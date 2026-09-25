# Nhiệm vụ của Quang: references, Figure 1 và abstract

## Mục tiêu

Đóng ba blocker biên tập/production độc lập với declarations: eligibility của
references, chất lượng Figure 1 và giới hạn abstract.

**Mức ưu tiên:** P0 trước submission.

## Quy tắc làm song song và phạm vi file

- Dùng clone hoặc worktree riêng, tạo branch từ `main` mới nhất, ví dụ
  `work/quang-references-figure`; chỉ commit file phản hồi mới mang tên duy nhất
  trong `giaotiep/` và các bản
  bàn giao thuộc `handoff/quangdhmhe181540/` nếu cần lưu trong repo.
- Bibliography đã rà soát phải mang tên riêng như
  `handoff/quangdhmhe181540/trace-references-reviewed.bib`; figure mới cũng
  đặt trong thư mục đó, không ghi đè `Fig1.png` hoặc tên figure đang được TeX
  dùng. Abstract và caption gửi dưới dạng văn bản/đoạn LaTeX trong file bàn giao.
- Không sửa hoặc commit `trace-paper.tex`, `trace-references.bib`,
  `trace-paper.pdf`, `Fig1.png`, `BUILD_RECORD.md`, `CITATION_AUDIT.md`,
  `RQ3_PROVENANCE.md` hay file giao việc của người khác.
- Push branch riêng và mở PR tới `main` để Hán xem; không push thẳng `main` và
  không tự merge PR. Đồng bộ branch trước khi bàn giao nếu `main` đã tiến lên.
  Hán là người duy nhất thay source chính và build bản PDF cuối.

## Phần A -- Kiểm tra toàn bộ references

### Hiện trạng

ISSE yêu cầu reference list chỉ chứa công trình đã xuất bản hoặc đã được chấp
nhận. `CITATION_AUDIT.md` đang đánh dấu 11 key arXiv-only:

`bib8`, `bib9`, `bib11`, `bib15`, `bib19`, `bib20`, `bib23`, `bib24`, `bib26`,
`bib27`, `bib29`.

### Quang cần cung cấp cho agent

1. Với từng key, một trong các bằng chứng:
   - publisher page và DOI chính thức;
   - proceedings/journal metadata chính thức;
   - acceptance letter hoặc trạng thái in press mà nhóm được quyền dùng;
   - quyết định loại nguồn và claim nào được phép viết lại.
2. PDF/acceptance evidence nếu kết quả không công khai trên publisher site.
3. Xác nhận claim-to-source mapping cuối cùng, đặc biệt với các bài năm 2026.
4. Ngày truy cập mong muốn cho tài liệu web JaCoCo, PIT và JUnit.

### Agent có thể giúp

- Tra cứu Crossref, DOI, DBLP, ACM/IEEE/Springer/Elsevier và website chính thức.
- So sánh title, author, year, venue, pages và DOI giữa arXiv/publisher version.
- Tạo `trace-references-reviewed.bib` và bảng thay đổi citation có dẫn chứng
  trong phạm vi bàn giao của Quang để Hán tích hợp sau khi xác minh.
- Nếu chưa có publisher/accepted version, liệt kê chính xác các câu đang cite
  source đó và đề xuất bản viết lại/loại citation để Quang và nhóm duyệt.
- Kiểm tra citation order, cited/uncited key, DOI link và access date trên bản
  bibliography đề xuất; báo lỗi build cho Hán nếu có.

### Agent không thể tự làm thay Quang

- Không thể coi arXiv posting là bằng chứng accepted.
- Không thể tạo acceptance letter hoặc suy đoán một bài “sắp được nhận”.
- Không được xóa/đổi claim khoa học nếu nhóm chưa phê duyệt.

## Phần B -- Figure 1

### Hiện trạng

`Fig1.png` là ảnh 1536 x 1024 và chỉ khoảng 224--244 dpi ở kích thước đặt trong
paper. Đây là color/combination artwork có nhiều chữ; ISSE nêu mức tối thiểu
600 dpi cho combination art và ưu tiên EPS cho vector graphics.

### Quang cần cung cấp cho agent

1. File thiết kế gốc: draw.io, SVG, PDF vector, EPS, Visio, PowerPoint hoặc công
   cụ đã dùng tạo hình.
2. Tên và phiên bản chương trình tạo hình.
3. Font sử dụng và quyền/licence của icon/asset nếu có.
4. Xác nhận hình do nhóm tự tạo hay có material bên thứ ba; nếu có, cung cấp
   permission/source.
5. Nội dung caption mong muốn và xác nhận tất cả label trong hình đúng với
   pipeline hiện tại.
6. Xác nhận hình có dùng AI để tạo/chỉnh sửa hay không; nếu có, cung cấp model,
   mục đích, source material và mức chỉnh sửa để disclosure.

### Agent có thể giúp

- Kiểm tra file vector, embedded fonts, bounding box, line width và kích thước
  chữ ở final size.
- Export EPS/PDF vector tương thích `pdflatex`, hoặc bitmap RGB 600 dpi khi
  vector không khả dụng.
- Soạn đề xuất đổi `\includegraphics` và caption mô tả đủ bảy block; render
  figure mới ở kích thước in để Hán xem trước khi tích hợp.
- Kiểm tra grayscale legibility và bảo đảm caption nằm trong TeX, không chèn
  caption vào artwork.

### Agent không thể tự làm thay Quang

- Upscale PNG hiện tại không tạo thêm chi tiết thật và không thay thế source
  vector.
- Không thể xác nhận quyền sử dụng icon/font/third-party material nếu nhóm chưa
  cung cấp nguồn.
- Không được tạo hình khoa học mới từ prompt mà không có source material kiểm
  chứng và phê duyệt của tác giả.

## Phần C -- Abstract

### Hiện trạng

Abstract hiện được đếm 245 từ khi giữ từ ghép, nhưng có thể thành 274 từ theo
cách token hóa khác. ISSE yêu cầu 150--250 từ và không cho abbreviation chưa
định nghĩa; hiện còn `RQ1`, `RQ2`, `RQ3`, `N/A` và `SF110` chưa được giải nghĩa
đầy đủ trong abstract.

### Quang cần cung cấp cho agent

1. Xác nhận các con số bắt buộc giữ lại và con số có thể bỏ để giảm độ dài.
2. Xác nhận framing cuối: ba component studies cộng một integrated exploratory
   comparison; không gọi chung là chỉ ba studies.
3. Phê duyệt mức claim: RQ1 là package-level evidence, RQ2 không được hỗ trợ
   inferentially, RQ3 và FullChain comparison là exploratory.

### Agent có thể giúp

- Tạo bản abstract khoảng 220--230 từ, không thêm dữ kiện và không đổi số.
- Loại/giải nghĩa abbreviation, kiểm tra bằng nhiều cách đếm từ.
- So sánh từng câu với Results/Conclusion để phát hiện claim vượt bằng chứng.
- Bàn giao abstract đã duyệt cùng kết quả đếm từ và danh sách câu cần thay;
  Hán chèn vào bản chính, build và cập nhật PDF metadata nếu cần.

## Đầu ra Quang phải bàn giao

- [ ] Một file phản hồi trong `giaotiep/` gửi `to-CuuTroHan`.
- [ ] Bảng 11 arXiv key: publisher/accepted/rewrite/remove, kèm URL/DOI hoặc
  evidence.
- [ ] Bản `trace-references-reviewed.bib` trong thư mục bàn giao hoặc danh sách
  chính xác các claim cần viết lại; không ghi đè bibliography chính.
- [ ] Source vector của Figure 1, thông tin phần mềm/licence/AI-use và caption
  đã duyệt.
- [ ] Abstract 220--230 từ đã được nhóm xác nhận về số liệu và claim.
- [ ] Link branch/PR chỉ gồm file thuộc phạm vi Quang, kèm commit SHA.

## Tiêu chí hoàn thành

Không còn reference chưa chứng minh published/accepted; Figure 1 đạt vector hoặc
600 dpi thật và rõ ở final size; abstract chắc chắn không vượt 250 từ, không có
abbreviation chưa định nghĩa và không nâng quá mức bằng chứng RQ2/RQ3.

## Phụ thuộc và bàn giao tiếp theo

Gửi bibliography, Figure 1 và abstract cuối cho Hán (`myseflt`) để agent build
gói submission và thực hiện vòng audit cuối.

## Nguồn chính thức cần tuân theo

- ISSE References, Artwork, Abstract and Keywords:
  <https://link.springer.com/journal/11334/submission-guidelines>
- Springer Nature LaTeX Author Support:
  <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
