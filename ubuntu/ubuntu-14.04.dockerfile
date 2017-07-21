FROM ubuntu:14.04
MAINTAINER xp@fandora.co

# 強制使用 bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# 語系
RUN locale-gen en_US.UTF-8
RUN locale-gen zh_TW.UTF-8
ENV LANG zh_TW.UTF-8

# 切換 apt source
RUN sed -i "s/archive.ubuntu.com/free.nchc.org.tw/" /etc/apt/sources.list
RUN sed -i "s/deb-src/#deb-src/" /etc/apt/sources.list
RUN echo "deb http://free.nchc.org.tw/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade; apt-get clean

# 時區
RUN apt-get install tzdata
RUN echo "Asia/Taipei" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# 安裝常用套件
RUN apt-get -y install gcc g++ build-essential nano vim imagemagick graphicsmagick zip curl; apt-get clean

# Python 環境
RUN apt-get -y install python2.7 python-pip; apt-get clean

# Node.js
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
RUN source /root/.nvm/nvm.sh; nvm install 0.12; npm update -g
RUN source /root/.nvm/nvm.sh; nvm install 6.11; npm update -g

# npm install excel-parser
RUN pip install xlrd
RUN pip install argparse

# 超商取貨貼紙
# npm install canvas
RUN apt-get -y install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential; apt-get clean

# 預設執行 bash
CMD /bin/bash
