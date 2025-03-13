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