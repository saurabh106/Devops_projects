//If you want to see outputs of any resource we can write here the outputs blocks 
output "my_ec2_instance_id" {
  value = aws_instance.my-instance.public_ip
  
}