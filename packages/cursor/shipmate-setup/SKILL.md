---
name: shipmate-setup
description: Initialize or repair a repository for the Shipmate workflow by creating durable docs, a root AGENTS.md contract, and Cursor project guidance. Use when setting up Shipmate in a project.
---

# Shipmate Setup for Cursor

Initialize the current Git repository without overwriting project knowledge.

## Procedure

1. Resolve the repository root and inspect existing `AGENTS.md`, `.cursor/rules/`, `docs/`, build manifests, test configuration, CI, and contribution guidance.
2. Read `assets/AGENTS.block.md` and the files under `assets/docs-template/`.
3. Create only missing directories and starter files under `docs/`. If `docs/README.md` exists, add links for missing Shipmate sections without replacing its structure.
4. Create or update the root `AGENTS.md` block delimited by `shipmate:start` and `shipmate:end`. Preserve all content outside that block. Never create a second block.
5. Create or update `.cursor/rules/shipmate.mdc` as an always-applied project rule that tells Cursor to follow the root `AGENTS.md`, use `docs/README.md` as the documentation map, and invoke `shipmate` for the full workflow. Preserve unrelated Cursor rules.
6. Populate documentation only with facts confirmed from the repository. Add project commands or architecture links to the most relevant existing or new reference page; mark unknowns instead of guessing.
7. Validate links and show exactly which files were created or updated.

Setup does not implement product work, commit, push, open a PR, or merge.
