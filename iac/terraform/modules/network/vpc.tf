#------------------------
# Cria recurso de VPC
#------------------------

resource "aws_vpc" "this" {
  cidr_block = var.aws_vpc.cidr_block

  tags = {
    Name = "${var.aws_vpc.name}"
  }
}
