variable "SSHLocation" {
  type        = string
}
variable "HTTPLocation" {
  type        = string
}

resource "aws_security_group" "InstanceSecurityGroup" {
    name = "InstanceSecurityGroup"
    description = "Source IP for SSH and HTTP"
    vpc_id = aws_vpc.VPC.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.SSHLocation]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.HTTPLocation]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
