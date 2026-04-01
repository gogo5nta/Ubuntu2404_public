# ollama.md

ollama関係のメモ

**作成日**  : 2026/03/29
**ﾊﾞｰｼﾞｮﾝ** : v0.0.1

---

# 1. ollama docker設定

## 1.1 docker実行

[参考1_Dockerを用いたOllamaの実行手順まとめ](https://qiita.com/Chi_corp_123/items/7b3e2617e901a656ede4)
[参考2_Docker 上で GPU を使って Ollama を動かす](https://ishikawa-pro.hatenablog.com/entry/2025/01/16/192126)

<details>
  <summary>フォルダマウントの注意をクリックで展開</summary>

```text
Dockerコマンドで -v ollama:/root/.ollama と指定した場合、
「名前付きボリューム（Named Volume）」として扱われるため、
ホスト側のカレントディレクトリ（今いるフォルダ）にデータは現れません。 

フォルダが見当たらない主な理由と、解決策を整理しました。
1. なぜフォルダが見えないのか？
名前付きボリュームの仕組み: ollama: のようにコロンの左側に
絶対パス（/から始まるパス）を書かない場合、Dockerが管理する専用領域にデータが保存されます。

保存場所: 通常、Linux環境では /var/lib/docker/volumes/ollama/_data に保存されています。ここは管理者権限がないとアクセスできません。

2. ホスト側のフォルダで見えるようにする方法（バインドマウント）
自分の好きなフォルダ（例：デスクトップや作業用ディレクトリ）の中身を見たい場合は、
絶対パスで指定する必要があります。

実行コマンド例（Linux / Mac）
カレントディレクトリの ollama_data フォルダを同期させる場合：

bash
docker run -d --gpus=all -v /home/$USER/ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

</details>

<BR>

基本実行は以下。　　
ollamaのイメージを取得、 .ollamaフォルダをマウント、ollamaのコンテナ名で実行
初回はイメージ取得で3.5GB程度使用

```bash
# docker 基本起動
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

## 1.2 GPUバックグランド実行

GPUでバックグラウンド動作

```bash
# docker 基本起動(GPU)
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

GPUでバックグラウンド動作(home環境にバインド)

```bash
# docker 基本起動(GPU) home環境にバインド
docker run -d --gpus=all -v /home/$USER/ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

```bash
# docker 基本起動(GPU) home環境にバインド
docker run -d \
  --gpus=all \
  -v /home/$USER/ollama:/root/.ollama \
  -p 11434:11434 \
  --restart always \
  --name ollama ollama/ollama
```

<BR>

start_ollama.shの例(chmod +xで実行権限を与えておく)

```bash
#!/bin/bash

# docker 基本起動(GPU) home環境にバインド
docker run -d \
  --gpus=all \
  -v /home/$USER/ollama:/root/.ollama \
  -p 11434:11434 \
  --restart always \
  --name ollama ollama/ollama
```

### 1.3 ollama起動確認

curlを使い、以下のコマンドで確認可能

```bash
# curlコマンドで動作確認
curl http://localhost:11434
```

```bash
# curlコマンドで動作確認
curl http://192.168.1.61:11434
```

正常動作の場合、以下のメッセージを取得

```bash
Ollama is running
```

## 1.4 モデルインストール

### 1.4.1 モデル確認(URL)

インストール可能なモデル一覧は以下のURLを参考
https://ollama.com/library

### 1.4.2 モデルインストール

docker実行例:

```bash
docker exec -it ollama ollama pull qwen3.5:9b
```

```bash
docker exec -it ollama ollama pull gpt-oss:20b
```

### 1.4.3 モデル確認(local)

以下のコマンドで、localにインストールしたモデル一覧を確認

docker実行例:

```bash
# ollama listでインストールモデルを確認
docker exec -it ollama ollama list
```

curl確認

```bash
# curlでインストールモデルを確認
curl http://localhost:11434/api/tags
```

curl確認 (IP)

```bash
# curlでインストールモデルを確認
curl http://192.168.1.61:11434/api/tags
```

実行中のモデル curl確認 (IP)

```bash
# curlで実行中モデルを確認
curl http://192.168.1.61:11434/api/ps
```

<BR>

curl出力のjsonをjqで成形 (モデル一覧)

```bash
# bashでjqを用いて成形
curl http://localhost:11434/api/tags | jq -C '.'
```

## 1.5 推論

### 1.5.1 推論(curl)

curl出力のjsonをjqで成形(chat結果)

```bash
# curlを使い、chat API経由で推論実施
curl http://localhost:11434/api/chat -d '{
  "model": "qwen3.5:9b",
  "messages": [{
    "role": "user",
    "content": "日本語で挨拶して"
  }],
  "stream": false
}' | jq -C
```

<BR>

ollama出力をjsonファイルに保存

```bash
# curlを使い、chat API経由で推論実施
curl http://localhost:11434/api/chat -d '{
  "model": "qwen3.5:9b",
  "messages": [{
    "role": "user",
    "content": "日本語で挨拶して"
  }],
  "stream": false
}' > ollama_res.json
```

### 1.5.2 推論をjson形式で保存(curl)

ollama出力をjsonファイルに保存　(qwen3 no-thinking)
[参考:extra_bodyでno_thinking](https://github.com/run-llama/llama_index/issues/18635#issuecomment-3686160674)

```bash
# curlを使いno-thinkingの出力を保存
curl http://localhost:11434/api/chat -d '{
  "model": "qwen3.5:9b",
  "messages": [{
    "role": "user",
    "content": "日本語で挨拶して"
  }],
  "extra_body": {
    "chat_template_kwargs": {"enable_thinking": false}
  },
  "stream": false
}' > ollama_res_nothinking.json
```

<BR>

jqでollama出力を解析

```bash
# jqでresponse[message[content]]を成形し確認
cat ollama_res.json | jq '.message.content'
```

### 1.5.3 ollamaの推論(terminal)

軽いモデルをダウンロード

```bash
ollama pull gemma3:1b
```

<BR>

teminal上で実行 ollama runを実行

```bash
ollama run gemma3:1b
```

ollama run後の、質問と応答は以下

```bash
>>> 挨拶して
こんにちは！何かお手伝いできることはありますか？ 😊
```

## 1.6 ollama API (日本語)

[Ollama API (日本語)](https://ollama-jp.apidog.io/)
![alt text](../assets/img/ollama_api_japanese1.jpg)
