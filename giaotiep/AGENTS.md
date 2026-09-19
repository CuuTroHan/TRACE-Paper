# Quy ước giao tiếp & Quy tắc đặt tên file trong thư mục `giaotiep/`

> **Phạm vi áp dụng (Scope):**  
> Quy tắc này **CHỈ ÁP DỤNG DUY NHẤT** cho các file được tạo bên trong thư mục `giaotiep/` (và các thư mục con của nó nếu có). Quy tắc này **KHÔNG** ảnh hưởng hay áp dụng cho các file mã nguồn, tài liệu bên ngoài thư mục này.

---

## 1. Cấu trúc đặt tên file

Mọi file trao đổi, phản biện, báo cáo hoặc tài liệu đưa vào thư mục này bắt buộc phải tuân theo cấu trúc:

```text
YYYYMMDD-HHMM-<người_gửi>-to-<người_nhận>-<mô_tả_ngắn>.<ext>
```

### Chi tiết các trường thông tin:
- **`YYYYMMDD`**: Năm, tháng, ngày tạo file theo múi giờ Việt Nam (`Asia/Ho_Chi_Minh`). Ví dụ: `20260919`.
- **`HHMM`**: Giờ và phút theo định dạng 24 giờ. Ví dụ: `2315`.
- **`<người_gửi>`**: GitHub username của người tạo/gửi file. Ví dụ: `dungng2808` hoặc `CuuTroHan`.
- **`-to-`**: Từ khóa liên kết cố định để xác định rõ người gửi và người nhận.
- **`<người_nhận>`**: GitHub username của người tiếp nhận trao đổi/phản hồi. Ví dụ: `CuuTroHan` hoặc `dungng2808` (dùng `all` nếu là tài liệu/thông báo chung cho cả nhóm).
- **`<mô_tả_ngắn>`**: Tóm tắt ngắn gọn nội dung bằng chữ thường không dấu, các từ ngăn cách bằng dấu gạch nối `-`.
- **`<ext>`**: Định dạng file gốc (ví dụ: `.md`, `.pdf`, `.png`...).

---

## 2. Ví dụ minh họa

- Bạn Dũng gửi phản biện bản thảo Springer cho CuuTroHan:
  ```text
  20260919-2315-dungng2808-to-CuuTroHan-springer-submission-audit.md
  ```
- Bạn CuuTroHan gửi bản sửa lại phần Abstract cho Dũng:
  ```text
  20260920-0930-CuuTroHan-to-dungng2808-cap-nhat-abstract.md
  ```
- File thông báo chung cho cả nhóm:
  ```text
  20260920-1400-CuuTroHan-to-all-ke-hoach-chot-nop-bai.md
  ```

---

> *Lưu ý:* File `AGENTS.md` (hoặc `agent.md`) là file cấu hình hướng dẫn dành cho thành viên và AI Agent, không cần tuân theo quy tắc đặt tên file giao tiếp ở trên.
