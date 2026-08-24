# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Logo Shipmate" width="280"></p>
<p align="center"><strong>Planuj uważnie. Twórz test-first. Dostarczaj z pewnością.</strong></p>

[한국어 / English](../../README.md)

Shipmate to umiejętność wieloagentowego przepływu pracy, która łączy planowanie, TDD, dokumentację, niezależny przegląd adwersarialny i monitorowanie PR w jeden proces, aby rozwój wspierany przez AI był wydajniejszy i bardziej niezawodny. Działa z Cursor, Claude Code i Codex.

## Umiejętności

- `shipmate-setup`: uruchamiana raz dla projektu; konfiguruje główny plik `AGENTS.md`, trwałą strukturę dokumentacji oraz wykryte wskazówki TDD.
- `shipmate`: prowadzi zatwierdzony plan przez RED → GREEN → REFACTOR, atomowe commity dla kolejnych fragmentów, dokumentację, niezależny przegląd adwersarialny, końcowe utworzenie PR i nadzór aż do gotowości do scalenia.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

Utworzenie PR jest ostatnim etapem lokalnego rozwoju. Shipmate nigdy nie scala zmian bez wyraźnej prośby.

## Instalacja

`npx skills add support-kang/shipmate-agent-skills`

Po instalacji rozpocznij nową sesję agenta, uruchom `shipmate-setup` dokładnie raz dla projektu, a potem używaj `shipmate`.

Konfiguracja zachowuje istniejące pliki i dodaje tylko brakującą strukturę oraz jasno wydzielony blok zarządzany. Shipmate jest dostępny na [licencji MIT](../../LICENSE); informacje o atrybucji znajdują się w [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md).
