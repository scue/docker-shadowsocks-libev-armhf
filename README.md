# scue/shadowsocks-libev-armhf

**Base on:**

* [arm32v6/alpine:3.8](https://hub.docker.com/r/arm32v6/alpine/)
* [shadowsocks-libev v3.2.5](https://github.com/shadowsocks/shadowsocks-libev/archive/v3.2.5.tar.gz)
* [libsodium-1.0.16](https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz)
* [mbedtls-2.6.0](https://tls.mbed.org/download/mbedtls-2.6.0-gpl.tgz)

# Usage

On macOS/Linux x86_64 platform, type:

```bash
docker run --rm -it -v $PWD/qemu-arm-static:/usr/bin/qemu-arm-static scue/shadowsocks-libev-armhf ss-server --help
```

On arm32v6 platfrom, type:

```bash
docker run --rm -it scue/shadowsocks-libev-armhf ss-server --help
```

# Build

```bash
docker build --squash -t scue/shadowsocks-libev-armhf .
```