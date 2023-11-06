resource "aws_security_group" "sg" {
  count       = length(var.sg_names)
  name_prefix = var.sg_names[count.index]
  description = var.sg_names[count.index]

  // Allow all incoming traffic
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


