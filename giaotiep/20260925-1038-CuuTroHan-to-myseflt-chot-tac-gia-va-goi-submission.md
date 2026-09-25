# Nhiệm vụ của Hán (myself): chốt tác giả và gói submission

## Vai trò

Hán là đầu mối tích hợp. Chỉ thực hiện gói submission cuối sau khi nhận đủ đầu
ra của Dũng, Chính và Quang. Nhiệm vụ này không thay thế việc mỗi tác giả phải
đọc và phê duyệt bản cuối.

**Mức ưu tiên:** P0 và bước cuối trước khi upload lên cổng ISSE.

## Phần A -- Chốt title page và quyền đại diện nhóm

### Hán cần cung cấp cho agent

1. Chỉ định chính xác **một corresponding author**; nếu là Hán, xác nhận rõ
   “Trần Văn Hán is the corresponding author”. Nếu là người khác, ghi tên và
   email EDU tương ứng.
2. Affiliation chính thức của cả nhóm:
   - department/school;
   - tên pháp lý tiếng Anh của institution;
   - city, postal code (nếu dùng) và country.
3. ORCID 16 chữ số của từng tác giả hoặc xác nhận người nào chưa có.
4. Cách hiển thị tên khi xuất bản: có dấu tiếng Việt hay Latin hóa; xác nhận tách
   given name/family name và thứ tự năm tác giả.
5. Xác nhận từ cả năm tác giả rằng:
   - danh sách và thứ tự tác giả là đúng;
   - mọi người đã đọc bản cuối;
   - mọi người đồng ý nộp;
   - corresponding author có quyền thay mặt nhóm trao đổi với journal.
6. Xác nhận manuscript chưa xuất bản và không được xem xét đồng thời ở journal
   khác; nêu rõ quan hệ với thesis/preprint/bản tiếng Việt nếu có.

### Agent có thể giúp

- Cập nhật `\author*`, email corresponding, affiliation, ORCID và PDF metadata.
- Chuyển dấu tiếng Việt sang TeX-compatible form nếu submission platform không
  nhận trực tiếp Unicode/T5; thử build trên môi trường sạch.
- Kiểm tra title page theo checklist ISSE và phát hiện tên/email không nhất
  quán giữa manuscript, release và submission form.

### Agent không thể tự làm thay Hán

- Không thể tự chọn corresponding author, ORCID, affiliation hoặc cách viết tên.
- Không thể thay mặt tác giả xác nhận originality, consent to submit hoặc quyền
  đại diện nếu chưa có phê duyệt thật.

## Phần B -- Quyết định phạm vi khoa học trước khi nộp

### Hán cần cung cấp cho agent

1. Quyết định nhóm có chạy thêm các thí nghiệm sau hay không:
   - RQ1 equal-compute/multiple-seed/project-clustered analysis;
   - RQ3 holdout, nhiều annotator và equal-budget reviewer;
   - FullChain--EvoSuite evaluator-neutral gate và raw pre-gate audit.
2. Nếu không chạy thêm, phê duyệt framing cuối:
   - RQ1 chỉ là package-level evidence trong cấu hình đánh giá;
   - RQ2 là locality/traceability trade-off, không chứng minh superiority;
   - RQ3 và FullChain comparison là exploratory;
   - title/contributions không ngụ ý ba contribution đều được xác nhận ngang
     nhau.
3. Xác nhận có cần rút title và phần lặp Introduction/Methodology/Conclusion hay
   giữ nguyên vì chiến lược special issue.

### Agent có thể giúp

- Audit claim-by-claim giữa Abstract, Introduction, Results và Conclusion.
- Soạn hai phương án: manuscript có follow-up experiments hoặc manuscript giữ
  dữ liệu hiện tại nhưng hạ claim.
- Chạy thống kê/sensitivity analysis khi Hán và Dũng cung cấp đúng canonical
  dataset; agent không tạo dữ liệu mới.

## Phần C -- Thu nhận đầu ra từ ba thành viên

- [ ] Từ Dũng: public release/DOI, manifest, Data Availability, Code
  Availability và audit raw metrics.
- [ ] Từ Chính: toàn bộ declarations, CRediT, AI-use disclosure và xác nhận của
  năm tác giả.
- [ ] Từ Quang: bibliography hợp lệ, Figure 1 production-ready và abstract cuối.

Không đóng manuscript nếu một trong ba đầu ra vẫn ghi “sẽ bổ sung sau”.

## Phần D -- Gói submission và portal

### Hán cần cung cấp cho agent

1. Xác nhận collection/special issue cần chọn và deadline đang áp dụng.
2. Submission account và thao tác đăng nhập do Hán tự thực hiện; không gửi mật
   khẩu vào Git hoặc file giao tiếp.
3. Danh sách reviewer gợi ý nếu portal yêu cầu: họ tên, institution, email tổ
   chức, publication/profile link và xác nhận độc lập/không xung đột.
4. Reviewer cần loại trừ (nếu có) và lý do chuyên môn phù hợp.
5. Quyết định traditional publishing hay Open Choice; nguồn chi trả APC nếu
   chọn open access.
6. Những điểm cần nhấn mạnh trong cover letter và mọi prior/preprint disclosure.

### Agent có thể giúp

1. Tạo cover letter nhắm đúng ISSE/collection từ thông tin Hán cung cấp.
2. Tạo submission ZIP tối giản, cùng một thư mục, chỉ gồm source thực sự dùng:
   `trace-paper.tex`, bibliography/bbl theo phương án đã chọn, `sn-jnl.cls`,
   `sn-basic.bst`, Figure 1 và dependency bắt buộc.
3. Loại khỏi ZIP các file mẫu/demo như `sn-article.tex/pdf`, `user-manual.pdf`,
   `empty.eps`, `fig.eps` và bibliography mẫu.
4. Thử fresh build bằng `pdflatex` trên môi trường gần với TeX Live 2021 của
   Springer Nature Article Processing Platform; kiểm tra font, Unicode, figure,
   DOI, citation và cross-reference.
5. Render toàn bộ PDF để kiểm tra title page, bảng, hình, declarations và
   references; tạo checksum và submission manifest.
6. Chuẩn bị checklist dữ liệu để Hán copy vào portal: title, running title,
   abstract, keywords, author metadata, funding, competing interests, author
   contributions, data statement, code statement và reviewer suggestions.
7. Hỗ trợ thao tác portal sau khi Hán đăng nhập, nhưng mọi nút xác nhận pháp lý
   và submit cuối phải được Hán kiểm tra trực tiếp.

## Checklist chấp nhận trước khi upload

- [ ] Corresponding author, affiliation, author order và ORCID đã chốt.
- [ ] Không còn `To be completed by the authors`.
- [ ] Abstract 150--250 từ, không có abbreviation chưa định nghĩa.
- [ ] Có 4--6 keywords.
- [ ] Mọi reference đều cited và đã published/accepted; DOI đầy đủ khi có.
- [ ] Figure 1 là vector hoặc 600 dpi thật, font/permission/AI-use rõ ràng.
- [ ] Data/Code Availability trỏ tới release truy cập được.
- [ ] Author contributions và competing interests khớp submission interface.
- [ ] AI use được khai báo đúng phạm vi thực tế và có human accountability.
- [ ] ZIP build sạch trên môi trường mới, không dùng absolute path và không
  thiếu `.bib`/`.bbl`/`.bst`/figure/style file.
- [ ] PDF không có `??`, undefined citation/reference, overfull box, Type 3 font
  hoặc chữ/bảng/hình bị cắt.
- [ ] Tất cả tác giả đã xem PDF cuối và đồng ý nộp.

## Đầu ra Hán phải bàn giao

- [ ] Một file phản hồi trong `giaotiep/` ghi các quyết định author/submission.
- [ ] Metadata chính thức của năm tác giả và corresponding author.
- [ ] Quyết định về follow-up experiments hoặc reduced-claim framing.
- [ ] Cover letter và reviewer suggestions đã duyệt.
- [ ] Submission ZIP, compiled PDF, checksum manifest và fresh-build log.
- [ ] Xác nhận cuối của cả năm tác giả.

## Nguồn chính thức cần tuân theo

- ISSE Submission Guidelines:
  <https://link.springer.com/journal/11334/submission-guidelines>
- Springer Nature LaTeX Author Support:
  <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
- Springer Nature AI use in manuscript preparation:
  <https://www.springernature.com/gp/policies/editorial-policies/ai-manuscript-preparation>
