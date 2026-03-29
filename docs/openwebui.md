# openwebui.md

ollama関係のメモ

**作成日**  : 2026/03/29
**ﾊﾞｰｼﾞｮﾝ** : v0.0.1

---

# 1. openwebui docker設定

## 1.1 docker実行

[参考1: ローカル環境で動かすOpen WebUIのインストールと使用方法](https://note.com/tamo2918/n/n94b8561fb70c)
[参考2: OpenWebUI Quick Start](https://docs.openwebui.com/getting-started/quick-start/)

基本実行は以下。　　
openwebuiのイメージを取得、 open-webuiフォルダをマウント、open-webuiのコンテナ名で実行
初回はイメージ取得で1GB程度使用

```bash
# docker 基本起動
docker run -d -v open-webui:/app/backend/data -p 3000:8080 -e OLLAMA_BASE_URL=http://localhost:11434 --name open-webui ghcr.io/open-webui/open-webui:main
```

```bash
# docker 基本起動 home環境にバインド
docker run -d -v /home/$USER/open-webui:/app/backend/data -p 3000:8080 -e OLLAMA_BASE_URL=http://192.168.1.61:11434 --name open-webui ghcr.io/open-webui/open-webui:main
```

<BR>

start_openwebui.shの例(chmod +xで実行権限を与えておく)

```bash
#!/bin/bash

# docker 基本起動 home環境にバインド
docker run -d -v /home/$USER/open-webui:/app/backend/data -p 3000:8080 -e OLLAMA_BASE_URL=http://192.168.1.61:11434 --name open-webui ghcr.io/open-webui/open-webui:main
```
