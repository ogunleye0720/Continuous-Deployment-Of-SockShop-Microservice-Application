resource "aws_subnet" "jenkins_subnet" {
  count = length(var.jenkins_cidrs)
  vpc_id = aws_vpc.jenkins_vpc.id
  cidr_block = var.jenkins_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = "${var.availability_zone}"[count.index]


  tags = {
    Name = "jenkins_subnet_${count.index + 1}"
  }
}