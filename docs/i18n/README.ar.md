# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="شعار Shipmate" width="280"></p>
<p align="center"><strong>خطّط بعناية. طوّر بالاختبارات أولاً. أطلق بثقة.</strong></p>

[한국어 / English](../../README.md)

Shipmate هي مهارة سير عمل متعددة الوكلاء تربط التخطيط والتطوير الموجّه بالاختبارات (TDD) والتوثيق والمراجعة النقدية المستقلة ومراقبة طلبات السحب في عملية واحدة، لجعل التطوير المعتمد على الذكاء الاصطناعي أكثر كفاءة وموثوقية. تعمل مع Cursor وClaude Code وCodex.

## المهارات

- `shipmate-setup`: تُشغّل مرة واحدة لكل مشروع لإعداد ملف `AGENTS.md` في الجذر، وبنية توثيق دائمة، وإرشادات TDD المكتشفة.
- `shipmate`: تنفّذ الخطة المعتمدة عبر RED → GREEN → REFACTOR، وعمليات إيداع ذرّية لكل جزء، والتوثيق، والمراجعة النقدية المستقلة، ثم إنشاء طلب السحب أخيراً ومتابعته حتى يصبح جاهزاً للدمج.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

إنشاء طلب السحب هو آخر خطوة في التطوير المحلي. لا تدمج Shipmate أي طلب سحب دون طلب صريح.

## التثبيت

`npx skills add support-kang/shipmate-agent-skills`

بعد التثبيت، ابدأ جلسة وكيل جديدة وشغّل `shipmate-setup` مرة واحدة فقط للمشروع، ثم استخدم `shipmate` للمهام اللاحقة.

يحافظ الإعداد على الملفات الحالية ولا يضيف إلا البنية الناقصة وكتلة مُدارة محددة بوضوح. يستخدم Shipmate [ترخيص MIT](../../LICENSE)، وتوجد نسب أعمال الأطراف الثالثة في [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md).
