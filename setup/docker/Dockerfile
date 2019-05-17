from debian:buster

ENV WORKDIR /usr/local/src

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
cat > /etc/apt/sources.list <<- EOF
deb http://mirrors.ustc.edu.cn/debian buster main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian buster main contrib non-free
deb http://mirrors.ustc.edu.cn/debian buster-proposed-updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian buster-proposed-updates main contrib non-free
deb http://mirrors.ustc.edu.cn/debian buster-updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian buster-updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian sid main contrib non-free
EOF

RUN apt-get update -qq && apt-get install openssl wget gnupg2 git curl -y
RUN apt-get update -qq && apt-get install redis python python-pip -y
#RUN apt-get update -qq && apt-get install python3 -y
RUN apt-get update -qq && apt-get install -y nmap

RUN cd ${WORKDIR} && git clone https://github.com/the-champions-of-capua/celerystalk \
 && cd celerystalk/setup && ./install.sh


WORKDIR ${WORKDIR}/celerystalk

USER root
