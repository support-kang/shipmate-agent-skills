# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Logotipo de Shipmate" width="280"></p>
<p align="center"><strong>Planifica con cuidado. Desarrolla con pruebas primero. Entrega con confianza.</strong></p>

[한국어 / English](../../README.md)

Shipmate es una habilidad de flujo de trabajo multiagente que conecta planificación, TDD, documentación, revisión adversarial y seguimiento de PR para lograr un desarrollo basado en IA más eficiente y fiable. Funciona con Cursor, Claude Code y Codex.

## Habilidades

- `shipmate-setup`: se ejecuta una vez por proyecto para configurar el `AGENTS.md` raíz, una estructura documental duradera y las pautas de TDD detectadas.
- `shipmate`: parte de un plan aprobado y aplica RED → GREEN → REFACTOR, commits atómicos por porciones, documentación, revisión adversarial independiente, creación final del PR y seguimiento hasta que esté listo para fusionarse.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

La creación del PR es el último paso del desarrollo local. Shipmate nunca fusiona sin una solicitud explícita.

## Instalación

macOS/Linux: `./scripts/install.sh codex`  
Windows: `.\scripts\install.ps1 -Platform codex`

Puedes sustituir `codex` por `cursor` o `claude-code`. Inicia una sesión nueva, ejecuta primero `shipmate-setup` y usa `shipmate` para el trabajo posterior.

La configuración conserva los archivos existentes y solo añade la estructura que falta y un bloque administrado claramente delimitado. Shipmate usa la [licencia MIT](../../LICENSE); consulta [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) para las atribuciones.
