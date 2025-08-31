#! /bin/bash
sudo apt update
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
sudo usermod -aG docker ubuntu
sudo docker image build -t mynode:1.0 .
sudo docker container run --name mycon -d -p 1234:80 mynode:1.0
