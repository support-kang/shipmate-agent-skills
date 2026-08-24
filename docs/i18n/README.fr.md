# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Logo Shipmate" width="280"></p>
<p align="center"><strong>Planifiez avec soin. Développez en test-first. Livrez en confiance.</strong></p>

[한국어 / English](../../README.md)

Shipmate est une compétence de workflow multi-agent qui relie planification, TDD, documentation, revue contradictoire et suivi de PR afin de rendre le développement assisté par IA plus efficace et fiable. Elle fonctionne avec Cursor, Claude Code et Codex.

## Compétences

- `shipmate-setup` : à exécuter une fois par projet pour configurer le fichier `AGENTS.md` à la racine, une documentation durable et les consignes TDD détectées.
- `shipmate` : part d'un plan approuvé et enchaîne RED → GREEN → REFACTOR, commits atomiques par tranche, documentation, revue contradictoire indépendante, création finale de la PR et suivi jusqu'à l'état prêt à fusionner.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

La création de la PR est la dernière étape du développement local. Shipmate ne fusionne jamais sans demande explicite.

## Installation

`npx skills add support-kang/shipmate-agent-skills`

Après l'installation, démarrez une nouvelle session, exécutez `shipmate-setup` exactement une fois pour le projet, puis utilisez `shipmate` pour les travaux suivants.

La configuration préserve les fichiers existants et ajoute uniquement la structure manquante et un bloc géré clairement délimité. Shipmate est sous [licence MIT](../../LICENSE) ; consultez [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) pour les attributions.
