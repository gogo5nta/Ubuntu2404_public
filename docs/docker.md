# docker.md

docker関係のメモ

**作成日**  : 2026/04/05
**ﾊﾞｰｼﾞｮﾝ** : v0.0.2

---

# Table of Contents

| # | セクション | 説明 |
|---|---|---|
| 1 | [dockerコマンド](#dockerコマンド) | コマンド一覧 |
| 1.1 | [docker ps format](#docker-ps-format) | ps フォーマット |
| 1.2 | [.bashrcのalisとして追加](#bashrcのalisとして追加) | エイリアス |
| 1.3 | [環境変数](#環境変数) | 環境変数 |
| 1.4 | [コンテナにアタッチしてbashを使用する場合](#コンテナにアタッチしてbashを使用する場合) | アタッチ |
| 2 | [dockerオプション](#dockerオプション) | オプション一覧 |

<BR>

---

# dockerコマンド

| コマンド | 説明 | 備考 |
| --- | --- | --- |
| docker run | 実行 | イメージからコンテナ生成など |
| docker exec | アタッチ | 実行中のコンテナにアタッチ。-itでターミナル実行 <BR> docker exec -it [コンテナ名] bash |
| docker stop | 停止 | 例: docker stop ollama |
| docker start | 開始 | 例: docker start ollama |
| docker rm | コンテナ削除 | 例: docker rm ollama |
| docker rmi | イメージ削除 | 例: docker rmi イメージ |
| docker ps | プロセス確認 | 例: docker ps -a |
| docker images | イメージ確認 | |

<BR>

## docker ps format

```bash
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
```

.bashrcのalisとして追加

```bash
# add alias
alias dp='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'

```

<BR>

## 環境変数

[Docker で環境変数をホストからコンテナに渡す方法](https://qiita.com/KEINOS/items/518610bc2fdf5999acf2)

<BR>

## コンテナにアタッチしてbashを使用する場合

docker exec -it [コンテナ名] bash

<BR>

---

# dockerオプション

[[Docker]覚えておきたいオプションまとめ](https://qiita.com/ryoishizawa/items/637d39574026bbd54dbf)

| オプション | 説明 | 備考 |
| --- | --- | --- |
| -p  | ポート設定   | {ホスト_ポート番号} : {コンテナ_ポート番号} |
| -v  | フォルダ設定 | {ホスト_フォルダ名} : {コンテナ_フォルダ名} |
| -e  | 環境変数　   | 変数名 = 値　|
| -t  | 標準入力     | ターミナルでの操作 |
| -it | 継続+標準入力 | ターミナルでの操作を継続 |
| --name | コンテナ名 | 指定しないとランダムな乱数に |
| -d | コンテナをバックグランド実行 | --detachの省略。|
