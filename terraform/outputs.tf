output "iam_user_name" {
  value = aws_iam_user.terraform_user.name
}

output "access_key_id" {
  value = aws_iam_access_key.terraform_access_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.terraform_access_key.secret
  sensitive = true
}