---
name: shipmate-setup
description: Initialize or repair a repository for the Shipmate workflow by creating durable docs, a root AGENTS.md contract, detected TDD guidance, and Cursor project rules. Use when setting up Shipmate in a project.
---

# Shipmate Setup for Cursor

Initialize the current Git repository without overwriting project knowledge.

## Procedure

1. Resolve the repository root and inspect existing `AGENTS.md`, `.cursor/rules/`, `docs/`, build manifests, test configuration, CI, and contribution guidance.
2. Read `assets/AGENTS.block.md` and the files under `assets/docs-template/`.
3. Create only missing directories and starter files under `docs/`. If `docs/README.md` exists, add links for missing Shipmate sections without replacing its structure.
4. Detect the existing test framework, test locations, focused-test command, related-suite command, full-suite command, and configured coverage policy. Prefer manifests, test configuration, CI, and verified repository commands as evidence.
5. Populate `docs/reference/testing.md` with those confirmed facts and the RED -> GREEN -> REFACTOR agreement. When dependencies are available, run the smallest safe existing test command to verify it. If no usable harness exists, record the gap and a minimal recommendation; do not add a framework, dependency, or broad configuration without explicit approval.
6. Create or update the root `AGENTS.md` block delimited by `shipmate:start` and `shipmate:end`. Preserve all content outside that block. Never create a second block.
7. Create or update `.cursor/rules/shipmate.mdc` as an always-applied project rule that tells Cursor to follow the root `AGENTS.md`, use `docs/README.md` as the documentation map, and invoke `shipmate` for the full workflow. Preserve unrelated Cursor rules.
8. Populate all documentation only with facts confirmed from the repository. Add project commands or architecture links to the most relevant existing or new reference page; mark unknowns instead of guessing.
9. Validate links, the testing reference, and managed markers, then show exactly which files were created or updated.

Setup does not implement product work, commit, push, open a PR, or merge.
