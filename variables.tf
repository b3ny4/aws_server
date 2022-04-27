
variable "region" {
  description = "region to provision server"
  type        = string
}

variable "server_name" {
  description = "Name of the server/service"
  type        = string
}

variable "user_data" {
  description = "Initialization payload for the ec2 instance"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "ID of the vpc to provision in"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to provision in"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for server"
  type        = list(any)
  default     = []
}

variable "ami" {
  description = "AMI for ec2 instance"
  type        = string
  default     = "ami-0245697ee3e07e755"
}

variable "instance_type" {
  description = "Type of the provisioned instance"
  type        = string
  default     = "t2.micro"
}

variable "public_key" {
  description = "Public ssh key of the ec2 instance"
  type        = string
}
