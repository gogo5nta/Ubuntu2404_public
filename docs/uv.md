# uv.md

**作成者**: gogo5nta  
**作成日**: 2026-06-28  
**目的**: uvの使い方を整理
**バージョン**: v0.1  
**参考資料**:

| # | 資料名 | 備考 | URL |
|---|---|---|---|
| 1 | uv （pythonパッケージマネージャー）の使い方　詳細版 | UV関係のまとめ1 | [URL](https://zenn.dev/tabayashi/articles/52389e0d6c353a) |
| 2 | uv を今さらながら使い始めてみる（Python のパッケージ管理など）| UV関係のまとめ2 | [URL](https://qiita.com/youtoy/items/ce1e4602b09980f329dc) |
| 3 | uvインストールとPATH設定のやさしい解説（PowerShellとCMD両対応）| windowsでuvインストール後のpath設定 | [URL](https://note.com/youpapalife/n/na3bdb65e8d18) |

---

# 1. UVインストール

## 1.1 macOS/Linuxインストール

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## 1.2 Windowsインストール

```shell
# Windows
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### 1.2.1 path設定(PowerShell)

スタートメニューから「PowerShell」と検索 > 「Windows PowerShell」を右クリック > 「管理者として実行」を選択  
```shell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

通常のPowerShell起動
```shell
# もしプロファイルファイルがなかったら、新規作成
if (!(Test-Path -Path $PROFILE)) {
New-Item -ItemType File -Path $PROFILE -Force
}
```

```shell
# プロファイルファイルに、「uvのプログラムがある場所（`C:\Users\あなたのユーザー名\.local\bin`）」をPATHに追加
Add-Content -Path $PROFILE -Value '$env:PATH += ";C:\Users$env:USERNAME.local\bin"'
```

### 1.2.2 path設定(cmd)

windowsの場合、uvは以下にインストール済

```bat
echo "uv.exeの場所"

@echo C:\Users\{USER}\.local\bin\uv.exe
dir %USERPROFILE%\.local\bin
```

環境変数を開き、pathに以下を追加
```
%USERPROFILE%\.local\bin
```
---

# 2. UVの基本的な使い方

## 2.1 pythonインストール

```bash
# python install in uv
uv python install 3.11
```

## 2.2 UVプロジェクトの作成

```bash
# init uv project (my-project)
uv init my-project
```

## 2.3 UVへ依存関係を追加(pip installみたいなもの)

```bash
# pyproject.tomlの project.dependencies に依存関係を追加 > 仮想環境へインストール
uv add requests
```

依存関係を削除
```bash
uv remove requests
```

## 2.4 環境の管理

UV環境を再現する場合、以下のコマンドを実行
```bash
uv sync
```