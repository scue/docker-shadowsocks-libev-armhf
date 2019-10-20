#
# Dockerfile for shadowsocks-libev
#

FROM arm32v6/alpine:3.8

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN set -ex \
    && apk add --no-cache \
        libcrypto1.0 \
        libev \
        libsodium \
        pcre \
        udns \
        c-ares
RUN set -ex \
    && apk add --no-cache --virtual TMP \
        autoconf \
        automake \
        build-base \
        gettext-dev \
        libev-dev \
        libsodium-dev \
        libtool \
        linux-headers \
        openssl-dev \
        pcre-dev \
        c-ares-dev \
        udns-dev \
        asciidoc \
        xmlto \
        curl \
    && ( \
        SS_VERSION=3.2.5; \
        LIBSODIUM_VER=1.0.16; \
        MBEDTLS_VER=2.6.0; \
        BUILD_DIR=/tmp/build; \
        mkdir $BUILD_DIR \
        && cd $BUILD_DIR \
        && curl -sL https://github.com/scue/docker-shadowsocks-libev-armhf/raw/master/shadowsocks-libev-3.2.5.tar.gz | tar zxv \
        && cd shadowsocks-libev-$SS_VERSION \
        && ( cd libsodium-$LIBSODIUM_VER && ./configure --prefix=/usr && make && make install ) \
        && ( cd mbedtls-$MBEDTLS_VER && make SHARED=1 CFLAGS="-O2 -fPIC" && make DESTDIR=/usr install ) \
        && ./autogen.sh && ./configure && make && make install \
        && rm -rf $BUILD_DIR \
    ) \
    && apk del TMP

RUN rm -f /usr/bin/qemu-arm-static
