#!/bin/sh
set -x

echo "server=$RESOLVER" > /dnsmasq.conf
echo "address=/$HOSTS" | tr ':' '/' | sed 's|;|\naddress=/|g' >> /dnsmasq.conf

/bin/dnsmasq --keep-in-foreground --port=1053 --conf-file=/dnsmasq.conf