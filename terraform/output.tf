output "public_ip" {
    value = aws_instance.bastion.public_ip
    description = "The public IP address of the web server"
}
### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("stage_aws.tmpl",
 {
  #bastion-dns = aws_eip.eip-bastion.public_dns,
  #bastion-ip = aws_eip.eip-bastion.public_ip,
  bastion-ip = aws_instance.bastion.public_ip,
  bastion-id = aws_instance.bastion.id,
 }
 )
 filename = "stage_aws.yml"
}
