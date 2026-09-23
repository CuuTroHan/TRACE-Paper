# Báo cáo đánh giá toàn diện Template Springer Nature và Nội dung Khoa học của Bản thảo TRACE

- **Người thực hiện:** DucChinh
- **Người nhận:** CuuTroHan
- **Thời điểm:** 2026-09-23 10:45 (Asia/Ho_Chi_Minh)
- **Đối tượng xem xét:** [`trace-paper.tex`](../trace-paper.tex), [`trace-paper.pdf`](../trace-paper.pdf), mã nguồn template [`sn-jnl.cls`](../sn-jnl.cls), cơ sở dữ liệu trích dẫn [`trace-references.bib`](../trace-references.bib)
- **Mục tiêu nộp bài:** Special Issue Collection *"Resilient, Trustworthy, and AI-Driven Software Systems for Next-Generation Applications"* trên tạp chí **Innovations in Systems and Software Engineering (ISSE)** - Springer Nature.
- **Tài liệu đối chiếu:**
  - Collection Call for Papers: <https://link.springer.com/collections/gagdfebeia>
  - Submission Guidelines ISSE: <https://link.springer.com/journal/11334/submission-guidelines>
  - Springer Nature LaTeX Author Support: <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
  - Quy ước trao đổi: [`giaotiep/AGENTS.md`](AGENTS.md)

---

## PHẦN I: ĐÁNH GIÁ MỨC ĐỘ TUÂN THỦ TEMPLATE SPRINGER NATURE

### 1. Thông tin quy định của Tạp chí & Collection
- **Tạp chí chủ quản:** *Innovations in Systems and Software Engineering* (ISSE, Springer Nature / NASA hợp tác).
- **Phù hợp chủ đề (Scope fit):** Bản thảo TRACE tập trung vào kiểm thử phần mềm tự động bằng LLM kết hợp quy hoạch cấu trúc và kiểm chứng đa agent, hoàn toàn khớp với trọng tâm của Special Issue về *AI-driven software systems, reliability, resilience and verification*.
- **Hạn chót nộp bài (Deadline):** **30/10/2026**.
- **Cơ chế bình duyệt (Peer Review):** **Single-blind review** (Người phản biện biết danh tính tác giả $\rightarrow$ bản thảo nộp **bắt buộc phải có đầy đủ tên tác giả, đơn vị công tác, email liên hệ**, không dùng bản ẩn danh).
- **Template quy định:** Springer Nature LaTeX Template (`sn-jnl.cls`, Version 3.1 tháng 12/2024). Repository hiện đã có sẵn đầy đủ file `.cls`, `.bst`, `sn-article.tex` và `user-manual.pdf`.

### 2. Các điểm ĐÃ TUÂN THỦ ĐÚNG chuẩn Template
1. **Document Class & Layout:** 
   - Khai báo chuẩn tại dòng 2:
     ```latex
     \documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
     ```
   - Định dạng 2 cột (`iicol`) và hệ thống trích dẫn số thứ tự (`Numbered`) với style `sn-basic.bst` là cấu hình khuyến nghị chuẩn của Springer cho ngành Khoa học Máy tính.
2. **Biên dịch & Định dạng trang:**
   - Biên dịch hoàn tất 24 trang A4 (2 cột) sạch sẽ, không có lỗi cú pháp TeX nghiêm trọng, không có overfull boxes hay undefined citations/references.
3. **Độ dài Abstract:**
   - Đạt **219 từ** (chuẩn nhóm từ) / **245 từ** (chuẩn tách dấu), nằm trong khung quy định ngặt nghèo **150 -- 250 từ** của Springer.
4. **Từ khóa (Keywords):**
   - Đạt đúng **6 từ khóa** (quy định là từ 4 đến 6 từ khóa).
5. **Ký hiệu số liệu:**
   - Dùng dấu chấm thập phân (`.`) theo chuẩn học thuật quốc tế (58.00%, 70.58%, v.v.).

### 3. Các điểm CHƯA ĐÚNG hoặc CẦN HOÀN THIỆN về mặt Template (Cần sửa)
1. **Placeholder Thông tin tác giả (P0 - Chặn nộp):** Dòng 28--29 vẫn là `First Author`, `author@example.com`, `Department, Institution`. Cần điền họ tên, viện/trường, email của nhóm tác giả thật.
2. **Khai báo bắt buộc chưa hoàn thành (P0 - Chặn nộp):** Dòng 670--698 (Funding, Competing interests, Ethics approval, Data/Code availability, Author contributions) toàn bộ đều ghi *"To be completed by the authors."* Hệ thống nộp bài của Springer sẽ tự động từ chối nếu thiếu các cam kết này.
3. **Tiêu đề Bảng viết IN HOA toàn bộ (P1):** Table 1 (`END-TO-END DESCRIPTION RESULTS`) và Table 2 (`RESULTS OF PAIRED TESTS`) đang viết hoa toàn bộ; Springer quy định dùng **Sentence case** (`End-to-end descriptive results` và `Results of paired tests`).
4. **Lệnh `\nocite` dư thừa (P1):** Dòng 37 có lệnh `\nocite{bib1,...,bib25}` ép hiện 25 tài liệu tham khảo. Cần xóa lệnh này và chỉ để BibTeX kéo tài liệu được cite tự nhiên trong bài.
5. **Chất lượng hình ảnh Fig1.png (P1):** Ảnh PNG hiện có độ phân giải khoảng 244 DPI; khuyến nghị xuất sang vector PDF từ bản vẽ gốc để in ấn đạt độ nét cao nhất.
6. **Chính sách sử dụng GenAI (P1):** Cần bổ sung câu tuyên bố minh bạch về việc sử dụng AI theo chính sách *AI use in manuscript preparation* của Springer Nature vào mục Declarations / Acknowledgements.

---

## PHẦN II: ĐÁNH GIÁ NỘI DUNG KHOA HỌC BẢN THẢO TRACE

### 1. Điểm mạnh học thuật nổi bật (Core Strengths)

1. **Khung phương pháp luận (Methodology) mô hình hóa chặt chẽ:**
   - Quy trình 7 bước của TRACE được hình thức hóa mạch lạc bằng các phương trình toán học ($M, \Pi, \Omega, E_i, D_i, T'_i, A$).
   - Ràng buộc **bất biến (Immutable Scenario Plan)** và **ánh xạ song ánh ($S_i \leftrightarrow T_i$)** giải quyết triệt để vấn đề "sửa lan man" (uncontrolled repair scope) của các phương pháp trước đây (như ChatUniTest, ChatTester, TestAgent).
2. **Thiết kế thực nghiệm (Experimental Design) có độ tin cậy và khách quan cao:**
   - Phân định rõ 3 nghiên cứu thành phần (RQ1: 600 runs; RQ2: 300 runs; RQ3: 73 cases) với 1 đánh giá hệ thống tích hợp (FullChain vs EvoSuite: 450 pairs).
   - **Áp dụng nguyên tắc ITT (Intention-To-Treat):** Các ca sinh test lỗi, không compile, không chạy được đều nhận điểm 0 cho metric cấu trúc, phản ánh trung thực cả độ tin cậy của pipeline chứ không loại bỏ để làm đẹp số liệu.
   - **Tách riêng phân tích điều kiện (Conditional Quality Analysis):** Chứng minh rõ việc Planning cải thiện coverage chủ yếu đến từ việc tăng tỷ lệ test thực thi thành công, tránh ngụy biện về chất lượng test thuần túy.
   - Phân tích thống kê ghép cặp bài bản với kiểm định McNemar, Wilcoxon signed-rank, hiệu chỉnh Holm--Bonferroni và khoảng tin cậy Bootstrap 95%.
3. **Văn phong khoa học thận trọng, trung thực và có chiều sâu (Nuanced & Rigorous):**
   - Bài báo chủ động nêu rõ các giới hạn: chi phí token tăng ~2.03x ở RQ1; lợi thế conditional của DeepSeek không ổn định; tỷ lệ sửa thành công của TGSLR (60%) thấp hơn FCR (76%) dù đổi lại kiểm soát được phạm vi sửa; verifier B2 tốn token gấp ~3x; và thừa nhận RQ3 mới là exploratory vì tập gold có 1 annotator người.
   - Đánh giá FullChain vs EvoSuite nêu rõ thời gian chạy (19.65h vs 14.73h) và lượng token tiêu thụ (37.5M tokens). Sự khách quan này tạo thiện cảm và độ tin cậy rất lớn với ban bình duyệt.

### 2. Các điểm cần hoàn thiện và chuẩn hóa trong nội dung (Content Improvements)

1. **Chuẩn hóa tính nhất quán của tên các mô hình LLM:**
   - RQ1 dùng: `Gemini 3.7 Flash` và `DeepSeek V4 Flash`.
   - RQ2 dùng: `gemini 3.6 flash` (đang viết thường ở dòng 292 $\rightarrow$ cần đổi thành `Gemini 3.6 Flash`).
   - RQ3 dùng: `Gemini 3.5`, `DeepSeek Reasoner` / `DeepSeek repaired`, `GLM`.
   - *Khuyến nghị:* Viết hoa đồng bộ tên model và bổ sung 1 câu ngắn trong Setup giải thích lý do dùng các phiên bản mô hình khác nhau ở từng RQ (do thời điểm thực nghiệm hoặc tính năng đặc thù của benchmark).
2. **Làm sạch hệ thống trích dẫn:**
   - Gỡ bỏ `\nocite` ở dòng 37.
   - Bổ sung một số trích dẫn mới (2024--2026) vào phần Related Work và Methodology về Multi-agent / LLM testing để cập nhật tính thời sự học thuật.
3. **Làm rõ Data Availability & Reproducibility:**
   - Phần Section 4.6 đã có Campaign ID rõ ràng (`official-150-20260920-r42-r44-v1`), cần gắn kèm link kho lưu trữ (Zenodo / Figshare / GitHub) trong mục Data Availability để khẳng định khả năng tái lập độc lập.

---

## PHẦN III: BẢNG TỔNG HỢP HÀNH ĐỘNG THEO MỨC ĐỘ ƯU TIÊN

| Mức độ | Hạng mục công việc | Mô tả chi tiết | Trách nhiệm thực hiện |
| :---: | :--- | :--- | :--- |
| **P0 (Chặn nộp)** | **Điền Metadata Tác giả** | Thay thế placeholder bằng họ tên thật (`\fnm{...} \sur{...}`), cơ quan, email tác giả liên hệ. | Nhóm tác giả xác nhận |
| **P0 (Chặn nộp)** | **Hoàn thiện Declarations** | Điền Funding, Competing Interests, Data/Code Availability, Author Contributions (tránh để *"To be completed"*). | Nhóm tác giả phê duyệt |
| **P1 (Cần sửa)** | **Chuẩn hóa Tiêu đề Bảng** | Sửa `\caption{...}` Table 1 & Table 2 sang dạng Sentence case theo quy định Springer. | Xử lý trong mã nguồn TeX |
| **P1 (Cần sửa)** | **Gỡ bỏ `\nocite`** | Xóa dòng `\nocite{...}` tại dòng 37 để danh mục References hiển thị tự nhiên. | Xử lý trong mã nguồn TeX |
| **P1 (Cần sửa)** | **Đồng bộ Tên Model** | Chuẩn hóa viết hoa `Gemini 3.6 Flash` tại dòng 292; làm rõ ngữ cảnh sử dụng model. | Xử lý trong mã nguồn TeX |
| **P1 (Cần sửa)** | **Bổ sung Tuyên bố GenAI** | Thêm tuyên bố trách nhiệm tác giả về việc dùng công cụ AI hỗ trợ viết bản thảo. | Xử lý trong mã nguồn TeX |
| **P2 (Khuyến nghị)** | **Tối ưu đồ họa Fig1** | Xuất lại ảnh sơ đồ kiến trúc TRACE sang định dạng PDF vector thay cho `Fig1.png` (244 DPI). | Cung cấp file thiết kế gốc |

---

## PHẦN IV: KẾT LUẬN CHUNG

Bản thảo TRACE hiện có **chất lượng khoa học rất cao, nội dung đồ sộ và lập luận thực nghiệm chặt chẽ**, hoàn toàn xứng tầm một bài báo Journal quốc tế uy tín. Cấu hình TeX đã sử dụng đúng template của Springer Nature (`sn-jnl.cls` v3.1, 2 cột `iicol`, trích dẫn `Numbered`). 

Sau khi nhóm tác giả bổ sung thông tin chính thức (Metadata & Declarations) và chỉnh sửa một số lỗi định dạng nhỏ (tiêu đề bảng, trích dẫn, ảnh vector), bản thảo sẽ hoàn toàn sẵn sàng để nộp thành công lên cổng tiếp nhận của Special Issue ISSE.
