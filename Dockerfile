FROM alpine:3.12

ENV TZ=UTC

COPY clean.sh /tmp/clean.sh
RUN apk add --no-cache mariadb-client=10.4.13-r0 && \
  sh /tmp/clean.sh

ENTRYPOINT ["mysql"]
