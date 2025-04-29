variable "AWS_REGION" {
    default = "eu-west-3"
    type = string
    description = "Région AWS"
}

variable "AWS_AMIS" {
    type = map
    default = {
        "eu-west-3" = "ami-08461dc8cd9e834e0"
    }
}

variable "AWS_INSTANCE_TYPE" {
    default = "t2.micro"
}

variable "dbpassword" {
    type = string
}

variable "dbusername" {
    type = string
}

variable "cost_threshold" {
  description = "Le seuil des coûts en EUR au-delà duquel l'alarme se déclenche"
  type        = number
  default     = 5
}

variable "alarm_actions" {
  description = "Liste des actions à prendre quand l'alarme se déclenche (par exemple, SNS Topic ARN)"
  type        = list(string)
  default     = []
}
