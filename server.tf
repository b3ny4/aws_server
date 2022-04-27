
# EC2
resource "aws_instance" "instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = aws_key_pair.deployer.key_name
  security_groups = setunion(var.security_groups, [aws_security_group.server.id])
  user_data       = var.user_data
}


# SSH Key
resource "aws_key_pair" "deployer" {
  key_name   = var.server_name
  public_key = var.public_key
}


# Elastic IP
resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_eip_association" "eip_instance" {
  instance_id   = aws_instance.instance.id
  allocation_id = aws_eip.eip.id
}
