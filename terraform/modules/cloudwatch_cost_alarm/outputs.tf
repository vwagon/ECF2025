output "cost_alarm_name" {
  description = "Nom de l'alarme"
  value       = aws_cloudwatch_metric_alarm.cost_alarm.alarm_name
}

