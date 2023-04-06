# COLLECTS THE VPC_ID FROM AN EXISTING VPC
data "aws_vpc" "eks_vpc" {
  filter {
    name   = "tag:Name"
    values = ["ogunleye_eks_vpc"]
  }
}

# COLLECTS ALL THE SUBNET IDS IN THE VPC
# THE VALUE OF COUNT MUST CORRESPOND TO THE NUMBER OF SUBNETS IN THE VPC

data "aws_subnet_ids" "all_subnet_ids" {
  vpc_id = data.aws_vpc.eks_vpc.id
}

data "aws_subnet" "all_subnets" {
  count = 6
  id    = tolist(data.aws_subnet_ids.all_subnet_ids.ids)[count.index]
}

# RETRIEVE ALL PRIVATE SUBNET IDS IN A VPC
data "aws_subnet_ids" "private_subnet_id" {
  vpc_id = data.aws_vpc.eks_vpc.id

  tags = {
    Name = "*eks_private_subnet_*"
  }
}

data "aws_subnet" "private_subnet" {
    count = 3
    id = tolist(data.aws_subnet_ids.private_subnet_id.ids)[count.index]
}

