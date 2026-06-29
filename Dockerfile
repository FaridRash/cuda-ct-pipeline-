FROM nvcr.io/nvidia/cuda:12.4.1-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    pkg-config \
    libopencv-dev \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
