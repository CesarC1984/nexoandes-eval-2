locals {
  common_tags = {
    Proyecto  = "NexoAndes"
    Fase      = "U2"
    Alumno    = "a02"
    Curso     = "c50"
    Proveedor = "AWS"
  }
}


resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "na-u2-c50-a02-vpc"
  })

}


resource "aws_internet_gateway" "gw" {

  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "na-u2-c50-a02-igw"
  })
}

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = merge(local.common_tags, {
    Name = "na-u2-c50-a02-rt-public"
  })
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_a_cidr
  availability_zone = var.availability_zones[0]

  tags = merge(local.common_tags, {
    Name = "na-u2-c50-a02-subnet-a"
  })
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_b_cidr
  availability_zone = var.availability_zones[1]

  tags = merge(local.common_tags, {
    Name = "na-u2-c50-a02-subnet-b"
  })
}

resource "aws_route_table_association" "subnet_a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnet_b" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.public.id
}

