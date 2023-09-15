esource "aws_autoscaling_group" "asg" {
  name = "my-asg"
  max_size = 2
  min_size = 1

  launch_configuration = aws_launch_configuration.lc.name

  vpc_zone_identifier = [aws_subnet.public1.id, aws_subnet.public2.id]

  tag {
    key                 = "Name"
    value               = "my-asg"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "lc" {
  image_id      = data.aws_ami.ubuntu1804.id # ubuntu 18.04 ami id from AWS marketplace

  instance_type = "t2.micro"

  security_groups = [aws_security_group.sg1.id] # security group created earlier

  user_data       = file("userdata/userdata-script") # user data script to install nginx on instance launch  

  key_name        = aws_keypair.keypair1.key_name # key pair created earlier  

  lifecycle { create_before_destroy=true } # preserve the existing instance when updating the launch configuration  
}  
  
# Create two EC2 instances and assign them to the autoscaling group  
resource "aws_instance" "ec2-instance1" {  
    ami           = data.aws Application Load Balancer (ALB).alb {   name        = “my-alb”   internal     = false   security groups     [ aws Security Group .sg1 .id ] # Security Group created earlier subnets      [ aws Subnet .public1 .id , aws Subnet .public2 .id ] } resource “aws Instance” “ec2 Instance 1” { ami           Data . Aws _ Ami . Ubuntu1804 . Id # Ubuntu 1804 AMI ID from AWS Marketplace instance Type    “t2 Micro