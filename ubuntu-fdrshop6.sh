cd ubuntu
sudo docker pull xpsteven/ubuntu:14.04
sudo docker build -t xpsteven/ubuntu:fdrshop6 -f ubuntu-fdrshop6.dockerfile .
sudo docker push xpsteven/ubuntu:fdrshop6
