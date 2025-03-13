resource "aws_instance" "ec2_java" {
    ami = lookup(var.AWS_AMIS, var.AWS_REGION)
    instance_type = var.AWS_INSTANCE_TYPE
    vpc_security_group_ids = [var.security_group_id]
    subnet_id = var.subnet_id
    key_name = aws_key_pair.ecfkey.key_name
    tags = {
        Name = "ecf_ec2"
    }
    user_data = file("dependance_ec2.sh")
}

resource "aws_key_pair" "ecfkey" {
  key_name   = "ecfkey"
  public_key = file("ecfkey.pub")
}

