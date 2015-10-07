FROM ubuntu

COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential libgd2-xpm-dev libpcre3 libpcre3-dev libssl-dev wget zip
RUN rm -rf /var/lib/apt/lists/*

# Download Nginx and Nginx modules source
RUN wget http://nginx.org/download/nginx-1.8.0.tar.gz -O nginx.tar.gz && \
    mkdir /tmp/nginx && \
    tar -xzvf nginx.tar.gz -C /tmp/nginx --strip-components=1

RUN wget http://people.freebsd.org/~osa/ngx_http_redis-0.3.7.tar.gz -O ngx-http-redis.tar.gz && \
    mkdir /tmp/nginx/http-redis && \
    tar -xzvf ngx-http-redis.tar.gz -C /tmp/nginx/http-redis --strip-components=1

RUN wget https://github.com/maxmind/libmaxminddb/releases/download/1.1.1/libmaxminddb-1.1.1.tar.gz -O libmaxminddb.tar.gz && \
    mkdir /tmp/nginx/libmaxminddb && \
    tar -xzvf libmaxminddb.tar.gz -C /tmp/nginx/libmaxminddb --strip-components=1
RUN cd /tmp/nginx/libmaxminddb && \
    ./configure && \
    make && \
    make check && \
    make install && \
    ldconfig

# https://github.com/leev/ngx_http_geoip2_module
RUN wget https://github.com/leev/ngx_http_geoip2_module/archive/1.0.tar.gz -O ngx-http-geoip2.tar.gz && \
    mkdir /tmp/nginx/http-geoip2 && \
    tar -xzvf ngx-http-geoip2.tar.gz -C /tmp/nginx/http-geoip2 --strip-components=1

WORKDIR /tmp/nginx

RUN ./configure --sbin-path=/usr/local/sbin \
    --prefix=/usr/share/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/lock/subsys/nginx \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-http_gzip_static_module \
    --with-http_stub_status_module \
    --with-http_ssl_module \
    --with-http_spdy_module \
    --with-pcre \
    --with-http_image_filter_module \
    --with-file-aio \
    --with-ipv6 \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_realip_module \
    --with-http_auth_request_module \
    --with-http_addition_module \
    --with-http_sub_module \
    --add-module=http-redis \
    --add-module=http-geoip2 && \
    make && \
    make install

COPY nginx.conf /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 8081
