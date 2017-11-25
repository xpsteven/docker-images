#!/bin/bash
sudo docker pull ubuntu:14.04
sudo docker build -t xpsteven/ubuntu:14.04 -f ubuntu_trusty.dockerfile .
sudo docker push xpsteven/ubuntu:14.04
