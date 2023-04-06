#EKS VPC CONFIGURATON SECTION

resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true


  tags = {
    "Name" = "ogunleye_eks_vpc"
  }

}



#EKS SUBNET AND ROUTING CONFIGURATION SECTION

resource "aws_subnet" "eks_private_subnet" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = var.private_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone = "${var.availability_zone}"[count.index]


  tags = {
    Name = "eks_private_subnet_${count.index + 1}"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/ogunleye_cluster" = "owned"
  }
}

resource "aws_subnet" "eks_public_subnet" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = "${var.availability_zone}"[count.index]


  tags = {
    Name = "eks_public_subnet_${count.index + 1}"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/ogunleye_cluster" = "owned"

  }
}


resource "aws_route_table_association" "eks_private_subnet_association" {
  count = length(var.private_cidrs)
  subnet_id      = aws_subnet.eks_private_subnet.*.id[count.index]
  route_table_id = aws_route_table.eks_private_route_table.id
}

resource "aws_route_table_association" "eks_public_subnet_association" {
  count = length(var.public_cidrs)
  subnet_id      = aws_subnet.eks_public_subnet.*.id[count.index]
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_eip" "nat_ip" {
  vpc = var.nat_bool

  tags = {
    "Name" = "nat_ip"
  }
}

resource "aws_nat_gateway" "eks_nat_gateway" {
  count = 1
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.eks_public_subnet.*.id[count.index]

  tags = {
    Name = "NAT gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_internet_gateway]
}

resource "aws_internet_gateway" "eks_internet_gateway" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    "Name" = "Eks_internet_gateway"
  }
}

resource "aws_route_table" "eks_private_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    "Name" = "private_route"
  }
}

resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    "Name" = "public_route"
  }
}

resource "aws_route" "eks_private_route" {
 count = 1
 route_table_id = aws_route_table.eks_private_route_table.id
 destination_cidr_block = var.destination_cidr
 nat_gateway_id = aws_nat_gateway.eks_nat_gateway[count.index].id 
}

resource "aws_route" "eks_public_route" {
 route_table_id = aws_route_table.eks_public_route_table.id
 destination_cidr_block = var.destination_cidr
 gateway_id = aws_internet_gateway.eks_internet_gateway.id 
}
