# wasi-balena

A minimal [balena block](https://www.balena.io/blog/introducing-balenaBlocks/) that demonstrates [WebAssembly System Interface (WASI)](https://wasi.dev/) on embedded Linux using the [Wasmer](https://wasmer.io/) runtime.

This block runs the `cowsay` WebAssembly module compiled with WASI support and outputs configurable messages to the terminal. Compatible with 64-bit Raspberry Pi and other aarch64 devices.

## Features

- WASI runtime via [Wasmer](https://wasmer.io/)
- Runs `cowsay.wasm` with optional cowfiles
- Customize output via `MESSAGE` and `COW` environment variables

##  Usage

### Local testing
Build with Docker: `docker build -t wasi-balena .` then execute like so:
```bash

docker run --rm wasi-balena
🐄 Running wasmer cowsay...
 __________________________
< Hello from balena block! >
 --------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
               ||----w |
                ||     ||
```

#### Override message and cowfile
```bash
docker run --rm -e MESSAGE="Your WASI code goes here!" -e COW="dragon" wasi-balena
```
### Usage as balena block
To use this block in your own `docker-compose.yml`, add the following:

```yaml
wasi-cowsay:
  image: bh.cr/gh_billz/wasi-cowsay
  environment:
    MESSAGE: "WebAssembly on balena rocks!"
    COW: tux
```
