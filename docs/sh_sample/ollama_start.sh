#!/bin/sh

# docker 基本起動(GPU) home環境(.ollama)にバインド＆コンテナ自動起動
docker run -d \
  --gpus=all \
  -v /home/$USER/ollama:/root/.ollama \
  -p 11434:11434 \
  --restart always \
  --name ollama ollama/ollama