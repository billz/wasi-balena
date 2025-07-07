# local testing on Raspberry Pi 3
FROM balenalib/raspberrypi3-64-debian:bookworm-run

# install Wasmer
RUN install_packages curl ca-certificates && \
    curl https://get.wasmer.io -sSfL | sh && \
    mv /root/.wasmer/bin/wasmer /usr/local/bin && \
    wasmer --version

WORKDIR /app

# copy prebuilt cowsay.wasm and start script
COPY cowsay.wasm .
COPY start.sh .

CMD ["bash", "start.sh"]

