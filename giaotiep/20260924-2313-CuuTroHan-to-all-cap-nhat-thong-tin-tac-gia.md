# Cập nhật thông tin tác giả cho bản TRACE Springer

## Những nội dung đã cập nhật

1. Thay toàn bộ placeholder `First Author`, `author@example.com` và affiliation
   mẫu bằng năm tác giả theo đúng thứ tự trong bảng nhóm:
   - Nguyễn Tuấn Dũng — `dungnthe180616@fpt.edu.vn`;
   - Vương Kiều Anh — `anhvkhe180546@fpt.edu.vn`;
   - Đoàn Hữu Minh Quang — `quangdhmhe181540@fpt.edu.vn`;
   - Ngô Đức Chính — `chinhndhe180889@fpt.edu.vn`;
   - Trần Văn Hán — `hantvhe181281@fpt.edu.vn`.
2. Giữ nguyên dấu tiếng Việt trong tên hiển thị bằng encoding T5 cục bộ cho tên
   tác giả; phần tiếng Anh còn lại vẫn dùng encoding mặc định của template.
3. Dùng affiliation chung `FPT University, Vietnam`, phù hợp với các địa chỉ
   e-mail giáo dục `@fpt.edu.vn` đã được cung cấp.
4. Bổ sung PDF metadata gồm Title, Author, Subject và Keywords. Trường Author
   trong metadata dùng dạng Latin không dấu để tương thích ổn định với
   `pdflatex`; tên hiển thị trên trang đầu vẫn có đầy đủ dấu tiếng Việt.
5. Không đưa MSSV, số điện thoại, e-mail Jira hoặc GitHub username lên bài báo vì
   đây không phải metadata tác giả cần thiết cho bản nộp Springer.

## Những nội dung chưa cập nhật và lý do

1. **Corresponding author:** bảng chưa chỉ định người chịu trách nhiệm liên hệ,
   nên chưa tự ý gắn dấu `*` cho bất kỳ tác giả nào.
2. **ORCID và địa chỉ affiliation chi tiết:** chưa có ORCID, khoa/bộ môn, thành
   phố hoặc địa chỉ bưu chính chính thức. Nhóm cần xác nhận cách ghi affiliation
   chính thức của FPT University trước khi nộp.
3. **Statements and Declarations:** giữ nguyên theo yêu cầu hiện tại; các mục
   Funding, Competing interests, Data availability, Code availability và Author
   contributions vẫn cần toàn bộ nhóm tác giả phê duyệt.
4. **Figure 1:** giữ nguyên theo yêu cầu; chưa thay nguồn ảnh hoặc chỉnh lại hình.

## Kiểm tra sau cập nhật

- Build bằng `scripts/build-paper.ps1` hoàn tất qua chuỗi `pdflatex`, `bibtex`,
  `pdflatex`, `pdflatex`.
- PDF có 27 trang A4; đã render và kiểm tra trực quan toàn bộ 27 trang. Trang đầu
  hiển thị đủ năm tên có dấu, affiliation và năm e-mail mà không cắt hoặc chồng
  nội dung.
- Không có lỗi LaTeX, citation/reference chưa định nghĩa, overfull box, label
  trùng hoặc PDF destination trùng trong log.
- Toàn bộ font nhúng là Type 1; không có Type 3.
- SHA-256 của `trace-paper.pdf`:
  `C5A12CBD06D18C121EA902A6181A398E6DB92EF1CF23050537EFB68EAC4E9FC7`.
- SHA-256 của `trace-paper.tex`:
  `BEC02650117473E6783D939D5E5DDCD41EB6D75BB10C919DD1A94CEE7DB6CF7D`.

## Việc nhóm cần xác nhận tiếp

Trước khi nộp, nhóm cần chốt một corresponding author, ORCID (nếu có), cách ghi
đầy đủ khoa/cơ sở/thành phố/địa chỉ của FPT University, và toàn bộ nội dung
Statements and Declarations.
