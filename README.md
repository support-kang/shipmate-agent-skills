# Shipmate

One development workflow for Cursor, Claude Code, and Codex:

1. Set up durable project documentation and agent instructions.
2. Plan and obtain the required plan approval.
3. Implement in reviewable slices with atomic commits.
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
  install.ps1
  validate.ps1
```

## Install

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
```

The setup skill preserves existing documentation and instruction files. It adds only missing structure and a clearly delimited managed block.

Every setup also creates or updates a managed section in the repository-root `AGENTS.md`. Cursor and Claude Code receive thin host-specific pointers to that shared project contract, so project rules do not drift between agents.

## Safety boundary

`shipmate` may create local commits, push its task branch, and open a pull request only when the user's request authorizes the full workflow. It never merges. Destructive Git operations and force pushes are prohibited.

## License

Shipmate is released under the [MIT License](LICENSE). Material adapted from third-party projects remains subject to its original license and attribution requirements; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) and [`third_party/`](third_party/).
