# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Shipmate logosu" width="280"></p>
<p align="center"><strong>Dikkatle planla. Önce test ederek geliştir. Güvenle yayınla.</strong></p>

[한국어 / English](../../README.md)

Shipmate; planlama, TDD, dokümantasyon, bağımsız karşıt inceleme ve PR takibini tek bir süreçte birleştirerek yapay zekâ destekli geliştirmeyi daha verimli ve güvenilir hâle getiren çok ajanlı bir iş akışı becerisidir. Cursor, Claude Code ve Codex ile çalışır.

## Beceriler

- `shipmate-setup`: proje başına bir kez çalıştırılır; kök `AGENTS.md` dosyasını, kalıcı dokümantasyon yapısını ve algılanan TDD yönergelerini kurar.
- `shipmate`: onaylı planı RED → GREEN → REFACTOR, atomik dilim commit'leri, dokümantasyon, bağımsız karşıt inceleme, en son PR oluşturma ve birleştirmeye hazır olana kadar takip aşamalarından geçirir.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

PR oluşturmak yerel geliştirmedeki son adımdır. Shipmate açık bir istek olmadan asla birleştirme yapmaz.

## Kurulum

`npx skills add support-kang/shipmate-agent-skills`

Kurulumdan sonra yeni bir ajan oturumu başlatın, proje için `shipmate-setup` komutunu tam bir kez çalıştırın ve sonraki işler için `shipmate` kullanın.

Kurulum mevcut dosyaları korur; yalnızca eksik yapıyı ve sınırları açıkça belirlenmiş yönetilen bir bloğu ekler. Shipmate [MIT Lisansı](../../LICENSE) ile yayımlanır; atıflar için [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) dosyasına bakın.
