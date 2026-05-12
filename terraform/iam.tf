resource "aws_iam_user" "terraform_user" {

  name = "terraform-user"

  tags = {
    Environment = "dev"
    Project     = "k8s-gitops-platform"
  }
}

resource "aws_iam_user_policy_attachment" "admin_policy" {

  user = aws_iam_user.terraform_user.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "terraform_access_key" {

  user = aws_iam_user.terraform_user.name
}