resource "aws_instance" "example" {
  count = 4
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-tls.id]

  tags = {
    Name = var.instance[count.index]
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

resource "aws_route53_record" "dns_records" {
  count = 4
  zone_id = var.zone_id
  name    = "${var.instance[count.index]}.${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[count.index].public_ip]
}