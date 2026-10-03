# syntax=docker/dockerfile:1

FROM node:26-trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    ca-certificates \
    procps \
    build-essential \
    python3 \
    python3-dev \
    gcc \
    g++ \
    make \
    cmake \
    ripgrep \
    fd-find \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=warn
ENV PI_CODING_AGENT_DIR=/pi
ENV RUSTUP_HOME=/opt/rust
ENV CARGO_HOME=/opt/cargo

RUN npm install -g @earendil-works/pi-coding-agent

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y

RUN mkdir -p /pi /workspace /opt/cargo/registry
WORKDIR /workspace

ENV PATH=/opt/cargo/bin:$PATH

ENTRYPOINT ["pi"]
CMD []
