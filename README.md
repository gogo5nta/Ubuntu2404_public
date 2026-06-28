# Ubuntu2404_public

<!-- encoding: utf-8 -->

***概要**: Ubuntu24.04の公開用リポジトリ  
**作成日**: 2026/06/28  
**ﾊﾞｰｼﾞｮﾝ**: v0.0.5  

---

# 1. docs関係

| 種類 | 説明 | 備考 |
| --- | --- | --- |
| [AI_Chat.md](AI_Chat.md) | AI Chatのリンク集 | |
| [docker.md](./docs/dopcker.md) | docker関係のメモ | ollamaをdockerで動作 |
| [git.md](git.md) | git関係のメモ | |
| [github_copilot.md](github_copilot.md) | GitHub Copilotのメモ | |
| [langfuse.md](langfuse.md) | Langfuse関連のメモ | LLM Opsで、入出等を管理。<BR>docker runで起動 |
| [Mermaid.md.md](Mermaid.md.md) | Mermaidの使い方まとめ | |
| [ollama.md](./docs/ollama.md)  | ollama関係のメモ | ollamaの実行やモデルインストール。<BR>docker runで起動 |
| [windows11.md](./docs/windows11.md) | windows11関係のメモ | |
| [openwebui.md](openwebui.md) | OpenWebUIのメモ | ollamaのLocall LLMをchatで繋ぐ。<BR>docker runで起動 |
| [PlantUML.md](PlantUML.md) | PlantUMLのまとめ | |
| [ubuntu.md](ubuntu.md) | Ubuntu24.04のセットアップ | |
| [uv.md](./docs/uv.md) | UV操作のメモ |

# 2. 01_ubuntu_setup関係

| 種類 | 説明 | 備考 |
| --- | --- | --- |
| [01_install_tool.sh](./01_ubuntu_setup/01_install_tool.sh) | Ubuntu基本ツールのインストール | 初期セットアップ時に実行 |
| [02_install_nvida_container_toolkit.sh](./01_ubuntu_setup/02_install_nvida_container_toolkit.sh) | NVIDIAコンテナツールキットのインストール | GPU環境構築用 |
| [README.md](./01_ubuntu_setup/README.md) | セットアップガイド | インストール手順の詳細

# 3. 全体

| 種類 | 説明 | 備考 |
| --- | --- | --- |
| [README.md](./README.md) | Githubリポジトリ全体の説明 | |
| [pyproject.toml](pyproject.toml) | UV環境の管理ファイル | |