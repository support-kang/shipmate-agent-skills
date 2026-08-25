<!-- shipmate:start -->
## Shipmate project contract

Read `docs/README.md` before planning non-trivial work, then read only the linked documents relevant to the task.

For development tasks:

- Understand the affected flow and surface material ambiguity before editing.
- Prefer no change, existing project code, standard/native capabilities, and already-installed dependencies before new code or packages.
- Make the smallest correct change; avoid speculative abstractions and unrelated cleanup.
- Develop behavior-changing code with TDD: prove RED with a focused failing behavioral test, make the minimum change for GREEN, then REFACTOR only while tests remain green.
- Do not weaken tests to reach GREEN or add a new test framework without explicit approval. Record justified TDD exceptions and the replacement verification in the task plan.
- Keep `docs/features/`, `docs/plans/`, `docs/decisions/`, `docs/runbooks/`, and `docs/reference/` accurate for the areas affected.
- Plan non-trivial work before implementation and use coherent, independently verifiable slice commits.
- Record shipping in the task plan: target branch and remote, slice commits, push, and PR creation. An approved plan authorizes those actions unless the user explicitly excludes one.
- Record stop conditions in the task plan: inherit the protocol defaults and add task-specific cases that require developer intervention. When a recorded stop condition is met, stop and ask for direction instead of bypassing it to keep shipping.
- Before pushing, run relevant checks and obtain a fresh independent adversarial review of the plan and branch diff.
- Create the pull request only after implementation, documentation, review fixes, and the local verification gate are complete.
- After the PR exists, babysit CI and review feedback until merge-ready. Never merge without a separate explicit request.

Do not use destructive Git operations or force-push unless the user explicitly authorizes the exact action.
<!-- shipmate:end -->
