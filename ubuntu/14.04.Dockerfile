FROM ubuntu:14.04
MAINTAINER xp@fandora.co
# 強制使用 bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# 切換 apt source
RUN sed -i "s/archive.ubuntu.com/free.nchc.org.tw/" /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade; apt-get clean
# 安裝常用套件
RUN apt-get -y install gcc g++ build-essential nano vim imagemagick graphicsmagick zip curl; apt-get clean
# Python 環境
RUN apt-get -y install python2.7 python-pip; apt-get clean
# Node.js
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
RUN source /root/.nvm/nvm.sh; nvm install 0.12; npm update -g
RUN source /root/.nvm/nvm.sh; nvm install 4.4; npm update -g
RUN source /root/.nvm/nvm.sh; nvm use 4.4
# 預設執行 bash
CMD /bin/bash
