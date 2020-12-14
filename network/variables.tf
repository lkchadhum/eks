variable "vpc_cidr" {
  type        = string
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
}


variable "subnet_1_cidr" {
  type        = string
}
variable "subnet_2_cidr" {
  type        = string
}
variable "private_subnet_1_cidr" {
  type        = string
}
variable "private_subnet_2_cidr" {
  type        = string
}

variable "az1" {
  type        = string
}
variable "az2" {
  type        = string
}

variable "subnet_tags" {
  type        = map(string)
  default     = {}
}

variable "tags" {
  type        = map(string)
  default     = {}
}
