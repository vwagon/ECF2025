output "ec2_instance_ip" {
  value       = module.ec2.public_ip
  description = "Public IP de l'instance EC2"
}

output "sns_arn" {
  value = aws_sns_topic.example_sns.arn
}
