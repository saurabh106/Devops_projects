variable "my-env" {
  description = "This is the environment for the AWS infrastructure"
    type        = string
}
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
}
variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  
}
variable "instance_count" {
  description = "The number of EC2 instances to launch"
  type        = number
  default     = 1
}