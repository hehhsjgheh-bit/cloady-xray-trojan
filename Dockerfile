# Xray (Trojan) for Cloady — multi-stage: copy the xray binary into Alpine
FROM teddysun/xray:26.10.31 AS xray
FROM alpine:3.20
RUN apk add --no-cache ca-certificates
COPY --from=xray /usr/bin/xray /usr/local/bin/xray
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
