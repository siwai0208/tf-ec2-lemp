variable "key_name" {
  type        = string
}
variable "InstanceType" {
  type        = string
}
variable "DBUser" {
  type        = string
}
variable "DBPassword" {
  type        = string
}
variable "DBName" {
  type        = string
}
variable "GitUser" {
  type        = string
}
variable "GitEmail" {
  type        = string
}
variable "GitPassword" {
  type        = string
}

data "template_file" "user_data" {
  template = file("cloudinit.yml")
    vars = {
    GitUser = var.GitUser
    GitEmail = var.GitEmail
    GitPassword = var.GitPassword
    DBName = var.DBName
    DBUser = var.DBUser
    DBPassword = var.DBPassword
  }
}

resource "aws_instance" "WEBServer" {
    ami = "ami-0ce107ae7af2e92b5"
    instance_type = var.InstanceType
    key_name = var.key_name
    subnet_id = aws_subnet.SubnetsPUB1.id
    security_groups = [aws_security_group.InstanceSecurityGroup.id]
    root_block_device {
        volume_type = "gp2"
        volume_size = 8
        delete_on_termination = true
    }
    user_data = data.template_file.user_data.rendered
}

output "WebsiteURL" {
  value = aws_instance.WEBServer.public_ip
}