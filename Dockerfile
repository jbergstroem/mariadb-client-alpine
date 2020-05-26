FROM alpine:3.11

ENV TZ=UTC

COPY clean.sh /tmp/clean.sh

RUN apk add --no-cache mariadb-client && \
  sh /tmp/clean.sh
ENTRYPOINT ["mysql"]