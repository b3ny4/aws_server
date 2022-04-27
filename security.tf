
# Security Group

resource "aws_security_group" "server" {
  name   = "${var.server_name}-server"
  vpc_id = var.vpc_id
}

# Firewall Rules

# allow internet access
resource "aws_security_group_rule" "allow_internet_access" {
  type              = "egress"
  security_group_id = aws_security_group.server.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# allow ssh
resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.server.id

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
