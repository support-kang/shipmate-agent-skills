# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Shipmate ロゴ" width="280"></p>
<p align="center"><strong>慎重に計画し、テストファーストで作り、自信を持って届ける。</strong></p>

[한국어 / English](../../README.md)

Shipmate は、計画、TDD、ドキュメント、敵対的レビュー、PR の監視を一つの流れにつなぎ、効率的で信頼できる AI ベースの開発を支援するマルチエージェント・ワークフロースキルです。Cursor、Claude Code、Codex で利用できます。

## スキル

- `shipmate-setup`: プロジェクトごとに一度実行し、ルートの `AGENTS.md`、永続的なドキュメント構造、検出した TDD ガイダンスを設定します。
- `shipmate`: 承認済みの計画から、RED → GREEN → REFACTOR、原子的なスライスコミット、ドキュメント、独立した敵対的レビュー、最終 PR、マージ可能になるまでの監視を行います。

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

PR の作成はローカル開発の最後の段階です。Shipmate は明示的な依頼なしにマージしません。

## インストール

macOS/Linux: `./scripts/install.sh codex`  
Windows: `.\scripts\install.ps1 -Platform codex`

`codex` は `cursor` または `claude-code` に置き換えられます。新しいエージェントセッションを開始し、最初に `shipmate-setup`、その後の開発では `shipmate` を使用してください。

セットアップは既存ファイルを保持し、不足している構造と明確に区切られた管理ブロックだけを追加します。ライセンスは [MIT](../../LICENSE)、第三者の帰属情報は [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) を参照してください。
