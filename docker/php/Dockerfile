FROM ghcr.io/roadrunner-server/roadrunner:2.12.3 AS roadrunner
FROM php:8.2-cli

RUN apt-get update && \
    apt-get install -y vim curl git zip unzip procps \
        libicu-dev \
        g++ zlib1g-dev
RUN docker-php-ext-install intl pdo_mysql

# for rr
RUN docker-php-ext-install sockets

# grpc ext
RUN pecl install grpc
RUN docker-php-ext-enable grpc

# xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
COPY ./docker/php/php.ini /usr/local/etc/php/

COPY --from=composer:2.5.4 /usr/bin/composer /usr/bin/composer

COPY --from=roadrunner /usr/bin/rr /usr/local/bin/rr

# rr grpc

# 多分いらない
# RUN pecl install protobuf
# RUN pecl install protobuf-3.10.0

# protoc
RUN apt install -y protobuf-compiler


# https://github.com/grpc/grpc/blob/v1.53.0/src/php/README.md
# grpc_php_plugin
# 最新の v1.53.0 make で error
# https://github.com/grpc/grpc/issues/25350
# RUN cd /tmp && git clone -b v1.34.1 https://github.com/grpc/grpc
RUN cd /tmp && git clone -b v1.53.0 https://github.com/grpc/grpc
# && \
WORKDIR /tmp
RUN    cd grpc && \
    git submodule update --init
# && \
WORKDIR /tmp/grpc
RUN    mkdir -p cmake/build
# && \
RUN apt install -y cmake
WORKDIR /tmp/grpc/cmake/build
# RUN    cd cmake/build && \
RUN cmake ../..
# && \
# RUN    make protoc grpc_php_plugin && \
RUN    make grpc_php_plugin
# && \
# mv protoc /usr/local/bin/protoc && \
    # mv grpc_php_plugin /usr/local/bin/grpc_php_plugin
RUN    mv grpc_php_plugin /usr/local/bin/protoc-gen-php-grpc
# && \

# /tmp/grpc/cmake/build/grpc_php_plugin
# /tmp/grpc/cmake/build/protoc -I=. hello.proto --php_out=out-- --grpc_out=gout-- --plugin=protoc-gen-grpc=/tmp/grpc/cmake/build/grpc_php_plugin

# protoc --php_out=out-- --grpc_out=gout-- --plugin=protoc_gen_grpc hello.proto
