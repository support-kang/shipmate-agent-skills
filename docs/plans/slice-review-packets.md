# Plan slice review packets

## Status

Complete.

## Problem and outcome

AI pull requests force reviewers to reconstruct intent from the diff. Shipmate already treats a slice commit as one reviewable reason for change, but that reason is not recorded as a short, reusable review packet. After this change, each slice commit writes a one-screen packet into the task plan, and the pull request copies those packets as recorded.

## Scope

- Protocol IMPLEMENT, DOCUMENT, ADVERSARIAL_REVIEW, PR, and BABYSIT rules for slice review packets
- Setup plan template, AGENTS contract, and README workflow list
- This durable plan record for the distribution repository

## Non-goals

- New workflow state, configuration toggles, or document types
- Raw transcript, tool-trace, or chain-of-thought attachments
- Full i18n README updates
- Consumer-project `shipmate-setup` output in this repository

## Acceptance criteria

- [x] Each slice commit records a short packet in `docs/plans/<task-slug>.md`: intent, changed behavior, why, review hotspots, verification, residual uncertainty
- [x] Packets are not rewritten later; the PR copies them as recorded and prefixes each with its commit SHA
- [x] Independent review treats packets as a map, not proof, and treats packet/diff mismatch as a finding
- [x] Follow-up BABYSIT and review-fix commits record a new packet in the same format
- [x] Setup template, AGENTS contract, and README match the protocol
- [x] `scripts/validate.ps1` passes

## Assumptions and open questions

Packet SHAs may be filled from `git log` at DOCUMENT or PR time when the packet is written before the commit exists. That is not a rewrite.

## TDD test plan

Docs-only exception. Verification uses `scripts/validate.ps1`.

## Planned commit boundaries

1. Protocol slice
2. Documentation slice

## Risks and rollback

Low risk documentation change. Revert the branch if the wording is rejected.

## Stop conditions

Protocol defaults apply. For this task, stop and ask for direction if:

- scope expands to full i18n README updates, a new workflow state, or a new document type
- raw transcript archival is requested
- consumer-project setup files are requested in this distribution repository
- secrets or credentials become required
- target branch or remote is unclear at shipping time

## Shipping

- Branch: `feat/slice-review-packets`
- Base: `main`
- Remote: `origin`
- Commits: protocol slice, documentation slice
- Push and PR: after local verification

## Verification

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate.ps1
```

Result: passed.

## Slices

### Slice: protocol
- SHA: `bb6be18`
- Intent: require a one-screen slice review packet in the development protocol
- Changed: `skills/shipmate/references/workflow.md` — IMPLEMENT records the packet, DOCUMENT does not rewrite it, review treats it as a map, PR copies it with SHA, BABYSIT uses the same packet
- Why this: reuse `docs/plans/` and the PR body; skipped a new artifact type and raw transcripts
- Look here: IMPLEMENT field list; PR copy-as-recorded rule; packet/diff mismatch as a finding
- Verified: `powershell -ExecutionPolicy Bypass -File scripts/validate.ps1`
- Unsure: none

### Slice: documentation
- SHA: `558576f`
- Intent: make consumer-facing docs match the packet protocol
- Changed: `skills/shipmate-setup/assets/AGENTS.block.md`, `skills/shipmate-setup/assets/docs-template/plans/README.md`, `README.md`, this plan — contract, plan template, and workflow list now require packets and copy-as-recorded PRs
- Why this: agents in consumer repos read AGENTS and the plan template, not only `workflow.md`; skipped i18n README copies and a new `features/` page
- Look here: AGENTS slice-commit bullet; plans README copy rule; README steps 3 and 6
- Verified: `powershell -ExecutionPolicy Bypass -File scripts/validate.ps1`
- Unsure: none

### Slice: plan evidence
- Intent: add commit SHAs, verification result, and final status without rewriting packets
- Changed: `docs/plans/slice-review-packets.md` — SHAs, checkboxes, validation result
- Why this: DOCUMENT may add SHAs and status only; skipped a new summary of the work
- Look here: SHA lines stay additive; packet bodies unchanged
- Verified: `powershell -ExecutionPolicy Bypass -File scripts/validate.ps1`
- Unsure: none

### Slice: review-fix packet lifetime
- Intent: make later commits record a new packet in the same format, after verification
- Changed: `skills/shipmate/references/workflow.md`, `skills/shipmate-setup/assets/AGENTS.block.md`, `README.md` — review fixes and BABYSIT write a new packet; Korean intro mentions packets
- Why this: “the same packet” was readable as reuse; skipped rewriting the protocol slice packet
- Look here: IMPLEMENT “new packet for later commits”; BABYSIT order (verify then packet); AGENTS babysit bullet; Korean intro
- Verified: `powershell -ExecutionPolicy Bypass -File scripts/validate.ps1`
- Unsure: none

### Slice: review-fix packet order and AC
- Intent: align the plan AC and BABYSIT order with “new packet immediately before commit”
- Changed: `docs/plans/slice-review-packets.md`, `skills/shipmate/references/workflow.md` — AC now requires a new packet; BABYSIT is verify → delta review → packet → commit
- Why this: AC still said “same packet”, and a packet written before the delta review would drift if the review changed the tree
- Look here: acceptance criteria follow-up line; BABYSIT bullet order
- Verified: `powershell -ExecutionPolicy Bypass -File scripts/validate.ps1`
- Unsure: none

## Review triage

- Finding 1 (protocol packet omits the plan file in `bb6be18`): invalid. The plan file is the packet store and is included in every slice commit by IMPLEMENT step 6. Listing it in Changed on every packet would be noise. Changed names the slice's product or docs change.
- Finding 2 (later commits need a new packet; BABYSIT wording and order): valid. Fixed in this slice.
- Finding 3 (Korean README intro omitted packets): valid. Fixed in the previous slice.
- Finding 4 (plan AC still said “same packet”): valid. Fixed in this slice.
- Finding 5 (BABYSIT recorded the packet before the delta review): valid. Fixed in this slice: verify → delta review → new packet → commit.

## Documentation impact

- `skills/shipmate/references/workflow.md`
- `skills/shipmate-setup/assets/docs-template/plans/README.md`
- `skills/shipmate-setup/assets/AGENTS.block.md`
- `README.md`
- this plan file
