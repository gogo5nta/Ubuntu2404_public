#!/bin/sh

# docker 基本起動(GPU) home環境(.ollama)にバインド＆コンテナ自動起動 & devモード
docker run -d \
  -v /home/$USER/open-webui:/app/backend/data \
  -p 3000:8080 \
  -e OLLAMA_BASE_URL=http://192.168.1.7:11434 \
  -e ENV=dev \
  --name open-webui \ 
  --restart=always \
  ghcr.io/open-webui/open-webui:main

