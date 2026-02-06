resource "aws_vpc" "prod_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = { Name = "${var.env}-vpc" }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = { Name = "${var.env}-private-${count.index}" }
}

resource "aws_subnet" "database" {
  count             = 2
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = var.db_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = { Name = "${var.env}-db-${count.index}" }
}