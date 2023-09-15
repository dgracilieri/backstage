variable "account_numbers" {
  description = "Whitelisted account numbers to apply terraform code in. Can apply in any if left blank."
  type    = list(string)
  default = []
}

variable "region" {
  description = "AWS Region to target"
  type        = string
  default     = "us-east-1"
}


variable "aws_profile" {
  description = "AWS Profile credentials to use"
  type        = string
  default     = "pragma"
}

variable "env_name" {
  description = "Environment name string to be used for decisions and name generation. Appended to name_suffix to create full_suffix"
  type        = string
  default = "Sandbox"
}

variable "source_repo" {
  description = "name of repo which holds this code"
  type        = string
  default = "iperfex-team/curso-Kuberntes001/tree/main/capitulo1"
}

variable "developer" {
  description = "name of developer who has written this code"
  type        = string
  default     = "diego-gracilieri"
}


variable "awsprops" {
    type = map
    default = {
    vpc = "vpc-03bf3cf91d74e3f8d"
    ami = "ami-0aa7d40eeae50c9a9"
    itype = "t2.medium"
    subnet = "subnet-0b84257e977da9197"
    publicip = true
    keyname = "secret_minikube"
    secgroupname = "sg_minikube_01"
    }
} 