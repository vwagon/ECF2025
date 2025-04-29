output "cost_alarm_name" {
  description = "Nom de l'alarme"
  value       = aws_cloudwatch_metric_alarm.cost_alarm.alarm_name
}

output "sns_topic_arn" {
  value = aws_sns_topic.billing_alerts.arn
}