FROM xpsteven/ubuntu:14.04
MAINTAINER xp@fandora.co
# for excel-parser
RUN pip install xlrd
RUN pip install argparse
# 超商取貨貼紙 barcode
RUN sudo apt-get -y install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential; apt-get clean