resource "aws_instance" "example" {
  for_each = var.instances
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow-tls.id]

  tags = {
    Name = each.key
    Project = "roboshop"
  }
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
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow-all-terraform"
  }
}

resource "aws_route53_record" "pvt_dns_records" {
  for_each = aws_instance.example
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "pub_dns_records" {
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}" 
  type    = "A"
  ttl     = 1
  # records = [lookup(aws_instance.example, "frontend").public_ip]
  records = [try(aws_instance.example["mongodb"].public_ip, "127.0.0.1")]
  allow_overwrite = true
}