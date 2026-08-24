---
name: babysit-setup
description: Initialize or repair a repository for the Babysit Dev workflow by creating durable docs and a root AGENTS.md contract. Use when setting up Babysit Dev in a project for Codex.
---

# Babysit Setup for Codex

Initialize the current Git repository without overwriting project knowledge.

## Procedure

1. Resolve the repository root and inspect existing `AGENTS.md`, `docs/`, build manifests, test configuration, CI, and contribution guidance.
2. Read `assets/AGENTS.block.md` and the files under `assets/docs-template/`.
3. Create only missing directories and starter files under `docs/`. If `docs/README.md` exists, add links for missing Babysit sections without replacing its structure.
4. Create or update the root `AGENTS.md` block delimited by `babysit-dev:start` and `babysit-dev:end`. Preserve all content outside that block. Never create a second block.
5. Populate documentation only with facts confirmed from the repository. Add project commands or architecture links to the most relevant existing or new reference page; mark unknowns instead of guessing.
6. Validate links and show exactly which files were created or updated.

Setup does not implement product work, commit, push, open a PR, or merge.
