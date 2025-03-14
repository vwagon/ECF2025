output "instance_id" {
    value = aws_instance.ec2_java.id
}

output "public_ip" {
  value       = aws_instance.ec2_java.public_ip
  description = "Public IP of the EC2 instance"
}