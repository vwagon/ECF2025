variable "alarm_name" {
  description = "Nom de l'alarme CloudWatch"
  type        = string
  default     = "AWS Cost Alarm"
}

variable "cost_threshold" {
  description = "Le seuil des coûts en EUR au-delà duquel l'alarme se déclenche"
  type        = number
}

variable "sns_topic_arn" {
  description = "ARN du topic SNS pour les alertes de coût"
  type        = string
}