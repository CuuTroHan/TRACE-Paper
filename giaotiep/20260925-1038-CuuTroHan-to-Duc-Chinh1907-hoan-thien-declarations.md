# Nhiệm vụ của Chính: hoàn thiện Statements and Declarations

## Mục tiêu

Thu thập xác nhận thật từ toàn bộ nhóm và bàn giao các đoạn khai báo tiếng Anh
có thể chèn trực tiếp vào manuscript. Không được thay placeholder bằng câu mẫu
nếu các tác giả chưa xác nhận nội dung pháp lý/học thuật tương ứng.

**Mức ưu tiên:** P0, submission có thể bị trả lại nếu thiếu declarations phù
hợp.

## Quy tắc làm song song và phạm vi file

- Dùng clone hoặc worktree riêng, tạo branch từ `main` mới nhất, ví dụ
  `work/chinh-declarations`; chỉ commit file phản hồi mới mang tên duy nhất trong
  `giaotiep/` và bản nháp hoặc
  biểu mẫu thuộc `handoff/Duc-Chinh1907/` nếu cần lưu trong repo.
- Không sửa hoặc commit `trace-paper.tex`, `trace-references.bib`,
  `trace-paper.pdf`, `Fig1.png`, `BUILD_RECORD.md`, `CITATION_AUDIT.md`,
  `RQ3_PROVENANCE.md` hay file giao việc của người khác. Gửi nguyên văn các
  đoạn đã được tác giả duyệt kèm vị trí cần thay vào file bàn giao.
- Push branch riêng và mở PR tới `main` để Hán xem; không push thẳng `main` và
  không tự merge PR. Đồng bộ branch trước khi bàn giao nếu `main` đã tiến lên.
- Funding, conflicts, ethics, CRediT và AI-use có thể thu thập song song; phần
  Data/Code Availability chốt sau khi Dũng gửi release URL/DOI. Hán là người
  duy nhất chèn các đoạn cuối vào manuscript.

## Hiện trạng cần xử lý

Các mục sau trong `trace-paper.tex` vẫn ghi `To be completed by the authors`:

- Acknowledgements;
- Funding;
- Competing interests;
- Data availability;
- Code availability;
- Author contributions.

Ethics approval, Consent to participate và Consent for publication đang ghi
`Not applicable`; nhóm vẫn phải xác nhận rằng nghiên cứu không dùng human
participants, animals hoặc dữ liệu cá nhân cần consent.

## Chính cần cung cấp cho agent

### 1. Funding

- Xác nhận có hay không có tài trợ, grant, thiết bị, cloud/API credit, học bổng
  hoặc hỗ trợ hiện vật liên quan.
- Nếu có: tên đầy đủ tổ chức, grant number, người nhận và vai trò của funder.
- Nếu không: gửi câu xác nhận đã được cả năm tác giả đồng ý.

### 2. Competing interests

- Thu thập xác nhận của từng tác giả về financial và non-financial interests
  liên quan trong thời gian nghiên cứu/chuẩn bị bài.
- Nêu rõ quan hệ việc làm, tư vấn, sở hữu cổ phần, bằng sáng chế, vai trò hội
  đồng/editorial board, quan hệ cá nhân hoặc lợi ích khác nếu có.
- Không dùng blanket statement “no competing interests” khi chưa hỏi đủ người.

### 3. Author contributions

Lập bảng CRediT cho đủ năm tác giả, tối thiểu xét các vai trò:

- Conceptualization;
- Methodology;
- Software;
- Validation;
- Formal analysis;
- Investigation;
- Data curation;
- Visualization;
- Writing -- original draft;
- Writing -- review and editing;
- Supervision;
- Project administration;
- Funding acquisition (nếu có).

Mỗi vai trò phải gắn tên thật; tất cả tác giả phải xác nhận thứ tự tên và đoạn
contribution cuối.

### 4. Acknowledgements

- Tên người/tổ chức đã hỗ trợ nhưng không đủ điều kiện authorship.
- Hỗ trợ hạ tầng, API credit, máy chủ, dữ liệu, cố vấn hoặc proofreading.
- Nếu không có acknowledgement, xác nhận rõ để agent dùng wording phù hợp hoặc
  bỏ mục này theo hướng dẫn journal.

### 5. Khai báo sử dụng AI/LLM

Cung cấp một bảng sự thật, không viết chung chung:

- tên công cụ/model và nhà cung cấp;
- giai đoạn sử dụng: thiết kế nghiên cứu, sinh code, chạy thí nghiệm, phân tích,
  dịch, soạn thảo, tái cấu trúc, kiểm tra ngôn ngữ, tạo/chỉnh figure;
- đầu vào/đầu ra nào được con người kiểm tra;
- tác giả nào chịu trách nhiệm kiểm chứng;
- có hay không AI-generated/AI-assisted visual content.

TRACE dùng LLM như đối tượng/phương pháp nghiên cứu đã được mô tả trong Methods,
nhưng việc dùng AI để chuẩn bị manuscript, code, analysis hoặc figure vẫn phải
được khai báo riêng theo đúng phạm vi thực tế. Chính sách Springer Nature hiện
hành yêu cầu minh bạch và trách nhiệm con người; không được để agent tự đoán.

### 6. Ethics và consent

- Xác nhận nghiên cứu chỉ dùng source code/project artifacts công khai hay có
  dữ liệu con người/dữ liệu cá nhân.
- Nếu thực sự không có human/animal research, gửi xác nhận để giữ ba câu `Not
  applicable`.
- Nếu có, cung cấp committee, approval number và consent documentation.

### 7. Data và Code Availability

- Nhận URL/DOI, licence và điều kiện truy cập từ Dũng.
- Không chốt wording trước khi release tồn tại và link truy cập được.

## Agent có thể giúp Chính làm

1. Tạo form/bảng CRediT để năm tác giả điền và phát hiện vai trò còn bỏ trống.
2. Soạn wording tiếng Anh theo lựa chọn có/không có funding và competing
   interests mà nhóm đã xác nhận.
3. Soạn AI Declaration đúng công cụ, mục đích, phạm vi và human verification do
   Chính cung cấp; đối chiếu với Methods để tránh mâu thuẫn.
4. Kiểm tra Data/Code Availability URL, DOI, licence và tính nhất quán với
   replication package của Dũng.
5. Soạn block LaTeX đề xuất, đánh dấu từng placeholder cần thay và cung cấp
   checklist để Hán chèn, build PDF và kiểm tra trang declarations.
6. Tạo bản đối chiếu để các tác giả ký/ghi “approved” trước khi commit cuối.

## Agent không thể tự quyết định hoặc tự bịa

- Không thể tuyên bố “no funding” hoặc “no competing interests” thay tác giả.
- Không thể phân công CRediT dựa trên suy đoán từ lịch sử Git.
- Không thể tự xác nhận ethics/consent hay phạm vi sử dụng AI.
- Không thể công bố URL dữ liệu/mã nguồn chưa tồn tại.

## Đầu ra Chính phải bàn giao

- [ ] Một file phản hồi trong `giaotiep/` gửi `to-CuuTroHan`.
- [ ] Wording tiếng Anh cuối cùng cho từng mục declaration.
- [ ] Bảng CRediT có tên đủ năm tác giả.
- [ ] Bảng xác nhận funding/competing interests/ethics của từng tác giả.
- [ ] AI-use inventory và AI Declaration đã được cả nhóm duyệt.
- [ ] URL/DOI Data và Code Availability đã kiểm tra truy cập.
- [ ] Xác nhận bằng văn bản: tất cả tác giả đọc và phê duyệt declarations.
- [ ] Link branch/PR chỉ gồm file thuộc phạm vi Chính, kèm commit SHA.

## Tiêu chí hoàn thành

Bản bàn giao có câu thay thế cho mọi `To be completed by the authors`; mọi câu
khai báo đều có nguồn xác nhận từ tác giả, khớp submission interface và không
mâu thuẫn với Methods, replication package hoặc author contributions. Hán kiểm
tra placeholder đã biến mất sau khi tích hợp.

## Phụ thuộc và bàn giao tiếp theo

- Chờ Dũng cung cấp release URL/DOI cho Data/Code Availability.
- Gửi toàn bộ block đã duyệt cho Hán (`myseflt`) để chốt manuscript và nhập lại
  chính xác trên submission interface.

## Nguồn chính thức cần tuân theo

- ISSE Statements and Declarations:
  <https://link.springer.com/journal/11334/submission-guidelines>
- Springer Nature AI use in manuscript preparation:
  <https://www.springernature.com/gp/policies/editorial-policies/ai-manuscript-preparation>
