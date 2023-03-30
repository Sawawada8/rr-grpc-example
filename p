#!/bin/bash
protoc \
    --php_out=php-out \
    --php-grpc_out=php-gout \
    service.proto
