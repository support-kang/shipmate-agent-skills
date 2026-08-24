<!-- babysit-dev:start -->
## Babysit Dev project contract

Read `docs/README.md` before planning non-trivial work, then read only the linked documents relevant to the task.

For development tasks:

- Understand the affected flow and surface material ambiguity before editing.
- Prefer no change, existing project code, standard/native capabilities, and already-installed dependencies before new code or packages.
- Make the smallest correct change; avoid speculative abstractions and unrelated cleanup.
- Keep `docs/features/`, `docs/plans/`, `docs/decisions/`, `docs/runbooks/`, and `docs/reference/` accurate for the areas affected.
- Plan non-trivial work before implementation and use coherent, independently verifiable slice commits.
- Before pushing, run relevant checks and obtain a fresh independent adversarial review of the plan and branch diff.
- Create the pull request only after implementation, documentation, review fixes, and the local verification gate are complete.
- After the PR exists, babysit CI and review feedback until merge-ready. Never merge without a separate explicit request.

Do not use destructive Git operations or force-push unless the user explicitly authorizes the exact action.
<!-- babysit-dev:end -->
