/*
# 01-Access Keys Creation:

# 1. Create tls private key:

resource "tls_private_key" "pk01" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


# 2. Create aws key pair:

resource "aws_key_pair" "key" {
  key_name   = var.access_key_name
  public_key = tls_private_key.pk01.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk01.private_key_pem}' > ./key-${var.access_key_name}.pem"
  }
}
*/