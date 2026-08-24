---
name: shipmate
description: Run a development task from an approved plan through slice commits, documentation, independent adversarial review, final PR creation, and post-PR babysitting. Use for the full Cursor development workflow.
---

# Shipmate for Cursor

Read [references/workflow.md](references/workflow.md) completely and follow it as the authoritative protocol.

Use Cursor's planning surface when available, but keep `docs/plans/<task-slug>.md` as the durable source of truth. Use a fresh Cursor subagent for the adversarial review; it must not be the implementation context.

At the start, state the detected workflow state and what evidence advances it. Explicit invocation with an end-to-end development request authorizes scoped local commits. Push and PR creation require either explicit authorization in that request or a confirmation immediately before shipping. Never merge.
