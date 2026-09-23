# Báo cáo đánh giá mức độ tuân thủ Template Springer Nature của bản thảo TRACE

- **Người thực hiện:** DucChinh
- **Người nhận:** CuuTroHan
- **Thời điểm:** 2026-09-23 10:15 (Asia/Ho_Chi_Minh)
- **Đối tượng đánh giá:** [`trace-paper.tex`](../trace-paper.tex), [`trace-paper.pdf`](../trace-paper.pdf), mã nguồn template [`sn-jnl.cls`](../sn-jnl.cls)
- **Mục tiêu nộp bài:** Special Issue Collection *"Resilient, Trustworthy, and AI-Driven Software Systems for Next-Generation Applications"* trên tạp chí **Innovations in Systems and Software Engineering (ISSE)** - Springer Nature.
- **Tài liệu tham chiếu:**
  - Collection Call for Papers: <https://link.springer.com/collections/gagdfebeia>
  - Submission Guidelines ISSE: <https://link.springer.com/journal/11334/submission-guidelines>
  - Springer Nature LaTeX Author Support: <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
  - Hướng dẫn nội bộ: [`giaotiep/AGENTS.md`](AGENTS.md)

---

## 1. Tổng quan về yêu cầu của Tạp chí & Template

1. **Tạp chí & Collection:**
   - **Tạp chí:** *Innovations in Systems and Software Engineering* (ISSE, Springer Nature / NASA).
   - **Collection:** *Resilient, Trustworthy, and AI-Driven Software Systems for Next-Generation Applications*.
   - **Chủ đề bài báo:** Phù hợp trực tiếp với scope của collection (AI-driven software testing, verification, resilience, và trustworthiness).
   - **Hạn chót nhận bài (Deadline):** **30/10/2026**.
   - **Cơ chế bình duyệt (Peer Review):** **Single-blind review** (Người phản biện biết danh tính tác giả; manuscript **bắt buộc** phải ghi rõ thông tin tác giả, đơn vị công tác, email liên hệ, không dùng bản ẩn danh).

2. **Tình trạng gói Template tại repository:**
   - Repository hiện tại **đã có sẵn đầy đủ gói template chuẩn mới nhất của Springer Nature**:
     - `sn-jnl.cls`: Document class chính thức của Springer Nature (Version 3.1, Update tháng 12/2024).
     - `sn-article.tex`: File bài báo mẫu tham chiếu nguyên bản của nhà xuất bản.
     - `sn-basic.bst`, `sn-mathphys-num.bst` và các style trích dẫn trong `bst/`.
     - `user-manual.pdf`: Sách hướng dẫn định dạng kỹ thuật của Springer Nature.

---

## 2. Kết quả kiểm tra đối chiếu chi tiết `trace-paper.tex` / `trace-paper.pdf`

### 2.1. Các điểm ĐÃ ĐÚNG quy chuẩn (Compliant)

1. **Document Class & Cấu hình Layout:**
   - Khai báo tại `trace-paper.tex:2`:
     ```latex
     \documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
     ```
   - Đúng chuẩn 2 cột (`iicol`) và hệ thống trích dẫn đánh số theo thứ tự xuất hiện (`Numbered`) với style `sn-basic.bst` theo khuyến nghị của tạp chí.
2. **Biên dịch PDF & Định dạng trang:**
   - Biên dịch sạch qua chuỗi lệnh `pdflatex -> bibtex -> pdflatex -> pdflatex`.
   - File xuất bản `trace-paper.pdf` có độ dài 24 trang A4 (2 cột), không gặp lỗi overfull hbox/vbox nghiêm trọng, không có duplicate destinations hay undefined references/citations.
3. **Độ dài Abstract:**
   - Kiểm tra qua script `scripts/count-abstract-words.ps1`: Abstract hiện có **219 từ** (theo chuẩn nhóm từ) hoặc **245 từ** (theo chuẩn tách dấu).
   - Hoàn toàn nằm trong khung quy định của Springer Nature (**150 -- 250 từ**).
4. **Keywords:**
   - Có đúng **6 từ khóa** chuyên môn (`unit test generation; large language models; structural planning; traceability-guided repair; multi-agent verification; Java`), đáp ứng đúng giới hạn **4 -- 6 keywords** của tạp chí.
5. **Định dạng số liệu:**
   - Sử dụng dấu chấm thập phân (`.`) theo chuẩn văn phong học thuật tiếng Anh (ví dụ: `58.00%`, `70.58%`, `p = 0.0001`).

---

## 2.2. Các điểm CHƯA ĐÚNG hoặc CẦN HOÀN THIỆN trước khi nộp (Non-compliant / Blockers)

Dưới đây là các điểm khiến bản thảo hiện tại **chưa thể nộp trực tiếp lên hệ thống Editorial Manager** của Springer:

| STT | Hạng mục | Quy định của Springer Nature / ISSE | Hiện trạng trong `trace-paper.tex` | Mức độ & Biện pháp khắc phục |
| :---: | :--- | :--- | :--- | :--- |
| **1** | **Thông tin tác giả (Metadata)** | Quy trình Single-blind yêu cầu ghi đầy đủ họ tên, cơ quan, email tác giả liên hệ, địa chỉ (thành phố, quốc gia), ORCID. | Dòng 28--29 đang là placeholder: `\author*[1]{\fnm{First} \sur{Author}}`, `author@example.com`, `\orgdiv{Department}, \orgname{Institution}...` | **P0 (Chặn nộp):** Cần nhóm tác giả cung cấp danh sách tác giả chính thức, tách rõ `\fnm{Tên/Tên đệm}` và `\sur{Họ}` cùng affiliation chuẩn. |
| **2** | **Khai báo bắt buộc (Declarations)** | Bắt buộc phải có các mục: Funding, Competing Interests, Ethics approval, Data availability, Code availability, Author contributions. | Dòng 670--698: Các mục đều đang ghi `"To be completed by the authors."` | **P0 (Chặn nộp):** Cần điền cam kết không xung đột lợi ích (*The authors have no competing interests...*), nguồn tài trợ (hoặc *No funding was received*), và link kho lưu trữ dữ liệu/mã nguồn. |
| **3** | **Tiêu đề Bảng (Table Captions)** | Springer Nature quy định tiêu đề bảng dùng dạng chữ hoa đầu dòng (**Sentence case**), không viết IN HOA toàn bộ. | Bảng 1 (dòng 317): `END-TO-END DESCRIPTION RESULTS`<br>Bảng 2 (dòng 348): `RESULTS OF PAIRED TESTS` | **P1 (Cần sửa):** Đổi thành:<br>- Table 1: `End-to-end descriptive results`<br>- Table 2: `Results of paired tests` |
| **4** | **Lệnh `\nocite` dư thừa** | Chỉ liệt kê tài liệu tham khảo được trích dẫn thực tế trong nội dung bài báo. | Dòng 37 có lệnh: `\nocite{bib1,bib2,...,bib25}` để ép hiện đủ 25 tài liệu. | **P1 (Cần sửa):** Xóa bỏ dòng `\nocite` này và đảm bảo mọi tài liệu đều được trích dẫn theo ngữ cảnh ngữ nghĩa trong bài. |
| **5** | **Độ phân giải hình ảnh (`Fig1.png`)** | Springer khuyến khích sử dụng định dạng Vector (PDF/EPS) hoặc ảnh Bitmap có độ phân giải tối thiểu 300 DPI. | `Fig1.png` là file PNG có độ phân giải thực tế khoảng 244 DPI. | **P1 (Khuyến nghị):** Nếu có file thiết kế gốc (draw.io, SVG, Visio), nên export sang vector PDF để chèn vào LaTeX đạt độ sắc nét tuyệt đối khi in ấn. |
| **6** | **Chính sách sử dụng GenAI/LLM** | Springer Nature yêu cầu tuyên bố minh bạch về việc sử dụng công cụ AI tạo sinh hỗ trợ viết văn, hiệu đính hoặc xử lý dữ liệu. | Chưa có đoạn mô tả trách nhiệm tác giả về việc sử dụng AI hỗ trợ chuẩn bị bản thảo. | **P1 (Cần bổ sung):** Bổ sung tuyên bố theo đúng chính sách *AI use in manuscript preparation* của Springer Nature vào mục Acknowledgements hoặc Declarations. |

---

## 3. Đề xuất kế hoạch hành động tiếp theo

1. **Bước 1 (Kỹ thuật TeX):**
   - Đổi Sentence case cho tiêu đề Table 1 và Table 2.
   - Gỡ bỏ lệnh `\nocite` tại dòng 37.
   - Thử nghiệm chèn vector PDF cho Figure 1 nếu nhóm tác giả có sẵn file thiết kế gốc.
2. **Bước 2 (Xác nhận thông tin từ nhóm tác giả):**
   - Nhóm tác giả cung cấp thông tin tác giả chính thức (Tên, Email, Trường/Viện công tác).
   - Nhóm tác giả phê duyệt nội dung các mục Declarations (Đặc biệt là Data Availability: đường dẫn công khai Zenodo / Figshare / GitHub lưu trữ dataset và scripts).
3. **Bước 3 (Kiểm tra và đóng gói nộp bài):**
   - Chạy lại `.\scripts\build-paper.ps1` để sinh file PDF cuối cùng.
   - Đóng gói toàn bộ mã nguồn TeX, file `.bib`, `.cls`, `.bst`, các hình ảnh vào file ZIP theo đúng yêu cầu upload của cổng nộp bài Springer.

---

> *Báo cáo này được lập nhằm tổng hợp hiện trạng kỹ thuật và đối chiếu quy định chính thức của Springer Nature cho đợt nộp bài trước ngày 30/10/2026.*
