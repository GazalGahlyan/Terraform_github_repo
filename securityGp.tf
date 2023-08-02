provider "aws" {
  region = "us-east-1"  
}

data "aws_security_groups" "all_security_groups" {
  tags = {
    Terraform = "true"
  }
}

data "aws_security_group" "exposed_port_22" {
  count = length(data.aws_security_groups.all_security_groups.ids)

  id = data.aws_security_groups.all_security_groups.ids[count.index]
}

output "exposed_security_groups" {
  value = [for sg in data.aws_security_group.exposed_port_22 : sg.tags.Name]
}

