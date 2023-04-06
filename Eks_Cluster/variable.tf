#variable "vpc_config" {
#type = object({
#vpc_id = string
#eks_public_subnet_ids = map(string)
#eks_private_subnet_ids = map(string)
#})

#description = "Network configuration used by the cluster"
#}

#variable "aws_subnet_id" {
#type = list(string)
#description = "list of all subnet in the eks vpc"
#}

#variable "private_subnet_id" {
#type = list(string)
#description = "list of all private subnets"
#}
