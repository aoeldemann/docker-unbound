FROM alpine:edge

RUN apk add --update unbound ca-certificates curl \
  && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

EXPOSE 53/udp

ENTRYPOINT ["/entrypoint.sh"]
