variable "jenkins_vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

#variable "jenkins_instance_sg" {
  #type = string
  #default = "aws_security_group.jenkins_instance_sg"
#}

#variable "jenkins_vpc_id" {
  #type = string
  #default = "aws_vpc.jenkins_vpc.id"
  #description = "Jenkins vpc id"
#}
variable "jenkins_cidrs" {
    type = list(any)
    default = ["10.0.1.0/24"]
}
#variable "jenkins_subnets" {
  #type = list(any)
  #default = ["aws_subnet.jenkins_subnet.*.id"]
#}

variable "jenkins_server_instance_type" {
  type = string
  default = "t3.medium"
  description = "instance type"
}

variable "key_name" {
  type = string
  default = "terraform"
  description = "instance key name"
}

variable "availability_zone" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
  description = "list of availability zones where infrastucture will be created"
}

variable "destination_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "registered_ip" {
  description = "by default allows all ip address access into the server"
  type = string
  default = "0.0.0.0/0"
  sensitive = true
}

variable "region" {
  description = "Vpc Region"
  type        = string
  default     = "us-east-1"
}
