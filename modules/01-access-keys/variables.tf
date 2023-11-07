## Common Variables:

#1.Tags:

variable "tags"{
  type = map(string)
}

# 2. Variables for Access Keys:

variable "access_key_names" {
  type = list(string)
  description = "variable for access_key_names for ec2"
}

