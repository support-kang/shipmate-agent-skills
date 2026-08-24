# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Shipmate-Logo" width="280"></p>
<p align="center"><strong>Sorgfältig planen. Testgetrieben entwickeln. Sicher ausliefern.</strong></p>

[한국어 / English](../../README.md)

Shipmate ist ein Multi-Agent-Workflow-Skill, der Planung, TDD, Dokumentation, adversariales Review und PR-Überwachung zu einem durchgängigen Prozess verbindet. So wird KI-gestützte Entwicklung effizienter und verlässlicher. Shipmate unterstützt Cursor, Claude Code und Codex.

## Skills

- `shipmate-setup`: wird einmal pro Projekt ausgeführt und richtet die zentrale `AGENTS.md`, eine dauerhafte Dokumentationsstruktur sowie erkannte TDD-Hinweise ein.
- `shipmate`: führt einen genehmigten Plan durch RED → GREEN → REFACTOR, atomare Slice-Commits, Dokumentation, unabhängiges adversariales Review, abschließende PR-Erstellung und Überwachung bis zur Merge-Bereitschaft.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

Das Erstellen des PR ist der letzte lokale Entwicklungsschritt. Shipmate führt ohne ausdrückliche Aufforderung niemals einen Merge durch.

## Installation

`npx skills add support-kang/shipmate-agent-skills`

Starten Sie nach der Installation eine neue Agent-Sitzung, führen Sie `shipmate-setup` genau einmal für das Projekt aus und verwenden Sie danach `shipmate`.

Das Setup erhält vorhandene Dateien und ergänzt nur fehlende Strukturen und einen klar abgegrenzten verwalteten Block. Shipmate steht unter der [MIT-Lizenz](../../LICENSE); Hinweise zu Drittanbietern finden Sie in [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md).
