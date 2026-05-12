# -----------------------------------
# Generate Private Key
# -----------------------------------

resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# -----------------------------------
# Create AWS Key Pair
# -----------------------------------

resource "aws_key_pair" "generated_key" {
  key_name   = "devops-key"

  public_key = tls_private_key.devops_key.public_key_openssh
}

# -----------------------------------
# Save Private Key Locally
# -----------------------------------

resource "local_file" "private_key_pem" {
  content  = tls_private_key.devops_key.private_key_pem

  filename = "C:/Temp/devops-key.pem"

  file_permission = "0400"
}