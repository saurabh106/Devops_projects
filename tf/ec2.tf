# Key Pair Resource in Terraform
# For now we are using a default vpc
# Now we have to create a security group : By using this we open the port 22 for SSH access

resource "aws_key_pair" "deployer" {
  key_name   = "my-key-pair"
  public_key = file("S:/projects_devops/tf/terra-key.pub")

}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "twssecurity_group" {
  name        = "twssecuritygroup"
  description = "Allow SSH inbound traffic"
  # Interpolation :- We can access any resources internal by using there resource type and refrences name
  vpc_id = aws_default_vpc.default.id

  # Ingress means incoming traffic
  ingress {
    description = "This is for SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr block is a range of IP addresses
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress means outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my-instance" {
  ami           = var.ami_id 
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.twssecurity_group.name]

  tags = {
    Name = "terra-automate" # Name of the instance
  }
}
