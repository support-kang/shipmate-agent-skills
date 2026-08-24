# Babysit development protocol

## Operating principles

- Understand the request and the affected code path before editing.
- Surface material ambiguity, incompatible requirements, and risky assumptions.
- Prefer, in order: no change, existing project code, standard library, native platform capability, an existing dependency, then the smallest new implementation.
- Do not add speculative abstractions, dependencies, configuration, or adjacent cleanup.
- Every changed line must support the request, its verification, or its required documentation.
- Never simplify away security, data integrity, accessibility, trust-boundary validation, or explicit requirements.

## State machine

`SETUP -> PLAN -> PLAN_GATE -> IMPLEMENT -> DOCUMENT -> ADVERSARIAL_REVIEW -> LOCAL_GATE -> PR -> BABYSIT -> MERGE_READY`

Locate the current state from repository evidence before acting. Resume instead of restarting completed stages.

### SETUP

Require the documentation contract from `babysit-setup`. If setup is missing, run or request that skill before implementation.

### PLAN

Inspect repository instructions, relevant documentation, current branch, working tree, existing tests, and related implementation. Write `docs/plans/<task-slug>.md` with:

- problem and outcome;
- explicit scope and non-goals;
- assumptions and open questions;
- acceptance criteria;
- implementation slices, each independently understandable and verifiable;
- planned commit boundaries;
- verification commands;
- documentation impact;
- risks and rollback notes when relevant.

Use the host's native plan mode when it is available. Do not claim the UI mode changed when it did not. The durable plan file is authoritative.

### PLAN_GATE

For an interactive request, present the plan and stop for approval before changing product code. A user instruction that explicitly approves execution, such as “go ahead” or “run babysit-dev end to end,” satisfies this gate. Material scope changes return to PLAN.

### IMPLEMENT

Implement one coherent slice at a time. For each slice:

1. Establish the smallest check that can fail for the intended behavior.
2. Make the minimum correct change.
3. Run focused verification.
4. Inspect the full slice diff for unrelated edits, generated noise, secrets, and accidental dependency changes.
5. Commit only that slice with the repository's commit convention.

Do not split commits by arbitrary file count. A slice commit represents one reviewable reason for change. Do not rewrite, squash, or force-push existing user commits without explicit authorization.

### DOCUMENT

Before review, update the relevant durable documentation:

- `features/`: behavior, user value, boundaries, and acceptance criteria;
- `plans/`: actual slices, verification evidence, and final status;
- `decisions/`: durable choices with alternatives and consequences;
- `runbooks/`: deploy, operate, troubleshoot, and recover procedures;
- `reference/`: stable API, schema, configuration, or terminology facts.

Do not create empty or speculative documents. Update only categories affected by the work.

### ADVERSARIAL_REVIEW

Before any push or pull request, delegate the branch diff and plan to a fresh, independent reviewer context. The reviewer is read-only and assumes the implementation may be wrong. It must challenge:

- requirement and plan compliance;
- correctness, edge cases, and regressions;
- security and data-loss risks;
- test quality and missing failure-path coverage;
- unnecessary code, abstractions, dependencies, and scope creep;
- documentation accuracy and operational gaps.

Each finding must include severity, evidence, affected location, failure scenario, and a concrete recommendation. Reject vague style preferences.

Triage every finding as `valid`, `invalid`, or `needs-clarification`. Fix valid findings in new focused commits, record the reason for rejected findings, and send changed areas through one fresh review pass. Stop after two fix/re-review rounds unless the user authorizes more; unresolved material findings block the PR.

### LOCAL_GATE

Run the strongest relevant local checks available: focused tests, broader tests, lint/typecheck/build, documentation links or generation, and `git diff`/status inspection. Record commands and results in the plan. Require a clean working tree except intentionally ignored local files.

### PR

PR creation is the last construction step. Only after PLAN through LOCAL_GATE are complete:

1. Confirm the target branch and remote.
2. Push the current task branch without force.
3. Open one pull request using the repository template when present.
4. Include purpose, slices/commits, verification evidence, documentation changes, risks, and any explicitly accepted residuals.

Never merge. Do not open a draft or stacked PR unless requested.

### BABYSIT

After the PR exists, monitor checks, mergeability, and review threads. This phase does not create another PR.

- Triage reviewer comments against the actual code before changing anything.
- For valid comments, make a focused fix, update affected docs, run verification, obtain an independent review of the delta, commit, and push.
- Explain evidence when a comment is invalid; ask a specific question when clarification is needed.
- Diagnose CI failures before retrying. Retry a likely transient failure once. Repeated or material failures require a fix or user decision.
- Stop at merge-ready: required checks green, no conflicts, and every material thread resolved or clearly answered.

Report the PR as merge-ready. Merging requires a separate explicit user request.

## Stop conditions

Stop and ask for direction when requirements materially conflict, a destructive migration lacks authorization, secrets or credentials are required, the target branch is unclear at shipping time, independent review is unavailable, or a material finding cannot be resolved safely.
