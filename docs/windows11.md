# windows11.md

windows11関係のメモ

**作成日**  : 2026/04/05
**ﾊﾞｰｼﾞｮﾝ** : v0.0.2

---

## Table of Contents

| # | セクション | 説明 |
|---|---|---|
| 1 | [curlインストール](#curlインストール) | curlインストール |
## curlインストール

[curl | Windows11におけるcurl利用までのフロー](https://shelokuma.com/2024/03/20/flow-for-using-command-line-tool-curl-on-windows11/)

step1: [cURL](https://curl.se/) > Download > [Windows downloads](https://curl.se/windows/) > curl for X64 を入手
step2: zipを解凍し、bin/curl.exeをローカルにコピー後、環境変数のpathに追加

```bash
# .binフォルダにcurl.exeを入れた場合のpath追加
C:\Users\$USER\.bin
```
