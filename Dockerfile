FROM alpine:3.15.4

ARG USER_ID=2000
ARG USER_NAME=tor
# -D - no password, -g - GECOS
RUN addgroup -g ${USER_ID} -S ${USER_NAME} && \
    adduser -u ${USER_ID} -S ${USER_NAME} -G ${USER_NAME} -D -g ""
ENV TZ=Europe/Moscow

RUN echo '@edgecommunity https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk -U upgrade && \
    apk -v add --no-cache tor@edgecommunity lyrebird@testing bash curl && \
    rm -rf /var/cache/apk/* && \
    chown -R ${USER_NAME}:${USER_NAME} /etc/tor && \
    chmod -R 700 /etc/tor

COPY --chown=${USER_NAME}:${USER_NAME} start.sh /srv/
RUN chmod +x /srv/start.sh

HEALTHCHECK --start-period=20s --timeout=15s --interval=60s \
    CMD curl -x socks5h://localhost:9350 'https://check.torproject.org/api/ip' | \
    grep -qm1 :true

USER ${USER_NAME}

EXPOSE 9350/tcp 9351/tcp 9352/udp

CMD ["/srv/start.sh"]
