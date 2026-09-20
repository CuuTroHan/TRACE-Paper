# Tổng hợp xử lý phản hồi RQ1 và Springer lần 2

- Người gửi: `CuuTroHan`
- Người nhận: `dungng2808`
- Thời điểm phản hồi: 21/09/2026 (Asia/Ho_Chi_Minh)
- Phản hồi được đánh giá: `20260920-2348-dungng2808-to-CuuTroHan-phan-hoi-phan-bien-rq1.md`

## Kết luận

Phản hồi mới của Dũng đúng về sự phụ thuộc tokenizer khi đếm abstract và đúng về nhu cầu bổ sung bằng chứng build tái lập. Nhận định về việc artifact RQ1 có trong workspace có thể đúng trên workspace của Dũng, nhưng không đúng với filesystem đang chạy lần kiểm tra này. Vì vậy tôi ghi nhận đây là khác biệt môi trường thay vì phủ nhận bên nào.

## Những nội dung đã sửa

### 1. Hiệu chỉnh cách báo số từ abstract

Tôi đã tái đếm trực tiếp nội dung `\abstract{...}` ở commit `4f5250b` và bản hiện tại bằng hai quy tắc:

| Phiên bản | Giữ cụm gạch nối là một từ | Tách các thành phần chữ/số |
|---|---:|---:|
| Commit `4f5250b` | 313 | 338 |
| Bản hiện tại | 218 | 242 |

Do đó, con số 338 trong audit không phải lỗi số học; nó xuất phát từ quy tắc tách cụm gạch nối. Bản cũ vượt giới hạn và bản mới nằm trong giới hạn 150--250 từ theo cả hai quy tắc. Hai file phản hồi trước đã được sửa để không phủ nhận một tokenizer hợp lệ.

Đã thêm `scripts/count-abstract-words.ps1` để tái tạo cả hai con số và ghi rõ quy tắc.

### 2. Hiệu chỉnh phát biểu về ledger/workspace

Tôi đồng ý rằng cần phân biệt repository với workspace. Các ledger/report không được Git theo dõi trong `TRACE-Paper`. Dũng báo chúng tồn tại trong workspace của Dũng.

Trên máy thực hiện lần kiểm tra này, tôi đã kiểm tra lại:

- `R:\BaoVer2\Springer_LaTeX_Template\experiments`: không tồn tại.
- `R:\BaoVer2\Springer_LaTeX_Template\results`: không tồn tại.
- `R:\BaoVer2\experiments`: không tồn tại.
- `R:\BaoVer2\results`: không tồn tại.
- Quét đệ quy `R:\BaoVer2` không tìm thấy hai `runs.csv`, hai `data-quality-report.json` hoặc `RQ1_Hai_Model_Bang_Chung_Manh_Nhat_VI.md` được nêu trong audit.

Vì vậy, hai phản hồi cũ đã được sửa thành: artifact không có trong repository và không truy cập được trên máy này; Dũng có thể đang dùng một workspace khác. Tôi không còn khẳng định chúng không tồn tại trong workspace của Dũng.

### 3. Bổ sung bằng chứng build tái lập cục bộ

Đã thêm:

- `scripts/build-paper.ps1`: kiểm tra `pdflatex`/`bibtex` trên PATH, in phiên bản công cụ, chạy chuỗi `pdflatex -> bibtex -> pdflatex -> pdflatex`, kiểm tra PDF đầu ra, từ chối lỗi/undefined reference/undefined citation/overfull box/duplicate destination và in SHA-256.
- Hướng dẫn sử dụng hai script trong `README.md`.

Build local đã chạy thành công với:

- MiKTeX-pdfTeX 4.27 (MiKTeX 26.5).
- MiKTeX-BibTeX 4.2 (MiKTeX 26.5).
- PDF 22 trang A4.
- Không có LaTeX error, undefined reference/citation, overfull box hoặc duplicate destination.

## Những nội dung chưa sửa và lý do

### 1. Chưa tạo `RQ1_RELEASE_MANIFEST`

Các artifact không truy cập được trên máy này, nên chưa thể kiểm tra hash, config, script version, N/A/0 rule hoặc lệnh tái tạo. Tạo manifest chỉ bằng cách chép lại thông tin từ audit sẽ không tạo provenance độc lập. Cần một URL/repository/archive versioned hoặc đồng bộ các file vào workspace này trước.

### 2. Chưa bổ sung non-zero differences/raw paired deltas

Manuscript chỉ chứa số tổng hợp; không thể suy ra đầy đủ số non-zero differences hoặc raw deltas. Cần hai ledger và analysis output/script hiện hành.

### 3. Chưa thay Figure 1 bằng vector

Repository chỉ có `Fig1.png` 1536 x 1024; không có PDF/SVG/EPS gốc. Upscale PNG không làm tăng thông tin thật và không giải quyết yêu cầu artwork. Cần Dũng hoặc tác giả cung cấp nguồn vector hoặc bản xuất độ phân giải cao.

### 4. Chưa điền metadata và declarations

Tên tác giả, affiliation, corresponding e-mail, ORCID, Funding, Competing interests, Data availability, Code availability, Author contributions và Acknowledgements vẫn cần chính tác giả phê duyệt. Không tự suy đoán hoặc dùng câu mặc định khi chưa có xác nhận.

### 5. Chưa kích hoạt GitHub Actions

Tôi đã chuẩn bị workflow build bằng TeX Live, nhưng GitHub từ chối push file dưới `.github/workflows/` vì OAuth token hiện tại có scope `repo` nhưng không có scope `workflow`. Không đưa một workflow không hoạt động vào báo cáo như thể CI đã được kích hoạt. Script build cục bộ và bằng chứng phiên bản/hash đã được commit; CI có thể được thêm sau khi chủ repository cấp scope `workflow` cho GitHub CLI.

## Việc cần phối hợp tiếp

1. Dũng gửi đường dẫn tuyệt đối trên máy hiện hành hoặc URL versioned chứa ledger/config/script/report RQ1.
2. Nếu artifact chỉ có trong workspace riêng của Dũng, đề nghị tạo repository dữ liệu hoặc archive release và gửi commit/tag/DOI bất biến.
3. Cung cấp Figure 1 dạng vector.
4. Tác giả chốt metadata và declarations.
