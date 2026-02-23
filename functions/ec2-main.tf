resource "aws_instance" "example" {
  for_each = var.instances
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow-tls.id]

  tags = merge(
    var.common_tags, var.ec2_tags
  )
}


resource "aws_security_group" "allow-tls" {
  name        = "allow-all-terraform"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_type
    content {
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = "tcp"
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  tags = merge(var.common_tags, var.sg_tags)
}

