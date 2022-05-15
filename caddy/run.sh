#!/bin/sh

echo "$CADDYFILE" > /etc/caddy/Caddyfile

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile