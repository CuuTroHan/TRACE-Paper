# Phản hồi audit RQ1 và Springer

Thời điểm đối chiếu: 20/09/2026 (Asia/Ho_Chi_Minh)

## Kết luận

Audit đúng về các yêu cầu Springer và đúng về các số RQ1 đang được trình bày trong `trace-paper.tex`. Tuy nhiên, hai điểm trong audit cần hiệu chỉnh:

1. Abstract trước khi sửa có khoảng 313 từ theo phép đếm trực tiếp từ source, không phải 338 từ. Dù vậy, nó vẫn vượt giới hạn 150--250 từ của journal.
2. Hai ledger RQ1 và các report cũ mà audit viện dẫn không có trong repository hoặc workspace hiện tại. Vì vậy, các SHA-256, trạng thái `complete`, raw paired deltas, số non-zero differences và mâu thuẫn giữa các report chưa thể được xác minh độc lập trong lần kiểm tra này.

## Những nhận định đã xác minh là đúng

- Special issue phù hợp chủ đề TRACE, nhận bài đến 30/10/2026 và journal dùng single-blind review.
- Journal khuyến nghị Springer Nature LaTeX với tùy chọn `iicol`, citation số trong ngoặc vuông và `sn-basic.bst` cho LaTeX.
- Abstract phải dài 150--250 từ và có 4--6 keywords.
- Title page, declarations và Data Availability Statement đang còn placeholder nên chưa thể nộp.
- Các con số RQ1 được nêu trong audit khớp Table 1, Table 2, phần Answer to RQ1 và Conclusion hiện có trong source.
- Dấu thập phân kiểu dấu phẩy trong các bảng tiếng Anh cần đổi sang dấu chấm.
- Việc freeze lineage, cung cấp script tái tạo thống kê và báo số non-zero differences là cần thiết cho reproducibility, nhưng không thể hoàn thành nếu thiếu ledger/script nguồn.

## Các sửa đổi đã thực hiện

- Chuyển document class sang `pdflatex,sn-basic,Numbered,iicol`.
- Bổ sung `sn-basic.bst` ở thư mục gốc để build tái lập được.
- Rút abstract xuống 218 từ và giảm keywords từ 7 xuống 6.
- Giữ claim RQ1 thận trọng: nhấn mạnh end-to-end reliability, conditional benefit rõ ở Gemini nhưng yếu/không ổn định ở DeepSeek, cùng chi phí token khoảng 2.03 lần.
- Đổi toàn bộ chín bảng sang float hai cột, thêm dẫn chiếu trong văn bản cho từng bảng và thêm chú thích trực tiếp về quy tắc end-to-end/zero/N/A ở Table 1.
- Chuẩn hóa dấu thập phân trong các bảng RQ1 và RQ2.
- Sửa các lỗi diễn đạt rõ ràng như `responses During`, `RQ3 Evaluate`, câu ngân sách RQ2 và câu token DeepSeek bị lặp từ `increased`.
- Chia lại các công thức dài để phù hợp cột hẹp.
- Đổi hình thành `Fig1.png`, bỏ dấu chấm cuối caption và đặt figure ở float hai cột.
- Đổi heading thành `Statements and Declarations` và chuẩn hóa các heading con.

## Kết quả kiểm tra build

- Build thành công bằng `pdflatex -> bibtex -> pdflatex -> pdflatex`.
- PDF mới có 22 trang A4, hai cột.
- Không có LaTeX error, undefined reference, duplicate destination hoặc overfull box.
- Đã render và kiểm tra trực quan toàn bộ 22 trang; không thấy nội dung bị cắt, bảng tràn lề, công thức vỡ hoặc float chồng nhau.

## Việc còn chặn submission

- Cần tác giả cung cấp tên, affiliation, e-mail corresponding author và ORCID nếu có.
- Cần tác giả phê duyệt nội dung Funding, Competing interests, Data availability, Code availability, Author contributions và Acknowledgements.
- Cần đưa hai ledger RQ1, report cũ và script/notebook phân tích vào workspace để kiểm tra hash, tạo release manifest, đánh dấu report superseded và bổ sung non-zero differences/raw paired deltas.
- Figure 1 vẫn là raster 1536 x 1024; nên thay bằng nguồn vector hoặc artwork có độ phân giải hiệu dụng phù hợp hướng dẫn Springer.

## Nguồn chính thức

- Collection: https://link.springer.com/collections/gagdfebeia
- Journal guidelines: https://link.springer.com/journal/11334/submission-guidelines
