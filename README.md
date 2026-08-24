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

## The workflow

Shipmate requires the agent to:

1. Inspect the repository, write a durable plan, and obtain approval before implementation.
2. Develop behavior changes test-first with RED → GREEN → REFACTOR.
3. Commit small, coherent slices that keep the branch green.
4. Update affected project documentation before shipping.
5. Run a fresh, independent adversarial review and resolve valid findings.
6. Run the local verification gate, then push and open one pull request.
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

An explicitly authorized end-to-end Shipmate run may create local commits, push its task branch, and open a pull request. Shipmate does not force-push, use destructive Git operations, or merge.

## License and acknowledgements

Shipmate is released under the [MIT License](LICENSE). Its workflow was informed by Karpathy Guidelines and Ponytail; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) for attribution and licensing details.

Translations: [日本語](docs/i18n/README.ja.md) · [简体中文](docs/i18n/README.zh-CN.md) · [繁體中文](docs/i18n/README.zh-TW.md) · [Español](docs/i18n/README.es.md) · [Português (Brasil)](docs/i18n/README.pt-BR.md) · [Français](docs/i18n/README.fr.md) · [Deutsch](docs/i18n/README.de.md) · [Italiano](docs/i18n/README.it.md) · [Русский](docs/i18n/README.ru.md) · [العربية](docs/i18n/README.ar.md) · [हिन्दी](docs/i18n/README.hi.md) · [Bahasa Indonesia](docs/i18n/README.id.md) · [Tiếng Việt](docs/i18n/README.vi.md) · [ไทย](docs/i18n/README.th.md) · [Türkçe](docs/i18n/README.tr.md) · [Polski](docs/i18n/README.pl.md) · [Українська](docs/i18n/README.uk.md)
