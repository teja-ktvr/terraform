resource "aws_instance" "this" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow-tls.id]
    instance_type = "t3.micro"
    tags = {
        Name = "terraform-demo"
    }
  
}

resource "aws_security_group" "allow-tls" {
    name = "allow-tls"
    description = "Allow TLS inbound and all outbound traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "allow-tls"
    }
}