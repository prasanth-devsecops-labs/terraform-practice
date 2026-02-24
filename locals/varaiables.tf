variable "name" {
    type = string
    default = "locals"
}

variable "env" {
    type = string
    default = "dev"
}

variable "ec2_tags" {
  type = map
  default = {
    Name = "local-demo"
    Env = "QA"
  }
}

variable "sg_tags" {
    type = map
    default = {
        Name = "local-demo"
    }
}