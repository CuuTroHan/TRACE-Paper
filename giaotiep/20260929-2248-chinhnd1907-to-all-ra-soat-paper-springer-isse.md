# Rà soát bản thảo TRACE theo hướng dẫn Springer Nature / ISSE

- Thời điểm: 29/09/2026, 22:48 (Asia/Ho_Chi_Minh).
- Người gửi: `chinhnd1907` → người nhận: `all`.
- Bản được rà soát: [`paper/trace-paper.tex`](../paper/trace-paper.tex) và [`paper/trace-paper.pdf`](../paper/trace-paper.pdf), PDF 29 trang.
- Tạp chí đối chiếu: *Innovations in Systems and Software Engineering* (ISSE), theo [submission guidelines](https://link.springer.com/journal/11334/submission-guidelines). Nếu nhóm đổi tạp chí đích, cần đối chiếu lại hướng dẫn của tạp chí mới.

## Kết luận và việc cần chốt trước khi nộp

Bản thảo dùng đúng lớp `sn-jnl`, kiểu trích dẫn `sn-basic` và tùy chọn hai cột `iicol` mà ISSE khuyến nghị. PDF hiện khớp nội dung nguồn LaTeX; mã băm nguồn trong `BUILD_RECORD.md` là bản xuống dòng LF, còn checkout Windows dùng CRLF. Kiểm tra tĩnh thấy 12 bảng và 1 hình đều được dẫn trong bài, 33 mục tài liệu tham khảo đều được trích dẫn, không có nhãn tham chiếu thiếu hoặc trùng. Quan sát PDF không thấy chữ hoặc bảng bị cắt.

**Chưa nên coi bản này là sẵn sàng nộp.** Đề nghị nhóm xử lý theo thứ tự:

1. **Hoàn thiện Data availability và Code availability.** Hiện hai mục chỉ ghi gói dữ liệu/mã “đang được chuẩn bị”, chưa có địa chỉ truy cập, phiên bản hoặc điều kiện tiếp cận. ISSE yêu cầu bài nghiên cứu gốc có tuyên bố giải thích cách truy cập dữ liệu hỗ trợ kết quả. Cần chốt gói tối thiểu để người phản biện đối chiếu các campaign, manifest, cấu hình, bản ghi và mã phân tích; nếu không thể công khai, phải nêu cách xin truy cập và điều kiện sử dụng thật sự. Không tự tạo DOI hay cam kết công bố khi chưa có gói thực tế. Xem cuối [`trace-paper.tex`](../paper/trace-paper.tex) và [`verification/README.md`](../paper/verification/README.md).
2. **Làm lại nguồn Hình 1 ở chất lượng nộp bài.** Hình hiện là PNG 1536 × 1024 px, khoảng 244 dpi ở kích thước in trong PDF. ISSE yêu cầu tối thiểu 600 dpi cho hình kết hợp nét/chữ và ưu tiên vector. Cần xuất từ file thiết kế gốc thành vector có font nhúng, hoặc bitmap độ phân giải thực đủ cao, rồi kiểm tra ở kích thước in. Không chỉ sửa metadata DPI hoặc phóng to PNG hiện có. Xem [`FIGURE1_ARTWORK.md`](../paper/FIGURE1_ARTWORK.md).
3. **Rút abstract.** Công cụ đếm trong repo cho 229 từ khi tính từ ghép có gạch nối là một từ, nhưng 258 từ khi tách chúng; ISSE giới hạn 150–250 từ. Nên rút xuống khoảng 240 từ theo cách đếm bảo thủ, giữ các kết quả và giới hạn quan trọng. Xem [`count-abstract-words.ps1`](../paper/scripts/count-abstract-words.ps1).
4. **Chốt xác nhận của toàn bộ tác giả.** Bản hiện tại đánh dấu cả bảy người “contributed equally” và phần Author contributions nói tất cả đều đóng góp ngang nhau vào mọi công đoạn, riêng cô Nguyệt còn hướng dẫn. Mỗi người cần xác nhận phát biểu đó đúng thực tế, đồng thời kiểm tra thứ tự tên, affiliation, funding và competing interests. Thông tin đóng góp và xung đột lợi ích nhập trên hệ thống nộp bài phải nhất quán với bản thảo; ISSE cho biết thông tin trong hệ thống sẽ được dùng cho bản công bố cuối.

## Nhận xét nội dung khoa học

- **RQ1:** Kết quả được trình bày với giới hạn phù hợp: PLANNED dùng thêm lượt gọi và token, nên đối chứng đo cả gói planning cộng ngân sách suy luận, chưa tách riêng tác động của biểu diễn kế hoạch. Chênh lệch mẫu số không thiếu ở STS/BC và việc chưa điều chỉnh đầy đủ theo cụm dự án vẫn giới hạn suy rộng. Khi sửa abstract hoặc kết luận, không nâng kết quả này thành khẳng định nhân quả riêng cho structural plan.
- **RQ2:** FCR đạt tỷ lệ core repair thành công 76%, so với 60% của TGSLR; ưu thế 60% so với 46% của FTMR không còn đạt ngưỡng sau Holm. Kết luận hiện tại đã thừa nhận chưa có bằng chứng TGSLR vượt trội tổng thể hoặc không kém hơn về độ đầy đủ của test. Cần giữ cách diễn đạt này.
- **RQ3:** Nhãn vàng do một thành viên gán cho 73 ca rồi nhóm thống nhất bằng trao đổi miệng, không có biên bản đối chiếu từng ca; tập ca đã tiếp xúc prototype, DeepSeek dùng artifact sửa sau freeze, và Qwen được chọn sau khi xem các run khác. Đây là kết quả thăm dò, chưa xác nhận lợi thế tổng quát của kiến trúc verifier. Cần giữ rõ các điều kiện này ở abstract, kết quả và kết luận.
- **TRACE so với EvoSuite:** VSR cao hơn trong cohort được báo cáo, nhưng cổng B2 là hợp đồng đánh giá riêng của TRACE và chưa chứng minh trung lập giữa hai bộ sinh. Chi phí inference cho nhánh EvoSuite bị thiếu trong trường token của export; ước tính 7,23 triệu token là phân tích độ nhạy hậu nghiệm, không phải usage đã ghi nhận. Không diễn giải các kết quả thành ưu thế phổ quát hoặc so sánh chi phí token đã đo đầy đủ.
- Các kiểm chứng hiện có hỗ trợ tính nhất quán số liệu từ những export cục bộ. Chúng không thay thế tái chạy Java/JUnit/JaCoCo/PIT, xác thực độc lập lịch sử chạy, hoặc một gói chứng cứ có phiên bản mà reviewer truy cập được.

## Chỉnh sửa trình bày nên làm

- Bảng 7–8 ở trang 20 có tên model/run bị xuống nhiều dòng; cân nhắc viết tắt nhãn và giải thích trong ghi chú bảng để dễ so sánh hàng.
- Rà lại tiếng Anh ở các tiêu đề và câu lặp, ví dụ `Costs and Trade-offs (Cost Trade-off)` và `a structural planning`; thống nhất kiểu viết hoa của các tiêu đề cấp ba. Đây là chỉnh sửa biên tập, không ảnh hưởng số liệu.
- Soát lần cuối metadata, email, tên tác giả và nội dung khai báo trong cổng nộp bài sau khi nhóm chốt bản cuối.

Phạm vi ghi chú này là rà nguồn hiện tại, kiểm tra tĩnh và quan sát PDF. Chưa sửa bản thảo, chưa chạy lại thí nghiệm, và chưa xác minh độc lập metadata của toàn bộ 33 tài liệu tham khảo.
