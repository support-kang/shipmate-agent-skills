# Plan slice review packets

## Status

Approved.

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

- [ ] Each slice commit records a short packet in `docs/plans/<task-slug>.md`: intent, changed behavior, why, review hotspots, verification, residual uncertainty
- [ ] Packets are not rewritten later; the PR copies them as recorded and prefixes each with its commit SHA
- [ ] Independent review treats packets as a map, not proof, and treats packet/diff mismatch as a finding
- [ ] Follow-up BABYSIT commits use the same packet
- [ ] Setup template, AGENTS contract, and README match the protocol
- [ ] `scripts/validate.ps1` passes

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
- Intent: make consumer-facing docs match the packet protocol
- Changed: `skills/shipmate-setup/assets/AGENTS.block.md`, `skills/shipmate-setup/assets/docs-template/plans/README.md`, `README.md`, this plan — contract, plan template, and workflow list now require packets and copy-as-recorded PRs
- Why this: agents in consumer repos read AGENTS and the plan template, not only `workflow.md`; skipped i18n README copies and a new `features/` page
- Look here: AGENTS slice-commit bullet; plans README copy rule; README steps 3 and 6
- Verified: `powershell -ExecutionPolicy Bypass -File scripts/validate.ps1`
- Unsure: none

## Documentation impact

- `skills/shipmate/references/workflow.md`
- `skills/shipmate-setup/assets/docs-template/plans/README.md`
- `skills/shipmate-setup/assets/AGENTS.block.md`
- `README.md`
- this plan file
