resource "aws_route_table_association" "jenkins_subnet_association" {
  count = length(var.jenkins_cidrs)
  subnet_id      = aws_subnet.jenkins_subnet.*.id[count.index]
  route_table_id = aws_route_table.jenkins_route_table.id
}



resource "aws_route_table" "jenkins_route_table" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    "Name" = "jenkins_route"
  }
}

resource "aws_route" "public_route" {
 route_table_id = aws_route_table.jenkins_route_table.id
 destination_cidr_block = var.destination_cidr
 gateway_id = aws_internet_gateway.jenkins_internet_gateway.id 
}