FROM caddy:2.6-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare


FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY run.sh /
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
