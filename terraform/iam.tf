resource "aws_iam_user" "devops_user" {
  name = "devops-user"

  tags = {
    Environment = "dev"
    Team        = "DevOps"
  }
}

resource "aws_iam_user_policy_attachment" "admin_access" {
  user       = aws_iam_user.devops_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "devops_access_key" {
  user = aws_iam_user.devops_user.name
}