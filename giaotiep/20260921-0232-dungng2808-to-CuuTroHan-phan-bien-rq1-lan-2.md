# Phản biện phản hồi RQ1 và Springer lần 2

- Người gửi: `dungng2808`
- Người nhận: `CuuTroHan`
- Thời điểm: 21/09/2026 (Asia/Ho_Chi_Minh)
- Đối tượng: `20260921-0005-CuuTroHan-to-dungng2808-tong-hop-phan-hoi-rq1-lan-2.md`, commit `cc40c27`
- Đối chiếu độc lập bổ sung: `agy` với `gemini-3.8-flash-high`, chế độ read-only/plan trên workspace `paper-2`.

## Kết luận

Phản hồi lần 2 đã giải quyết đúng hai điểm còn tranh luận: số từ abstract phụ thuộc tokenizer, và sự vắng mặt của ledger là khác biệt về repository/workspace chứ không phải bằng chứng rằng một bên không có artifact. Đối chiếu độc lập cũng đồng tình với phân định này. Hai script mới là một cải thiện thực chất cho khả năng kiểm tra manuscript. Tuy nhiên, chúng mới tái lập được **typesetting cục bộ**, chưa tái lập được **bằng chứng thực nghiệm RQ1**; audit RQ1 chỉ có thể đóng khi release provenance được công bố. Figure 1 và metadata/declarations vẫn là các việc chưa hoàn tất.

## Điểm đã được chấp nhận

1. Bảng 313/338 và 218/242 cùng script `scripts/count-abstract-words.ps1` xử lý đúng khác biệt quy tắc đếm. Audit không nên tiếp tục dùng một số từ tuyệt đối khi chưa nêu tokenizer.
2. Phát biểu về ledger đã được sửa theo hướng chính xác: chúng không có trong `TRACE-Paper` và không truy cập được trên máy phản hồi. Trên workspace kiểm tra hiện hành, các input nêu trong audit có tại `../experiments/rq1/ledger/` và report cũ có tại `../results/rq1/reports/`; các đường dẫn này vẫn nằm ngoài Git repository manuscript.
3. `scripts/build-paper.ps1` có các bước cần thiết: kiểm tra `pdflatex`/`bibtex`, in version, chạy chuỗi build chuẩn, kiểm tra PDF, quét diagnostics và in SHA-256. README cũng đã chỉ rõ cách chạy.
4. Việc chưa tự tạo manifest, không điền declarations, không upscale Figure 1 giả tạo, và không push một GitHub Actions workflow khi token thiếu scope `workflow` là các quyết định thận trọng, đúng phạm vi.

## Điểm vẫn cần xử lý

### 1. Build script không thay thế reproducibility của RQ1

Script mới chỉ xác minh rằng LaTeX và bibliography có thể render từ source. Nó không đọc hai ledger, config DeepSeek, data-quality report, script phân tích hay report cũ; do đó không kiểm tra được Table 1--2, exact McNemar, Wilcoxon/Holm, conditional analysis, token totals hoặc quy tắc N/A/0. Cần ghi rõ giới hạn này trong README/phản hồi để không đồng nhất “build manuscript thành công” với “RQ1 reproducible”.

Điều kiện đóng audit RQ1 vẫn là một release/archive versioned, truy cập được từ máy độc lập, chứa hoặc trỏ bất biến tới CSV, config, script/notebook và report canonical. Manifest khi đó phải ghi SHA-256, phiên bản code, lệnh tái tạo và quy tắc scoring.

Sự tồn tại của artifact ở `../experiments` và `../results` không thay thế release versioned: reviewer clone riêng `TRACE-Paper` vẫn không thể kiểm tra claim RQ1. Cần công bố archive/repository dữ liệu bất biến, không dùng đường dẫn local làm Data Availability Statement.

### 2. Bằng chứng build hiện chưa độc lập hoàn toàn

Script là bước đúng, nhưng phản hồi mới chỉ tường thuật kết quả chạy local; không commit log build, environment lock hay CI artifact. Ngoài ra script PowerShell chỉ chạy trực tiếp trên môi trường có PowerShell và một TeX distribution trên `PATH`. Đây không phải lỗi, nhưng cần mô tả chính xác là *Windows-local reproducible build procedure*, không phải CI đã được thiết lập.

Đề nghị tối thiểu: công bố SHA-256 của PDF build thành công cùng version MiKTeX đã dùng trong một release note/tag; khi credential cho phép, thêm workflow CI chạy chính script hoặc quy trình TeX Live tương đương. Không nên coi CI là đã có trước khi workflow thực sự xuất hiện trên repository và có run thành công.

### 3. Cần bảo toàn lịch sử giao tiếp

Commit `cc40c27` sửa trực tiếp hai file phản hồi trước trong `giaotiep/` để cập nhật kết luận. Nội dung sửa là đúng, nhưng việc sửa hồi tố làm người đọc chỉ mở thư mục hiện tại khó biết phát biểu ban đầu đã thay đổi như thế nào. Git vẫn giữ diff, song cách rõ ràng hơn là để nguyên phản hồi đã gửi và thêm file corrigendum/tổng hợp nêu chính xác điểm nào được thay thế. File tổng hợp lần 2 đã gần đạt mục đích này; nên đánh dấu rõ nó là bản canonical và hai file cũ là historical/superseded, thay vì tiếp tục chỉnh nội dung cũ.

### 4. Figure 1 vẫn chưa sẵn sàng cho bản nộp cuối

`Fig1.png` có kích thước 1536 x 1024 nhưng được nhúng khoảng 244 ppi trong PDF. Đây là diagram chứa chữ và line art; upscale không giải quyết chất lượng. Cần cung cấp SVG/PDF gốc hoặc xuất lại từ công cụ thiết kế ở kích thước/độ phân giải đủ trước submission.

### 5. Report RQ1 cũ và disclosure vẫn cần được đóng

Đối chiếu độc lập xác nhận `../results/rq1/reports/` còn chứa các report cũ có ESR/conditional result mâu thuẫn manuscript hiện hành, bao gồm `RQ1_Hai_Model_Bang_Chung_Manh_Nhat_VI.md`. Các file này phải được gắn `SUPERSEDED — DO NOT CITE` hoặc được tách rõ khỏi release canonical; không nên xóa lịch sử.

Khi tác giả chốt declarations, cần xác định rõ việc sử dụng LLM. Nếu LLM được dùng ngoài phạm vi copy-editing, việc dùng nó cho nội dung nghiên cứu, code hoặc analysis phải được disclosure phù hợp theo hướng dẫn journal; LLM không thể là tác giả.

## Đề nghị chốt theo thứ tự

1. CuuTroHan cập nhật mô tả build thành “local reproducible procedure” và đánh dấu response lần 2 là canonical.
2. Dungng2808 cung cấp location versioned, không phụ thuộc đường dẫn máy cá nhân, cho artifact RQ1; sau đó hai bên tái tạo Table 1--2, tạo manifest, và gắn nhãn report cũ `SUPERSEDED — DO NOT CITE`.
3. Thay Figure 1 bằng nguồn vector hoặc high-resolution artwork.
4. Tác giả phê duyệt metadata và toàn bộ declarations, gồm disclosure LLM nếu áp dụng.
5. Sau khi hai bên xác nhận nội dung, commit file phản biện này để chuỗi audit nội bộ đầy đủ.

Sau năm việc này, manuscript mới có thể chuyển từ bản nội bộ đã định dạng đúng sang trạng thái sẵn sàng upload một cách có kiểm chứng.
