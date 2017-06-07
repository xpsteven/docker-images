#!/bin/bash
cd ubuntu
sudo docker pull xpsteven/ubuntu:14.04
sudo docker build -t xpsteven/ubuntu:petdora -f ubuntu-petdora.dockerfile .
sudo docker push xpsteven/ubuntu:petdora
