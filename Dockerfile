FROM ubuntu:bionic
LABEL Kenan Sulayman <kenan@sly.mn>

ENV USER root
ENV PATH /root/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl1.0-dev \
    openssl1.0 \
    pkg-config && \
  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir /source

VOLUME ["/source"]
WORKDIR /source

CMD ["/bin/bash"]
