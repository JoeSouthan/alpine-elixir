FROM alpine:3.4

ENV ELIXIR_VERSION 1.2.6

RUN apk --update add --virtual build-dependencies wget ca-certificates && \
    wget --no-check-certificate https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
    mkdir -p /opt/elixir-${ELIXIR_VERSION}/ && \
    unzip Precompiled.zip -d /opt/elixir-${ELIXIR_VERSION}/ && \
    rm Precompiled.zip && \
    apk del build-dependencies && \
    apk --update add erlang-sasl erlang-crypto erlang-syntax-tools openssl && \
    rm -rf /etc/ssl && \
    rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
