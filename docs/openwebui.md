# openwebui.md

ollama関係のメモ

**作成日**  : 2026/03/29
**ﾊﾞｰｼﾞｮﾝ** : v0.0.1

---

# 1. openwebui docker設定

## 1.1 docker実行

[参考1: ローカル環境で動かすOpen WebUIのインストールと使用方法](https://note.com/tamo2918/n/n94b8561fb70c)
[参考2: OpenWebUI Quick Start](https://docs.openwebui.com/getting-started/quick-start/)
[参考3: OllamaをDockerで動かす完全ガイド](https://saiteki-ai.com/basics/ai-tool/ollama/ollama-docker/)

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

Swagger UI API ドキュメントを見る場合、以下を参考に
- [APIエンドポイントについて](https://www.reddit.com/r/OpenWebUI/comments/1k0vyyl/about_api_endpoints/?tl=ja)
- [After adding the environment variable -e ENV=dev](https://github.com/open-webui/open-webui/issues/18882)

```bash
# Swagger UI API  起動時に-e ENV=dev必要
http://localhost:11434/docs
```

<BR>

```bash
# docker 基本起動 home環境にバインド_debug
docker run -d \
  -v /home/$USER/open-webui:/app/backend/data \
  -p 3000:8080 \
  -e ENV=dev \
  -e OLLAMA_BASE_URL=http://192.168.1.61:11434 \
  --name open-webui \
  ghcr.io/open-webui/open-webui:main
```

start_openwebui.shの例(chmod +xで実行権限を与えておく)

```bash
#!/bin/bash

# docker 基本起動 home環境にバインド_debug
docker run -d \
  -v /home/$USER/open-webui:/app/backend/data \
  -p 3000:8080 \
  -e ENV=dev \
  -e OLLAMA_BASE_URL=http://192.168.1.61:11434 \
  --name open-webui \
  ghcr.io/open-webui/open-webui:main
```

# 2. openwebui設定

## 2.1 タイトルを日本語で生成

Step1: OpenWebUI 画面左下のプロファイル > 管理者パネル > 設定 > インタフェース
Step2: タイトル生成プロンプトに以下を入れる
```text
ユーザーの入力とAIの返答に基づき、この会話のタイトルを生成してください。
以下のガイドラインに従ってください：
1. 会話の主旨を10〜15文字程度の日本語で要約してください。
2. 簡潔で、チャット履歴を見て何の話かすぐにわかるようにしてください。
3. タイトルのみを出力し、説明や引用符（""）は含めないでください。
4. 挨拶（こんにちは等）ではなく、トピックに焦点を当ててください。

ユーザー: {{prompt}}
AI: {{response}}
```

- ![alt text](../assets/img/openwebui_title_japanese1.jpg)
