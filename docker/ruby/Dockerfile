# FROM ruby:3.2.1
FROM --platform=linux/amd64 ruby:3.2.1

RUN apt-get update && \
    apt-get install -y vim curl git zip unzip procps \
        libicu-dev \
        g++ zlib1g-dev

# grpc
RUN gem install grpc

# tools
RUN gem install grpc-tools

# protoc
RUN apt install -y protobuf-compiler

RUN cp /usr/local/bundle/bin/grpc_tools_ruby_protoc_plugin \
    protoc-gen-ruby-grpc
