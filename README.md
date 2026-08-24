# Shipmate

[한국어](#한국어) · [English](#english)

## 한국어

Shipmate는 Cursor, Claude Code, Codex에서 동일한 개발 절차를 재사용하기 위한 크로스 에이전트 스킬 모음입니다. 구현을 바로 시작하는 대신 계획과 승인부터 출발하고, RED → GREEN → REFACTOR의 TDD 사이클, 작은 단위의 커밋과 문서 갱신, 독립적인 적대적 리뷰를 거친 뒤 모든 로컬 검증이 끝났을 때만 PR을 생성합니다.

두 개의 스킬로 구성됩니다.

- `shipmate-setup`: 프로젝트에 처음 한 번 실행합니다. 최상단 `AGENTS.md`의 공통 작업 규칙과 아래 문서 구조를 만들고, 기존 테스트 프레임워크·테스트 위치·실행 명령을 탐지해 `docs/reference/testing.md`에 기록합니다.
- `shipmate`: 실제 개발 작업에 사용합니다. 계획 승인 → RED/GREEN/REFACTOR → 구현 슬라이스와 원자적 커밋 → 문서 갱신 → 독립 리뷰 에이전트의 적대적 검토 → 수정 및 최종 검증 → PR 생성 → CI와 리뷰 피드백 관찰 순서로 진행합니다.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

PR 생성은 로컬 개발 과정의 마지막 단계입니다. PR이 생성된 뒤에는 새 PR을 만들지 않고 해당 PR의 CI, 충돌, 리뷰 의견을 추적합니다. Shipmate는 merge-ready 상태까지만 책임지며, 별도의 명시적인 요청 없이는 병합하지 않습니다.

Karpathy Guidelines의 신중한 계획·검증 원칙과 Ponytail의 YAGNI·최소 변경 원칙에서 영향을 받았습니다. 원본 프로젝트의 라이선스와 출처는 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)에 정리되어 있습니다.

빠른 설치:

macOS/Linux:

```bash
./scripts/install.sh cursor
./scripts/install.sh claude-code
./scripts/install.sh codex
```

Windows:

```powershell
.\scripts\install.ps1 -Platform cursor
.\scripts\install.ps1 -Platform claude-code
.\scripts\install.ps1 -Platform codex
```

설치 후 에이전트를 새 세션으로 시작하고, 대상 프로젝트에서 먼저 `shipmate-setup`을 실행하세요. 이후 개발 작업부터는 `shipmate`를 사용하면 됩니다.

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

## Repository layout

```text
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
shared/
  workflow.md
  docs-template/
scripts/
  install.sh
  install.ps1
  sync-packages.sh
  sync-packages.ps1
  validate.sh
  validate.ps1
```

## Install

### macOS/Linux

Install both skills for one host into your user profile:

```bash
./scripts/install.sh cursor
./scripts/install.sh claude-code
./scripts/install.sh codex
```

Or install into a specific repository:

```bash
./scripts/install.sh codex --scope project --project-path /path/to/project
```

### Windows

Install both skills for one host into your user profile:

```powershell
.\scripts\install.ps1 -Platform cursor
.\scripts\install.ps1 -Platform claude-code
.\scripts\install.ps1 -Platform codex
```

Or install into a specific repository:

```powershell
.\scripts\install.ps1 -Platform codex -Scope project -ProjectPath C:\path\to\project
```

Then start a fresh agent session. Run `shipmate-setup` once in a project, and use `shipmate` for subsequent development work.

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
