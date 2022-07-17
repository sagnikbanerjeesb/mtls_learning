#!/bin/bash

set -e

mkdir keys || true
mkdir certs || true
mkdir cert_sign_req || true

entity=$1

openssl genrsa -des3 -out ./keys/${entity}.key 4096

openssl req -sha1 -new -key ./keys/${entity}.key -out ./cert_sign_req/${entity}.csr

openssl x509 -sha1 -req -days 1 -in ./cert_sign_req/${entity}.csr -CA ./certs/ca.cert.pem -CAkey ./keys/ca.key -CAcreateserial -out ./certs/${entity}.crt

openssl rsa -in ./keys/${entity}.key -out ./keys/${entity}_unprotected.key