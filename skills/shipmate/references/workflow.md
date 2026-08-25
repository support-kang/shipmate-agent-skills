# Shipmate development protocol

## Operating principles

- Understand the request and the affected code path before editing.
- Surface material ambiguity, incompatible requirements, and risky assumptions.
- Prefer, in order: no change, existing project code, standard library, native platform capability, an existing dependency, then the smallest new implementation.
- Do not add speculative abstractions, dependencies, configuration, or adjacent cleanup.
- Every changed line must support the request, its verification, or its required documentation.
- Never simplify away security, data integrity, accessibility, trust-boundary validation, or explicit requirements.
- Develop behavior-changing code test-first using RED -> GREEN -> REFACTOR. Keep tests as small and behavioral as the production change.

## State machine

`SETUP -> PLAN -> PLAN_GATE -> IMPLEMENT -> DOCUMENT -> ADVERSARIAL_REVIEW -> LOCAL_GATE -> PR -> BABYSIT -> MERGE_READY`

Locate the current state from repository evidence before acting. Resume instead of restarting completed stages.

### SETUP

Require the documentation contract from `shipmate-setup`. If setup is missing, run or request that skill before implementation.

### PLAN

Inspect repository instructions, relevant documentation, current branch, working tree, existing tests, and related implementation. Write `docs/plans/<task-slug>.md` with:

- problem and outcome;
- explicit scope and non-goals;
- assumptions and open questions;
- acceptance criteria;
- implementation slices, each independently understandable and verifiable;
- a TDD test plan naming the first failing test and the focused command for each behavior-changing slice;
- planned commit boundaries;
- shipping: target branch and remote, slice commits, push, and PR creation; default to automatic unless the user explicitly excludes an item in the plan;
- verification commands;
- documentation impact;
- risks and rollback notes when relevant;
- stop conditions: inherit the protocol defaults below and add task-specific cases that require developer intervention; when none apply beyond the defaults, state that explicitly.

Use the host's native plan mode when it is available. Do not claim the UI mode changed when it did not. The durable plan file is authoritative.

### PLAN_GATE

For an interactive request, present the plan and stop for approval before changing product code. A user instruction that explicitly approves execution, such as “go ahead” or “run shipmate end to end,” satisfies this gate and authorizes the shipping actions recorded in the plan. Do not ask again for push or PR confirmation after approval unless the user explicitly excluded those actions in the plan. Material scope changes return to PLAN.

### IMPLEMENT

Implement one coherent slice at a time. For each slice:

1. **RED:** Write or update the smallest meaningful automated test before production code. Run it and confirm it fails because the requested behavior is missing, not because of syntax, fixtures, environment, or an unrelated baseline failure. For a bug, the test must reproduce the reported failure.
2. **GREEN:** Make the minimum production change that passes the new test. Run the same focused test and confirm it passes.
3. **REFACTOR:** Only while green, simplify duplication or naming introduced by the slice. Do not add speculative abstractions. Re-run the focused test after refactoring.
4. Run the relevant nearby tests to catch regressions.
5. Inspect the full slice diff for unrelated edits, generated noise, secrets, accidental dependency changes, and tests coupled to implementation details.
6. Commit the test and implementation together as one green slice using the repository's commit convention.

Do not weaken a test merely to make GREEN. Prefer observable behavior over private implementation details, and do not mock away the behavior under test. Do not split commits by arbitrary file count. A slice commit represents one reviewable reason for change and must not intentionally leave the branch red. Do not rewrite, squash, or force-push existing user commits without explicit authorization.

TDD is required for behavior-changing code. Documentation-only edits, non-executable metadata, and generated artifacts may use an explicit exception. If a legacy area has no usable test harness, record the gap and reason in the plan, obtain approval before adding a new dependency or broad framework, and use the smallest executable regression check available.

During IMPLEMENT and every later stage, stop and ask for direction when a recorded stop condition is met. Do not bypass it to keep shipping.

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

Run the strongest relevant local checks available: the RED/GREEN evidence for new behavior, focused tests, broader tests, lint/typecheck/build, documentation links or generation, and `git diff`/status inspection. Record commands and results in the plan. Require a clean working tree except intentionally ignored local files and no intentionally failing tests.

### PR

PR creation is the last construction step. Only after PLAN through LOCAL_GATE are complete, proceed without a separate shipping confirmation when the approved plan includes push and PR creation:

1. Confirm the target branch and remote from the plan.
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

These defaults apply to every task. Each plan must inherit them and add task-specific cases that require developer intervention.

Stop and ask for direction when requirements materially conflict, a destructive migration lacks authorization, secrets or credentials are required, the target branch is unclear at shipping time, independent review is unavailable, a material finding cannot be resolved safely, or a recorded plan stop condition is met. Do not bypass a stop condition to keep shipping.
