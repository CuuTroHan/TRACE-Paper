# Audit định dạng Springer/ISSE và nội dung nghiên cứu của TRACE

- **Người gửi:** `dungng2808`
- **Người nhận:** `all`
- **Thời gian:** 2026-09-25 09:48 (Asia/Ho_Chi_Minh)
- **Cập nhật báo cáo:** 2026-09-25 12:42 (Asia/Ho_Chi_Minh)
- **Commit nền được kiểm tra:** `c45eea2`; có chỉnh sửa cục bộ chưa commit
- **Tệp chính:** `paper/trace-paper.tex`, `paper/trace-paper.pdf`, `paper/trace-references.bib`; template ở `template/`
- **Collection:** *Resilient, Trustworthy, and AI-Driven Software Systems for Next-Generation Applications*
- **Participating journal:** *Innovations in Systems and Software Engineering: A NASA Journal* (ISSE)

Trong các mục bên dưới, tên ngắn như `trace-paper.tex`, `Fig1.png` và `BUILD_RECORD.md` đều chỉ file trong `paper/`; `sn-jnl.cls` và các file mẫu nằm trong `template/`.

## 1. Kết luận điều hành

Bản thảo **đúng template cốt lõi của Springer Nature/ISSE**, có dàn trang ổn định và có chủ đề phù hợp mạnh với special issue. `Hanoi`, abstract rút gọn và tên tác giả không dấu đã có trong source và PDF mới. Theo yêu cầu của Dũng, Figure 1 và caption đã được trả về đúng bản gốc `Fig1.png`/`Overview of the TRACE framework`; vì vậy lỗi 244 dpi **vẫn còn**, không được ghi là đã sửa. Bản hiện tại **chưa submission-ready**.

Kết luận theo từng nhóm:

| Hạng mục | Trạng thái | Kết luận ngắn |
|---|---|---|
| Phù hợp chủ đề special issue | Đạt | Thuộc AI-driven software engineering, software testing, verification, reliability và trustworthy AI-assisted systems |
| Springer Nature LaTeX template | Đạt | Dùng đúng `sn-jnl`, `pdflatex`, `sn-basic`, `Numbered`, `iicol` |
| Template December 2024 | Đạt | `sn-jnl.cls` trong repo giống từng byte với class trong gói chính thức December 2024 |
| Dàn trang PDF | Đã build lại | 27 trang A4 bằng `pdflatex`; không có lỗi, missing characters, citation chưa giải quyết hoặc overfull boxes trong log |
| Abstract và keywords | Đã có trong PDF mới | Abstract mới khoảng 201 từ theo khoảng trắng, tối đa khoảng 216 nếu tách từ ghép; có đúng 6 keywords; còn cần kiểm tra bộ đếm trên submission portal |
| Heading, bảng, hình, citation | Phần lớn đạt | Không quá ba cấp heading; toàn bộ bảng/hình được dẫn chiếu; citation dạng số |
| Title page | Đạt một phần | Source đã ghi `FPT University, Hanoi, Vietnam`; còn thiếu corresponding author rõ ràng và nhóm cần xác nhận cách ghi affiliation chính thức |
| Statements and Declarations | Chưa hoàn tất | Còn sáu placeholder; mức bắt buộc khác nhau theo từng mục, cần tác giả xác nhận và xử lý |
| Figure 1 | Giữ nguyên bản gốc theo yêu cầu; chưa đạt production artwork | `Fig1.png` ở 244 dpi khi in, thấp hơn mức 600 dpi cho combination artwork; caption quá chung |
| Reference eligibility | Đã xử lý 11 mục bị gắn cờ và build lại | 4 mục đã có DOI ACM, 2 mục có bằng chứng accepted từ chương trình ISSTA 2026, 5 preprint không xác minh được đã bỏ khỏi bibliography và sửa câu phụ thuộc; cần cập nhật DOI ISSTA sau khi có |
| Khả năng tái lập | Chưa kiểm chứng độc lập | Nhóm dự kiến công bố kết quả/artifact sau; hiện chưa có public replication package cho toàn bộ RQ1, RQ2 và TRACE |
| Chất lượng nội dung nghiên cứu | Có nền tảng, cần major revision | Claims đã thận trọng hơn nhưng bằng chứng của RQ2, RQ3 và TRACE còn giới hạn đáng kể |

### Bảng theo dõi từng lỗi/việc còn mở

Mỗi dòng là **một vấn đề riêng**, không gom nhiều placeholder thành một lỗi; các ID có hậu tố a/b/c tách những nguyên nhân khác nhau của cùng nhóm. `P0` là việc cần chốt trước submission; `P1` là giới hạn bằng chứng/tái lập cần xử lý hoặc công khai rõ; `P2` là cải thiện biên tập. Các giới hạn thí nghiệm không đồng nghĩa lỗi LaTeX. Cột trạng thái mô tả bản hiện tại, không phải cam kết nhóm đã có dữ liệu để sửa.

| ID | Mức | Vấn đề cụ thể / bằng chứng | Cách xử lý và điều kiện đóng | Trạng thái / người chốt |
|---|---|---|---|---|
| F01 | P0 - artwork | `Fig1.png` 1536 x 1024 px, nhúng 244 x 244 dpi ở trang 6; dưới ngưỡng 600 dpi cho combination artwork. | Xuất từ nguồn thiết kế gốc thành EPS/PDF vector có font nhúng, hoặc bitmap gốc đủ >=600 dpi tại kích thước in; không upscale ảnh hiện tại. Làm theo `paper/FIGURE1_ARTWORK.md`, rồi kiểm tra bằng `pdfimages -list`. | **Chưa sửa theo yêu cầu giữ hình cũ**; người tạo Figure 1. |
| F02 | P2 - caption | Caption gốc chỉ ghi `Overview of the TRACE framework`, chưa tự mô tả các khối và nhánh trong hình. | Nhóm duyệt caption mô tả đúng nội dung hình; sửa `trace-paper.tex`, build và kiểm tra hình/caption cùng trang. | **Chưa sửa theo yêu cầu giữ như cũ**; người phụ trách phương pháp. |
| F03 | P0 - title page | Năm tác giả có e-mail nhưng không có `\author*`/dấu chỉ corresponding author; PDF ghi `Contributing authors`. | Chốt một người liên hệ, dùng macro tương ứng của `sn-jnl`, xác nhận e-mail nhận thư. | Chưa chốt; cả nhóm. |
| F04 | P0 - affiliation | `FPT University, Hanoi, Vietnam` đã hiện trong PDF, nhưng chưa có xác nhận đây là affiliation chính thức của cả năm tác giả. | Xác nhận cơ sở/khoa và địa chỉ theo hồ sơ từng người; sửa title page nếu khác. | Chờ tác giả xác nhận. |
| F05 | P0 - declaration | `Acknowledgements` còn `To be completed by the authors.` | Liệt kê hỗ trợ không đủ tư cách tác giả hoặc xác nhận không có; ghi câu cuối được nhóm duyệt. | Chưa hoàn tất; cả nhóm. |
| F06 | P0 - declaration | `Funding` còn placeholder. | Liệt kê funder/grant ID; nếu không có, chỉ ghi `no external funding` sau khi tất cả xác nhận. | Chưa hoàn tất; cả nhóm. |
| F07 | P0 - declaration | `Competing interests` còn placeholder. | Từng tác giả khai lợi ích liên quan, sau đó viết một statement chung chính xác. | Chưa hoàn tất; từng tác giả. |
| F08 | P0 - declaration | `Ethics approval` ghi `Not applicable` nhưng chưa thấy xác nhận từ nhóm. | Xác nhận không có human participants/dữ liệu cần duyệt đạo đức; nếu có, bổ sung hội đồng và mã chấp thuận. | Chờ xác nhận; cả nhóm. |
| F09 | P0 - declaration | `Consent to participate` ghi `Not applicable` nhưng chưa thấy xác nhận. | Đối chiếu đối tượng/dữ liệu nghiên cứu, giữ `Not applicable` chỉ khi đúng. | Chờ xác nhận; cả nhóm. |
| F10 | P0 - declaration | `Consent for publication` ghi `Not applicable` nhưng chưa thấy xác nhận. | Kiểm tra có thông tin cá nhân/nội dung bên thứ ba cần consent không; sửa theo thực tế. | Chờ xác nhận; cả nhóm. |
| F11 | P0 - declaration | `Data availability` còn placeholder; reviewer chưa có link package dùng cho Tables 1--12. | Nêu chính xác nơi, thời điểm, điều kiện truy cập; không nói dữ liệu đã public nếu URL/DOI chưa hoạt động. | Chưa hoàn tất; người phụ trách dữ liệu. |
| F12 | P0 - declaration | `Code availability` còn placeholder. | Nêu repo, tag/commit, license, scripts và điều kiện truy cập thực tế. | Chưa hoàn tất; người phụ trách mã. |
| F13 | P0 - declaration | `Author contributions` còn placeholder. | Mỗi tác giả xác nhận vai trò cụ thể; lời khai khớp submission portal. | Chưa hoàn tất; cả nhóm. |
| F14 | P0 - submission | Chưa thử đóng gói/build bằng TeX Live 2021 tương ứng môi trường submission; build hiện tại dùng TeX Live 2026. | Tạo ZIP chỉ gồm nguồn/phụ thuộc cần thiết, build sạch bằng TeX Live 2021 hoặc môi trường portal, so PDF/log. | Chưa kiểm tra; người nộp bài. |
| F15 | P0 - submission | Chưa xác nhận word count của abstract do submission portal tính; local count khoảng 201--216. | Dán abstract lên portal và giữ trong 150--250 từ; đối chiếu số liệu với PDF. | Chờ bước submission; người nộp bài. |
| F16 | P1 - reference | `bib15` là accepted ISSTA 2026, chưa có DOI/pages publisher trong BibTeX. | Khi kỷ yếu ra, cập nhật DOI/pages từ publisher rồi build lại. | Theo dõi; người phụ trách references. |
| F17 | P1 - reference | `bib29` là accepted ISSTA 2026, chưa có DOI/pages publisher trong BibTeX. | Khi kỷ yếu ra, cập nhật DOI/pages từ publisher rồi build lại. | Theo dõi; người phụ trách references. |
| F18 | P1 - reference | `bib8`, `bib9`, `bib19`, `bib23`, `bib24` đã loại vì chưa xác minh published/accepted; nếu muốn phục hồi cần chứng cứ. | Chỉ phục hồi từng bài và câu phụ thuộc khi có publisher link hoặc thư nhận đăng; hiện không phải lỗi bibliography còn tồn tại. | Có điều kiện; người phụ trách Related Work. |
| F19 | P1 - tái lập | Chưa có gói raw records/paired data và manifest đầy đủ cho RQ1, RQ2, TRACE để người ngoài kiểm tra. | Phát hành package bất biến hoặc cấp reviewer access đúng thời điểm, kèm checksum và README. | Chưa công bố; người phụ trách thí nghiệm. |
| F20 | P1 - tái lập | Prompt/schema, model snapshot, decoding/retry settings chưa được đóng gói công khai đầy đủ. | Đóng băng cấu hình và prompt từng campaign, gắn phiên bản với bảng kết quả. | Chưa công bố; người phụ trách LLM. |
| F21a | P1 - tái lập | Scoring/analysis scripts chưa được phát hành đủ để tính lại các bảng. | Công bố scripts, input schema, lệnh chạy và expected outputs theo từng RQ. | Chưa công bố; người phụ trách phân tích. |
| F21b | P1 - tái lập | Tool/environment locks chưa được phát hành đủ để tái chạy campaign. | Công bố version JaCoCo/PIT/JUnit, JDK, build tools, model/API và environment manifest. | Chưa công bố; người phụ trách hạ tầng. |
| F22 | P1 - RQ1 | PLANNED dùng gần gấp đôi token, nên hiệu quả của planning bị confound với compute. | Chạy equal-compute baseline hoặc giữ kết luận ở mức `planning + additional inference compute`. | Chưa có baseline; nhóm RQ1. |
| F23a | P1 - RQ1 | Chủ yếu một run cho mỗi method/model/treatment, nên biến thiên giữa các lần gọi LLM chưa được ước lượng. | Chạy thêm seed/replicate hoặc giữ kết luận ở cohort/setting hiện tại. | Giới hạn đã khai báo; nhóm RQ1. |
| F23b | P1 - RQ1 | Chưa mô hình hóa clustering theo project khi diễn giải CI/kiểm định. | Làm cluster-aware sensitivity analysis hoặc ghi rõ giới hạn suy luận. | Giới hạn đã khai báo; nhóm RQ1. |
| F23c | P1 - RQ1 | DeepSeek STS/BC có denominator non-N/A khác nhau giữa treatment. | Báo cáo missingness từng arm và dùng paired/common-denominator analysis nếu có thể. | Giới hạn đã khai báo; nhóm RQ1. |
| F24 | P1 - RQ2 | TGSLR 60% so với FTMR 46% không còn có ý nghĩa sau Holm; FCR đạt 76%. | Không viết kết luận TGSLR vượt trội overall; nếu muốn claim mạnh hơn cần campaign/đối chứng mới. | Wording hiện thận trọng; nhóm RQ2. |
| F25 | P1 - RQ3 | Gold set 73 case chọn từ 180 theo agreement, chỉ 8 natural case và một human annotator có AI assistance. | Tạo holdout khóa trước scoring, tăng natural cases, ít nhất hai annotator độc lập và inter-rater agreement. | Chưa có; nhóm RQ3. |
| F26 | P1 - RQ3 | B2 dùng nhiều calls/tokens hơn B1 nên chưa tách được lợi ích chuyên môn hóa role khỏi ngân sách inference. | Chạy equal-budget reviewer baseline hoặc giới hạn claim ở package hiện tại. | Chưa có baseline; nhóm RQ3. |
| F27 | P1 - TRACE | B2 là TRACE-specific gate; chưa chứng minh gate trung lập giữa TRACE và EvoSuite. | Audit blind generator identity/đặc trưng naming, định nghĩa common acceptance contract và sensitivity check. | Chưa xác lập; nhóm TRACE. |
| F28 | P1 - TRACE | Chưa có raw pre-gate CSR/ESR; VSR, delivered CSR, delivered ESR giống nhau vì post-gate definition. | Báo cáo raw build/run trước gate riêng; không diễn giải ba metric hiện tại như bằng chứng độc lập. | Chưa có; nhóm TRACE. |
| F29a | P1 - TRACE--EvoSuite | 175 EvoSuite records mang taxonomy `generation_failure`; chưa có audit độc lập để phân biệt generator failure với harness/config failure. | Kiểm từng record/log, thống kê nguyên nhân và xác nhận nhãn taxonomy. | Chưa audit độc lập; nhóm so sánh TRACE--EvoSuite. |
| F29b | P1 - TRACE--EvoSuite | 139 EvoSuite records mang taxonomy `repair_exhausted`; có nguy cơ nhãn phản ánh wrapper/evaluator thay vì hành vi EvoSuite. | Kiểm từng record/log và đối chiếu timeout, budget, environment với TRACE. | Chưa audit độc lập; nhóm so sánh TRACE--EvoSuite. |
| F30 | P1 - chính sách | Chưa quyết định có cần AI-assistance disclosure cho phần viết/chỉnh bản thảo. | Đối chiếu chính sách publisher với cách AI thực sự được dùng; tác giả chịu trách nhiệm và khai báo nếu thuộc diện yêu cầu. | Chờ nhóm xác nhận. |
| F31 | P2 - reference | Các nguồn web JaCoCo, PIT, JUnit chưa có ngày truy cập trong bibliography. | Thêm access date nếu `sn-basic` và loại tài liệu cho phép, kiểm tra bản in. | Tùy chọn; người phụ trách references. |
| F32 | P2 - biên tập | Introduction, Methodology, Conclusion có một số diễn giải lặp. | Rút các đoạn lặp nhưng giữ claim/caveat; rà lại cross-reference. | Tùy chọn; người viết. |
| F33 | P2 - dàn trang | Trang 27 của PDF chỉ chứa mục reference [33], để lại gần như cả trang trắng. Đây không phải lỗi compile hay vi phạm định dạng bắt buộc, nhưng kém gọn. | Sau khi nội dung đã khóa, thử điều chỉnh ngắt trang/khoảng cách bibliography theo template; không ép bằng negative space làm hỏng dàn trang. | Chưa tối ưu; người dàn trang. |

Những mục đã xử lý, **không** tính là lỗi còn mở: năm tên tác giả đã bỏ dấu; `Hanoi` đã thêm vào source/PDF (vẫn cần xác nhận affiliation); abstract đã rút gọn; 11 reference bị gắn cờ đã xử lý bằng DOI/accepted status hoặc loại khỏi list; PDF đã build sạch. Không có thay đổi nội dung nghiên cứu khác trong lần cập nhật này.

## 2. Đối chiếu yêu cầu chính thức của collection và journal

Trang collection, kiểm tra ngày 2026-09-25:

- Collection đang mở nhận bài.
- Deadline full paper: **30 October 2026**.
- Chủ đề có AI-driven software engineering, trustworthy/explainable AI, resilient systems, software testing, verification and validation for AI-based systems.
- Bài phải là công trình gốc, chưa công bố và không đồng thời được review ở nơi khác.
- Bài được đánh giá theo relevance, significance, technical quality, scholarship và quality of presentation.

Trang collection yêu cầu tác giả tuân theo hướng dẫn của ISSE. Hướng dẫn ISSE hiện hành quy định:

- Khuyến nghị Springer Nature LaTeX template và option `[iicol]`.
- Nộp cả editable source và PDF đã compile.
- Abstract 150--250 từ, không chứa abbreviation chưa định nghĩa hoặc reference không rõ.
- Có 4--6 keywords.
- Heading dùng decimal system, tối đa ba cấp.
- Citation trong bài dùng số trong ngoặc vuông; reference list chỉ gồm tài liệu đã published hoặc accepted.
- Bảng và hình phải được đánh số, dẫn chiếu theo thứ tự và có caption mô tả đầy đủ.
- Combination artwork cần tối thiểu 600 dpi; vector artwork ưu tiên EPS và phải nhúng font.
- Original research phải có Data Availability Statement.
- Competing Interests và các declarations liên quan phải được cung cấp đầy đủ.

Nguồn chính thức:

- Collection: https://link.springer.com/collections/gagdfebeia
- ISSE submission guidelines: https://link.springer.com/journal/11334/submission-guidelines
- Springer Nature LaTeX support: https://www.springernature.com/gp/authors/campaigns/latex-author-support

## 3. Những điểm định dạng đã đạt

### 3.1. Template và class

Source hiện khai báo:

```latex
\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
```

Khai báo này phù hợp trực tiếp với khuyến nghị của ISSE. Class `sn-jnl.cls` trong repository có SHA-256:

```text
36d0c3273a59d48dc6a9c7b080dfa1ec50dc10229d8751568d1f2e490ffa5ecc
```

Hash này trùng với class lấy từ gói Springer Nature journal article template December 2024. Vì vậy, comment ở đầu source về template December 2024 là có căn cứ.

### 3.2. Abstract, keywords và heading

- Abstract trong source đã rút xuống khoảng **201 từ** theo cách đếm bằng khoảng trắng và khoảng **216 từ** nếu tách các từ ghép có dấu gạch nối; cần kiểm tra lại bằng hệ thống submission khi nộp.
- Abstract mới đã thay `RQ1`, `RQ2`, `RQ3` bằng mô tả ba nghiên cứu thành phần và một phép so sánh hệ thống tích hợp.
- Có đúng **6 keywords**.
- Source chỉ dùng `section`, `subsection` và `subsubsection`; không có cấp heading thứ tư.
- Không có label trùng và không có `\ref` chưa resolve.

### 3.3. Citation và bibliography kỹ thuật

- Có 33 bibliography entries.
- Cả 33 entries đều được cite.
- Không có citation key bị thiếu.
- Đã bỏ blanket `\nocite`.
- Dùng `sn-basic` và citation đánh số, phù hợp ISSE.

### 3.4. PDF và visual QA của bản build cục bộ mới

PDF đã được build lại từ source hiện tại. Bản trước đó đã được render toàn bộ 27 trang; ở bản mới, trang 6 chứa Figure 1 gốc đã được render và kiểm tra lại. Kiểm tra tự động cho bản build mới cho thấy:

- khổ A4;
- không có text bị cắt hoặc chồng;
- không có table/figure tràn lề;
- không có citation/reference hiển thị `??`;
- các bảng 1--12 đọc được và đúng thứ tự;
- Figure 1 và toàn bộ 12 bảng đều được dẫn chiếu trong nội dung;
- title, author, subject và keywords metadata đã được điền;
- toàn bộ font kiểm tra được là Type 1 và embedded, không còn Type 3;
- Figure 1 là raster 1536 x 1024 px, hiệu dụng 244 x 244 dpi, chưa đạt ngưỡng artwork.

Các hash hiện tại khớp bản build ngày 2026-09-25 trong `BUILD_RECORD.md`; các hash cũ trước đợt sửa còn trong Git history:

```text
trace-paper.tex        88D7EC5D84355A0EE1824CFAE2F09CF0D7DACE73F96B994C95D4152FE468AA55
trace-paper.pdf        9E89982A3F59B0ECAD11B1FC55996931270817C4727B4554B702DDBCFAF846AA
trace-references.bib   CD7F17F42D565A13AFE391F257538E7510B1B64361408B30C7C3260BC0889D2C
Fig1.png               5762E853E2871ED8D592F863AF2493F9CF3DD3592E12B8F686CBEC1701B56BE5
```

PDF hiện đã đồng bộ với source và bibliography; tuy nhiên **chưa dùng ngay làm bản nộp** vì Figure 1 và các mục P0 khác vẫn cần nhóm xử lý.

## 4. Trạng thái các mục P0 và cách xử lý trước submission

### P0.1. Chưa chỉ định corresponding author

Source đã có năm tác giả và e-mail, nhưng không tác giả nào dùng `\author*`. PDF hiện in `Contributing authors:` thay vì chỉ rõ corresponding author.

ISSE yêu cầu có một chỉ định rõ ràng và e-mail hoạt động của corresponding author. Nhóm cần chốt người liên hệ và sửa đúng macro của template.

### P0.2. Đã bổ sung Hanoi trong source; nhóm xác nhận tên affiliation chính thức

Theo thông tin nhóm cung cấp, source hiện là:

```latex
\affil[1]{\orgname{FPT University}, \orgaddress{\city{Hanoi}, \country{Vietnam}}}
```

**Đã sửa:** trường city trong `trace-paper.tex`; PDF mới đã hiển thị `Hanoi`. Theo yêu cầu của Dũng, năm tên tác giả được viết không dấu trong source và PDF. **Cần nhóm kiểm tra:** `Hanoi` có đúng với cơ sở/đơn vị chính thức của cả năm tác giả không; có cần tên khoa và địa chỉ cụ thể không; corresponding author sẽ là ai.

### P0.3. Statements and Declarations vẫn là placeholder: từng người cần cung cấp gì?

Source ở cuối `trace-paper.tex` vẫn có các dòng `To be completed by the authors`. Nhóm cần quyết định và viết **theo sự thật của nghiên cứu**, không điền mẫu khi chưa có xác nhận:

| Mục | Thông tin nhóm cần xác nhận | Cách sửa trong bài |
|---|---|---|
| Acknowledgements | Ai hỗ trợ nhưng không đủ tiêu chí đồng tác giả, tổ chức nào cần cảm ơn? | Ghi tên và đóng góp; nếu không có, dùng câu xác nhận ngắn hoặc bỏ mục nếu journal cho phép. Mục này nằm ngoài `Statements and Declarations`. |
| Funding | Có grant, học bổng hoặc nguồn hỗ trợ nào không; mã grant và tên tổ chức? | Ghi đầy đủ nguồn và mã; nếu thật sự không có, nêu rõ `This research received no external funding.` |
| Competing interests | Từng tác giả có lợi ích tài chính hoặc phi tài chính liên quan không? | Nêu lợi ích cụ thể; nếu cả nhóm xác nhận không có, dùng `The authors declare no competing interests.` |
| Ethics approval / Consent | Nghiên cứu có người tham gia hoặc dữ liệu cá nhân không? | Ba mục đang ghi `Not applicable`; nhóm xác nhận điều này đúng trước khi giữ nguyên. |
| Data availability | Dữ liệu nào hỗ trợ Tables 1--12, sẽ phát hành ở đâu, lúc nào, có điều kiện truy cập nào? | Viết statement nêu đúng tình trạng hiện tại và địa chỉ/DOI khi bản phát hành tồn tại. Không ghi `publicly available` trước khi link hoạt động. |
| Code availability | Source, phiên bản/tag, scripts, license và hướng dẫn chạy sẽ nằm ở đâu? | Gắn URL/DOI của phiên bản đúng với bài hoặc mô tả điều kiện truy cập thực tế. |
| Author contributions | Từng tác giả làm gì: thiết kế, code, chạy thí nghiệm, phân tích, viết, rà soát? | Ghi vai trò cụ thể theo từng tên, được tất cả đồng tác giả phê duyệt; nhập nhất quán trên submission portal. |

**Cách kiểm tra hoàn tất:** không còn `To be completed by the authors` trong source/PDF; lời khai trong bài khớp thông tin nhóm nhập ở submission portal; Data Availability giải thích được cách reviewer và người đọc tiếp cận dữ liệu. ISSE yêu cầu Data Availability Statement cho original research và có thể trả lại bài thiếu declarations phù hợp.

### P0.4. Figure 1 chưa đạt chuẩn production artwork; bản gốc được giữ nguyên

`Fig1.png` có kích thước 1536 x 1024 pixel và được đặt `width=\textwidth`. Với text width khoảng 160 mm, độ phân giải hiệu dụng chỉ khoảng **244 dpi**.

Hình này là combination artwork có line, icon, màu và lettering; ISSE yêu cầu tối thiểu 600 dpi. **Theo yêu cầu mới nhất, chưa thay hình hoặc caption trong bản thảo; PDF đã build lại với hình gốc.** Khi nhóm muốn xử lý lỗi artwork, có thể sửa `Fig1.png` và dòng `\includegraphics`/`\caption` trong `trace-paper.tex` như sau:

1. Lấy **file thiết kế gốc** (SVG, draw.io, PowerPoint, Illustrator hoặc tương đương). Xuất vector PDF cho luồng `pdflatex`; nếu journal yêu cầu, kèm EPS. Kiểm tra chữ/font được nhúng và đường/mũi tên vẫn rõ khi xem ở kích thước in.
2. Nếu chỉ có bitmap từ nguồn gốc, xuất trực tiếp ở ít nhất **3.780 x 2.520 pixel** cho chiều rộng in 160 mm và tỷ lệ 3:2 hiện tại. Không chỉ upscale `Fig1.png` 1536 x 1024 vì upscale không khôi phục độ nét.
3. Đổi `\includegraphics[width=\textwidth]{Fig1.png}` sang tên file mới, build PDF và nhìn Figure 1 ở 100% kích thước in; kiểm tra icon, mũi tên, chữ nhỏ và tương phản khi in đen trắng.

Caption hiện chỉ là `Overview of the TRACE framework`. Nên viết rõ các khối input/repository analysis, structural planning, scenario test generation, tool execution, specialized verification, repair routing và final test suite; mô tả đường quay lại sửa test và nhánh abstain nếu hình thể hiện chúng. Chỉ mô tả đúng các phần thực có trong hình.

**Cách kiểm tra hoàn tất:** file nguồn artwork có thể chỉnh sửa, PDF/vector hoặc bitmap đạt độ phân giải yêu cầu, font rõ ở kích thước in, caption tự chứa, PDF mới không bị mất hình.

### P0.5. Đã xử lý 11 reference arXiv-only bị gắn cờ; cần follow-up trước khi nộp

Theo [quy định reference list của ISSE](https://link.springer.com/journal/11334/submission-guidelines), chỉ đưa vào danh mục tài liệu đã công bố hoặc đã được nhận đăng. Sau khi tra cứu ngày 2026-09-25 và sửa `trace-references.bib`/`trace-paper.tex`:

| Nhóm | Key | Kết quả |
|---|---|---|
| Đã xuất bản | `bib11`, `bib20`, `bib26`, `bib27` | Đã thay metadata arXiv bằng bản ACM có DOI publisher: lần lượt [10.1145/3643769](https://doi.org/10.1145/3643769), [10.1145/3818617](https://doi.org/10.1145/3818617), [10.1145/3660783](https://doi.org/10.1145/3660783), [10.1145/3844945](https://doi.org/10.1145/3844945). `bib26` có tên bài/năm/thứ tự tác giả khác preprint; `bib27` có thêm tác giả Kecheng Li. |
| Đã được nhận đăng | `bib15`, `bib29` | Có trong chương trình [ISSTA 2026: Test vs Mutant](https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/31/Test-vs-Mutant-Adversarial-LLM-Agents-for-Robust-Unit-Test-Generation) và [ISSTA 2026: Context Matters](https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/151/Context-Matters-Improving-the-Practical-Reliability-of-LLM-Based-Unit-Test-Generatio). BibTeX ghi rõ accepted, chưa điền DOI/pages chưa có. |
| Chưa xác minh published/accepted | `bib8`, `bib9`, `bib19`, `bib23`, `bib24` | Đã bỏ khỏi BibTeX và sửa/bỏ các claim phụ thuộc; **không khẳng định năm bài này chắc chắn chưa được nhận đăng**, chỉ là chưa tìm được bằng chứng chính thức. Chi tiết và link preprint ở `paper/CITATION_AUDIT.md`. |

**Việc nhóm cần làm:** Nếu có thư nhận đăng hoặc publisher link cho 5 bài cuối, gửi bằng chứng để phục hồi chính xác claim; tuyệt đối không dùng DOI arXiv thay DOI publisher. Sau khi ISSTA 2026 xuất bản kỷ yếu, bổ sung DOI/pages cho `bib15` và `bib29`. Bản fresh LaTeX/BibTeX đã được build và kiểm tra tĩnh 33 citation; audit hiện tại giải quyết 11 mục bị gắn cờ, chưa phải chứng nhận mọi reference khác đều chính xác.

### P0.6. Đã rút ngắn abstract và build PDF; chờ kiểm tra portal

Abstract cũ khoảng 247 từ. Abstract mới trong `trace-paper.tex` khoảng **201 từ** nếu tách theo khoảng trắng, hoặc **216 từ** nếu tách thêm từ ghép có gạch nối. Nó đã nêu ba component studies và một integrated comparison, đồng thời bỏ cách gọi `RQ1`/`RQ2`/`RQ3` trong abstract.

**Cách kiểm tra hoàn tất:** kiểm tra số từ trong submission portal nằm trong 150--250, không có abbreviation chưa định nghĩa và số liệu/caveat còn đúng so với Results. Không cần rút thêm chỉ để đạt mốc 220--230 từ.

### P0.7. Đã fresh build trên TinyTeX 2026; vẫn cần kiểm tra môi trường submission

Đã build độc lập bằng `pdflatex` và `bibtex` của TinyTeX/TeX Live 2026 trên macOS; PDF, BBL và hash mới đã ghi trong `BUILD_RECORD.md`. Bản build trước đó dùng MiKTeX 26.5 và VnTeX; bản hiện tại không cần T5 vì tên tác giả đã chuyển sang không dấu.

Springer cho biết `submission.nature.com` dùng TeX Live 2021. Cần test submission ZIP trên TeX Live 2021 hoặc môi trường tương đương; source hiện dùng `OT1` và tên tác giả không dấu, không còn phụ thuộc T5. Cần đảm bảo zip chứa đủ `.tex`, `.bib`/`.bbl`, `.bst`, `sn-jnl.cls`, `Fig1.png` và mọi dependency thực sự được dùng.

Không đưa `sn-article.tex/pdf`, `user-manual.pdf`, bibliography mẫu, demo EPS hoặc báo cáo giao tiếp vào submission package.

## 5. Đánh giá mức phù hợp với special issue

### 5.1. Phù hợp tốt

TRACE có độ phù hợp chủ đề cao vì bài trực tiếp kết hợp:

- AI-driven software engineering;
- automated unit-test generation;
- verification and validation;
- false-acceptance control;
- traceability và repair routing;
- reliability, safety và transparency của quy trình dùng LLM.

Đây là fit rõ hơn với các topic `AI-driven software engineering approaches` và `software testing, verification, and validation for AI-based systems`.

### 5.2. Cần làm rõ thông điệp resilience/trustworthiness

Để bám sát tên collection hơn, Abstract/Introduction/Conclusion nên thể hiện rõ hơn rằng:

- trustworthiness đến từ provenance, evidence gating, abstention và kiểm soát false acceptance;
- resilience đến từ bounded repair, regression checking và explicit failure routing;
- các cơ chế này không chứng minh correctness tuyệt đối mà giảm rủi ro chấp nhận test không hợp lệ.

Không nên thêm claim mới nếu không có metric tương ứng; chỉ nên nối trực tiếp các khái niệm trên với evidence đã báo cáo.

## 6. Đánh giá nội dung khoa học

### 6.1. Những điểm mạnh hiện tại

1. Ba research question được tách rõ theo planning, repair và verification.
2. Có thêm integrated TRACE--EvoSuite comparison và đã gọi đúng là exploratory.
3. Báo cáo không chỉ có p-value mà còn có effect size, Holm correction, bootstrap interval, abstention và cost.
4. RQ1 đã công khai compute confounding và differential missingness.
5. RQ2 đã hạ kết luận xuống descriptive trade-off, không còn tuyên bố superiority sau khi Holm không còn ý nghĩa.
6. RQ3 đã giải thích gold distribution, false-pass definition, coverage/selective accuracy, invalid-output handling và provenance.
7. TRACE đã công khai gate-neutrality threat và phân biệt delivered CSR/ESR với raw pre-gate outcomes.
8. Có một section `Threats to Validity` riêng, bao phủ construct, internal, external và conclusion validity/reproducibility.
9. Conclusion hiện phản ánh cả ba component studies và integrated comparison với mức claim tương đối thận trọng.

### 6.2. RQ1: bằng chứng tốt nhất nhưng chưa cô lập planning

PLANNED dùng thêm planning call và khoảng gấp đôi token. Vì vậy, kết quả chỉ hỗ trợ package `planning + additional inference compute`, chưa chứng minh plan representation tự thân gây ra cải thiện.

Các giới hạn còn lại:

- mỗi focal-method/model/treatment chủ yếu chỉ chạy một lần;
- chưa mô hình hóa project clustering;
- DeepSeek STS/BC có denominator khác nhau giữa treatment;
- conditional adequacy trên DeepSeek yếu và không ổn định.

Wording hiện tại đã khá thận trọng và nên được giữ. Không nên quay lại câu kiểu `Structural Planning causes the improvement` nếu chưa có equal-compute baseline.

### 6.3. RQ2: không được hỗ trợ inferentially

TGSLR đạt 60% core repair success, FTMR 46% và FCR 76%. Sau Holm correction, TGSLR không tốt hơn FTMR có ý nghĩa thống kê; FCR tốt hơn TGSLR về success và có cost thấp hơn trong campaign này.

Changed LOC chỉ tính trên các tập successful repair khác nhau, còn regression difference không có ý nghĩa thống kê. Do đó, contribution này nên được định vị là cơ chế ownership/locality/traceability có tiềm năng kiểm soát edit scope, không phải repair method tốt hơn overall.

### 6.4. RQ3: chỉ nên giữ ở mức exploratory

Các nguồn bias/confounding còn tồn tại:

- 73 case được chọn từ 180 candidates theo agreement criterion;
- gold set có AI assistance và chỉ một human annotator;
- chỉ 8/73 case là natural cases;
- repaired DeepSeek artifact là sensitivity evidence;
- GLM có invalid-output rate cao;
- B2 dùng nhiều calls/tokens hơn B1 nên chưa cô lập role specialization.

RQ3 cần holdout được khóa trước scoring, nhiều annotator độc lập, inter-rater agreement và equal-budget reviewer baseline để nâng mức kết luận.

### 6.5. TRACE--EvoSuite: kết quả có ý nghĩa thống kê nhưng fairness chưa được xác lập

Các con số trong mục 4.6 tự nhất quán với campaign được mô tả:

- 150 target x 3 repetition = 450 paired observations;
- VSR 55.11% so với 28.89%;
- delta +26.22 percentage points;
- 95% CI [14.22; 38.36];
- paired permutation `p = 0.0001`;
- các outcome trong Holm family có `p_Holm <= 0.0007`.

Tuy nhiên:

1. B2 là TRACE-specific gate và chưa chứng minh construct-neutral với EvoSuite.
2. Treatment blinding không đảm bảo gate không nhận diện generator qua naming/scaffolding/style.
3. Không có raw pre-gate CSR/ESR.
4. VSR, delivered CSR và delivered ESR trùng nhau do định nghĩa post-gate; đây không phải ba bằng chứng độc lập.
5. Trong nhánh EvoSuite, 175 records `generation_failure` và 139 records mang taxonomy `repair_exhausted` cần được audit để loại trừ harness/config mismatch.
6. EvoSuite provider-token total không áp dụng theo cùng nghĩa với LLM, nhưng cost comparison cần tách rõ compute/tool time khỏi provider token.

Kết luận phù hợp nhất là: TRACE có delivered-system outcomes cao hơn trong campaign và evaluation contract đã khóa; chưa đủ để khẳng định universal superiority hoặc evaluator-neutral superiority.

### 6.6. Kết quả và artifact sẽ được nhóm công bố sau

Nhóm cho biết sẽ công bố kết quả và artifact sau. `paper/RQ3_PROVENANCE.md` hiện cung cấp hash và đường dẫn của một số artifact ngoài repo, nhưng reviewer bên ngoài chưa thể truy cập chúng. Repository chưa phát hành đầy đủ:

- raw records và paired data;
- cohort/target manifests;
- prompts và exact model configs;
- scoring/analysis scripts cho RQ1, RQ2 và TRACE;
- tool/environment locks;
- availability ledger và canonical reports.

Do đó, audit này xác nhận **tính nhất quán của manuscript**, không xác nhận độc lập tính đúng của toàn bộ Tables 1--12. Nhóm cần chốt **mốc công bố cụ thể** (trước submission, trong review, khi accepted hoặc sau publication), nơi lưu trữ, quyền truy cập reviewer và nội dung Data Availability tương ứng. Khi phát hành, nên dùng archive bất biến có DOI/persistent identifier, license, hash manifest và hướng dẫn reproduce. Trước lúc đó, không mô tả dữ liệu là đã công khai hoặc đã được tái lập độc lập.

## 7. Các chỉnh sửa P1/P2 nên thực hiện

### P1

1. Chuẩn bị replication package, xác định lịch công bố sau theo kế hoạch của nhóm và cách reviewer truy cập dữ liệu trong giai đoạn review; công bố đúng lịch đã ghi trong Data Availability.
2. Bổ sung exact prompt/schema, model snapshot, decoding settings, retry policy, commands JaCoCo/PIT và analysis scripts.
3. Audit TRACE--EvoSuite về harness, budget, raw pre-gate metrics và gate neutrality.
4. Chạy hoặc bổ sung equal-compute baseline cho RQ1 và equal-budget baseline cho RQ3 nếu còn thời gian.
5. Kiểm tra có cần disclosure về AI-assisted manuscript authoring theo chính sách Springer; AI copy-editing đơn thuần không cần khai báo, nhưng generative editorial work cần được tác giả xem xét và chịu trách nhiệm.

### P2

1. Abstract đã được rút trong source; chỉ kiểm tra lại bản PDF và bộ đếm của submission portal.
2. Sau khi nhóm cho phép sửa Figure 1, mở rộng caption để mô tả bảy block và các vòng repair/abstention; hiện giữ caption gốc theo yêu cầu.
3. Thêm ngày truy cập cho các nguồn web JaCoCo, PIT và JUnit nếu bibliography style cho phép.
4. Rút bớt nội dung lặp giữa Introduction, Methodology và Conclusion.
5. Cân nhắc bỏ `\raggedbottom` nếu không thực sự cần, để bám gần hơn vào default template.
6. Giữ title hiện tại nếu nhóm ưu tiên tính mô tả; nếu muốn tăng độ dễ đọc, có thể rút ngắn nhưng đây không phải lỗi bắt buộc.
7. Sau khi khóa nội dung, xử lý trang cuối chỉ có reference [33] nếu template cho phép; hiện đây là vấn đề thẩm mỹ, không phải lỗi biên dịch.

## 8. Thứ tự xử lý đề xuất cho cả nhóm

1. Chốt corresponding author; xác nhận cách ghi `FPT University, Hanoi, Vietnam` cho toàn bộ tác giả.
2. Từng tác giả cung cấp Funding, Competing Interests và Author Contributions; nhóm chốt Acknowledgements, Ethics/Consent, Data/Code Availability.
3. Figure 1 hiện giữ nguyên bản gốc theo yêu cầu; trước submission, người tạo hình cần cung cấp nguồn chỉnh sửa được để xuất vector hoặc bitmap đạt 600 dpi và nhóm duyệt caption mới.
4. P0.5 đã xử lý 11 mục bị gắn cờ; nếu nhóm có bằng chứng accepted/published của 5 preprint đã bỏ thì cung cấp để xét phục hồi claim, và cập nhật DOI/pages của 2 bài ISSTA khi kỷ yếu phát hành.
5. Chốt lịch công bố empirical package và cách reviewer truy cập dữ liệu trong thời gian review.
6. Build submission ZIP trên TeX Live 2021 hoặc môi trường mô phỏng `submission.nature.com`.
7. Khi chốt các sửa đổi tiếp theo, render lại toàn bộ PDF, kiểm tra citation/reference/font/hash và cập nhật `BUILD_RECORD.md`.

### Thông tin đề nghị cả nhóm phản hồi

| Câu hỏi cần chốt | Người/nhóm cung cấp | Bằng chứng hoặc đầu ra mong đợi |
|---|---|---|
| Ai là corresponding author? `Hanoi` và tên khoa/cơ sở có đúng cho cả năm người? | Cả năm tác giả | Tên người liên hệ, e-mail và affiliation chính thức để sửa title page |
| Có funding, competing interest, người cần cảm ơn, hoặc dữ liệu cá nhân/người tham gia không? | Từng tác giả xác nhận; nhóm tổng hợp | Nội dung Statements and Declarations được tất cả tác giả duyệt |
| Từng tác giả đóng góp gì? | Cả năm tác giả | Bảng vai trò để viết Author Contributions và nhập portal |
| File gốc của Figure 1 ở đâu? | Người tạo hình | SVG/draw.io/PPTX/AI hoặc nguồn chỉnh sửa được; hiện giữ ảnh PNG cũ theo yêu cầu, chưa đạt chuẩn |
| Nhóm có bằng chứng accepted/published của `bib8`, `bib9`, `bib19`, `bib23`, `bib24` không? | Người phụ trách Related Work | Publisher link/DOI hoặc thư nhận đăng; nếu không có, giữ nguyên việc loại 5 preprint khỏi References |
| Khi nào công bố dữ liệu/mã, reviewer sẽ truy cập bằng cách nào? | Người phụ trách dữ liệu/thí nghiệm | Kế hoạch release và câu Data/Code Availability trung thực, cụ thể |

## 9. Kết luận cuối

Về **format**, bản thảo đã đúng khung Springer Nature/ISSE và PDF hiện tại có chất lượng dàn trang tốt. Về **nội dung**, bài có cấu trúc research paper hợp lệ, chủ đề phù hợp special issue và reporting đã thận trọng hơn đáng kể.

Tuy nhiên, **chưa nên submit bản hiện tại**. `Hanoi`, abstract ngắn hơn, tên tác giả không dấu và phần sửa references đã có trong source lẫn PDF mới. Figure 1 đã được trả về đúng PNG/caption gốc theo yêu cầu, nên lỗi 244 dpi và caption chung vẫn còn. Các mục khác cần nhóm chốt được tách riêng trong bảng F01--F33 (một số ID có tiểu mục a/b/c): corresponding author/affiliation chính thức, từng declaration, build portability, quyền truy cập artifact và các giới hạn thực nghiệm. Giữ rõ giới hạn của RQ1--RQ3 và TRACE trong Abstract, Results, Threats và Conclusion.
