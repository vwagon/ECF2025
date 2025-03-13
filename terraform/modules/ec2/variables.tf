variable "map_list" {
    type = map(list(any))
    description = "Mapping des listes pour la configuration"
}

variable "AWS_REGION" {
    default = "eu-west-3"
    description = "Région de notre instance EC2"
}

variable "AWS_AMIS" {
    type = map
    default = {
        "eu-west-3" = "ami-08461dc8cd9e834e0"
    }
}

variable "AWS_INSTANCE_TYPE" {
    default = "t2.micro"
    description = "Type d'instance EC2"
}

variable "security_group_id" {
    type = string
    description = "ID du groupe de sécurité utilisé par l'instance EC2 et RDS"
}

variable "subnet_id" {
    type = string
    description = "ID du sous-réseau utilisé par l'instance EC2"
}

variable "vpc_id" {
    type = string
    description = "ID du VPC"
}
