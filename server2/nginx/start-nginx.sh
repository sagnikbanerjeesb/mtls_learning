#!/bin/bash

set -e

docker run --name server2-nginx -v ${PWD}/server2/nginx/nginx.conf:/etc/nginx/nginx.conf \
                                -v ${PWD}/server2/nginx/html:/etc/nginx/html \
                                -v ${PWD}/keys/server2_unprotected.key:/etc/nginx/ssl/server2_unprotected.key \
                                -v ${PWD}/certs/server2.crt:/etc/nginx/ssl/server2.crt \
                                -v ${PWD}/certs/ca.cert.pem:/etc/nginx/ssl/ca.cert.pem \
                                -p 8002:443 \
                                nginx