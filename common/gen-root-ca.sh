#!/bin/bash

set -e

mkdir keys || true
mkdir certs || true

openssl genrsa -des3 -out ./keys/ca.key 4096
openssl req -sha1 -new -x509 -days 1 -key ./keys/ca.key -out ./certs/ca.cert.pem