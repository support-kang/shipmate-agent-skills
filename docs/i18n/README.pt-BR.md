# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Logotipo do Shipmate" width="280"></p>
<p align="center"><strong>Planeje com cuidado. Desenvolva com testes primeiro. Entregue com confiança.</strong></p>

[한국어 / English](../../README.md)

Shipmate é uma skill de fluxo de trabalho multiagente que conecta planejamento, TDD, documentação, revisão adversarial e acompanhamento de PR para tornar o desenvolvimento orientado por IA mais eficiente e confiável. Funciona com Cursor, Claude Code e Codex.

## Skills

- `shipmate-setup`: executada uma vez por projeto para configurar o `AGENTS.md` na raiz, uma estrutura de documentação durável e orientações de TDD detectadas automaticamente.
- `shipmate`: parte de um plano aprovado e conduz RED → GREEN → REFACTOR, commits atômicos por fatia, documentação, revisão adversarial independente, criação final do PR e acompanhamento até ficar pronto para merge.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

A criação do PR é a última etapa do desenvolvimento local. O Shipmate nunca faz merge sem um pedido explícito.

## Instalação

`npx skills add support-kang/shipmate-agent-skills`

Após a instalação, inicie uma nova sessão, execute `shipmate-setup` exatamente uma vez para o projeto e use `shipmate` nos trabalhos seguintes.

A configuração preserva os arquivos existentes e adiciona apenas a estrutura ausente e um bloco gerenciado claramente delimitado. O projeto usa a [licença MIT](../../LICENSE); veja [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) para atribuições.
