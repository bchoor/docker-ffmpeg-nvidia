FROM nvidia/video-codec-sdk:8.2-ubuntu18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/*
