# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Logo Shipmate" width="280"></p>
<p align="center"><strong>Rencanakan dengan cermat. Kembangkan dengan test-first. Kirim dengan percaya diri.</strong></p>

[한국어 / English](../../README.md)

Shipmate adalah skill alur kerja multiagen yang menghubungkan perencanaan, TDD, dokumentasi, tinjauan adversarial independen, dan pemantauan PR menjadi satu proses agar pengembangan berbasis AI lebih efisien dan andal. Shipmate mendukung Cursor, Claude Code, dan Codex.

## Skill

- `shipmate-setup`: dijalankan sekali per proyek untuk menyiapkan `AGENTS.md` di root, struktur dokumentasi yang tahan lama, dan panduan TDD yang terdeteksi.
- `shipmate`: menjalankan rencana yang telah disetujui melalui RED → GREEN → REFACTOR, commit atomik per irisan, dokumentasi, tinjauan adversarial independen, pembuatan PR di tahap akhir, dan pemantauan hingga siap digabungkan.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

Pembuatan PR adalah tahap terakhir pengembangan lokal. Shipmate tidak pernah melakukan merge tanpa permintaan eksplisit.

## Instalasi

macOS/Linux: `./scripts/install.sh codex`  
Windows: `.\scripts\install.ps1 -Platform codex`

Ganti `codex` dengan `cursor` atau `claude-code` bila diperlukan. Mulai sesi agen baru, jalankan `shipmate-setup` terlebih dahulu, lalu gunakan `shipmate` untuk pekerjaan berikutnya.

Setup mempertahankan file yang ada dan hanya menambahkan struktur yang belum tersedia serta blok terkelola dengan batas yang jelas. Shipmate menggunakan [Lisensi MIT](../../LICENSE); lihat [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) untuk atribusi.
