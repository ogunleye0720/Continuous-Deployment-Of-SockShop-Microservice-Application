output "vpc_id" {
  value = aws_vpc.eks_vpc
}

#output "config" {
  #value = {
    #vpc_id = "aws_vpc.eks_vpc.id"
    #public_subnet_ids =  {for az, subnet in aws_subnet.eks_public_subnet : az => "${subnet.id}"}
    #private_subnet_ids = {for az, subnet in aws_subnet.eks_private_subnet : az => "${subnet.id}"}    
  #}
#}

#output "config" {
  #value = "${data.aws_subnet.vpc_subnet}"
#}
#output "private_subnet_id" {
  #value = "${data.aws_subnet.private_subnet_id}"
#}

#output "public_subnet" {
  #value = aws_subnet.eks_public_subnet
#}