# build cowsay.wasm
FROM rust:1.82 AS builder

# add WASI target
RUN rustup target add wasm32-wasi

# clone and build cowsay
WORKDIR /code
RUN git clone https://github.com/wapm-packages/cowsay.git .
RUN cargo build --release --target wasm32-wasi

# runtime image with wasmer
FROM arm64v8/ubuntu:22.04

# install dependencies + wasmer runtime
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl https://get.wasmer.io -sSfL | sh && \
    mv /root/.wasmer/bin/wasmer /usr/local/bin && \
    wasmer --version

# copy compiled wasm binary and runner
WORKDIR /app
COPY --from=builder /code/target/wasm32-wasi/release/cowsay.wasm .
COPY start.sh .

CMD ["bash", "start.sh"]

