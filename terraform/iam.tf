resource "aws_iam_user" "devops_user" {
  name = "devops-user"
}

resource "aws_iam_access_key" "devops_key" {
  user = aws_iam_user.devops_user.name
}

resource "aws_iam_user_policy_attachment" "admin_attach" {
  user       = aws_iam_user.devops_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "eks_attach" {
  user       = aws_iam_user.devops_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}