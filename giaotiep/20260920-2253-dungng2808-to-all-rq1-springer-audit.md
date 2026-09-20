# Phản biện RQ1 và kiểm tra sẵn sàng nộp Springer

Thời điểm kiểm tra: 20/09/2026 (Asia/Ho_Chi_Minh)
Phạm vi: `TRACE-Paper/` và hai ledger RQ1 được bài dẫn chiếu.

## Kết luận ngắn

Chủ đề của TRACE phù hợp với special issue: đây là AI-driven software engineering, đồng thời trực tiếp liên quan software testing, verification, resilience và trustworthiness. Tuy nhiên, bản hiện tại **chưa sẵn sàng nộp**. Ba việc chặn nộp là: (1) dùng sai template/không đúng cấu hình journal, (2) còn placeholder và các declaration bắt buộc chưa hoàn chỉnh, và (3) chưa khóa rõ một nguồn dữ liệu RQ1 duy nhất trong khi workspace có các báo cáo RQ1 cũ mâu thuẫn với bản paper.

Call for papers và hướng dẫn journal dùng để kiểm tra:

- Collection: https://link.springer.com/collections/gagdfebeia
- Journal guidelines: https://link.springer.com/journal/11334/submission-guidelines

Collection mở đến 30/10/2026. Journal yêu cầu manuscript gốc, chưa xuất bản/chưa đang review ở nơi khác; LaTeX phải nộp kèm toàn bộ source editable và PDF. Đây là single-blind review.

## 1. Kết quả RQ1: số mô tả hiện tại khớp ledger được chọn

Tôi tái tổng hợp hai ledger mà bản LaTeX đang dùng:

| Model / treatment | CSR | ESR | STS | BC | MS |
|---|---:|---:|---:|---:|---:|
| Gemini 3.7 Flash / DIRECT | 142/150 (94.67%) | 124/150 (82.67%) | 46.54 | 59.34 | 54.91 |
| Gemini 3.7 Flash / PLANNED | 147/150 (98.00%) | 135/150 (90.00%) | 58.38 | 71.19 | 64.32 |
| DeepSeek V4 Flash / DIRECT | 95/150 (63.33%) | 50/150 (33.33%) | 25.09 | 28.64 | 27.94 |
| DeepSeek V4 Flash / PLANNED | 142/150 (94.67%) | 130/150 (86.67%) | 58.57 | 69.98 | 63.52 |

Các số trên khớp Table 1 và phần kết luận RQ1 của `trace-paper.tex`. Suy ra hàng aggregate cũng đúng: ESR 58.00% -> 88.33%; STS 35.52 -> 58.47; BC 43.51 -> 70.58; MS 41.43 -> 63.92. Tổng token là 1,748,115 (DIRECT) và 3,545,907 (PLANNED), tức **2.0285x**, hợp lý khi viết xấp xỉ 2.03x.

Nguồn cần được chốt bằng release manifest:

- `experiments/rq1/ledger/RQ1-OFFICIAL-GEMINI-3.7-FLASH/runs.csv`, SHA-256 `849b2cc966a062769dab173ff52523bf1a1e28697bb93541fe7f80ed10f96488`.
- `experiments/rq1/ledger/RQ1-OFFICIAL-V4-DEEPSEEK-FLASH-THINKING/runs.csv`, SHA-256 `21ad6c376149cae838580d5a54e0cf442a9e19a58c1b798715ae185faf85f073`.

Hai `data-quality-report.json` đều đánh dấu `complete: true`, có 150 DIRECT + 150 PLANNED và không có invalid row. Exact McNemar cho hai binary outcome cũng khớp Table 2: Gemini CSR 5/0, p=0.0625; Gemini ESR 11/0, p=0.000977; DeepSeek CSR 50/3, p=5.52e-12; DeepSeek ESR 81/1, p=3.43e-23.

### Nhận định về câu trả lời RQ1

Kết luận khoa học trong `trace-paper.tex` là hợp lý **nếu hai ledger trên là bản frozen cuối cùng**: bằng chứng mạnh là reliability/end-to-end adequacy; không nên diễn giải thành "PLANNED luôn tạo test executable mạnh hơn". Việc nêu rõ conditional analysis mạnh hơn ở Gemini nhưng yếu/không ổn định ở DeepSeek, chỉ một lần chạy trên mỗi unit, và chưa mô hình hóa project clustering là thận trọng và đúng hướng.

Đoạn tiếng Anh đề xuất để thống nhất Abstract, Results và Conclusion:

> Across the two evaluated model configurations, Structural Planning improved end-to-end pipeline reliability and structural adequacy. Aggregated descriptively, execution success increased from 58.00% to 88.33% and focal-method branch coverage from 43.51% to 70.58%. Within each model, execution success, structural-target satisfaction, branch coverage, and mutation score favored PLANNED after Holm correction; compilation success was significant only for DeepSeek. Because failed runs receive zero in the primary end-to-end analysis, these effects combine generation reliability with test adequacy. In the exploratory analysis restricted to pairs that both executed successfully, the adequacy benefit was clear for Gemini but weak and unstable for DeepSeek. Planning therefore appears beneficial in the evaluated setting, at approximately 2.03 times the token volume, rather than universally superior for executable suites.

## 2. Phản biện RQ1 cần xử lý trước submission

### P0 — khóa lineage của kết quả

Trong `results/rq1/reports/` còn các report mâu thuẫn với paper hiện hành. Ví dụ `RQ1_Hai_Model_Bang_Chung_Manh_Nhat_VI.md` báo Gemini PLANNED ESR 87.33% và DeepSeek PLANNED ESR 46.00%, trong khi paper và ledger frozen hiện tại là 90.00% và 86.67%. Report cũ cũng kết luận conditional mutation thấp hơn, trái với cách diễn giải của manuscript hiện tại. Đây là rủi ro reproducibility rất lớn nếu reviewer hoặc coauthor mở nhầm file.

Yêu cầu: tạo một `RQ1_RELEASE_MANIFEST.md/json` liệt kê hai input CSV, SHA-256, config hash, phiên bản code phân tích, quy tắc N/A/0, lệnh tái tạo Table 1–2, và đánh dấu mọi report cũ là `SUPERSEDED — DO NOT CITE`. Không xóa lịch sử trước khi manifest tồn tại; chỉ tách/đánh dấu để giữ provenance.

Tên thư mục DeepSeek có hậu tố `THINKING`, nhưng config hiện hành đặt `deepSeekThinkingMode: disabled`. Bài nên nêu chính xác model ID, provider, temperature và thinking mode; hoặc đổi tên artefact/manifest để không tạo cảm giác đã chọn kết quả sau khi thử nhiều biến thể.

### P1 — làm rõ đơn vị đo và thống kê liên tục

- Table 1 cần nói ngay dưới bảng rằng STS/BC/MS là **end-to-end values**, failed compile/execution nhận 0, còn N/A chỉ do mẫu số structural không tồn tại và bị loại. Câu hiện có gần đúng nhưng nên dùng cùng một thuật ngữ ở Methods, bảng và caption.
- `n` trong Table 2 được mô tả là số complete pairs trước khi loại zero differences. Cần báo thêm số non-zero differences hoặc đưa raw paired deltas/CI vào supplementary material để reviewer kiểm tra Wilcoxon và rank-biserial correlation.
- Cần lưu script/notebook xuất bảng Wilcoxon + Holm. Hiện tìm thấy raw ledger và report, nhưng không thấy một artefact RQ1 hiện hành tái tạo trực tiếp Table 2. Không nên buộc reviewer tin p-value chỉ từ văn bản.
- Dùng dấu thập phân `.` trong bài tiếng Anh (94.67%, 58.38), không dùng `,` như PDF hiện tại.

## 3. Springer template và metadata: chưa đạt yêu cầu

### P0 — cấu hình LaTeX/layout

Guidelines của journal yêu cầu citation number trong ngoặc vuông, khuyến nghị `sn-basic.bst`, và khuyến nghị rõ cấu hình LaTeX `[iicol]`. `trace-paper.tex` đang dùng:

```tex
\documentclass[pdflatex,sn-mathphys-num]{sn-jnl}
```

và PDF hiện là single-column A4. Cần chuyển sang cấu hình được journal khuyến nghị (ví dụ `pdflatex,sn-basic,Numbered,iicol`), sau đó compile lại toàn bộ source và kiểm tra visual QA. Không chỉ thêm option; phải kiểm tra lại toàn bộ bảng, figure và bibliography sau khi chuyển hai cột.

### P0 — placeholder và declarations

Các placeholder làm manuscript bị trả về như incomplete:

- `First Author`, `author@example.com`, Department/Institution/City/Country ở `trace-paper.tex:27–28`.
- Acknowledgements, Funding, Conflict of interest, Data availability, Code availability, Author contribution đều `To be completed by the authors`.
- Journal yêu cầu title page có affiliation đầy đủ, corresponding e-mail, và ORCID nếu có; original research phải có Data Availability Statement. Competing Interests là declaration bắt buộc.
- Nếu LLM được dùng để tạo nội dung khoa học hay code/analysis (không chỉ copy-edit), journal yêu cầu ghi nhận hợp lý trong Methods hoặc một phần tương đương; LLM không thể là author.

### P1 — abstract, keywords, presentation

- Abstract hiện khoảng **338 từ**, vượt yêu cầu journal **150–250 từ**.
- Có **7 keywords**, vượt yêu cầu **4–6**.
- Rút abstract để chỉ giữ problem, method, dataset/design, 2–3 findings RQ1 mạnh nhất, caveat chi phí/giới hạn; không cố tóm tất cả chi tiết RQ1–RQ3.
- PDF đã render sạch về mặt ký tự/bảng ở các trang được kiểm tra, nhưng đang là 29 trang single-column và trang đầu còn placeholder. Đây mới là bản review nội bộ, không phải PDF để upload.

## 4. Thứ tự chốt đề xuất

1. Freeze hai ledger RQ1 bằng manifest, tái tạo tables/statistics, đánh dấu report cũ superseded.
2. Đồng bộ Section RQ1, abstract và conclusion trong manuscript LaTeX; dùng đoạn RQ1 đã đề xuất làm chuẩn claim.
3. Chuyển đúng Springer iicol + `sn-basic,Numbered`, thay toàn bộ metadata/declarations, rút abstract/keywords.
4. Compile từ source sạch, kiểm tra PDF hai cột, table/figure caption/citation order, rồi nộp source + PDF theo portal của journal.

## Vị trí bằng chứng đã kiểm tra

- `TRACE-Paper/trace-paper.tex`: RQ1 lines 290–362; metadata lines 26–32; declarations lines 550–577.
- `TRACE-Paper/trace-paper.pdf`: 29 pages; RQ1 Tables 1–2 ở pages 16–17.
- `experiments/rq1/ledger/RQ1-OFFICIAL-GEMINI-3.7-FLASH/` và `experiments/rq1/ledger/RQ1-OFFICIAL-V4-DEEPSEEK-FLASH-THINKING/`.
