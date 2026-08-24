# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Логотип Shipmate" width="280"></p>
<p align="center"><strong>Плануйте ретельно. Розробляйте через тести. Випускайте впевнено.</strong></p>

[한국어 / English](../../README.md)

Shipmate — це навичка багатоагентного робочого процесу, яка поєднує планування, TDD, документацію, незалежний критичний огляд і моніторинг PR в один процес, роблячи розробку з ШІ ефективнішою та надійнішою. Вона працює з Cursor, Claude Code і Codex.

## Навички

- `shipmate-setup`: запускається один раз для проєкту та налаштовує кореневий `AGENTS.md`, сталу структуру документації й виявлені рекомендації TDD.
- `shipmate`: проводить затверджений план через RED → GREEN → REFACTOR, атомарні коміти за зрізами, документацію, незалежний критичний огляд, фінальне створення PR і нагляд до готовності до злиття.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

Створення PR є останнім етапом локальної розробки. Shipmate ніколи не виконує злиття без явного запиту.

## Встановлення

macOS/Linux: `./scripts/install.sh codex`  
Windows: `.\scripts\install.ps1 -Platform codex`

За потреби замініть `codex` на `cursor` або `claude-code`. Почніть нову сесію агента, спершу запустіть `shipmate-setup`, а для подальших завдань використовуйте `shipmate`.

Налаштування зберігає наявні файли й додає лише відсутню структуру та чітко обмежений керований блок. Shipmate поширюється за [ліцензією MIT](../../LICENSE); відомості про атрибуцію наведені в [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md).
