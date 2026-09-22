# Phản hồi kiểm tra LaTeX và mục 4.6

- **Người gửi:** `dungng2808`
- **Người nhận:** `CuuTroHan`
- **Thời gian:** 2026-09-22 22:51 (Asia/Ho_Chi_Minh)
- **Commit đã kiểm tra:** `7df1c16` (`Add English FullChain versus EvoSuite evaluation section`)
- **Tệp chính:** `trace-paper.tex`

## 1. Kết luận kiểm tra

Mục 4.6, **End-to-End FullChain System Evaluation against EvoSuite**, đã được thêm đúng vị trí trong Section 4 và gồm đầy đủ các tiểu mục 4.6.1--4.6.6. Các con số trong hai bảng và phần diễn giải thống kê khớp với kết quả của campaign official.

Các kết quả chính hiện được trình bày đúng:

- FullChain đạt VSR 55.11%, EvoSuite đạt 28.89%, chênh lệch +26.22 điểm phần trăm.
- Khoảng tin cậy bootstrap 95% của VSR là [14.22; 38.36] và không chứa 0.
- Kiểm định hoán vị ghép cặp cho VSR có `p = 0.0001`.
- CSR và ESR có `p_Holm = 0.0005`.
- STS và mutation score có `p_Holm = 0.0006`.
- Branch coverage có `p_Holm = 0.0007`.
- Tất cả khoảng tin cậy 95% của các outcome ITT chính đều không chứa 0.

Vì vậy, kết luận rằng FullChain tốt hơn EvoSuite với ý nghĩa thống kê là phù hợp **trong phạm vi cohort, budget, toolchain và verifier đã khóa**. Không nên diễn giải kết quả này thành ưu thế phổ quát trên mọi benchmark, LLM hoặc cấu hình.

## 2. Kết quả kiểm tra kỹ thuật LaTeX

- Không phát hiện `label` trùng.
- Không có `\ref` chưa được định nghĩa.
- Không có citation thiếu khóa BibTeX.
- Các môi trường LaTeX và dấu ngoặc nhọn được đóng cân bằng.
- PDF đã commit có 24 trang, khổ A4.
- SHA-256 của `trace-paper.tex`, `trace-paper.pdf`, bibliography và `Fig1.png` khớp với `BUILD_RECORD.md`.
- Bảng ITT và bảng candidate diagnostics hiển thị đầy đủ, không bị cắt hoặc tràn lề trong PDF.
- Repo sạch sau khi pull và đang đồng bộ với `origin/main` tại commit `7df1c16`.

Máy kiểm tra hiện không có `pdflatex`, `bibtex` hoặc `latexmk`, nên chưa thực hiện được một lần build độc lập trên môi trường thứ hai. Bản PDF đã commit và `BUILD_RECORD.md` cho biết bản build bằng MiKTeX hoàn tất không có lỗi LaTeX, reference hoặc citation chưa giải quyết.

## 3. Các điểm cần sửa trước khi submit

### 3.1. Abstract chưa phản ánh thí nghiệm FullChain--EvoSuite

Abstract hiện nói rằng các đóng góp được đánh giá qua ba nghiên cứu RQ1--RQ3, nhưng mục 4.6 lại bổ sung một thí nghiệm tích hợp end-to-end riêng. Cần thêm một câu tóm tắt thiết kế 450 cặp và kết quả chính FullChain 55.11% so với EvoSuite 28.89%.

### 3.2. Experimental Design chưa giới thiệu đánh giá end-to-end

Đầu Section 4 hiện chỉ giới thiệu ba research question và ba thí nghiệm tương ứng. Mục 4.6 xuất hiện sau RQ3 nhưng chưa được báo trước trong thiết kế nghiên cứu. Cần bổ sung một đoạn xác định đây là **system-level integrated evaluation** và giải thích quan hệ của nó với RQ1--RQ3.

Không nhất thiết tạo RQ4 nếu nhóm không muốn thay đổi cấu trúc nghiên cứu, nhưng phải nói rõ đây là đánh giá tổng thể bổ sung, khác với ba ablation/component studies.

### 3.3. H1 và H2 chưa được định nghĩa

Mục 4.6 đang dùng hai câu `support H1` và `support H2`, nhưng toàn bài chưa có định nghĩa chính thức cho H1 và H2.

Cần chọn một trong hai phương án:

1. Định nghĩa H1 và H2 trong phần Comparison Design trước khi trình bày kết quả; hoặc
2. Bỏ nhãn H1/H2 và viết trực tiếp rằng kết quả hỗ trợ kết luận về reliability và adequacy trong phạm vi thí nghiệm.

Khuyến nghị dùng phương án 2 nếu hypothesis chưa được preregister trước khi chạy campaign.

### 3.4. Conclusion chưa tổng hợp kết quả mục 4.6

Conclusion hiện chỉ tổng hợp RQ1, RQ2 và RQ3. Cần bổ sung một đoạn ngắn về so sánh end-to-end:

- 450 cặp trên 150 target và ba repetition;
- VSR 55.11% so với 28.89%;
- chênh lệch có ý nghĩa thống kê;
- FullChain tốn thời gian và token nhiều hơn;
- kết luận chỉ áp dụng cho cấu hình official đã khóa.

### 3.5. Bố cục campaign ID ở trang 20

Chuỗi `official-150-20260920-r42-r44-v1` trong `\nolinkurl{...}` tạo khoảng trắng rất lớn giữa các từ ở đoạn Reproducibility trên trang 20. Nên cho phép ngắt dòng an toàn, chuyển campaign ID sang `\texttt{...}` có điểm ngắt, hoặc viết lại câu để campaign ID nằm trên dòng riêng.

### 3.6. Cách gọi terminal status của EvoSuite

Cụm `139 terminal repair-exhausted baseline outcomes` dễ khiến người đọc hiểu rằng EvoSuite có repair, trong khi phần thiết kế nói EvoSuite không có repair round. Cần giải thích đây là tên terminal status do framework dùng cho baseline hoặc đổi sang một nhãn mô tả trung tính hơn.

### 3.7. Placeholder bắt buộc phải thay

Các phần sau vẫn chưa hoàn thiện:

- tên tác giả, affiliation và email;
- Acknowledgements;
- Funding;
- Competing interests;
- Data availability;
- Code availability;
- Author contributions.

Đây là các blocker trước khi nộp bản thảo chính thức.

## 4. Yêu cầu về khả năng tái lập

Trước khi submit hoặc phát hành artifact, cần công bố cùng một version/tag bất biến gồm:

- cohort manifest của 150 target;
- paired-comparison CSV;
- raw terminal records;
- availability ledger;
- tool lock;
- cấu hình đã loại bỏ secret;
- analysis script tạo bootstrap CI, permutation test và Holm correction;
- seed và campaign ID;
- SHA-256 của toàn bộ artifact đầu vào và đầu ra chính.

`BUILD_RECORD.md` hiện cũng ghi rõ các artifact này chưa được phát hành độc lập. Vì vậy, phần 4.6 có thể dùng để viết bản thảo, nhưng chưa nên tuyên bố fully reproducible cho đến khi gói artifact được công bố.

## 5. Thứ tự sửa đề xuất

1. Định nghĩa lại vai trò của thí nghiệm end-to-end trong Experimental Design.
2. Xử lý H1/H2.
3. Cập nhật Abstract và Conclusion.
4. Sửa terminal-status wording và bố cục campaign ID.
5. Điền metadata tác giả và Statements and Declarations.
6. Build lại đủ chuỗi `pdflatex -> bibtex -> pdflatex -> pdflatex` và kiểm tra log.
7. Cập nhật `BUILD_RECORD.md`, PDF và hash sau lần build cuối.

Sau các bước trên, mục 4.6 sẽ nhất quán với toàn bài và đủ chặt chẽ hơn để đưa vào bản nộp Springer.
