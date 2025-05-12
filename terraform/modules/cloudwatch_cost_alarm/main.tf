resource "aws_cloudwatch_metric_alarm" "cost_alarm" {
  provider = aws.us-east-1
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 86400  
  statistic           = "Maximum"
  threshold           = var.cost_threshold
  alarm_description   = "Alarme sur les coûts d'utilisation AWS"
  alarm_actions = [var.sns_topic_arn] 
  dimensions = {
    "Currency" = "EUR"
  }
}
