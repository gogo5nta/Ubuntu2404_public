# ubuntu.md

ubuntu24.04関係のメモ

**作成日**  : 2026/04/05
**ﾊﾞｰｼﾞｮﾝ** : v0.0.2

---

# Table of Contents

| # | セクション | 説明 |
|---|---|---|
| 1 | [ubuntu 24.04 基本設定](#ubuntu-24-04-基本設定) | 基本設定 |
| 1.1 | [Remote DeskTop](#remote-desktop) | Remote Desktop |
| 1.2 | [openssh-server](#openssh-server) | SSHサーバ |
| 1.3 | [jq](#jq) | JSONツール |
| 1.4 | [du](#du) | ディレクトリサイズ |

<BR>

---

# ubuntu 24.04 基本設定

## Remote DeskTop

[Ubuntu 24.04 LTSで新しい標準RDP接続を試してみる](https://blog.treedown.net/entry/2024/09/17/010000)  
以下の設定で、WindowsからRemote Desktopでログインできるように設定

- 設定画面 > システム > 画面上の「Remote Desktop」> Desktop Sharing、Remote Controlの二つを有効化
  - ![alt text](../assets/img/Ubuntu_Remote01.jpg)

- ユーザ名とパスワードを確認。パスワードはRDP接続用のパスワードを別途設定
  - ![alt text](../assets/img/Ubuntu_Remote02.jpg)

## openssh-server

サーバーでの事前準備
[SSH接続のための設定まとめ](https://qiita.com/010Ri/items/0a09356633655b5613ee)  
以下のコマンドで、sshサーバーをインストール

```bash
sudo apt install openssh-server
```

## jq

[JSONをLinuxで扱うコマンドの使い方](https://zenn.dev/en2enzo2/articles/e45e6d0aec6c7e)
[jqコマンドを使ったJSONデータの加工](https://yossi-note.com/how_to_use_the_jq_command/)
[jq コマンドを使う日常のご紹介](https://qiita.com/takeshinoda@github/items/2dec7a72930ec1f658af)

ファイルを見やすく表示
```bash
jq '.' data.json
```

色付け・整形して表示（-Cオプション）:
```bash
jq -C '.' data.json | less -R
```

## du

[Linuxでディレクトリサイズを確認する方法](https://go.lightnode.com/ja/tech/check-directory-size-in-linux)
ubuntu上でフォルダ容量確認する場合

```bash
du -h
```
