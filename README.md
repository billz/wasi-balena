# wasi-balena

A minimal [balena block](https://www.balena.io/blog/introducing-balenaBlocks/) that demonstrates [WebAssembly System Interface (WASI)](https://wasi.dev/) on embedded Linux using the [Wasmer](https://wasmer.io/) runtime.

This block runs the `cowsay` WebAssembly module compiled with WASI support and outputs configurable messages to the terminal. Compatible with 64-bit Raspberry Pi and other aarch64 devices.

## Features

- WASI runtime via [Wasmer](https://wasmer.io/)
- Runs `cowsay.wasm` with optional cowfiles
- Customize output via `MESSAGE` and `COW` environment variables

##  Usage

## Run once with default message
For local testing with Docker, execute the following:

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

## Override message and cowfile
```bash
docker run --rm -e MESSAGE="Your WASI code goes here!" -e COW="dragon" wasi-balena
```
