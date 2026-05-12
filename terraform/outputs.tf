output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "iam_user_name" {
  value = aws_iam_user.devops_user.name
}

output "access_key_id" {
  value = aws_iam_access_key.devops_access_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.devops_access_key.secret
  sensitive = true
}