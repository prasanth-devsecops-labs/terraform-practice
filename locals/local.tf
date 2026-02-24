locals {
    instance_name = "${var.name}-${var.env}"
    common_tags = {
        Project = "roboshop"
        Env = "dev"
        Terraform = "true"
    }

    ec2_final_tags = merge(local.common_tags, var.ec2_tags)
}