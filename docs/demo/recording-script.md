# Shipmate terminal demo storyboard

Target length: 30–45 seconds. Record a real run in a small Todo application repository and keep the terminal large enough to read in the README.

## Scenario

The user asks: `Add password reset.`

| Time | Terminal beat | Evidence to show |
| --- | --- | --- |
| 0–3s | User request | A clean task branch in the Todo app |
| 3–7s | `STATE: PLAN` | Shipmate reads project docs and writes the durable plan |
| 7–10s | `PLAN GATE` | User approves three implementation slices |
| 10–18s | RED → GREEN → REFACTOR | One focused failing test becomes green; show compact test output |
| 18–22s | Slice commits | Three small, reviewable commits appear in the log |
| 22–25s | Documentation | Feature and testing docs update before shipping |
| 25–31s | Fresh adversarial review | Reviewer reports: `Missing rate-limit test` |
| 31–35s | Fix and local gate | New test passes with the relevant suite |
| 35–39s | PR created | PR is created only after the local gate is green |
| 39–43s | Babysit | CI and review status become green |
| 43–45s | `MERGE-READY` | Stop without merging |

## Recording rules

- Use a real repository and real command output; do not animate fabricated test or PR results.
- Speed up waits, but keep state transitions and the review finding readable.
- Hide tokens, account identifiers, private URLs, notifications, and unrelated terminal history.
- Record at a fixed 16:9 size with a high-contrast theme and no background music.
- Export an optimized GIF to `assets/shipmate-demo.gif`, then place it below `## See the loop` in the root README.
