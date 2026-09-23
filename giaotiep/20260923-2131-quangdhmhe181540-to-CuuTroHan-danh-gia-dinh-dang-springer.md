# Đánh giá định dạng Springer cho bản thảo TRACE

- **Người gửi:** quangdhmhe181540
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-23 21:31 (Asia/Ho_Chi_Minh)
- **File đã xem xét:** `trace-paper.tex`, `trace-paper.pdf`, các file class/style/bibliography và hình được tham chiếu
- **Bản làm cơ sở:** commit `2239b71`
- **Chuẩn đối chiếu:** Springer Nature LaTeX Journal Article Template, version 3.1 (December 2024), tải từ trang hỗ trợ chính thức của Springer Nature
- **Gói ZIP chính thức đã tải để đối chiếu:** 901,814 byte; SHA-256 `812E76DCAA9C28DC1BFF1FB6065D51729B67D4EA140552A05088317414A3ECAE`
- **Nguồn chính thức:**
  - <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
  - <https://support.springernature.com/en/support/solutions/articles/6000250920-latex-template-package-for-article-book-submissions>

## Kết luận ngắn

**Chưa sẵn sàng để nộp.** Khung LaTeX và bố cục PDF nhìn chung đúng họ template bài báo tạp chí Springer Nature `sn-jnl`; class, mẫu và user manual trong repository trùng nội dung với gói chính thức December 2024. Tuy nhiên, bản thảo còn các placeholder bắt buộc phải thay, PDF hiện chứa nhiều font Type 3, và chưa có tên journal đích để xác nhận các lựa chọn `iicol`, `sn-basic`, `Numbered`, giới hạn trang và yêu cầu abstract.

Không phát hiện lỗi hiển thị nghiêm trọng như bảng/hình tràn lề, nội dung bị cắt, citation `??`, reference `??`, nhãn trùng hoặc khóa BibTeX thiếu trong PDF hiện tại.

## Các điểm phải xử lý trước khi nộp

### P0 — Thông tin tác giả vẫn là placeholder

- `trace-paper.tex:27-29` còn `First Author`, `author@example.com`, `Department`, `Institution`, `City`, `Country`.
- Các placeholder này xuất hiện rõ ở trang 1 của PDF.
- Cần thay bằng đầy đủ tác giả, corresponding author, email và affiliation thực; thêm ORCID nếu journal yêu cầu.

### P0 — Back matter/declarations chưa hoàn tất

- `trace-paper.tex:670-697` và trang 22 PDF còn nhiều dòng `To be completed by the authors.` tại Acknowledgements, Funding, Competing interests, Data availability, Code availability và Author contributions.
- Không nên nộp với các câu placeholder này. Nếu một mục không áp dụng, ghi tuyên bố dứt khoát theo hướng dẫn journal, ví dụ `Not applicable`; nếu áp dụng, cung cấp nội dung thực tế.
- Với Acknowledgements không có nội dung, nên bỏ hẳn mục này thay vì để placeholder.

### P1 — PDF có nhiều font Type 3

- Kiểm tra 27 font duy nhất trong `trace-paper.pdf` cho thấy 17 font Type 3 và 10 font Type 1. PDF mẫu chính thức hầu như dùng Type 1.
- Khả năng cao nguyên nhân là `\usepackage[T1]{fontenc}` tại `trace-paper.tex:4` được build trong môi trường thiếu font outline tương ứng, khiến pdfTeX sinh font bitmap Type 3.
- Nên rebuild trong môi trường có font outline thích hợp và kiểm tra lại để không còn Type 3. Phương án ít rủi ro nhất là bám preamble chính thức và bỏ `T1` nếu tên tác giả/nội dung không cần nó; nếu giữ `T1`, cần bảo đảm TeX distribution có CM-Super/Latin Modern phù hợp và journal chấp nhận cấu hình đó.

### P1 — Phải xác nhận journal đích trước khi chốt layout

- `trace-paper.tex:2` dùng `\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}`.
- `iicol` là option hợp lệ, nhưng user manual chính thức chỉ yêu cầu dùng nó khi journal đích yêu cầu bố cục hai cột. Manual cũng đề nghị dùng `referee` (double-line spacing) ở giai đoạn peer review/editorial.
- `sn-basic` và `Numbered` đều hợp lệ, nhưng kiểu bibliography/citation phải theo journal đích.
- Vì chưa có tên/link “Instructions for Authors” của journal, chưa thể xác nhận hai cột, numbered citations, giới hạn 24 trang, line numbering hoặc referee layout là đúng yêu cầu nộp bài.

## Điểm nên chỉnh để sát template hơn

### P2 — Introduction đang có subheading

- Template mẫu chính thức ghi rằng Introduction không nên có subheading.
- Bản thảo có bốn `\subsection` trong Introduction tại `trace-paper.tex:41`, `:47`, `:53`, `:57`.
- Nên gộp thành nội dung liền mạch hoặc xác nhận journal đích cho phép các subheading này.

### P2 — Cú pháp heading ở back matter chưa bám sát mẫu

- Sau `\backmatter` tại dòng 668, Acknowledgements đang dùng `\section*{Acknowledgements}`. User manual quy định heading back matter dùng `\bmhead{...}`; mẫu chính thức dùng `\bmhead{Acknowledgements}`.
- Mẫu chính thức dùng heading `Declarations`; bản thảo dùng `Statements and Declarations` tại dòng 673. Cần đổi theo đúng tên heading mà journal yêu cầu.
- Các mục con Funding, Competing interests, Ethics, Consent, Data/Code availability và Author contributions cần đối chiếu chính xác với checklist declaration của journal.

### P3 — `\nocite` dư thừa

- `trace-paper.tex:37` dùng `\nocite{bib1,...,bib25}`.
- Cả 25 khóa đều đã được cite thực tế trong thân bài, nên `\nocite` không thay đổi output và có thể bỏ để nguồn gọn, tránh che giấu tài liệu tham khảo không được trích dẫn trong các lần sửa sau.

### P3 — Metadata PDF đang rỗng

- Trường Title, Author, Subject và Keywords trong metadata của PDF đều rỗng.
- Đây không phải lỗi template bắt buộc, nhưng nên bổ sung nếu quy trình nộp/journal yêu cầu PDF metadata hoặc accessibility tốt hơn.

## Các hạng mục đạt

- `sn-jnl.cls`, `sn-article.tex`, `sn-article.pdf`, `user-manual.pdf` và `sn-bibliography.bib` trong repository trùng byte hoặc trùng nội dung sau chuẩn hóa CRLF/LF với gói Springer chính thức.
- Hai file `.bst` đang dùng trùng nội dung với gói chính thức; khác SHA-256 thô chỉ do CRLF/LF.
- Source gồm một file manuscript chính và tham chiếu hình/bibliography bằng đường dẫn cục bộ; không có đường dẫn tuyệt đối.
- Source chỉ dùng ký tự ASCII, phù hợp khuyến cáo của Springer về việc mã hóa ký tự đặc biệt bằng lệnh TeX.
- Abstract có 219 từ khi coi từ ghép có dấu nối là một từ, hoặc 245 từ khi tách từ ghép; không có citation/equation trong abstract. Giới hạn cuối cùng vẫn phải theo journal đích.
- Có 69 label, không có label trùng và không có reference tới label không tồn tại.
- Có 25 mục BibTeX, không có khóa trùng/thiếu; cả 25 mục đều được cite trong thân bài. File `.bbl` có đủ 25 `\bibitem`.
- PDF gồm 24 trang A4 (595.28 × 841.89 pt), PDF 1.5, không mã hóa; hình pipeline xuất hiện đúng ở trang 6 và nhìn rõ.
- Kiểm tra trực quan toàn bộ 24 trang: bố cục hai cột ổn định; 11 bảng và 1 hình không tràn/cắt lề; phương trình, hyperlink và danh mục tài liệu tham khảo hiển thị được; không thấy trang trắng ngoài ý muốn.
- SHA-256 của PDF hiện tại là `674D1DC0D7A912F51054C005E439A8354AC27DB586848F850C11D101B035E625`, trùng `BUILD_RECORD.md`.
- SHA-256 của `trace-paper.tex` và `trace-references.bib` sau chuẩn hóa CRLF thành LF lần lượt là `1945BD53C2655A3FF343C0A59C34A926566BE7FC371AC8B4AE1AB19CD280C57E` và `6A0535BE46FFA270D30D27B0EE6B8B8BA4B291F89C0A5F95822F7E613980F372`, trùng `BUILD_RECORD.md`. Vì vậy chênh lệch hash thô trên Windows chỉ do line ending, không phải lệch nội dung giữa source và build record.

## Giới hạn kiểm tra

- Không thể chạy build độc lập trong phiên kiểm tra này vì `pdflatex` và `bibtex` không có trên `PATH`; `scripts/build-paper.ps1` dừng tại kiểm tra dependency.
- Repository không lưu file `.log` của lần build. Kết luận về không có LaTeX warning dựa trên `BUILD_RECORD.md`, kiểm tra tĩnh source và quan sát PDF; chưa phải một lần compile độc lập.
- Chưa kiểm tra được yêu cầu riêng của journal do chưa có tên journal hoặc URL “Instructions for Authors”. Springer Nature xác nhận template chung không thay thế hướng dẫn cấp journal.

## Checklist đề xuất trước khi nộp

1. Chốt journal đích và đối chiếu `documentclass`, reference style, abstract/page limits, line numbers và `referee`/`iicol`.
2. Điền thông tin tác giả và affiliation thật.
3. Hoàn tất toàn bộ declarations; bỏ mọi `To be completed by the authors.`.
4. Đổi heading back matter theo template/journal (`\bmhead{Acknowledgements}`, `Declarations`).
5. Quyết định gộp các subheading trong Introduction.
6. Rebuild bằng `pdflatex → bibtex → pdflatex → pdflatex`; giữ `.log` và xử lý toàn bộ error/warning quan trọng.
7. Kiểm tra font sau rebuild, mục tiêu không còn Type 3.
8. Chạy lại kiểm tra citation/reference/overflow và duyệt trực quan PDF cuối.

## Trạng thái cuối

- **Đúng template nền:** Có.
- **PDF hiện tại đọc được và bố cục ổn:** Có.
- **Đã xác nhận đúng yêu cầu journal cụ thể:** Chưa.
- **Sẵn sàng nộp ngay:** Không.
