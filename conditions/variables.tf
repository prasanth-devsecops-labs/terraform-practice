variable "env" {
    type = string
    default = "dev"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "devops-practice-image"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "instance size"
}

variable "tags" {
    type = map
    default = {
        Name = "terraform-variables"
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "sg_name" {
    type = string
    default = "allow-all-terraform"
    description = "security group name"
}

variable "sg_to_port" {
    type = number
    default = 0
}

variable "sg_from_port" {
    type = number
    default = 0
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
    description = "cidr block"
}

variable "sg_tags" {
    type = map
    default = {
        Name = "allow-all-terraform"
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}
