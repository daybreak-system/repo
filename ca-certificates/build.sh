#!/bin/sh
set -eu

wget https://curl.se/ca/cacert-2026-10-20.pem -O cacert.pem

mkdir -p "$1/etc/ssl/certs"
install -m 0644 cacert.pem "$1/etc/ssl/certs/ca-certificates.crt"
