# Shipmate

<p align="center">
  <img src="assets/shipmate-logo.png" alt="Shipmate hand-drawn sailing ship logo" width="240">
</p>

**A small, opinionated development workflow for coding agents.**

Shipmate gives Cursor, Claude Code, and Codex one predictable path from an approved plan to a merge-ready pull request:

```text
PLAN → IMPLEMENT → TEST → DOCUMENT → ADVERSARIAL REVIEW → PR → MERGE-READY
```

It is deliberately boring. There are no workflow presets, modes, step toggles, or configuration maze. If this workflow fits you, use it. If it does not, fork it or manage your own workflow.

```bash
npx skills add support-kang/shipmate-agent-skills
```

**Languages:** [English](#shipmate) · [한국어](#한국어) · [日本語](docs/i18n/README.ja.md) · [简体中文](docs/i18n/README.zh-CN.md) · [繁體中文](docs/i18n/README.zh-TW.md) · [Español](docs/i18n/README.es.md) · [Português (Brasil)](docs/i18n/README.pt-BR.md) · [Français](docs/i18n/README.fr.md) · [Deutsch](docs/i18n/README.de.md) · [Italiano](docs/i18n/README.it.md) · [Русский](docs/i18n/README.ru.md) · [العربية](docs/i18n/README.ar.md) · [हिन्दी](docs/i18n/README.hi.md) · [Bahasa Indonesia](docs/i18n/README.id.md) · [Tiếng Việt](docs/i18n/README.vi.md) · [ไทย](docs/i18n/README.th.md) · [Türkçe](docs/i18n/README.tr.md) · [Polski](docs/i18n/README.pl.md) · [Українська](docs/i18n/README.uk.md)

## The workflow

Shipmate requires the agent to:

1. Inspect the repository, write a durable plan with stop conditions, and obtain approval before implementation.
2. Develop behavior changes test-first with RED → GREEN → REFACTOR.
3. Commit small, coherent slices that keep the branch green, and record a short review packet for each slice in the task plan.
4. Update affected project documentation before shipping.
5. Run a fresh, independent adversarial review and resolve valid findings.
6. Run the local verification gate, then push and open one pull request that includes those packets.
7. Watch CI and review feedback until the pull request is merge-ready.

Shipmate stops at merge-ready. It never merges without a separate explicit request.

The repository contains two skills, which are two parts of the same workflow:

- `shipmate-setup` initializes the project contract and durable documentation once per repository.
- `shipmate` runs development tasks after setup.

## Who it is for

Shipmate fits teams and individual developers who want coding agents to follow the same conservative delivery loop every time: plan first, test behavior, keep changes small, document decisions, get an independent review, and finish with a healthy pull request.

It is probably not a fit if you want to assemble custom workflows, skip stages per task, choose among speed or strictness modes, or extensively configure how the agent works.

## Non-goals

Shipmate is not:

- a general-purpose agent framework;
- a collection of unrelated agent skills;
- a workflow builder or plugin ecosystem;
- a set of workflow presets;
- a large configuration surface;
- an attempt to support every coding style.

Convention over configuration is the point. Shipmate detects repository facts when it can and otherwise follows its documented workflow.

## Install

Use the standard Agent Skills CLI:

```bash
npx skills add support-kang/shipmate-agent-skills
```

The CLI discovers both skills and installs them for Cursor, Claude Code, Codex, or another compatible agent. Add `-g` for a user-level installation:

```bash
npx skills add support-kang/shipmate-agent-skills -g
```

For a non-interactive user-level installation to the three primary agents:

```bash
npx skills add support-kang/shipmate-agent-skills -g -y -a cursor -a claude-code -a codex --skill '*'
```

After installation, start a fresh agent session in the target repository and run `shipmate-setup` once. Use `shipmate` for subsequent development tasks.

<details>
<summary>Manual installation fallback</summary>

Clone this repository, then run the installer for the current agent:

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
  shipmate-setup/       # one-time project initialization
  shipmate/             # the development workflow
scripts/
  install.*             # manual installation fallback
  validate.*            # distribution checks
```

The two directories under `skills/` are the canonical, self-contained Agent Skills packages. Platform-specific behavior is limited to thin host instructions inside those skills so the workflow remains the same across agents.

## Project setup

`shipmate-setup` preserves existing documentation and agent instructions. It adds only missing documentation structure, records confirmed test commands, and maintains a clearly delimited Shipmate block in the repository-root `AGENTS.md`.

Cursor and Claude Code receive a thin pointer to the shared project contract when needed. Codex uses the root `AGENTS.md` directly. Setup does not add a test framework or guess project facts.

## Safety boundary

An approved Shipmate plan authorizes the shipping actions recorded in it: slice commits, push, and pull request creation. Each plan also records stop conditions: protocol defaults plus task-specific cases that require developer intervention. When a recorded stop condition is met, Shipmate stops and asks for direction instead of bypassing it to keep shipping. Shipmate does not force-push, use destructive Git operations, or merge.

## 한국어

Shipmate는 계획, TDD, 문서화, 적대적 리뷰, PR 모니터링을 하나의 흐름으로 연결해 효율적이고 신뢰할 수 있는 AI 기반 개발을 돕는 멀티 에이전트 워크플로 스킬입니다. 구현을 바로 시작하는 대신 계획과 승인부터 출발하고, RED → GREEN → REFACTOR의 TDD 사이클, 작은 단위의 커밋과 문서 갱신, 독립적인 적대적 리뷰를 거친 뒤 모든 로컬 검증이 끝났을 때 PR을 생성합니다. 계획에 shipping이 포함되어 있으면 승인 후 푸시와 PR 생성을 다시 묻지 않습니다. 각 계획에는 프로토콜 기본값과 작업별 개발자 개입 조건을 포함한 중단 조건을 기록하며, 기록된 조건이 맞으면 shipping을 우회하지 않고 멈춰 방향을 묻습니다.

두 개의 스킬로 구성됩니다.

- `shipmate-setup`: 프로젝트에 처음 한 번 실행합니다. 최상단 `AGENTS.md`의 공통 작업 규칙과 문서 구조를 만들고, 기존 테스트 프레임워크·테스트 위치·실행 명령을 탐지해 `docs/reference/testing.md`에 기록합니다.
- `shipmate`: 실제 개발 작업에 사용합니다. 계획 승인 → RED/GREEN/REFACTOR → 구현 슬라이스와 원자적 커밋 → 각 슬라이스의 짧은 리뷰 패킷을 작업 계획에 기록 → 문서 갱신 → 독립 리뷰 에이전트의 적대적 검토 → 수정 및 최종 검증 → 패킷을 그대로 첨부한 PR 생성 → CI와 리뷰 피드백 관찰 순서로 진행합니다.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

PR 생성은 로컬 개발 과정의 마지막 단계입니다. PR이 생성된 뒤에는 새 PR을 만들지 않고 해당 PR의 CI, 충돌, 리뷰 의견을 추적합니다. Shipmate는 merge-ready 상태까지만 책임지며, 별도의 명시적인 요청 없이는 병합하지 않습니다.

Shipmate는 범용 에이전트 프레임워크나 workflow builder가 아닙니다. 여러 preset, mode, 단계별 설정을 제공하지 않습니다. 이 workflow가 맞으면 그대로 사용하고, 맞지 않으면 fork하거나 직접 workflow를 관리하는 것을 전제로 합니다.

가장 간단한 설치 방법:

```bash
npx skills add support-kang/shipmate-agent-skills
```

사용자 프로필 전체에 설치하려면 `-g`를 추가하세요.

```bash
npx skills add support-kang/shipmate-agent-skills -g
```

설치 후 대상 프로젝트에서 에이전트를 새 세션으로 시작하고, 해당 프로젝트에 `shipmate-setup`을 정확히 한 번만 실행하세요. 일회성 설정이 끝난 뒤에는 작업마다 설정을 반복하지 말고 `shipmate`를 사용하면 됩니다.

## License and acknowledgements

Shipmate is released under the [MIT License](LICENSE). Its workflow was informed by Karpathy Guidelines and Ponytail; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) for attribution and licensing details.
