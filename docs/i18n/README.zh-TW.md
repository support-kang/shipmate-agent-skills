# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Shipmate 標誌" width="280"></p>
<p align="center"><strong>審慎規劃，測試先行，自信交付。</strong></p>

[한국어 / English](../../README.md)

Shipmate 是一套多代理工作流程技能，將規劃、TDD、文件、對抗式審查與 PR 監控串成單一流程，協助你進行高效且可靠的 AI 驅動開發。它支援 Cursor、Claude Code 與 Codex。

## 技能

- `shipmate-setup`：每個專案執行一次，用來設定根目錄 `AGENTS.md`、持久化文件結構，以及自動偵測的 TDD 指引。
- `shipmate`：從已核准的計畫開始，依序完成 RED → GREEN → REFACTOR、原子化切片提交、文件更新、獨立對抗式審查、最後建立 PR，並持續監控至可合併狀態。

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

建立 PR 是本機開發的最後一步。未經明確要求，Shipmate 絕不會合併 PR。

## 安裝

`npx skills add support-kang/shipmate-agent-skills`

安裝後請啟動新的代理工作階段，並為該專案只執行一次 `shipmate-setup`。後續開發工作則使用 `shipmate`。

設定過程會保留既有檔案，只加入缺少的結構與界線清楚的受管區塊。專案採用 [MIT 授權](../../LICENSE)，第三方歸屬資訊請見 [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md)。
