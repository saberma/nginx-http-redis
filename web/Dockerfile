FROM ubuntu

COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y install libpcre3 libssl-dev
RUN apt-get -y install libpcre3-dev
RUN apt-get -y install wget zip gcc
RUN apt-get -y install build-essential
RUN wget http://nginx.org/download/nginx-1.4.1.tar.gz
RUN gunzip nginx-1.4.1.tar.gz
RUN tar -xf nginx-1.4.1.tar
RUN wget --no-check-certificate https://github.com/max-l/nginx_accept_language_module/archive/master.zip
RUN unzip master
WORKDIR nginx-1.4.1
RUN ./configure --sbin-path=/usr/local/sbin && \
    make && \
    make install

RUN nginx -t

CMD ["nginx"]

EXPOSE 80
