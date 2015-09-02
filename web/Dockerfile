FROM ubuntu

COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential libgd2-xpm-dev libpcre3 libpcre3-dev libssl-dev wget
RUN rm -rf /var/lib/apt/lists/*

# Download Nginx and Nginx modules source
RUN wget http://nginx.org/download/nginx-1.8.0.tar.gz -O nginx.tar.gz && \
    mkdir /tmp/nginx && \
    tar -xzvf nginx.tar.gz -C /tmp/nginx --strip-components=1

RUN wget http://people.freebsd.org/~osa/ngx_http_redis-0.3.7.tar.gz -O ngx-http-redis.tar.gz && \
    mkdir /tmp/nginx/http-redis && \
    tar -xzvf ngx-http-redis.tar.gz -C /tmp/nginx/http-redis --strip-components=1

RUN addgroup nginx
RUN adduser --system --no-create-home --shell /bin/false --group --disabled-login nginx

# Build Nginx
WORKDIR /tmp/nginx
RUN ./configure \
    --sbin-path=/usr/sbin/nginx && \
#RUN ./configure \
#    --user=nginx \
#    --with-debug \
#    --group=nginx \
#    --prefix=/usr/share/nginx \
#    --sbin-path=/usr/sbin/nginx \
#    --conf-path=/etc/nginx/nginx.conf \
#    --pid-path=/run/nginx.pid \
#    --lock-path=/run/lock/subsys/nginx \
#    --error-log-path=/var/log/nginx/error.log \
#    --http-log-path=/var/log/nginx/access.log \
#    --with-http_gzip_static_module \
#    --with-http_stub_status_module \
#    --with-http_ssl_module \
#    --with-http_spdy_module \
#    --with-pcre \
#    --with-http_image_filter_module \
#    --with-file-aio \
#    --with-ipv6 \
#    --with-http_dav_module \
#    --with-http_flv_module \
#    --with-http_mp4_module \
#    --with-http_gunzip_module \
#    --add-module=http-redis && \
  make && \
  make install

#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
