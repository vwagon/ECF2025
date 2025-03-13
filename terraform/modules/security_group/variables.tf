variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "map_list" {
  description = "Mapping des listes pour la configuration des règles de sécurité"
  type        = map(list(any))
}

