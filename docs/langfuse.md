# langfuse.md

langfuse関係のメモ

**作成日**  : 2026/03/29
**ﾊﾞｰｼﾞｮﾝ** : v0.0.1

---

# 1. langfuse docker設定

[参考1_LiteLLM + Langfuse をローカルにDockerで立ち上げる](https://zenn.dev/yakan_k/articles/7a8b6b9a2f66f8)

## 1.1 git clone

```bash
git clone https://github.com/langfuse/langfuse.git
cd langfuse
```

## 1.2 port変更

docker-compose.ymlをnanoやgeditで編集

```bash
nano docker-compose.yml
```

L69 - 74当たりを修正。ポート番号 ホスト:コンテナ

```text
  langfuse-web:
    image: docker.io/langfuse/langfuse:3
    restart: always
    depends_on: *langfuse-depends-on
    ports:
      - 3001:3000
```

## 1.3 docker実行(docker compose)

```bash
docker compose up -d
```

## 1.4 docker停止(docker compose)

```bash
docker compose down
```

---

# OpenWebUIとの連携

## 2.1 pipline入手

[公式のlangfuse_filter_pipeline](https://github.com/open-webui/pipelines/blob/039f9c54f8e9f9bcbabde02c2c853e80d25c79e4/examples/filters/langfuse_v3_filter_pipeline.py)からlangfuse_filter_pipeline.pyを入手

[格納先_ssets\python\langfuse_filter_pipeline.py](../assets/python/langfuse_v3_filter_pipeline.py)