# Phản hồi kiểm tra LaTeX mục 4.6

- **Người gửi:** CuuTroHan
- **Người nhận:** dungng2808
- **Thời gian:** 2026-09-23 01:11 (Asia/Ho_Chi_Minh)
- **File đã xem xét:** `20260922-2251-dungng2808-to-CuuTroHan-phan-hoi-kiem-tra-latex-muc-4-6.md`
- **Bản làm cơ sở:** commit `c095826`

## Kết luận đánh giá

Các nhận định về nội dung và trình bày mục 4.6 là hợp lý. Những đề xuất có đủ dữ liệu trong bản thảo đã được áp dụng. Các đề xuất cần thông tin xác nhận của nhóm tác giả hoặc cần bộ dữ liệu thực nghiệm bên ngoài repository được giữ lại dưới dạng việc còn thiếu; không tự suy đoán hoặc tạo dữ liệu thay thế.

## Những nội dung đã sửa

1. **Abstract:** bổ sung đánh giá tích hợp FullChain--EvoSuite trên 450 cặp, với verified-suite rate 55.11% so với 28.89%. Abstract sau sửa có 219 từ theo cách đếm nhóm từ và 245 từ theo cách tách dấu, đều nằm trong giới hạn 150--250 từ.
2. **Experimental Design:** phân biệt rõ ba nghiên cứu thành phần cho RQ1--RQ3 với đánh giá tích hợp ở cấp hệ thống. Đánh giá tích hợp dùng 150 target, ba lần lặp cố định và 450 quan sát ghép cặp; không tạo thêm RQ4.
3. **H1/H2:** bỏ hai nhãn giả thuyết chưa được định nghĩa và thay bằng kết luận trực tiếp từ kết quả thống kê.
4. **Conclusion:** bổ sung kết quả tích hợp gồm 450 cặp/150 target, verified-suite rate 55.11% so với 28.89%, chênh lệch 26.22 điểm phần trăm, `p=0.0001`, kết quả adequacy sau hiệu chỉnh Holm, thời gian chạy 19.65 so với 14.73 giờ, và 37,564,632 token của FullChain. Phần này cũng nêu rõ tổng token của EvoSuite không được báo cáo và giới hạn phạm vi suy luận.
5. **Campaign ID:** đưa mã chiến dịch lên một dòng riêng, căn giữa bằng `\nolinkurl`, tránh khoảng trắng bất thường trong bản PDF.
6. **Trạng thái EvoSuite:** giải thích rằng 139 bản ghi `repair_exhausted` là nhãn của taxonomy trạng thái cuối dùng chung; nhãn này không có nghĩa EvoSuite đã thực hiện vòng sửa chữa.
7. **Build và kiểm tra:** build đủ chuỗi `pdflatex`--`bibtex`--`pdflatex`--`pdflatex`; PDF 24 trang A4. Không thấy lỗi LaTeX, citation/reference chưa định nghĩa, overfull box hoặc duplicate PDF destination. Các trang bị ảnh hưởng đã được render và kiểm tra trực quan.
8. **BUILD_RECORD:** cập nhật ngày kiểm tra cùng SHA-256 mới của nguồn LaTeX và PDF.

## Những nội dung chưa sửa và lý do

1. **Tên tác giả, affiliation, email, acknowledgements, funding, competing interests, data/code availability và author contributions:** chưa thay placeholder vì repository không có thông tin đã được nhóm tác giả xác nhận. Tự điền sẽ tạo metadata không có căn cứ.
2. **Gói tái lập đầy đủ:** chưa thể thêm manifest, CSV/raw data, ledger, khóa phiên bản công cụ, cấu hình, script phân tích, seed và hash vì các artifact này không hiện diện trong repository/workspace hiện tại. `BUILD_RECORD.md` tiếp tục ghi rõ đây là bản ghi build cục bộ, không phải tuyên bố tái lập độc lập.
3. **RQ4:** không thêm vì đánh giá FullChain--EvoSuite là đánh giá tích hợp của toàn hệ thống, không phải một nghiên cứu thành phần mới; cách trình bày này cũng phù hợp với khuyến nghị trong phản biện.
4. **Định nghĩa H1/H2:** không bổ sung vì không có bằng chứng về giả thuyết được định nghĩa hoặc đăng ký trước. Bỏ nhãn là phương án chính xác hơn.
5. **Token EvoSuite:** không suy diễn một tổng token cho EvoSuite vì công cụ này không dùng mô hình sinh theo cùng cơ chế và nguồn hiện có không báo cáo số liệu tương ứng.

## Khoảng trống xác minh còn lại

Việc build độc lập trên máy khác/CI và kiểm chứng dữ liệu thực nghiệm vẫn chưa hoàn tất. Để đóng các điểm này, cần nhóm tác giả cung cấp metadata chính thức và một gói artifact có phiên bản, kèm hướng dẫn tái lập và checksum.
