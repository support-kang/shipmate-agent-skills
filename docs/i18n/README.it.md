# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Logo di Shipmate" width="280"></p>
<p align="center"><strong>Pianifica con cura. Sviluppa test-first. Rilascia con fiducia.</strong></p>

[한국어 / English](../../README.md)

Shipmate è una skill di workflow multi-agente che unisce pianificazione, TDD, documentazione, revisione avversariale e monitoraggio delle PR, rendendo lo sviluppo basato sull'IA più efficiente e affidabile. Funziona con Cursor, Claude Code e Codex.

## Skill

- `shipmate-setup`: si esegue una volta per progetto per configurare il file `AGENTS.md` nella root, una struttura documentale durevole e le indicazioni TDD rilevate.
- `shipmate`: parte da un piano approvato e gestisce RED → GREEN → REFACTOR, commit atomici per slice, documentazione, revisione avversariale indipendente, creazione finale della PR e monitoraggio fino alla disponibilità per il merge.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

La creazione della PR è l'ultima fase dello sviluppo locale. Shipmate non esegue mai il merge senza una richiesta esplicita.

## Installazione

`npx skills add support-kang/shipmate-agent-skills`

Dopo l'installazione, avvia una nuova sessione, esegui `shipmate-setup` esattamente una volta per il progetto e usa `shipmate` per le attività successive.

La configurazione preserva i file esistenti e aggiunge solo la struttura mancante e un blocco gestito chiaramente delimitato. Shipmate usa la [licenza MIT](../../LICENSE); consulta [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) per le attribuzioni.
