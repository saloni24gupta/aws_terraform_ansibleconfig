provider "aws" {
 region = "ap-south-1"
}

resource "aws_instance" "webos" {
 ami = "ami-08df646e18b182346"
 instance_type = "t2.micro"
 security_groups = ["sg_ansible"]
 key_name = "ansible_terraform"
 tags = {
  Name = "Ansible"
}
connection {
 type = "ssh"
 user = "ec2-user"
 host = "aws_instance.webos.public_ip"
 private_key = file("C:/Users/marshal/OneDrive/Desktop/terraform_pro/ansible_terraform.pem")
}
provisioner "remote-exec" {
 inline = [
   "sudo yum update -y",
   "sudo yum install httpd - y",
   "sudo yum install php -y",
   "sudo systemctl start httpd",
   "sudo systemctl start pph" ]
}

}