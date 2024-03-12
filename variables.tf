variable "ami" {
  type    = list(string)  
  description = "A list of AMI IDs to use for the instances."
}

variable "instance_name" {
  type    = list(string)  
  description = "A list of names for the instance(s)."
}

variable "root_block_device" {
  description = <<EOD

  "Customize details about the root block device of the instance"
  ```hcl

  example:
  root_block_device = [
    {
      volume_size = 10, 
      volume_type = "gp2"   
    }
  ]
  ```
  EOD  

  type = list(map(string))
  default = null
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
}

variable "instance_type" {
  type    = list(string)  
  description = "A list of instance types to launch."
}

variable "subnet_id" {
  type        = list(string)
  description = "A list of subnet IDs where the instances will be launched."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with the instances."
}

variable "environment" {
  type        = string
  description = "The environment for which the infrastructure is intended (e.g., dev, test, prod)"
}

variable "key_pair" {
  description = "Name of the key pair public."
  type        = list(string)
  sensitive = true # Mark the variable as sensitive
}