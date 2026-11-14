#!/bin/sh
set -e
PASSWORD="${TROJAN_PASSWORD:?TROJAN_PASSWORD is required}"
WS_PATH="${WS_PATH:-/trojan}"
PORT="${PORT:-8080}"
mkdir -p /etc/xray
cat > /etc/xray/config.json <<EOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [
    {
      "port": ${PORT},
      "protocol": "trojan",
      "settings": {"clients": [{"password": "${PASSWORD}"}]},
      "streamSettings": {"network": "ws", "wsSettings": {"path": "${WS_PATH}"}}
    }
  ],
  "outbounds": [{"protocol": "freedom"}]
}
EOF
exec /usr/local/bin/xray run -c /etc/xray/config.json
