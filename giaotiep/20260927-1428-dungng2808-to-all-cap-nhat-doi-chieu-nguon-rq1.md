# Cập nhật audit: đã nối được hai CSV RQ1 với run artifacts

- Ngày cập nhật: 2026-09-27 14:28, Asia/Ho_Chi_Minh.
- Người gửi/người nhận: `dungng2808` → `all`; ghi chú do Codex hỗ trợ.
- Phạm vi: ghi lại kết quả kiểm tra chỉ đọc đã thực hiện sau khi Dũng chỉ vị trí `experiments/rq1/runs`; cập nhật kết luận audit. Không sửa CSV, JSON, XML, manuscript hoặc PDF; không chạy lại LLM/Java/JaCoCo/PIT và không chạy script chỉnh metric.

## 1. Kết luận thay thế nhận định cũ

**Đã tìm thấy và nối được dữ liệu nguồn cục bộ của hai CSV RQ1 dùng trong bài.**
Không tiếp tục mô tả RQ1 là “chưa tìm được raw artifacts” hoặc yêu cầu Dũng gửi
lại những file đang có trong workspace.

Các đối chiếu dưới đây không phát hiện sai lệch ở những trường/phép đo được kiểm
tra. Chưa có bằng chứng trong các kiểm tra này rằng script nhắm Gemini 3.1 Pro
tác động dữ liệu Gemini 3.7 Flash hoặc DeepSeek V4 Flash Thinking trong manuscript.
Sự tồn tại của các script đó không đủ để kết luận dữ liệu hai campaign bị sửa.

Điểm còn mở cụ thể là nguồn ghi nhận token Gemini và việc đóng gói artifact cho
reviewer. Kiểm tra tính nhất quán giữa các file cục bộ không phải một lần tái chạy
độc lập và không tự thiết lập quyền truy cập công khai.

## 2. Nguồn đã nối

| CSV dùng trong bài | Run root tương ứng |
|---|---|
| [Gemini CSV](../../results/rq1/csv/runs-gemini-3.7-flash.csv) | [RQ1-OFFICIAL-GEMINI-3.7-FLASH](../../experiments/rq1/runs/RQ1-OFFICIAL-GEMINI-3.7-FLASH/) |
| [DeepSeek CSV](../../results/rq1/csv/runs-deepseek-v4-flash-thinking.csv) | [RQ1-OFFICIAL-V4-DEEPSEEK-FLASH-THINKING](../../experiments/rq1/runs/RQ1-OFFICIAL-V4-DEEPSEEK-FLASH-THINKING/) |

Khóa ghép là experiment ID, subject ID, approach và repetition. Mỗi CSV có 300
dòng, ứng với 300 run directories riêng biệt; tổng cộng 600 run. Đường dẫn
Windows trong CSV Gemini được ghép theo phần đuôi campaign/subject/approach/R01,
không yêu cầu tiền tố ổ đĩa Windows tồn tại trên macOS. Cả 600 phần đuôi đường dẫn
đều khớp.

## 3. Những kiểm tra đã hoàn thành

| Kiểm tra | Gemini | DeepSeek |
|---|---:|---:|
| Dòng CSV khớp `metrics.json` ở cả 34 trường đối chiếu | 300/300 | 300/300 |
| `run.json` khớp subject/approach/repetition/requested model | 300/300 | 300/300 |
| Có `tools/tool-run.json` | 300/300 | 300/300 |
| Run có ít nhất một `provider-response.raw.json` | 300/300 | 300/300 |
| Tổng file response (DIRECT một, PLANNED planner + generator) | 450 | 450 |
| JaCoCo XML đã đọc và đối chiếu branch counters | 259 | 180 |
| PIT XML đã đọc để tính lại common-mutant counts/score | 259 | 180 |
| Mutation metadata khớp phép tính từ XML có sẵn, kể cả run không có mutant | 300/300 | 300/300 |
| Hash config snapshot khớp `config_hash` trong mọi dòng CSV | Có | Có |

34 trường gồm định danh, trạng thái, metric, cost, provider/model và các hash;
`run_directory` được kiểm riêng theo phần đuôi đường dẫn. So sánh số thực sử dụng
độ chính xác mà CSV exporter lưu: tám chữ số thập phân cho metric và sáu cho
duration. Đây không phải so sánh chuỗi tuyệt đối giữa Windows và macOS.

Branch coverage được đọc từ method counters trong JaCoCo XML theo focal class,
method name và khoảng dòng; đối chiếu với tool metadata và BC trong CSV của các
run execution-success. Mutation được chọn theo focal method/khoảng dòng, giữ
KILLED/SURVIVED/NO_COVERAGE, lấy giao mutant identities giữa các run có bằng chứng
của cùng subject theo logic hiện có. Không ghi ngược kết quả vào dữ liệu.

Các run không có JaCoCo/PIT XML đều là execution-failure trong CSV:

- Gemini: 8 ASSERTION_FAIL, 18 RUNTIME_ERROR, 11 COMPILE_FAIL, 4 TEST_DISCOVERY_FAIL.
- DeepSeek: 23 ASSERTION_FAIL, 60 COMPILE_FAIL, 30 RUNTIME_ERROR, 3 GENERATION_INVALID, 4 TEST_DISCOVERY_FAIL.

Không tự gắn việc thiếu XML sau một bước thất bại thành mất dữ liệu hoặc sửa số.
Đối chiếu lần này không tái tính toàn bộ STS từ target inventory, không tái chạy
test và không xác thực độc lập lịch sử thực thi với provider. Các paired tests
RQ1 đã được kiểm từ CSV trong lần sửa manuscript trước đó.

Các quy tắc exporter/parser được đọc tại
[MetricsLedgerService.cs](../../src/Rq1Experiment/Rq1Experiment.Infrastructure/Persistence/MetricsLedgerService.cs)
và [GatedToolExecutionService.cs](../../src/Rq1Experiment/Rq1Experiment.Infrastructure/Java/GatedToolExecutionService.cs).
Không gọi phương thức rebuild vì nó ghi đè metric/ledger.

## 4. Điểm còn mở: token Gemini

- 432/450 file response Gemini có cấu trúc cấp đầu chỉ gồm `response`, không có
  `usage`/`usageMetadata`; 18 file còn lại có `usage`.
- 450/450 file response DeepSeek có `usage`; lần kiểm này mới xác nhận trường
  tồn tại, chưa cộng và đối chiếu mọi usage field với run metadata.
- Token CSV của cả hai model khớp `metrics.json`. Điều này chưa chứng minh token
  Gemini là usage do provider báo cáo thay vì một giá trị ghi từ nguồn khác.

Việc cần làm tiếp là đọc code/log tạo `run.json`, phân biệt provider-reported
usage, token được tính bằng tokenizer, giá trị ước lượng hoặc fallback. Nếu có
usage gốc ở vị trí khác, nối thêm nguồn đó. Nếu là ước lượng, cần ghi đúng là
estimated tokens; nếu chưa xác minh được, hạn chế kết luận chi phí token tương
ứng. Không suy ra coverage/mutation sai và không yêu cầu chạy lại 600 run chỉ vì
response không giữ usage metadata.

## 5. Trạng thái audit sau cập nhật

- Đóng câu hỏi vị trí và liên kết CSV với run artifacts cục bộ của RQ1.
- Đã kiểm tra thêm branch/mutation XML; không còn chỉ dừng ở CSV so với bảng.
- Không gắn nghi ngờ tác động của script Gemini 3.1 Pro vào hai campaign nếu
  không có bằng chứng bổ sung; ghi chú hành vi script ở D09 vẫn là lịch sử kiểm tra mã.
- Giữ mở nguồn token Gemini, reviewer-access package và các giới hạn nghiên cứu
  thực sự còn tồn tại. Bootstrap RQ2, gold scoring RQ3, historical budget/cost
  FullChain và declarations không được đánh dấu hoàn tất bởi cập nhật này.
- Ghi chú này thay thế các yêu cầu “gửi raw RQ1” trong audit trước. Không sửa
  lịch sử của lần kiểm tra 09:43 thành một cuộc kiểm tra đã làm từ thời điểm đó.
