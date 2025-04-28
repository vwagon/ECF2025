resource "aws_cloudwatch_metric_alarm" "cost_alarm" {
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
    "Currency" = "USD"
  }
}

resource "aws_cloudwatch_dashboard" "cost_dashboard" {
  dashboard_name = "cost-dashboard"

  dashboard_body = jsonencode({
    "widgets": [
      {
        "type": "metric",
        "x": 0,
        "y": 0,
        "width": 24,
        "height": 12,
        "properties": {
          "metrics": [
            [ "AWS/Billing", "EstimatedCharges", "Currency", "USD" ]
          ],
          "title": "Coûts d'utilisation AWS"
        }
      }
    ]
  })
}