FROM php:7.3-alpine

LABEL maintainer="ViperPrint <dev@viperprint.pl>"

ENV VERSION=v6.8.0

RUN apk update --no-cache \
	&& apk add --no-cache \
	rsync \
	openssh-client

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& composer global require deployer/deployer:$VERSION deployer/recipes \
	&& ln -s /root/.composer/vendor/bin/dep /usr/local/bin/dep



VOLUME ["/data", "$HOME/.ssh"]
WORKDIR /data
