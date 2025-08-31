# This is a Terraform variables file for AWS infrastructure setup

# This is provider.tf file
variable "provider_name" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
  
}
#this is vpc.tf file
variable "name_vpc" {
  description = "Name of the VPC"
  type        = string
  default     = "name_vpc"

}

variable "name_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}

#this is subnet.tf file
variable "name_subnet" {
  description = "Name of the subnet"
  type        = string
  default     = "name_subnet"
}


variable "name_subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"

}

variable "name_availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "ap-south-1a"

}

#this is route-table file
variable "route_cidr" {
  description = "CIDR block for the route-table"
  type        = string
  default     = "0.0.0.0/0"

}

variable "route_name" {
  description = "Name of the route-table"
  type        = string
  default     = "name_route_table"
}

#this is internet_gateway
variable "igw_name" {
  description = "Name of the igw"
  type        = string
  default     = "Create-igw"

}

#this is security-group
variable "security_group_name" {
  description = "This is security-group"
  type        = string
  default     = "create-security-group"

}

# this is ec2
variable "instance_name" {
  description = "instance"
  type        = string
  default     = "my-ec2 online Shopling project"

}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t3.micro"

}

variable "instance_key" {
  description = "instance-key"
  type        = string
  default     = "new--key-nginx"

}

#This is s3 bucket
#variable "bucket_name" {
 # description = "bucket_name"
  #type        = string
  #default     =  "vish10-06-1998"
#}
 
# variable "key_name"{
 # description = "key_name"
  #type        = string
   # default = "node/npm/state"
 #}

 #variable "regiom_name" {
  #description = "region_name"
  #type        = string
  #default     = "ap-south-1"
 #}