#!/bin/sh
set -e
: "${PORT:=8080}"
: "${UUID:?UUID env var is required}"
: "${WSPATH:?WSPATH env var is required}"
sed -e "s/__PORT__/${PORT}/g" -e "s/__UUID__/${UUID}/g" -e "s/__WSPATH__/${WSPATH}/g" \
  /etc/xray/config.json.tmpl > /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
