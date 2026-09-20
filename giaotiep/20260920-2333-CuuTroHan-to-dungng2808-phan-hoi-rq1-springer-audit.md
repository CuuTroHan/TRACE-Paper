# Phản hồi audit RQ1 và mức độ sẵn sàng nộp Springer

- Người gửi: `CuuTroHan`
- Người nhận: `dungng2808`
- Thời điểm phản hồi: 20/09/2026 (Asia/Ho_Chi_Minh)

## Kết luận chung

Cảm ơn Dũng đã audit. Phần lớn nhận định về yêu cầu Springer và cách diễn giải thận trọng RQ1 là hợp lý. Tôi đã áp dụng các sửa đổi có thể xác minh trực tiếp từ source, PDF và hướng dẫn chính thức của journal. Một số nhận định chưa được chấp nhận nguyên trạng vì số đếm chưa chính xác, mức độ bắt buộc bị diễn đạt hơi mạnh, hoặc bằng chứng nguồn không có trong repository/workspace hiện tại.

## Những nội dung đã sửa theo audit

### 1. Cấu hình Springer và bibliography

- Đổi document class từ:

  ```tex
  \documentclass[pdflatex,sn-mathphys-num]{sn-jnl}
  ```

  sang:

  ```tex
  \documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
  ```

- Bổ sung `sn-basic.bst` ở thư mục gốc để BibTeX build được độc lập.
- Rebuild toàn bộ bibliography bằng `sn-basic` và giữ citation dạng số trong ngoặc vuông.

### 2. Abstract và keywords

- Rút abstract từ khoảng 313 từ xuống 218 từ, nằm trong giới hạn 150--250 từ.
- Giảm keywords từ 7 xuống 6.
- Không dùng nguyên văn đoạn RQ1 được đề xuất trong audit vì abstract cần phản ánh đủ cả RQ1, RQ2 và RQ3. Bản mới vẫn giữ claim RQ1 thận trọng, nhưng đồng thời giữ các kết quả chính và caveat của hai RQ còn lại.

### 3. Trình bày RQ1 và thống kê

- Giữ kết luận RQ1 theo hướng end-to-end reliability và end-to-end adequacy, không diễn giải thành PLANNED luôn tạo executable suite tốt hơn.
- Giữ caveat rằng conditional benefit rõ hơn ở Gemini nhưng yếu/không ổn định ở DeepSeek.
- Giữ trade-off token xấp xỉ 2.03 lần.
- Chuẩn hóa toàn bộ dấu thập phân trong các bảng RQ1 sang dấu chấm.
- Thêm chú thích ngay dưới Table 1: run invalid/không compile/không execute nhận 0; N/A chỉ dùng khi không có structural target hoặc denominator hợp lệ và bị loại khỏi mean tương ứng.
- Sửa câu token DeepSeek bị lặp từ `increased`.

### 4. Layout, bảng, hình và công thức

- Chuyển manuscript sang bố cục hai cột.
- Chuyển 9 bảng sang float hai cột để tránh tràn lề.
- Bổ sung dẫn chiếu trong nội dung cho đủ Tables 1--9 theo thứ tự.
- Chia lại các công thức dài để phù hợp chiều rộng cột.
- Đổi tên hình thành `Fig1.png`, bỏ dấu chấm cuối caption và đặt hình ở float hai cột.
- Chuẩn hóa dấu thập phân trong các bảng RQ2.

### 5. Ngôn ngữ và declarations

- Sửa `responses During compilation` thành `feedback from compilation`.
- Sửa `RQ3 Evaluate` thành câu tiếng Anh đúng ngữ pháp.
- Sửa câu ngân sách RQ2 bị tách sai thành hai câu.
- Đổi heading thành `Statements and Declarations`.
- Chuẩn hóa các heading con như `Competing interests` và `Author contributions`.
- Cập nhật `README.md` theo filename và cấu hình build mới.

## Những nhận định chưa hợp lý hoặc chưa thể xác nhận

### 1. Số từ abstract là 338

Nhận định này không khớp source hiện có. Phép đếm trực tiếp phần nằm trong `\abstract{...}` cho kết quả khoảng 313 từ; các tokenizer khác nhau có thể lệch nhẹ nhưng không lên đến 338. Kết luận “vượt 250 từ” vẫn đúng, nên abstract vẫn được rút xuống 218 từ.

### 2. Gọi bản cũ là “dùng sai template”

Diễn đạt này hơi mạnh. Bản cũ đã dùng đúng class chính thức `sn-jnl`, nhưng dùng cấu hình single-column và style `sn-mathphys-num`, chưa theo cấu hình mà journal hiện khuyến nghị. Cách mô tả chính xác hơn là “đúng template Springer Nature nhưng chưa dùng layout/style được journal khuyến nghị”.

### 3. Xem `iicol` và `sn-basic` là yêu cầu tuyệt đối

Guidelines dùng từ “recommend” cho `iicol` và nói tác giả LaTeX “can use” `sn-basic.bst`. Vì vậy đây là cấu hình phù hợp nhất để chuẩn bị submission, nhưng không nên mô tả như một quy định bất biến nếu collection editor hoặc portal cung cấp chỉ dẫn khác.

### 4. Xác nhận hai ledger frozen và các SHA-256

Trong repository `TRACE-Paper` và toàn bộ workspace hiện tại không có:

- `experiments/rq1/ledger/RQ1-OFFICIAL-GEMINI-3.7-FLASH/runs.csv`
- `experiments/rq1/ledger/RQ1-OFFICIAL-V4-DEEPSEEK-FLASH-THINKING/runs.csv`
- Hai `data-quality-report.json`
- `results/rq1/reports/RQ1_Hai_Model_Bang_Chung_Manh_Nhat_VI.md`

Vì vậy tôi chỉ xác nhận được rằng các số audit nêu khớp với Table 1, Table 2, Answer to RQ1 và Conclusion trong manuscript. Tôi chưa thể xác nhận độc lập các hash, số dòng raw, cờ `complete`, exact McNemar tái tính từ ledger hoặc mâu thuẫn của report cũ.

### 5. Tạo release manifest ngay trong lần sửa này

Chưa thể tạo manifest có giá trị kiểm chứng khi thiếu chính các CSV, config, analysis script và report được viện dẫn. Sao chép hash từ audit vào manifest mà không đọc được file nguồn sẽ tạo cảm giác provenance đã được xác minh trong khi thực tế chưa có. Cần đưa các artifact vào workspace/repository hoặc cung cấp đường dẫn truy cập trước.

### 6. Bổ sung số non-zero differences và raw paired deltas

Đề xuất này hợp lý về mặt thống kê, nhưng chưa thể thực hiện từ các số tổng hợp trong paper. Cần raw paired data hoặc output hiện hành của script Wilcoxon. Tôi giữ giải thích rằng `n` là complete pairs trước khi loại zero differences, nhưng không tự suy đoán số non-zero differences.

### 7. Điền author metadata và declarations

Đây là blocker đúng, nhưng không thể tự động sửa một cách trung thực. Tên tác giả, affiliation, corresponding e-mail, ORCID, funding, competing interests, data/code availability, author contributions và acknowledgements cần được chính các tác giả xác nhận. Placeholder vẫn được giữ để tránh tạo khai báo sai.

### 8. Chất lượng nguồn Figure 1

Đã sửa filename và caption, nhưng file nguồn vẫn là PNG 1536 x 1024. Việc upscale không tạo thêm chi tiết thật. Cần nguồn vector gốc hoặc artwork có độ phân giải hiệu dụng phù hợp trước khi nộp chính thức.

## Kết quả kiểm tra sau sửa

- Build thành công theo chuỗi `pdflatex -> bibtex -> pdflatex -> pdflatex`.
- PDF mới: 22 trang A4, bố cục hai cột.
- Không có LaTeX error, undefined reference, duplicate destination hoặc overfull box.
- Đã render và kiểm tra trực quan toàn bộ 22 trang; không thấy bảng/hình/công thức bị cắt hoặc chồng lấn.

## Thông tin cần Dũng bổ sung

1. Đưa hai ledger RQ1 và `data-quality-report.json` vào repository/workspace hoặc gửi đường dẫn truy cập được.
2. Gửi analysis script/notebook đã tạo Table 1--2 và conditional analysis.
3. Xác nhận report nào là canonical, report nào phải gắn nhãn `SUPERSEDED -- DO NOT CITE`.
4. Xác nhận model ID, provider, temperature và thinking mode của DeepSeek để xử lý tên thư mục `THINKING` nhưng config `disabled`.
5. Cung cấp author metadata, declarations đã được tác giả phê duyệt và nguồn vector của Figure 1.

## Nguồn hướng dẫn dùng để đối chiếu

- Collection: https://link.springer.com/collections/gagdfebeia
- Journal guidelines: https://link.springer.com/journal/11334/submission-guidelines
