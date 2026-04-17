variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  type    = string
  default = "gitops-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.29"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "min_capacity" {
  type    = number
  default = 2
}

variable "max_capacity" {
  type    = number
  default = 5
}

variable "desired_capacity" {
  type    = number
  default = 3
}

variable "key_name" {}

variable "vpc_id" {}

variable "public_subnet_id" {}