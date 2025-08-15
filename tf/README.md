# So building a tf project for the Multi env AWS infrastructure

1. terraform init 
- To connect with AWS we need to create an IAM user and then in security create an access key and now we create a access key and secret access key 
- And we put that secret key in the AWS cli and now in vs terminal write aws configure in that write the access key 
- We can test it also by writing a command aws s3 ls 

- Now we have to connect tf to the aws so for that we are using a providers in tf 

- So we create a terraform.tf in that we writing a provider to create a ec2 instance and now we create a s3.tf in that we write the s3 configure by using resoures to create it 

- There also having a tf plan to see the what action will perform by the tf for that there having a command :- terraform plan
if the planing was write then run the terraform apply to apply it :

- to create a ec2 instance we have to create something before write in the code 
    keygen key generate - public key and private key 

- To create a ec2 we need this 3 thing security group , vpc , and keypair 
by using keygen we create a ssh key public and private key 

- For the now we are using default VPC
- Now we have to create a Security Group 

- Why we create a security grp --- SSH -- port 22 expose 


- dynamodb.tf - What is dynamo and why we use that in tf
| Term                           | Meaning                                                                    |
| ------------------------------ | -------------------------------------------------------------------------- |
| DynamoDB                       | A fast, serverless database by AWS                                         |
| Terraform                      | Tool to manage cloud with code                                             |
| Why use DynamoDB in Terraform? | To **lock the state** so multiple people don’t mess it up at the same time |

- Now we also create one more file name is variables.tf 
    Rather then hard core the refrences name or something other name we all define that in the variables like 
        aws instance type , ami id
        any resource default , type etc
    We all create this in the variables.tf file and by given name that variables we can use that anywhere in the project !

- # If you want to see outputs of any resource we can write here the outputs blocks 

- After the resource create then the attribute created (In output the public_ip was the attribute)


- States in tf
    Stores the information about the resource that created !
        - As we know we can store it locally or in the s3 that called the remote backend (recommeded)

- By using --target we can destroy the specific resource in tf


- Now we are creating a multi level architecture means for the 
    Dev , Stg , Pro

# In Dev we have to create a 1 - S3 , Db , EC2  -- t2.micro
# In STG we have to create a 1 - S3 , Db , EC2  -- t2.medium
# In Pro we have to create a 2 - S3 , 1 - Db , 3 - EC2 

- Now we are learning module : 
    Creating a template of the resources and resuable using module :
    Means Created a EC2 instance in the module file and using it again and again by changing the instance_type (eg-t2.micro,medium etc)

# So now we create name(aws_infra) a folder in that we are creating a module means bucket ,instance, table etc and also a variables.tf to updated the file as per we needed

- So basically we create a folder in that we create a bucket instance table and variable that what we need 
    Now in the module folder in bucket instance table we added a env (name) and that we env we implement or come form the main.tf 
    as per the what we want to build dev ,stg, prod

    If not undertand then refer the module folder and main.tf

- So now we need a 3 instance in the prod so for that we create a variable in the module in variable folder for the count we can create a multiple variable
    and implement that count in the instances , bucket , table etc
- In main.tf we create instance_count that will created


-  That for the module :: Create a module template of the tf and in that added what we want to build and also create a variable 
    And implement value in the main.tf file 

-  When you create any module then we need to again init the terraform init 