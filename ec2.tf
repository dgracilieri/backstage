resource "aws_instance" "ec2_instance_apache" {
 ami           = lookup(var.awsprops, "ami")
 instance_type = lookup(var.awsprops, "itype")
 subnet_id = lookup(var.awsprops, "subnet")
 associate_public_ip_address = lookup(var.awsprops, "publicip")
 key_name = aws_key_pair.generated_key.key_name
 vpc_security_group_ids = [ aws_security_group.sg1.id ]
 user_data = "${file("apache.sh")}"
}

resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = lookup(var.awsprops, "keyname")
  public_key = tls_private_key.keypair.public_key_openssh
}
