terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 3.74"
		}
	}
}

output "instance" {
	value = aws_instance.webserver
}

resource "aws_instance" "webserver" {
	ami           = var.ami
	instance_type = var.instance_type
	subnet_id     = aws_subnet.webserver.id

	tags = {
		Name = var.name
	}
}
