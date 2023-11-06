## Variables for kms keys:

#1. Tags:

variable "tags"{
  type = map(string)
}


#2. Variables for Kms Keys:

#variable for kms key name:

variable "kmskey_ebs_name" {
  description = "variable for kmskey_ebs_name"

}

variable "kmskey_s3_name" {
  description = "variable for kmskey_s3_name"

}