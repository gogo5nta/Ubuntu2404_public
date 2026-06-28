# Continue.md

# 1 VSCodeの「Continue」拡張機能に追加

VSCodeでGitHub Copilotに近い体験をローカルモデルで実現するには、オープンソースの拡張機能 Continue を使用します。  

- 1.インストール:
  - VSCodeの拡張機能マーケットプレイスから Continue をインストール

- 2.設定の編集:
  - Continueのサイドバーにある歯車アイコン（Open Config）をクリックし、config.json を開きます。

- 3.モデル情報の追加:
  - models 配列にOllamaの設定を追記
  - path: C:\Users\$USER\.continue\config.yaml

```yaml
name: Local Assistant
version: 1.0.0
schema: v1
models:
  - name: Llama 3.2 3B
    provider: ollama
    model: llama3.2:3b
    roles:
      - chat
      - edit
    apiBase: http://192.168.1.7:11434

  - name: Qwen3.5-Coder 9B
    provider: ollama
    model: qwen3.5:9b
    roles:
      - autocomplete
    apiBase: http://192.168.1.7:11434

  - name: llm-jp-4-32b-a3b-thinking-gguf
    provider: ollama
    model: hf.co/alfredplpl/llm-jp-4-32b-a3b-thinking-gguf:latest
    roles:
      - chat
      - edit
    apiBase: http://192.168.1.7:11434

context:
  - provider: code
  - provider: docs
  - provider: diff
  - provider: terminal
  - provider: problems
  - provider: folder
  - provider: codebase
```

- 4.使用開始:
  - Continueのチャット画面で、追加したモデル（LLM-jp-4）を選択して利用

- 5.参考
  - 【Windows】VSCodeと拡張機能Continueでollamaにローカル接続
    - https://www.kotememo.com/posts/vscode_ollama_continue
  - Ollama + ContinueでVS CodeにローカルLLM開発環境を構築する (Windows / WSL両対応)
    - https://qiita.com/usxc/items/72c9dd16a261fc502f90

# 2. Continueエラー対応

Step1: VSCode画面右下のステータスバーにある「Continue」ボタンをクリック

Step2: Open settings > Configs > Main Configを開く
```text
Continueのパネル（またはステータスバーのContinueボタン）から 
"Configure autocomplete options" をクリックし、設定ファイル
（config.json または config.yaml）を開きます。
```

Step3: config.yaml内のエラー個所を修正