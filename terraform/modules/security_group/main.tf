locals {
  public_subnet_cidr  = "10.0.1.0/24"    # EC2 subnet
  private_subnet_cidr = "10.0.2.0/24"    # RDS subnet
  admin_ip           = ["91.160.175.100/32"]     # Your IP for SSH/Grafana
}

resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    vpc_id = var.vpc_id
    description = "EC2 security group"
    tags = {
        Name = "ec2_sg"
    }
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Grafana"
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = local.admin_ip
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTP access to Java app"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Prometheus"
        from_port   = 9090
        to_port     = 9090
        protocol    = "tcp"
        cidr_blocks = local.admin_ip
    }
    ingress {
        description = "Node-exporter"
        from_port   = 9100
        to_port     = 9100
        protocol    = "tcp"
        cidr_blocks = local.admin_ip
    }
}
resource "aws_security_group" "rds_sg" {
    name = "rds_sg"
    vpc_id = var.vpc_id
    description = "RDS security group"
    tags = {
      Name = "rds_sg"
    }
    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        security_groups = [aws_security_group.ec2_sg.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [local.private_subnet_cidr]
    }
}