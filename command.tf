resource "null_resource" "my_nginx_cmd" {

  triggers = {
    build = "4.0"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/vishw/.ssh/id_ed25519") 
    host        = aws_instance.name_instance.public_ip
  }

  provisioner "file" {
    source      = "D:/sonusingh/online_shopping_app/node.sh"
    destination = "/tmp/node.sh"
  }

  provisioner "file" {
    source      = "D:/sonusingh/online_shopping_app/Dockerfile"
    destination = "/home/ubuntu/Dockerfile"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/node.sh",
      "sudo /tmp/node.sh"
    ]
  }
}
