#!/bin/bash

# aquire certs

/dehydrated/dehydrated -c -k /hook/cf-hook.sh --accept-terms -o /certs -t dns-01 --ca letsencrypt-test -d $DOMAIN --alias wildcard_cert

# upload to cloudflare

curl -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/custom_certificates" \
     -H "X-Auth-Email: $AUTH_EMAIL" \
     -H "X-Auth-Key: $CF_TOKEN" \
     -H "Content-Type: application/json" \
     --data  '{"certificate": "'$(cat /certs/wildcard_cert/cert.pem | awk 1 ORS='\\n')'", "private_key": "'$(cat /certs/wildcard_cert/privkey.pem | awk 1 ORS='\\n')'"}'