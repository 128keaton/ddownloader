FROM alpine:latest

VOLUME /tmp/imgs

RUN apk update && \
    apk add coreutils curl bash

COPY ddownload.sh /ddownload.sh

RUN mkdir -p /tmp/imgs

CMD ["sh", "/ddownload.sh"]
