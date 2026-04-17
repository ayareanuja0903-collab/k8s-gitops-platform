provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "k8s-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway  = true

  enable_dns_hostnames = true
  enable_dns_support    = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "gitops-cluster"
  cluster_version = "1.30"

  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  eks_managed_node_groups = {
    worker_nodes = {
      instance_types = ["t3.medium"]
      ami_type        = "AL2_x86_64"

      min_size     = 2
      max_size     = 5
      desired_size = 3
    }
  }

  # 👇 ADD THIS HERE (INSIDE MODULE EKS)
  access_entries = {
    devops_user = {
      principal_arn = "arn:aws:iam::023465168943:user/devops-user"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
}

# ---------------------------
# ANSIBLE KEY SETUP
# ---------------------------

resource "tls_private_key" "ansible_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible-key"
  public_key = tls_private_key.ansible_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.ansible_key.private_key_pem
  filename = "${path.module}/ansible-key.pem"
}

# ---------------------------
# SECURITY GROUP
# ---------------------------

resource "aws_security_group" "ansible_sg" {
  name   = "ansible-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------------------
# ANSIBLE CONTROL NODE
# ---------------------------

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ansible_control" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name      = aws_key_pair.ansible_key.key_name

  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "ansible-control-node"
  }
}