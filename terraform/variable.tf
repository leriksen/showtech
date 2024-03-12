variable "env" {
  description = "which environment we are deploying the iac to"
  type        = string
  default     = "dev"
}

variable "id_file" {
  description = "id file for ssh"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}