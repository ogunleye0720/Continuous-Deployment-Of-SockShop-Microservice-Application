data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins_server" {
  count = length(var.jenkins_cidrs)
  ami = data.aws_ami.ubuntu.id
  subnet_id = aws_subnet.jenkins_subnet.*.id[count.index]
  instance_type = var.jenkins_server_instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_instance_sg.id] 
  key_name = var.key_name
  associate_public_ip_address = true

  tags = {
    "Name" = "jenkins_server_${count.index + 1}"
  }
}