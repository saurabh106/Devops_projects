module "dev-app" {
  source = "./aws_infra"
    my-env = "dev"
    ami_id = "ami-12345678" # Replace with your actual AMI ID
    instance_type = "t2.micro" # Replace with your desired instance type
    instance_count = 1 # Specify the number of instances for development
}
module "stg-app" {
  source = "./aws_infra"
    my-env = "stg"
    ami_id = "ami-12345678" # Replace with your actual AMI ID
    instance_type = "t2.medium" # Replace with your desired instance type
    instance_count = 2 # Specify the number of instances for staging
}
module "prd-app" {
  source = "./aws_infra"
    my-env = "prd"
    ami_id = "ami-12345678" # Replace with your actual AMI ID
    instance_type = "t2.large" # Replace with your desired instance type
    instance_count = 3 # Specify the number of instances for production
}