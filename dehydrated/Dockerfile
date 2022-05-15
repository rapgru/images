FROM ubuntu

RUN apt-get -qy update
RUN apt-get -qy install openssl jq publicsuffix curl git dnsutils

RUN git clone https://github.com/dehydrated-io/dehydrated.git /dehydrated
RUN git clone https://github.com/socram8888/dehydrated-hook-cloudflare.git /hook

RUN chmod +x /hook/cf-hook.sh
RUN mkdir /certs

COPY run.sh /

ENTRYPOINT ["/run.sh"]