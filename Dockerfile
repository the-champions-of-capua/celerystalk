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

RUN apt-get update -qq && apt-get install build-essential libexpat1-dev libgeoip-dev \
libpng-dev libpcre3-dev libssl-dev libxml2-dev rcs \
zlib1g-dev libmcrypt-dev libcurl4-openssl-dev \
libjpeg-dev libpng-dev libwebp-dev pkg-config openssl wget gnupg2 git make -y

RUN apt-get update -qq && apt-get install redis python3 -y

RUN cd ${WORKDIR} && git clone https://github.com/the-champions-of-capua/celerystalk \
 && cd celerystalk/setup 