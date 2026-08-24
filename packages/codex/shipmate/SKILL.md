---
name: shipmate
description: Run a development task from an approved plan through slice commits, documentation, independent adversarial review, final PR creation, and post-PR babysitting. Use for the full Codex development workflow.
---

# Shipmate for Codex

Read [references/workflow.md](references/workflow.md) completely and follow it as the authoritative protocol.

Use Codex Plan mode when the user has selected it. A skill cannot change the app's collaboration mode, so when Plan mode is unavailable, write the durable plan and stop at the same approval gate without claiming the mode changed. Delegate adversarial review to a fresh read-only subagent that did not implement the change.

At the start, state the detected workflow state and what evidence advances it. Explicit invocation with an end-to-end development request authorizes scoped local commits. Push and PR creation require either explicit authorization in that request or a confirmation immediately before shipping. Never merge.
