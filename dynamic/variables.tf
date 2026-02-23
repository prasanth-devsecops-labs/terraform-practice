variable "instances" {
    type = map
    default = {
        mongodb = "t3.micro"
        # mysql = "t3.small"
    }
}


variable "zone_id" {
    type = string
    default = "Z082901534H7OC4NT02WB"
}

variable "domain_name" {
    type = string
    default = "prashum.online"
}

variable "ingress_type" {
    default = [
        {
            port = 22
            cidr_blocks = ["0.0.0.0/0"]
            description = "allow port 22 from internet"
        },
        {
            port = 443
            cidr_blocks = ["0.0.0.0/0"]
            description = "allow port 443 from internet"
        }
    ]
  
}