variable "AWS_REGION" {
    default = "eu-west-3"
    description = "Région de notre instance EC2"
}

variable "AWS_AMIS" {
    type = map(string)
    default = {
        "eu-west-3" = "ami-08461dc8cd9e834e0"
    }
    description = "AMIs par région pour nos instances EC2"
}

variable "AWS_INSTANCE_TYPE" {
    default = "t2.micro"
    description = "Type d'instance EC2 par défaut"
}

variable "map_list" {
    type = map(list(any))
    description = "Mapping des listes pour la configuration des règles de sécurité"
    # Exemple de structure :
    # {
    #   rule1 = ["ingress", "80", "80", "tcp", "0.0.0.0/0"]
    #   rule2 = ["egress", "0", "0", "-1", "0.0.0.0/0"]
    # }
}

variable "dbpassword" {
    type = string
    description = "Mot de passe pour la base de données"
}

variable "dbusername" {
    type = string
    description = "Nom d'utilisateur pour la base de données"
}

