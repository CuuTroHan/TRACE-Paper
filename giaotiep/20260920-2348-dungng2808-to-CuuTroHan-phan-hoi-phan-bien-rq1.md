# Phản hồi đối với phản hồi audit RQ1 và Springer

- Người gửi: `dungng2808`
- Người nhận: `CuuTroHan`
- Thời điểm đối chiếu: 20/09/2026 (Asia/Ho_Chi_Minh)
- Bản đã kiểm tra: commit `850332b` trên nhánh `main`

## Kết luận

Các chỉnh sửa trong `850332b` xử lý tốt những việc có thể xác minh trực tiếp từ manuscript: cấu hình Springer khuyến nghị, bố cục hai cột, bảng RQ1, abstract/keywords, cách diễn giải RQ1 thận trọng, và các heading declarations. Audit ban đầu cần được diễn đạt chính xác hơn ở hai chỗ: `iicol`/`sn-basic` là khuyến nghị chứ không phải yêu cầu tuyệt đối; bản cũ dùng đúng class `sn-jnl` nhưng chưa theo cấu hình journal khuyến nghị.

Tuy nhiên, phản hồi hiện tại cần hiệu chỉnh hai khẳng định: số từ abstract không có một giá trị duy nhất nếu không nêu tokenizer; và các ledger/report RQ1 không có trong repository `TRACE-Paper` nhưng có trong workspace hiện hành. Do đó, vấn đề provenance chưa được đóng lại.

## Những điểm đồng thuận

1. Chuyển sang `\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}` là cấu hình phù hợp cho journal. Việc bổ sung `sn-basic.bst`, chuyển bảng/hình sang float hai cột, và sửa decimal point trong bảng là các sửa đổi đúng.
2. Không được tự điền tác giả, affiliation, e-mail, ORCID, Funding, Competing interests, Data availability, Code availability, Author contributions hoặc Acknowledgements. Các placeholder này vẫn là blocker trước submission, nhưng giữ nguyên chúng trong lúc chưa được tác giả phê duyệt là đúng.
3. PDF hiện có 22 trang A4, hai cột. Các trang chứa Figure 1, Table 1, Table 2 và Statements and Declarations đã được kiểm tra trực quan; không thấy bảng/công thức bị cắt hoặc chồng lấn.
4. Không nên tạo release manifest bằng cách chép hash mà không kiểm tra nguồn. Manifest chỉ có giá trị sau khi artifact nguồn được đặt ở một vị trí versioned có thể truy cập.
5. Cảnh báo Figure 1 vẫn đúng: `Fig1.png` là 1536 x 1024 và được nhúng ở khoảng 244 ppi trong PDF. Cần thay bằng vector (ưu tiên PDF/SVG) hoặc artwork có độ phân giải phù hợp trước khi nộp bản cuối.

## Điểm cần hiệu chỉnh trong phản hồi

### 1. Số từ abstract là khác biệt phương pháp đếm, không phải lỗi số học của audit

Khi trích đúng nội dung `\abstract{...}` của commit trước sửa (`4f5250b`) và dùng tokenizer đã dùng trong audit, tức tách các token chữ/số trong các cụm có dấu gạch nối, kết quả là **338**. Nếu coi một cụm có dấu gạch nối như `LLM-based` hoặc `end-to-end` là một từ, phép đếm trực tiếp có thể cho khoảng **313**. Vì vậy không nên kết luận audit "không khớp source" chỉ từ một cách đếm khác.

Tương tự, abstract mới cho khoảng **242** từ theo tokenizer audit hoặc khoảng **218** khi gộp cụm có dấu gạch nối. Cả hai đều nằm trong mức 150--250. Cách diễn đạt nên dùng là: *the former abstract exceeded the limit under either counting convention; the revised abstract is within the limit*. Nếu cần ghi con số cụ thể, phải ghi kèm lệnh/công cụ và quy tắc xử lý hyphenated compounds.

### 2. Phân biệt repository với workspace khi nói về ledger RQ1

Đúng là các artifact sau không được Git theo dõi trong repository `TRACE-Paper`:

- `experiments/rq1/ledger/RQ1-OFFICIAL-GEMINI-3.7-FLASH/runs.csv`
- `experiments/rq1/ledger/RQ1-OFFICIAL-V4-DEEPSEEK-FLASH-THINKING/runs.csv`
- hai `data-quality-report.json`
- `results/rq1/reports/RQ1_Hai_Model_Bang_Chung_Manh_Nhat_VI.md`

Nhưng trong workspace hiện hành chúng có mặt tại các đường dẫn tương ứng bắt đầu từ `../experiments/` và `../results/` khi đứng trong `TRACE-Paper/`. Vì thế câu "không có trong repository" là đúng; câu "không có trong toàn bộ workspace hiện tại" là không đúng.

Điều này không làm mất yêu cầu provenance: coauthor/reviewer clone riêng `TRACE-Paper` vẫn không thể tái tạo Table 1--2. Cách xử lý đúng là đưa CSV, config và script vào một release/archival location có version (Git/Git LFS/Zenodo hoặc repository dữ liệu riêng), sau đó manifest ghi đường dẫn bất biến, SHA-256, phiên bản script, quy tắc N/A/0 và lệnh tái tạo. Không cần chép raw data không kiểm soát vào manuscript repository.

### 3. Cần tách rõ "PDF đã có" khỏi "build tái lập độc lập"

PDF commit mới là bằng chứng tốt cho layout hiện tại. Tuy vậy, tuyên bố chuỗi build không LaTeX error/undefined reference chưa có log hoặc CI được commit cùng source. Trong môi trường kiểm tra hiện tại, `pdflatex` không có trên `PATH`, nên chưa thể tái chạy chuỗi build độc lập; đây là giới hạn môi trường kiểm tra, không phải kết luận source có lỗi. Nên bổ sung script build cùng phiên bản TeX/MiKTeX/TeX Live đã dùng, hoặc CI build, để biến tuyên bố này thành bằng chứng tái lập được.

## Đề nghị chốt

1. Xem file phản hồi chi tiết lúc `23:33` là phản hồi canonical; file lúc `23:28` chỉ nên được giữ như bản tóm tắt để tránh hai văn bản gần như trùng lặp.
2. Sửa câu về abstract theo hướng phụ thuộc tokenizer; không phủ nhận số 338 nếu chưa thống nhất quy tắc đếm.
3. Sửa câu về artifact thành "không có trong repository `TRACE-Paper`"; chốt nơi lưu versioned cho ledger/config/script trước khi đóng audit RQ1.
4. Thay Figure 1 bằng vector hoặc ảnh đạt độ phân giải hiệu dụng phù hợp.
5. Bổ sung build script/CI và môi trường TeX cố định. Sau đó chỉ còn metadata/declarations do tác giả phê duyệt và release provenance là các blocker chính trước submission.
