output "cost_alarm_name" {
  description = "Nom de l'alarme"
  value       = aws_cloudwatch_metric_alarm.cost_alarm.alarm_name
}

output "cost_dashboard_name" {
  description = "Nom du tableau de bord CloudWatch"
  value       = aws_cloudwatch_dashboard.cost_dashboard.dashboard_name
}