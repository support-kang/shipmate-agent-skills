# Shipmate

<p align="center">
  <img src="assets/shipmate-logo.png" alt="Shipmate hand-drawn sailing ship logo" width="280">
</p>
<p align="center"><strong>Plan carefully. Build test-first. Ship with confidence.</strong></p>

```bash
npx skills add support-kang/shipmate-agent-skills
```

[English](#english) · [한국어](#한국어)

**Translations:** [日本語](docs/i18n/README.ja.md) · [简体中文](docs/i18n/README.zh-CN.md) · [繁體中文](docs/i18n/README.zh-TW.md) · [Español](docs/i18n/README.es.md) · [Português (Brasil)](docs/i18n/README.pt-BR.md) · [Français](docs/i18n/README.fr.md) · [Deutsch](docs/i18n/README.de.md) · [Italiano](docs/i18n/README.it.md) · [Русский](docs/i18n/README.ru.md) · [العربية](docs/i18n/README.ar.md) · [हिन्दी](docs/i18n/README.hi.md) · [Bahasa Indonesia](docs/i18n/README.id.md) · [Tiếng Việt](docs/i18n/README.vi.md) · [ไทย](docs/i18n/README.th.md) · [Türkçe](docs/i18n/README.tr.md) · [Polski](docs/i18n/README.pl.md) · [Українська](docs/i18n/README.uk.md)

## English

One development workflow for Cursor, Claude Code, and Codex:

1. Set up durable project documentation and agent instructions.
2. Plan and obtain the required plan approval.
3. Develop behavior-changing code test-first with RED -> GREEN -> REFACTOR, then commit reviewable green slices atomically.
4. Update documentation before shipping.
5. Run an independent adversarial review and resolve valid findings.
6. Push and create the pull request only after the local gate is green.
7. Babysit the open pull request without merging it.

The workflow combines Karpathy-inspired caution and goal-driven verification with Ponytail-inspired simplicity and YAGNI. It is an original orchestration layer; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) for attribution and licensing details.

## See the loop

```text
USER  Add password reset.

SHIPMATE  STATE: PLAN
          ↓ plan approved
          3 implementation slices
          ↓ RED → GREEN → REFACTOR
          tests green · docs updated
          ↓ fresh adversarial review
          ⚠ missing rate-limit test
          ↓ fix · local gate green
          PR created
          ↓ CI and review babysitting
          MERGE-READY
```

See the [30–45 second recording storyboard](docs/demo/recording-script.md) for the real terminal demo scenario.

## Why Shipmate?

**Not another collection of 50 skills.** Shipmate is opinionated:

- one development workflow
- two focused skills
- three coding agents
- plan before code
- test-first behavior changes
- small, reviewable commits
- documentation that stays current
- independent adversarial review
- a PR that stops at merge-ready

**100 generic skills? No. One development loop done properly.**

## Install

### Recommended

Install the two canonical skills with the standard Agent Skills CLI:

```bash
npx skills add support-kang/shipmate-agent-skills
```

The CLI discovers `skills/shipmate` and `skills/shipmate-setup`, then lets you choose Cursor, Claude Code, Codex, or another supported agent. Installation is project-level by default; add `-g` for your user profile:

```bash
npx skills add support-kang/shipmate-agent-skills -g
```

For a non-interactive global installation to all three primary agents:

```bash
npx skills add support-kang/shipmate-agent-skills -g -y -a cursor -a claude-code -a codex --skill '*'
```

### Ask your AI agent to install it

Copy and paste this instruction into Cursor, Claude Code, or Codex:

```text
Install both Shipmate skills from support-kang/shipmate-agent-skills for the coding agent you are currently running in.

1. Run `npx skills add support-kang/shipmate-agent-skills -g` and select both `shipmate` and `shipmate-setup` for the current agent.
2. Do not modify the current project during installation.
3. Verify the installation with `npx skills list -g` and report the installed paths.
4. Tell me to start a fresh agent session in the target project and run `shipmate-setup` exactly once for that project. After setup, use `shipmate` for development tasks.
```

### After installation

Start a fresh agent session in the target project and run `shipmate-setup` exactly once for that project. After the one-time setup, use `shipmate` for subsequent development work; do not repeat setup for every task.

<details>
<summary>Manual installation fallback</summary>

If the Skills CLI is unavailable, clone this repository and use the legacy platform scripts:

```bash
./scripts/install.sh cursor
./scripts/install.sh claude-code
./scripts/install.sh codex
```

```powershell
.\scripts\install.ps1 -Platform cursor
.\scripts\install.ps1 -Platform claude-code
.\scripts\install.ps1 -Platform codex
```

</details>

## Repository layout

```text
skills/
  shipmate-setup/       # canonical universal skill
  shipmate/             # canonical universal skill
packages/
  cursor/
    shipmate-setup/
    shipmate/
  claude-code/
    shipmate-setup/
    shipmate/
  codex/
    shipmate-setup/
    shipmate/
                      # compatibility adapters for legacy installers
shared/
  workflow.md
  docs-template/
docs/
  i18n/
assets/
  shipmate-logo.png
scripts/
  install.sh
  install.ps1
  sync-packages.sh
  sync-packages.ps1
  validate.sh
  validate.ps1
```

## Project documentation created by setup

```text
docs/
  README.md
  features/
  plans/
  decisions/
  runbooks/
  reference/
    testing.md
```

The setup skill preserves existing documentation and instruction files. It adds only missing structure and a clearly delimited managed block. It also detects the existing test framework, test locations, focused and full-suite commands, and configured coverage policy for `docs/reference/testing.md`; it does not add a new framework without explicit approval.

Every setup also creates or updates a managed section in the repository-root `AGENTS.md`. Cursor and Claude Code receive thin host-specific pointers to that shared project contract, so project rules do not drift between agents.

## Safety boundary

`shipmate` may create local commits, push its task branch, and open a pull request only when the user's request authorizes the full workflow. It never merges. Destructive Git operations and force pushes are prohibited.

## License

Shipmate is released under the [MIT License](LICENSE). Material adapted from third-party projects remains subject to its original license and attribution requirements; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) and [`third_party/`](third_party/).

## 한국어

Shipmate는 계획, TDD, 문서화, 적대적 리뷰, PR 모니터링을 하나의 흐름으로 연결해 효율적이고 신뢰할 수 있는 AI 기반 개발을 돕는 멀티 에이전트 워크플로 스킬입니다. 구현을 바로 시작하는 대신 계획과 승인부터 출발하고, RED → GREEN → REFACTOR의 TDD 사이클, 작은 단위의 커밋과 문서 갱신, 독립적인 적대적 리뷰를 거친 뒤 모든 로컬 검증이 끝났을 때만 PR을 생성합니다.

두 개의 스킬로 구성됩니다.

- `shipmate-setup`: 프로젝트에 처음 한 번 실행합니다. 최상단 `AGENTS.md`의 공통 작업 규칙과 아래 문서 구조를 만들고, 기존 테스트 프레임워크·테스트 위치·실행 명령을 탐지해 `docs/reference/testing.md`에 기록합니다.
- `shipmate`: 실제 개발 작업에 사용합니다. 계획 승인 → RED/GREEN/REFACTOR → 구현 슬라이스와 원자적 커밋 → 문서 갱신 → 독립 리뷰 에이전트의 적대적 검토 → 수정 및 최종 검증 → PR 생성 → CI와 리뷰 피드백 관찰 순서로 진행합니다.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

PR 생성은 로컬 개발 과정의 마지막 단계입니다. PR이 생성된 뒤에는 새 PR을 만들지 않고 해당 PR의 CI, 충돌, 리뷰 의견을 추적합니다. Shipmate는 merge-ready 상태까지만 책임지며, 별도의 명시적인 요청 없이는 병합하지 않습니다.

Karpathy Guidelines의 신중한 계획·검증 원칙과 Ponytail의 YAGNI·최소 변경 원칙에서 영향을 받았습니다. 원본 프로젝트의 라이선스와 출처는 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)에 정리되어 있습니다.

가장 간단한 설치 방법:

```bash
npx skills add support-kang/shipmate-agent-skills
```

사용자 프로필 전체에 설치하려면 `-g`를 추가하세요.

```bash
npx skills add support-kang/shipmate-agent-skills -g
```

설치 후 대상 프로젝트에서 에이전트를 새 세션으로 시작하고, 해당 프로젝트에 `shipmate-setup`을 정확히 한 번만 실행하세요. 일회성 설정이 끝난 뒤에는 작업마다 설정을 반복하지 말고 `shipmate`를 사용하면 됩니다.
