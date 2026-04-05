 # github_copilot.md

github copilot関係のメモ

**作成日**  : 2026/04/05
**ﾊﾞｰｼﾞｮﾝ** : v0.0.2

---

# Table of Contents

| # | セクション | 説明 |
|---|---|---|
| 1 | [Github Copilot設定](#github-copilot設定) | GitHub Copilotの基本設定 |
| 1.1 | [Visual Studio Code から GitHub Copilot を利用](#visual-studio-code-から-github-copilot-を利用) | VSCodeでの利用方法 |
| 1.2 | [Github Copilotのプラン確認](#github-copilotのプラン確認) | プラン確認手順 |
| 1.3 | [GitHub Copilotの料金プラン](#github-copilotの料金プラン) | 料金プランの比較 |
| 2 | [Github Copilotの応用](#github-copilotの応用) | Copilotを使った応用例 |
| 2.1 | [VSCode Github CopilotでOllama利用](#vs-code-github-copilotでollama利用) | Ollamaとの連携 |

<BR>

# Github Copilot設定

## Visual Studio Code から GitHub Copilot を利用

[参考_GitHub Copilot を極める会
](https://zenn.dev/microsoft/articles/github_copilot_advanced)

基本的には、VSCodeをインストールし、Github copilot chatのExtentionを入れた後に、Githubへログインするだけ

<BR>

## Github Copilotのプラン確認

自分のGithub repositoryにログインし、
右上アイコン > Settings > Copilotで確認
![alt text](../assets/img/GithubCopilot_plan_check01.jpg)

<BR>

## GitHub Copilotの料金プラン

[参考_GitHub Copilotを導入するには？](https://biz.moneyforward.com/ai/basic/807/)
| プラン名 | 月額料金（1ユーザーあたり） | 主な対象者 | 特徴 |
|---------|--------------------------|----------|-----|
| Copilot Free | 無料 | 個人（組織管理下でないアカウント） | 基本的なコード補完とチャット機能（月あたり「2,000 コード補完」「50 プレミアムリクエスト」の制限あり） |
| Pro | $10（または年額 $100） | 個人開発者 | 無制限コード補完＋高度モデル利用。 |
| Copilot Pro＋ | $39（または年額 $390） | 個人でモデル選択重視 | 全モデルアクセス、より「プレミアムリクエスト数」多め。 |

<BR>

---

# Github Copilotの応用

## VSCode Github CopilotでOllama利用

[参考1_VSCode - GitHub CopilotをローカルLLMで動かしてみた(Ollama, gpt-oss:20b)](https://zenn.dev/okyugog/articles/6666289d84fed6)

<BR>

1. vscodeのGithub Copilotのチャットで、もdるの管理を選択  
![alt text](../assets/img/vscode_github_copilot_model_select1.jpg)

2. ＋モデルを追加でollamaを選択  
![alt text](../assets/img/vscode_github_copilot_model_select2.jpg)

3. OllamaのURLを記入  
![alt text](../assets/img/vscode_github_copilot_model_select3.jpg)

 | URL | 備考 |
 |-----|------|
 | http://localhost:11434 | localhost(同じPC)の場合 |
 | http://192.168.1.61:11434 | 他のPCの場合 |

4. Ollamaのモデルが表示されるようにollama内モデルを修正  
![alt text](../assets/img/vscode_github_copilot_model_select4.jpg)

<BR>