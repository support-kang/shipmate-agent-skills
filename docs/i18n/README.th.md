# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="โลโก้ Shipmate" width="280"></p>
<p align="center"><strong>วางแผนอย่างรอบคอบ พัฒนาแบบ test-first ส่งมอบอย่างมั่นใจ</strong></p>

[한국어 / English](../../README.md)

Shipmate คือสกิลเวิร์กโฟลว์แบบหลายเอเจนต์ที่เชื่อมการวางแผน TDD เอกสาร การรีวิวเชิงโต้แย้งโดยอิสระ และการติดตาม PR ไว้ในกระบวนการเดียว เพื่อให้การพัฒนาด้วย AI มีประสิทธิภาพและน่าเชื่อถือยิ่งขึ้น รองรับ Cursor, Claude Code และ Codex

## สกิล

- `shipmate-setup`: เรียกใช้หนึ่งครั้งต่อโปรเจกต์ เพื่อตั้งค่า `AGENTS.md` ที่รากโปรเจกต์ โครงสร้างเอกสารระยะยาว และแนวทาง TDD ที่ตรวจพบ
- `shipmate`: ดำเนินงานจากแผนที่อนุมัติแล้วผ่าน RED → GREEN → REFACTOR, คอมมิตย่อยแบบอะตอมมิก, เอกสาร, การรีวิวเชิงโต้แย้งโดยอิสระ, สร้าง PR เป็นขั้นตอนสุดท้าย และติดตามจนพร้อม merge

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

การสร้าง PR เป็นขั้นตอนสุดท้ายของการพัฒนาในเครื่อง Shipmate จะไม่ merge หากไม่มีคำขออย่างชัดเจน

## การติดตั้ง

`npx skills add support-kang/shipmate-agent-skills`

หลังติดตั้ง ให้เริ่มเซสชันเอเจนต์ใหม่ เรียกใช้ `shipmate-setup` เพียงครั้งเดียวสำหรับโปรเจกต์ แล้วใช้ `shipmate` สำหรับงานถัดไป

การตั้งค่าจะเก็บไฟล์เดิมไว้และเพิ่มเฉพาะโครงสร้างที่ขาดกับบล็อกที่จัดการซึ่งมีขอบเขตชัดเจน Shipmate ใช้ [สัญญาอนุญาต MIT](../../LICENSE) และดูข้อมูลการให้เครดิตได้ที่ [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md)
