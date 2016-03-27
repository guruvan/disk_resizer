FROM alpine:2.7

COPY growpart /
COPY grow.sh /

RUN apk --update add sfdisk parted e2fsprogs && rm -rf /var/cache/apk/*

ENTRYPOINT ["/grow.sh"]
