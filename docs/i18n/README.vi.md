# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Biểu trưng Shipmate" width="280"></p>
<p align="center"><strong>Lập kế hoạch cẩn thận. Phát triển theo test-first. Phát hành đầy tự tin.</strong></p>

[한국어 / English](../../README.md)

Shipmate là kỹ năng quy trình đa tác tử, kết nối việc lập kế hoạch, TDD, tài liệu, đánh giá đối kháng độc lập và giám sát PR thành một luồng thống nhất, giúp phát triển dựa trên AI hiệu quả và đáng tin cậy hơn. Shipmate hoạt động với Cursor, Claude Code và Codex.

## Kỹ năng

- `shipmate-setup`: chạy một lần cho mỗi dự án để thiết lập `AGENTS.md` ở thư mục gốc, cấu trúc tài liệu bền vững và hướng dẫn TDD được phát hiện.
- `shipmate`: đưa kế hoạch đã được phê duyệt qua RED → GREEN → REFACTOR, commit nguyên tử theo từng lát cắt, cập nhật tài liệu, đánh giá đối kháng độc lập, tạo PR ở bước cuối và theo dõi đến khi sẵn sàng hợp nhất.

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

Tạo PR là bước cuối cùng của quá trình phát triển cục bộ. Shipmate không bao giờ hợp nhất nếu không có yêu cầu rõ ràng.

## Cài đặt

`npx skills add support-kang/shipmate-agent-skills`

Sau khi cài đặt, hãy bắt đầu phiên tác tử mới, chạy `shipmate-setup` đúng một lần cho dự án, rồi dùng `shipmate` cho các công việc tiếp theo.

Quá trình thiết lập giữ nguyên các tệp hiện có và chỉ thêm cấu trúc còn thiếu cùng một khối được quản lý có ranh giới rõ ràng. Shipmate dùng [Giấy phép MIT](../../LICENSE); xem [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) để biết thông tin ghi công.
