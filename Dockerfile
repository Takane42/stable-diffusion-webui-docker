FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y git vim python3 python3-venv curl ffmpeg libsm6 libxext6

RUN useradd -ms /bin/bash deez

USER deez

WORKDIR /home/deez

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git \
    && cd stable-diffusion-webui \
    && ./webui.sh --skip-torch-cuda-test

CMD ~/stable-diffusion-webui/webui.sh
