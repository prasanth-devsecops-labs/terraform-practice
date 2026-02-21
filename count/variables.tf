variable "instance" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "zone_id" {
    type = string
    default = "Z082901534H7OC4NT02WB"
}

variable "domain_name" {
    type = string
    default = "prashum.online"
}

variable "fruits" {
    type = list(string)
    default = [ "orange", "apple", "mango", "orange" ]
}

variable "fruits_set" {
    type = set(string)
    default = [ "orange", "apple", "mango", "orange" ]
}