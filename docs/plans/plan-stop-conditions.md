# Plan stop conditions

## Status

Complete.

## Problem and outcome

Task plans did not require explicit stop conditions, so agents could keep shipping when developer intervention was needed. Shipmate now requires every task plan to record stop conditions and to halt when one is met.

## Scope

- Protocol PLAN required fields and execution stop behavior
- Setup plan template, AGENTS contract, and README safety boundary
- This durable plan record for the distribution repository

## Non-goals

- New workflow state or configuration toggles
- Full i18n README updates
- Consumer-project `shipmate-setup` output in this repository

## Acceptance criteria

- [x] `docs/plans/<task-slug>.md` required fields include stop conditions
- [x] Recorded stop conditions halt execution instead of bypassing shipping
- [x] Setup template, AGENTS contract, and README match the protocol
- [x] `scripts/validate.ps1` passes

## Assumptions and open questions

None.

## TDD test plan

Docs-only exception. Verification uses `scripts/validate.ps1`.

## Planned commit boundaries

1. Protocol slice
2. Documentation slice

## Risks and rollback

Low risk documentation change. Revert the branch if the wording is rejected.

## Slices

1. Protocol updates in `skills/shipmate/references/workflow.md` and `skills/shipmate/SKILL.md`
2. Documentation updates in setup template, AGENTS contract, README, and this plan file

## Stop conditions

Protocol defaults apply. For this task, stop and ask for direction if:

- scope expands to full i18n README updates or a new workflow state
- consumer-project setup files are requested in this distribution repository
- secrets or credentials become required
- target branch or remote is unclear at shipping time

## Shipping

- Branch: `feat/plan-stop-conditions`
- Base: `main`
- Commits: protocol slice, documentation slice
- Push and PR: after local verification

## Verification

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate.ps1
```

Result: passed.

## Documentation impact

- `skills/shipmate/references/workflow.md`
- `skills/shipmate/SKILL.md`
- `skills/shipmate-setup/assets/docs-template/plans/README.md`
- `skills/shipmate-setup/assets/AGENTS.block.md`
- `README.md`
- this file
