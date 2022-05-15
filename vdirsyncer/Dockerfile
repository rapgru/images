FROM python:3

RUN apt-get install -y libxml2 libxslt1.1 zlib1g
RUN pip install --ignore-installed vdirsyncer[google]

WORKDIR /config

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]