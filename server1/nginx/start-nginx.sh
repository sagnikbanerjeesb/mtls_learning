#!/bin/bash

set -e

docker run --name server1-nginx -v ${PWD}/server1/nginx/nginx.conf:/etc/nginx/nginx.conf \
                                -v ${PWD}/keys/server1_unprotected.key:/etc/nginx/ssl/server1_unprotected.key \
                                -v ${PWD}/certs/server1.crt:/etc/nginx/ssl/server1.crt \
                                -p 8001:80 \
                                nginx