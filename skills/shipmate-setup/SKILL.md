---
name: shipmate-setup
description: Initialize or repair a repository for the Shipmate workflow by creating durable docs, a root AGENTS.md contract, detected TDD guidance, and a thin host-specific adapter when needed. Use once when setting up Shipmate in a project for Cursor, Claude Code, Codex, or another compatible agent.
---

# Shipmate Setup

Initialize the current Git repository without overwriting project knowledge.

## Procedure

1. Resolve the repository root and inspect existing `AGENTS.md`, `docs/`, build manifests, test configuration, CI, contribution guidance, and instructions for the current agent.
2. Read `assets/AGENTS.block.md` and the files under `assets/docs-template/`.
3. Create only missing directories and starter files under `docs/`. If `docs/README.md` exists, add links for missing Shipmate sections without replacing its structure.
4. Detect the existing test framework, test locations, focused-test command, related-suite command, full-suite command, and configured coverage policy. Prefer manifests, test configuration, CI, and verified repository commands as evidence.
5. Populate `docs/reference/testing.md` with those confirmed facts and the RED -> GREEN -> REFACTOR agreement. When dependencies are available, run the smallest safe existing test command to verify it. If no usable harness exists, record the gap and a minimal recommendation; do not add a framework, dependency, or broad configuration without explicit approval.
6. Create or update the root `AGENTS.md` block delimited by `shipmate:start` and `shipmate:end`. Preserve all content outside that block. Never create a second block.
7. Add only the thin adapter needed by the current host:
   - Cursor: create or update `.cursor/rules/shipmate.mdc` as an always-applied rule pointing to root `AGENTS.md`, `docs/README.md`, and `shipmate`. Preserve unrelated Cursor rules.
   - Claude Code: create or update a managed block in `CLAUDE.md` pointing to root `AGENTS.md`, `docs/README.md`, and `shipmate`. Preserve unrelated Claude instructions.
   - Codex: root `AGENTS.md` is the project contract; do not create a redundant host file.
   - Other agents: create a host-specific pointer only when its documented convention is known. Otherwise rely on `AGENTS.md` and report the limitation.
8. Populate documentation only with facts confirmed from the repository. Add project commands or architecture links to the most relevant page; mark unknowns instead of guessing.
9. Validate links, the testing reference, managed markers, and any host adapter, then show exactly which files were created or updated.

Run this setup exactly once per project. Re-run it only when explicitly asked to repair or refresh the Shipmate setup. Setup does not implement product work, commit, push, open a PR, or merge.
