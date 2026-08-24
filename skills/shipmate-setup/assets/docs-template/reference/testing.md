# Testing and TDD

Shipmate uses RED -> GREEN -> REFACTOR for behavior-changing code.

## Project test setup

- Test framework: _Detect from the repository; do not guess._
- Test locations: _Record confirmed paths or naming patterns._
- Focused test command: _Record the smallest supported command._
- Related test command: _Record the relevant package or module command._
- Full test command: _Record the repository-wide command when one exists._
- Coverage command or policy: _Record only when configured._

## Working agreement

1. RED: write the smallest behavioral test and confirm it fails for the expected reason.
2. GREEN: make the minimum production change and confirm the focused test passes.
3. REFACTOR: simplify only while green, then rerun the focused and related tests.

Do not weaken tests to make them pass, test private implementation details without need, or add a new framework without explicit approval.

## Known gaps and approved exceptions

Record areas without a usable test harness, the reason TDD cannot be applied, the replacement verification, and who approved the exception. Remove entries when the gap is closed.
