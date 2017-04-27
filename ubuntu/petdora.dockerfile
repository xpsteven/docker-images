FROM xpsteven/ubuntu:14.04
MAINTAINER xp@fandora.co

# 安裝 python 相依
# for excel-parser
RUN pip install xlrd
RUN pip install argparse
