output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.ec2.public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.endpoint
  sensitive   = true
}

output "s3_website_endpoint" {
  description = "S3 website endpoint"
  value       = module.s3.website_endpoint
}