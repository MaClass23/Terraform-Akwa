variable "instance" {
  type = string
  default = "t2.micro"
}
variable "instance1" {
  type = string
  default = "t2.micro"
}

variable "region" {
    type = string
    description = "(optional) describe your variable"
}

variable "instance_num" {
  type = number
  description = "(optional) describe your variable"
}

variable "instance1_num" {
  type = number
  description = "(optional) describe your variable"
}
