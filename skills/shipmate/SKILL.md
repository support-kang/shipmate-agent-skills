---
name: shipmate
description: Run a development task from an approved plan through RED-GREEN-REFACTOR TDD, green slice commits, documentation, independent adversarial review, final PR creation, and post-PR babysitting. Use for an end-to-end development workflow in Cursor, Claude Code, or Codex.
---

# Shipmate

Read [references/workflow.md](references/workflow.md) completely and follow it as the authoritative protocol.

## Host adapter

Preserve the same gates while using the current agent's native mechanics:

- Cursor: use its planning surface when available and a fresh Cursor subagent for adversarial review.
- Claude Code: use its plan workflow when available and a fresh read-only subagent that did not implement the change.
- Codex: use Plan mode only when the user selected it; a skill cannot change collaboration mode. Use a fresh read-only subagent that did not implement the change.
- Other compatible agents: use the closest native planning and isolated-review capabilities. If independent review is unavailable, disclose the limitation instead of claiming the review gate passed.

In every host, keep `docs/plans/<task-slug>.md` as the durable source of truth. When a native planning surface is unavailable, write the durable plan and stop at the same approval gate without claiming that the host changed modes.

At the start, state the detected workflow state and what evidence advances it. Explicit invocation with an end-to-end development request authorizes scoped local commits. Push and PR creation require either explicit authorization in that request or confirmation immediately before shipping. Never merge.
