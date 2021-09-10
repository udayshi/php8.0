FROM alpine:3.12.8
MAINTAINER shiuday@gmail.com


RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git build-base


RUN  git config --global user.email "uday@php.net" && \
git config --global user.name "Alpine Container"

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#
WORKDIR  /usr/local/src
#
#
#
RUN wget https://www.php.net/distributions/php-8.0.10.tar.gz && \
    tar -zxf php-8.0.10.tar.gz
#
#
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN apk add --no-cache  libxml2-dev openssl-dev pkgconfig sqlite-libs sqlite-dev curl-dev oniguruma-dev

##Compile and build  module
RUN cd /usr/local/src/php-8.0.10 && \
    ./configure --enable-fpm --enable-debug  --with-openssl --with-pear --with-curl --with-iconv --enable-mbstring --enable-mysqlnd --with-pdo-mysql &&  \
    make && \
    make install
#
#



RUN apk add --no-cache nginx supervisor curl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update

RUN rm -rf /usr/local/src* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /usr/local/etc
#
#
#
ADD manifest/nginx.sf5.conf /etc/nginx/nginx.conf
ADD manifest/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./manifest/php /usr/local/etc
#
#
#
#
#
EXPOSE 80 443
ADD app app/
WORKDIR /app
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]



