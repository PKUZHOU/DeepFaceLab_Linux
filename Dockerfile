FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get clean 
RUN apt-get update
RUN apt -y install python3-pip python3.6 python3.6-dev

RUN apt -y install ffmpeg cmake build-essential git python-qt4

COPY requirements-cuda.txt /opt/

RUN python3.6 -m pip install -r /opt/requirements-cuda.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN mkdir "/dfl"

WORKDIR "/dfl"
CMD ["/bin/bash"]
