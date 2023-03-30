# FROM ruby:3.2.1
FROM --platform=linux/amd64 ruby:3.2.1

RUN apt-get update && \
    apt-get install -y vim curl git zip unzip procps \
        libicu-dev \
        g++ zlib1g-dev

# protoc
RUN apt install -y protobuf-compiler

# ruby plugin
RUN gem install grpc-tools
# path
RUN cp /usr/local/bundle/bin/grpc_tools_ruby_protoc_plugin \
    /usr/local/bin/protoc-gen-ruby-grpc

# php plugin
RUN apt install -y cmake

RUN cd /tmp && \
    git clone -b v1.53.0 https://github.com/grpc/grpc && \
    cd grpc && \
    git submodule update --init && \
    mkdir -p cmake/build && \
    cd cmake/build && \
    cmake ../.. && \
    make grpc_php_plugin

# path
RUN mv /tmp/grpc/cmake/build/grpc_php_plugin /usr/local/bin/protoc-gen-php-grpc
