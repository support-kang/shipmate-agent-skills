# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Shipmate 标志" width="280"></p>
<p align="center"><strong>谨慎规划，测试先行，自信交付。</strong></p>

[한국어 / English](../../README.md)

Shipmate 是一个多智能体工作流技能，将规划、TDD、文档、对抗式审查和 PR 监控串联为统一流程，帮助你进行高效且可靠的 AI 驱动开发。它支持 Cursor、Claude Code 和 Codex。

## 技能

- `shipmate-setup`：每个项目运行一次，用于配置根目录 `AGENTS.md`、持久化文档结构以及自动检测的 TDD 指南。
- `shipmate`：从已批准的计划开始，依次完成 RED → GREEN → REFACTOR、原子化切片提交、文档更新、独立对抗式审查、最终创建 PR，并持续监控直至可合并。

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

创建 PR 是本地开发的最后一步。未经明确请求，Shipmate 永远不会合并 PR。

## 安装

macOS/Linux：`./scripts/install.sh codex`  
Windows：`.\scripts\install.ps1 -Platform codex`

可将 `codex` 替换为 `cursor` 或 `claude-code`。启动新的智能体会话，先运行 `shipmate-setup`，之后的开发任务使用 `shipmate`。

设置过程会保留现有文件，只添加缺失的结构和边界清晰的托管区块。项目采用 [MIT 许可证](../../LICENSE)，第三方归属信息见 [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md)。
