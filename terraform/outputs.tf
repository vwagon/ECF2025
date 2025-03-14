output "ec2_instance_ip" {
  value = aws_instance.ec2_java.public_ip
  description = "Public IP de l'instance EC2"
}