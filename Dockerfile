FROM udaysh/alpine-php8.0.10:xdebug-node
MAINTAINER shiuday@gmail.com


#
#
#
ADD manifest/nginx.sf5.conf /etc/nginx/nginx.conf
ADD manifest/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./manifest/php /usr/local/php8/etc/
ADD ./manifest/php/php.ini.dev /usr/local/php8/etc/php.ini

ADD app /app
EXPOSE 80 443