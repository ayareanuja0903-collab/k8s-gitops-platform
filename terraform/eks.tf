module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.11.1"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = true

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    worker_nodes = {
      desired_size = 2
      min_size     = 2
      max_size     = 4

      instance_types = var.instance_types

      capacity_type = "ON_DEMAND"

      ami_type = "AL2_x86_64"

      tags = {
        Name = "eks-worker-nodes"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}