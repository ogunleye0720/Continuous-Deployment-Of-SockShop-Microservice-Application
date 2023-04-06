resource "aws_security_group" "jenkins_instance_sg" {
  name = "jenkins_instance_sg"
  description = "Allow SSH/HTTP inbound traffic"
  vpc_id = aws_vpc.jenkins_vpc.id

   # ALLOW SSH TRAFFIC FROM REGISTERED IPs

   ingress {
    description = "Allows inbound SSH traffic from registered ip addresses"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.registered_ip]
  }

  # ALLOW HTTP TRAFFIC FROM THE INTERNET

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.registered_ip]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.destination_cidr]
  }
}