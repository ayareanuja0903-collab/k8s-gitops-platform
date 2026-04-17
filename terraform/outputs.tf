output "cluster_name" { value = "gitops-cluster" }

output "devops_access_key" {
  value     = aws_iam_access_key.devops_key.id
  sensitive = true
}

output "devops_secret_key" {
  value     = aws_iam_access_key.devops_key.secret
  sensitive = true
}

output "ansible_control_public_ip" {
  value = aws_instance.ansible_control.public_ip
}

output "configure_kubectl" {
  value = "aws eks update-kubeconfig --region ap-south-1 --name ${module.eks.cluster_name}"
}