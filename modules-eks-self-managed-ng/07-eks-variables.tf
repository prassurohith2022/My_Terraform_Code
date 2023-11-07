# EKS Cluster Input Variables

# 1.AWS Region:

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
}

#2. Environment Variable:

variable "environment" {
  description = "Environment Variable used as a prefix"
}

#3. Variables for Access Key:


#4. variables for iam roles:

variable "iam_role_eks_master_name" {
  description = "iam_role_eks_master_name"
}

variable "iam_role_eks_nodegroup_name" {
  description = "iam_role_eks_nodegroup_name"
}


# 5. Variable for Self Managed node-SG:


# variable for vpc-id


# variable for vpc-cidr:


variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
}


variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
}

# Variables for eks subnets:

variable "eks_subnets" {
  description = "eks_subnets"
}

# EKS Node Group Variables

variable "eks_node_group_name" {
  description = "eks_node_group_name"
}
