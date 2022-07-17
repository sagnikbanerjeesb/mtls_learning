# Mutual TLS experiment

## Objective:

Establish mTLS between server1 and server2 for this traffic flow:
Browser -> server1 -> server2

### Pre-requisites

1. openssl
2. docker

### Steps

1. execute `chmod +x ./common/gen-root-ca.sh`
2. execute `chmod +x ./common/gen-cert.sh`
3. execute: `chmod +x ./server1/nginx/start-nginx.sh`
4. execute: `chmod +x ./server2/nginx/start-nginx.sh`
5. generate root certificate: `./common/gen-root-ca.sh` (use suitable password for key and use `dummy.demo` as Common Name for certificate, all other fields can be skipped)
6. generate server1 certificate: `./common/gen-cert.sh server1` (use suitable password for key and use `server1.dummy.demo` as Common Name for certificate, all other fields can be skipped)
7. generate server2 certificate: `./common/gen-cert.sh server2` (use suitable password for key and use `server2.dummy.demo` as Common Name for certificate, all other fields can be skipped)
8. start server1: `./server1/nginx/start-nginx.sh`
9. start server2: `./server2/nginx/start-nginx.sh`
10. Add localhost mappings for `server1.dummy.demo` and `server2.dummy.demo` to `/etc/hosts` file
11. Hit `https://server1.dummy.demo:8001` from browser

### Ref

1. https://www.golinuxcloud.com/create-certificate-authority-root-ca-linux/
2. https://docs.konghq.com/kubernetes-ingress-controller/latest/guides/upstream-mtls/
