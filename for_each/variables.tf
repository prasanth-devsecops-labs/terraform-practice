variable "instances" {
    type = map
    default = {
        mongodb = "t3.micro"
        mysql = "t3.small"
    }
}

variable "instances_list" {
    type = list
    default = ["mongodb", "redis"]
}


variable "zone_id" {
    type = string
    default = "Z082901534H7OC4NT02WB"
}

variable "domain_name" {
    type = string
    default = "prashum.online"
}