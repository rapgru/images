FROM alpine:3

ARG VERSION="2.89"
ARG CHECKSUM="8651373d000cae23776256e83dcaa6723dee72c06a39362700344e0c12c4e7e4"

ADD http://www.thekelleys.org.uk/dnsmasq/dnsmasq-$VERSION.tar.gz /tmp/dnsmasq.tar.gz

RUN [ "$(sha256sum /tmp/dnsmasq.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add gcc linux-headers make musl-dev && \
    tar -C /tmp -xf /tmp/dnsmasq.tar.gz && \
    cd /tmp/dnsmasq-$VERSION && \
      make LDFLAGS="-static"

RUN mkdir -p /bin && \
      cp /tmp/dnsmasq-$VERSION/src/dnsmasq /bin/ && \
    mkdir -p /etc && \
      echo "nogroup:*:10000:nobody" > /etc/group && \
      echo "nobody:*:10000:10000:::" > /etc/passwd

COPY --chmod=744 --chown=10000:10000 run.sh /bin/run.sh

RUN touch /dnsmasq.conf && chown 10000:10000 /dnsmasq.conf

USER 10000:10000
EXPOSE 1053/udp
ENTRYPOINT ["/bin/run.sh"]
