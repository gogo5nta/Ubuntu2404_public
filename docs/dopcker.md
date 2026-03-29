# docker.md

docker関係のメモ

**作成日**  : 2026/03/29
**ﾊﾞｰｼﾞｮﾝ** : v0.0.1

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

## コンテナにアタッチしてbashを使用する場合

docker exec -it [コンテナ名] bash

---

# dockerオプション

[[Docker]覚えておきたいオプションまとめ](https://qiita.com/ryoishizawa/items/637d39574026bbd54dbf)

| オプション | 説明 | 備考 |
| --- | --- | --- |
| -p  | ポート設定   | {ホスト_ポート番号} : {コンテナ_ポート番号} |
| -v  | フォルダ設定 | {ホスト_フォルダ名} : {コンテナ_フォルダ名} |
| -t  | 標準入力     | ターミナルでの操作 |
| -it | 継続+標準入力 | ターミナルでの操作を継続 |
| --name | コンテナ名 | 指定しないとランダムな乱数に |
| -d | コンテナをバックグランド実行 | --detachの省略。|
