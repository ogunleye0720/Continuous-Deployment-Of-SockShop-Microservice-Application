resource "aws_internet_gateway" "jenkins_internet_gateway" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    "Name" = "jenkins_internet_gateway"
  }

  #lifecycle {
    #create_before_destroy = true
  #}
}