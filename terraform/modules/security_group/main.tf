resource "aws_security_group" "ecf_sg" {
    name        = "ecf_sg"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id      = var.vpc_id
    tags = {
        Name = "ecf_sg"
    }

    ingress {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks  = local.admin_ip
    }

    ingress {
        description = "Allow HTTP access to Java app"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "rds_sg" {
    name        = "rds_sg"
    vpc_id      = var.vpc_id
    description = "RDS security group"
    tags = {
      Name = "rds_sg"
    }

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        security_groups  = [aws_security_group.ec2_sg.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [local.private_subnet_cidr]
    }
}

resource "aws_security_group_rule" "ecf_sg_rule" {
    for_each             = var.map_list
    type                 = each.value[0]
    from_port            = each.value[1]
    to_port              = each.value[2]
    protocol             = each.value[3]
    cidr_blocks          = [each.value[4]]
    security_group_id    = aws_security_group.ecf_sg.id
}

