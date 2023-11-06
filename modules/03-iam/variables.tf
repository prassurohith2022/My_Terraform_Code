## 3. Variables for Iam:

#1.Tags:

variable "tags"{
  type = map(string)
}

#2. Variable for  s3 iam role policy:

variable "iamrole_policy_s3_access_name" {
  type    = string  
  default = "iam role policy for s3 access name"
}
 

#3. Variable for  lambda execution  role policy:
variable "iamrole_policy_lanbdaexecution_name" {
  default = "iam role policy for lambda execution name"
}


#4. Variable for  ec2 iam role:

variable "iamrole_ec2_name" {
  type    = string
  default = "iam role ec2 name"
}

#5. Variable for  lambda execution iam role:

variable "iamrole_lambdaexecution" {
  type    = string
  default = "iamrole_lambdaexecution"
}

#6. S3 bucket code:

variable "app_code" {
  type    = string
  default = "variable for app_code of s3 bucket policy"
}

