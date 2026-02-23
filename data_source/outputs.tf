output "instance_info" {
    value = aws_instance.example
}

output "data_ami_info" {
    value = data.aws_ami.devops.id
}