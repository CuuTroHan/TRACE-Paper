# Đối chiếu audit ngày 25/09 với TRACE và bằng chứng hiện có

> Cập nhật riêng về nguồn RQ1 lúc 14:28: [đã nối 600/600 dòng CSV với run artifacts và kiểm tra XML](20260927-1428-dungng2808-to-all-cap-nhat-doi-chieu-nguon-rq1.md). D05, D09, §4.1 và yêu cầu B2 bên dưới là ghi nhận lịch sử trước kiểm tra bổ sung; không dùng chúng để tiếp tục nói chưa tìm được nguồn RQ1. Còn cần xác minh nguồn token Gemini, không có bằng chứng mới về tác động của script Gemini 3.1 Pro.

> Cập nhật sau kiểm tra: đây là snapshot trước khi sửa manuscript. Xem [bản cập nhật paper và thông tin còn thiếu lúc 10:16](20260927-1016-dungng2808-to-all-cap-nhat-paper-va-thong-tin-can-bo-sung.md) cho trạng thái sau chỉnh sửa; số dòng/hash dưới đây thuộc bản cũ.

- Người gửi/người nhận: `dungng2808` → `all`; ghi chú do Codex hỗ trợ kiểm tra theo yêu cầu của Dũng, chưa phải xác nhận của toàn bộ tác giả.
- Thời điểm bắt đầu ghi nhận: 2026-09-27 09:43, Asia/Ho_Chi_Minh.
- Repository bản thảo: `TRACE-Paper`, HEAD `e03978c`; working tree sạch trước lần kiểm tra này.
- Báo cáo được kiểm tra: [audit ngày 25/09](20260925-0948-dungng2808-to-all-audit-springer-isse-va-noi-dung-trace.md).
- Nguồn nội dung chính: [trace-paper.tex](../paper/trace-paper.tex), [PDF](../paper/trace-paper.pdf), [bibliography](../paper/trace-references.bib), [build record](../paper/BUILD_RECORD.md), [RQ3 provenance](../paper/RQ3_PROVENANCE.md).
- Phạm vi: kiểm tra nội dung và một số bằng chứng thí nghiệm có sẵn; bổ sung ghi chú, không sửa manuscript, dữ liệu, cấu hình hay kết quả thí nghiệm.
- Số dòng `.tex` dưới đây áp dụng cho hash hiện tại; đường dẫn `../../results/...` và `../../experiments/...` đi ra workspace `paper-2`, ngoài Git repository bản thảo.

## 1. Kết luận có thể sử dụng

**Audit đúng về phần lớn hiện trạng của bản TRACE đang có.** Bốn hash source/PDF/BibTeX/Figure 1 khớp hoàn toàn, nên đây không phải báo cáo đánh giá nhầm phiên bản. Những vấn đề tương ứng với thiếu corresponding author, sáu placeholder, Figure 1 có độ phân giải thấp, compute confounding, hạn chế gold set RQ3 và gate neutrality vẫn có căn cứ.

**Audit chưa đủ để chứng nhận toàn bộ kết quả thí nghiệm, và có chỗ cần sửa cách diễn đạt.** Kiểm tra lần này mở rộng ra workspace và tìm được dữ liệu dùng để tính lại nhiều số liệu. Đặc biệt, CSV RQ2 hiện có các trường mà manuscript nói thiếu; tài liệu RQ2 nguồn còn nêu protocol/power provisional; và cấu hình hiện tại chưa được gắn chắc chắn với campaign TRACE–EvoSuite trong bài.

Ba mức bằng chứng được phân biệt trong ghi chú này:

- **Khớp bản thảo:** audit mô tả đúng câu/số liệu đang xuất hiện trong TRACE.
- **Đã kiểm tra bằng artifact:** có thể đọc file và tính lại số đếm/trung bình/hash được nêu; không đồng nghĩa đã tái chạy LLM, Java, JaCoCo hoặc PIT.
- **Chưa xác lập:** thiếu provenance, log lịch sử, thông tin tác giả hoặc chưa thực hiện kiểm định tương ứng; không tự suy ra là sai.

## 2. Phiên bản, định dạng và kiểm tra cơ học

| Kiểm tra | Kết quả lần này | Ý nghĩa với audit cũ |
|---|---|---|
| SHA-256 `.tex` | `88d7ec5d84355a0ee1824cfae2f09cf0d7dace73f96b994c95d4152fe468aa55` | Khớp |
| SHA-256 PDF | `9e89982a3f59b0ecad11b1fc55996931270817c4727b4554b702ddbcfaf846aa` | Khớp |
| SHA-256 `.bib` | `cd7f17f42d565a13afe391f257538e7510b1b64361408b30c7c3260bc0889d2c` | Khớp |
| SHA-256 Figure 1 | `5762e853e2871ed8d592f863af2493f9cf3dd3592e12b8f686cbec1701b56be5` | Khớp |
| SHA-256 class | `36d0c3273a59d48dc6a9c7b080dfa1ec50dc10229d8751568d1f2e490ffa5ecc` | Khớp hash audit; lần này không tải lại ZIP December 2024 để so byte với publisher |
| PDF | 27 trang A4; metadata đã điền; font được `pdffonts` liệt kê đều Type 1, embedded | Khớp |
| Figure 1 | Trang 6, 1536 × 1024 px, `pdfimages -list` báo 244 × 244 ppi | Khớp; chưa sửa artwork |
| Citation | 33 entry, 33 key được cite; không key thiếu/không dùng | Khớp ở mức kiểm tra source; không xác nhận mọi metadata/claim của 33 bài |
| Cross-reference | Không label trùng; mọi key trong `\ref` có `\label` tương ứng | Khớp ở mức source |
| Bảng và hình | 12 môi trường table, 1 Figure 1 | Khớp |
| Placeholder | 6 lần `To be completed by the authors.` | Khớp; chỉ 5 nằm trong Statements and Declarations, 1 là Acknowledgements |
| Visual QA | Xem trực tiếp trang 1, 6, 27; trang 27 chỉ còn reference [33] | Xác nhận các nhận xét cụ thể ở ba trang này; không tuyên bố đã kiểm lại toàn bộ 27 trang |

Không có `pdflatex`/`bibtex` trên PATH của phiên kiểm tra này, nên **không fresh-build**. Nhận định “build không lỗi” vẫn dựa vào build record ngày 25/09 và việc hash hiện tại không đổi. Kiểm tra tĩnh hoặc trích text không chứng minh tuyệt đối rằng toàn bộ PDF không chồng chữ/tràn lề.

**Word count cần chuẩn hóa mô tả:** sau khi bỏ biểu thức toán theo logic script, đếm token cách nhau bởi whitespace cho 202; regex giữ dấu gạch nối và số thập phân cho 201; regex tách mọi chuỗi chữ/số như `HyphenatedCompoundsSplit` trong script cho 222. Con số 216 có thể tương ứng với một quy ước chỉ tách từ ghép, nhưng không nên gọi 201 là chính xác “theo khoảng trắng”, hoặc coi 216 là output chắc chắn của script hiện tại. Các cách đếm kiểm tra ở đây vẫn trong 150–250; đây không phải lỗi abstract vượt giới hạn. Script PowerShell chưa được chạy trực tiếp; các regex đã được đối chiếu bằng Python trên abstract hiện tại.

## 3. Những điểm cần sửa hoặc bổ sung trong audit

### D01 — RQ2: “CSV thiếu compilation và thời gian” không đúng với CSV hiện có

**Vị trí trong TRACE:** dòng 413, 477 và 690. Manuscript nói không báo compile riêng được, CSV thiếu independent compilation outcome và repair time. Audit 6.3/6.6 chưa kiểm tra lại điều này.

Hai file đã đọc:

- [297 run của batch chính](../../results/rq2/raw/rq2-postdev-v2-surefire-r1/analysis/batch-rq2-20260820T113236Z-dc439caaa-runs.csv).
- [3 run của task thay thế](../../results/rq2/raw/rq2-postdev-v2-surefire-r1-replacement/analysis/batch-rq2-20260825T165335Z-6598109b5-runs.csv).

Gộp hai file được 300 run/100 task. Các file có `compilation_stage`, `duration_seconds`, `started_at_utc`, `completed_at_utc`, `stage_evidence_inferred`. Tất cả 300 dòng có `stage_evidence_inferred=false`.

| Trường quan sát | TGSLR | FTMR | FCR |
|---|---:|---:|---:|
| `compilation_stage=Succeeded` | 72 | 79 | 86 |
| `compilation_stage=Failed` | 15 | 11 | 0 |
| `compilation_stage=NotRun` | 13 | 10 | 14 |
| Mean `duration_seconds` | 161.573 | 187.231 | 144.923 |

**Kết luận đúng:** có trường compilation và thời lượng cấp run trong bản CSV hiện có. Cần xác định chúng ghi trạng thái cuối hay một stage cụ thể, tính cả retry/tool time như thế nào, và liệu đây có phải đúng snapshot đã dùng viết bài.

**Không làm ngay:** không đổi các số trên thành “compile success rate” hoặc “repair-only latency” chính thức khi chưa kiểm tra semantics và nguồn export. `NotRun` phải được phân biệt với compiler failure. Có trường dữ liệu không tự bảo đảm nó đo đúng construct mong muốn.

**Đề nghị sửa audit:** “Bản thảo hiện mô tả thiếu compilation/time; CSV schema 11 trong workspace có các trường liên quan. Cần xác minh snapshot và định nghĩa, rồi cập nhật reporting.”

### D02 — RQ2: cần làm rõ căn cứ của chữ “prespecified” và phân tích confirmatory

**Vị trí:** `.tex` dòng 303 và 394 mô tả family 10 tests; audit 6.3 trình bày kết quả sau Holm nhưng bỏ qua trạng thái protocol của dữ liệu nguồn.

[Báo cáo batch chính](../../results/rq2/raw/rq2-postdev-v2-surefire-r1/analysis/batch-rq2-20260820T113236Z-dc439caaa-rq2-report.md), phần Claim gate, ghi `Analysis-ready: Không`, power/outcome plan còn provisional và số unit 99/145. [Addendum 100 unit](../../results/rq2/raw/rq2-postdev-v2-surefire-r1/analysis/rq2-descriptive-100-unit-addendum.md) giải thích thêm task thay thế và chỉ nhận kết quả mô tả; báo cáo cũ dùng 98/99 cặp đủ điều kiện, trong khi manuscript dùng 100 cặp, giữ Cancelled/Unexpected là failure.

Đây **không phải bằng chứng rằng phép tính mới sai**: phân tích giữ 100 cặp có thể là một tái phân tích hợp lý. Tuy nhiên, cần tài liệu ghi ngày, version và lý do chuyển từ eligibility filtering sang giữ toàn bộ scheduled outcomes. Tính được p-value không tự chứng minh test family đã được chốt trước khi nhìn dữ liệu.

**Cần cung cấp:** analysis script tạo family 10 tests trên 100 unit; protocol/amendment tương ứng; thời điểm chốt family, handling Cancelled/Unexpected và replacement task. Nếu đây là tái phân tích hậu nghiệm, ghi rõ exploratory/post-hoc và giữ các p-value với đúng giới hạn đó.

### D03 — “RQ2 is not supported inferentially” quá bao quát

Audit 6.3 bám đúng câu trong `.tex` dòng 477/710, nhưng câu này không diễn đạt tốt kết quả của một câu hỏi nghiên cứu gồm nhiều thành phần.

- TGSLR–FTMR: 60% so với 46%, p Holm được bài báo cáo là 0.0752; chưa có bằng chứng vượt trội sau hiệu chỉnh. Không chứng minh hai phương pháp tương đương.
- TGSLR–FCR: 60% so với 76%, p Holm 0.0108; bài báo cáo bằng chứng có ý nghĩa theo hướng FCR tốt hơn về success.
- FCR cũng có token/API calls/iterations thấp hơn TGSLR trong phân tích được báo cáo. “Cost” ở đây không tự bao gồm USD, tool compute hoặc latency.
- Changed LOC trên các successful subset là mô tả. Adequacy thiếu dữ liệu và không có kết luận non-inferiority đã được xác nhận.

**Wording đề nghị:** “The results do not establish overall superiority of TGSLR. Under the reported analysis, FCR achieves higher core repair success and lower token/API/iteration cost, while TGSLR shows descriptively smaller successful patches. These findings remain limited by the cohort, missing adequacy evidence, and the analysis-protocol status.”

### D04 — F23c cần thừa nhận Bảng 2 đã có complete-pair analysis

RQ1 `.tex` dòng 334 và 342–370 phân biệt mean trên non-N/A với test ghép cặp. DeepSeek DIRECT có 148/148 quan sát STS/BC, PLANNED có 141/140; Bảng 2 đã dùng 141/140 complete pairs. Gemini có 140/139 pairs.

**Audit đúng** khi cảnh báo mean STS/BC có mẫu số khác nhau. **Audit cần sửa** nếu cách viết “dùng paired/common-denominator analysis nếu có thể” khiến người đọc hiểu bài chưa có paired tests.

Điều còn cần là: mean và effect trên cùng common pairs, bảng missingness có reason code, giải thích vì sao một target có thể undefined ở treatment này nhưng defined ở treatment kia, sensitivity với cách xử lý missingness và project clustering. Paired tests hiện có không tự khắc phục selection do missingness.

### D05 — “Chưa có artifact” phải ghi rõ phạm vi

Audit đúng khi nói artifact không nằm trong repository `TRACE-Paper` và chưa chứng minh có public release. Tuy nhiên workspace `paper-2` đã có CSV RQ1, 300 dòng RQ2, metrics RQ3, 450 dòng paired comparison, prompt/code/config/protocol liên quan.

**Có trên máy ≠ có public/reviewer access ≠ đã kiểm chứng nguồn raw.** Trạng thái F19–F21 nên là “có một phần artifact cục bộ; cần chốt đúng snapshot, provenance, package và quyền truy cập”, không yêu cầu tác giả cung cấp lại toàn bộ file đã tồn tại.

### D06 — TRACE–EvoSuite: cần đối chiếu ngân sách thực tế với cấu hình lịch sử

[Paired CSV 450 dòng](../../experiments/full-chain/paired-comparison.csv) có 4 dòng `EvoSuite process timed out after 120s.`. [Config hiện tại](../../experiments/full-chain/configs/full-chain.official.json) đặt `searchTimeoutSeconds=420`, hard wall-clock 900; CLI hiện tại cũng có option `--evo-timeout`.

120 giây có thể là process limit/override riêng, còn 420 giây là search allocation hoặc config của phiên bản khác. **Chưa kết luận vi phạm fairness.** Cần snapshot config, command line, runtime log và commit của campaign `official-150-20260920-r42-r44-v1`; không gán config hiện tại cho campaign chỉ dựa vào tên `official`.

CSV còn cho phép làm rõ F29a/b ngay:

- 175 generation-failure của EvoSuite = 171 “produced no test file within budget” + 4 timeout 120s.
- 139 dòng ghi `TerminalRepairExhausted_NoRepairInBaseline`, nên đã có bằng chứng nhãn taxonomy dành cho baseline không repair; nhãn này không phải 139 vòng repair của EvoSuite.
- Nguyên nhân sâu của 171 ca không có file và vì sao 139 ca kết thúc ở gate đó vẫn cần log.

**Ghi chú cost:** cột `Evo_Tokens` trong CSV đều 0. Điều này không chứng minh chi phí verifier B2 dùng chung bằng 0 hoặc được hạch toán đầy đủ. Cần tách token generation, repair, verification cho mỗi arm; không đổi “not reported” thành “EvoSuite total inference cost = 0” chỉ từ cột này.

### D07 — Nguồn FullChain trong workspace có nhiều phiên bản; tên “official” không đủ

[Export thống kê](../../experiments/full-chain/exports/statistical_analysis_results.json) hiện mang `campaignId=phase11-official-export`, VSR 68.89%/35.56%; [data-quality report cùng thư mục](../../experiments/full-chain/exports/data_quality_report.json) ghi 45 pairs. Đây không phải kết quả 450 pairs 55.11%/28.89% trong bài.

Ngược lại, `experiments/full-chain/paired-comparison.csv` có đúng 450 dòng, 150 target, 58 project, reps 42/43/44 và tái tạo được các mean trong Bảng 11–12. File này không có cột campaignId; cần manifest/hash để khóa liên kết với campaign.

DOCX `artifacts/FullChain_Muc_4_6_Ket_qua_thong_ke.docx` có SHA-256 `0af931fa5be55d4427b8597558281842c2216ec1840a97be70b16022daee8c67`, khác `E09E5E...FF7C` trong BUILD_RECORD. Khác hash chỉ chứng minh khác bytes, chưa chứng minh khác nội dung. Lần này chưa so sánh nội dung DOCX.

**Cần:** manifest chỉ rõ CSV/script/config/report/DOCX nào là nguồn của mục 4.6; lưu các export 45 pairs như bản khác và không dùng chúng để xác nhận CI/p-value của 450 pairs.

### D08 — Độ ưu tiên nội bộ không đồng nghĩa yêu cầu bắt buộc của publisher

F03, các declaration liên quan và chất lượng hình là vấn đề thực sự cần chốt. Tuy nhiên:

- F04: affiliation đã đủ thành phần institution/city/country cơ bản; “chưa xác nhận” là việc tác giả cần kiểm tra, chưa phải bằng chứng địa chỉ sai. Khoa/department không nên tự bổ sung.
- F05: không có người cần cảm ơn thì không nên coi thiếu một câu Acknowledgements là lỗi bắt buộc; xử lý mục placeholder phù hợp thực tế.
- F08–F10: `Not applicable` có thể đúng; thiếu xác nhận trong hội thoại không chứng minh thiếu xác nhận ngoài đời.
- F14: test TeX Live 2021/portal là kiểm tra portability có ích, chưa có bằng chứng source hiện tại không build được ở portal.
- F15: abstract đang trong giới hạn; kiểm tra portal là bước cuối, không phải lỗi word count đã xác định.
- F19–F21: khả năng truy cập và tái lập cần được làm rõ; không mặc định journal buộc public mọi artifact trước submission.

Nên dùng thêm cột “bắt buộc theo journal / xác nhận tác giả / bổ sung bằng chứng / cải thiện biên tập” thay vì diễn giải mọi nhãn P0 là desk-reject chắc chắn.

### D09 — Cần xác nhận tách biệt script thay đổi báo cáo đo khỏi dữ liệu nghiên cứu chính thức

> Trạng thái sau đối chiếu: mô tả hành vi script dưới đây được giữ làm lịch sử kiểm tra code, không phải kết luận rằng hai CSV trong bài bị tác động. Raw artifacts của hai campaign đã được tìm và đối chiếu; yêu cầu gửi lại raw RQ1 đã được thay thế bằng cập nhật 14:28 ở đầu file.

Trong khi tìm script phân tích, phát hiện [boost_31_pro_metrics.py](../../tools/rq1/boost_31_pro_metrics.py). Đọc source cho thấy script nhắm vào `experiments/rq1/runs/RQ1-OFFICIAL-GEMINI-3.1-PRO`, sửa các counter JaCoCo từ missed sang covered (dòng 34–47) và đổi ngẫu nhiên một phần mutation status `SURVIVED`/`NO_COVERAGE` thành `KILLED` (dòng 49–59). Đây là thay đổi trực tiếp measurement report, không phải kết quả đo lại coverage/mutation bằng công cụ.

[mutation_boost_planned.py](../../tools/rq1/mutation_boost_planned.py) cũng nhắm Gemini 3.1 Pro, chọn rerun PLANNED khi kém DIRECT và xóa/thay thư mục `PLANNED/R01` của target được chọn. Nếu dùng kết quả theo cách này cho so sánh một run mỗi arm thì phải khai rõ quy tắc chọn/rerun, ngân sách và lưu nguyên lần chạy gốc.

**Ranh giới kết luận:** chỉ xác nhận hành vi mã nguồn. Không chạy hai script; chưa xác định chúng từng được chạy; chưa có bằng chứng chúng tác động CSV Gemini 3.7 Flash/DeepSeek V4 Flash đang dùng trong TRACE. Không được suy từ tên file hoặc sự tồn tại của script sang cáo buộc số liệu trong bài bị sửa.

**Thông tin cần xác nhận:** hai script là thử nghiệm/synthetic hay đã dùng thực tế, ngày/campaign bị tác động nếu có, và raw measurement bất biến nào chứng minh lineage của các CSV chính thức. Nếu các file đo đã sửa chỉ là synthetic/test fixtures, phải ghi nhãn và tách khỏi dữ liệu empirical. Nếu report đã sửa từng đi vào kết quả nghiên cứu thì không dùng chúng làm empirical evidence; phải lấy lại report gốc có provenance hoặc đo lại từ mã test/repository đã khóa.

Điểm này làm rõ vì sao “CSV khớp bảng” chỉ kiểm tra tính nhất quán số học, chưa chứng minh kết quả phản ánh các lần thực thi thực tế.

## 4. Các số liệu đã đối chiếu thêm

### 4.1. RQ1

Nguồn: [CSV Gemini](../../results/rq1/csv/runs-gemini-3.7-flash.csv), [CSV DeepSeek](../../results/rq1/csv/runs-deepseek-v4-flash-thinking.csv).

| Model/arm | n | Compile | Execute | STS % (n) | BC % (n) | MS % |
|---|---:|---:|---:|---:|---:|---:|
| Gemini DIRECT | 150 | 142 | 124 | 46.54 (140) | 59.34 (139) | 54.91 |
| Gemini PLANNED | 150 | 147 | 135 | 58.38 (140) | 71.19 (139) | 64.32 |
| DeepSeek DIRECT | 150 | 95 | 50 | 25.09 (148) | 28.64 (148) | 27.94 |
| DeepSeek PLANNED | 150 | 142 | 130 | 58.57 (141) | 69.98 (140) | 63.52 |

Đếm lại và mean khớp Bảng 1 ở độ làm tròn hiển thị. Mean token/time cũng khớp mục 4.3.4. Exact McNemar tính lại từ các cặp discordant khớp p chưa hiệu chỉnh trong Bảng 2: Gemini CSR 5/0 → 0.0625; ESR 11/0 → 0.0009765625; DeepSeek CSR 50/3 → 5.5196e-12; ESR 81/1 → 3.4328e-23.

Chưa tính lại Wilcoxon, effect size, conditional tests hoặc sensitivity clustering trong lần này. Không suy từ việc khớp CSV sang xác nhận độc lập raw test/tool evidence.

**Cảnh báo phiên bản:** [report hai model trong workspace](../../results/rq1/reports/4.3_Result_of_RQ1_Hai_Model_VI.md) hiện có aggregate PLANNED ESR 66.67% và mô tả conditional mutation thấp hơn; các CSV vừa kiểm tra và manuscript hiện có ESR 88.33%. Cần ghi rõ report đó thuộc phiên bản khác/chưa đồng bộ; không trộn narrative của report đó vào bản TRACE hiện tại.

### 4.2. RQ2

Từ 297 + 3 dòng đã nêu ở D01:

| Chỉ số | TGSLR | FTMR | FCR |
|---|---:|---:|---:|
| Success/100 | 60 | 46 | 76 |
| Mean tokens | 25,284.93 | 28,238.19 | 17,798.23 |
| Mean API calls | 4.51 | 4.82 | 3.74 |
| Mean iterations | 2.05 | 2.30 | 1.39 |
| Mean changed LOC trên successful repairs | 18.45 | 16.50 | 28.9342 |
| Runs có regression | 6 | 6 | 8 |
| Coverage có measurement/success | 51/60 | 39/46 | 59/76 |
| Mutation có measurement/success | 40/60 | 29/46 | 47/76 |

Các con số khớp Bảng 3–6 ở độ làm tròn. Ghép task_id cho W/T/L 21/72/7 và 4/76/20 đúng manuscript. Exact McNemar success chưa hiệu chỉnh lần lượt 0.01254095 và 0.00154388; chưa chạy lại toàn bộ 10 tests để xác nhận Holm/cost effects trong lần này.

Hai Cancelled đúng là TGSLR/FCR của `D4J-JACKSONXML-4-25`. “Unexpected run FTMR” có `status=Failed`, `failure_category=Unexpected` ở `D4J-JACKSONCORE-17-10`; nên gọi rõ failure category, không nhầm Unexpected là status riêng.

FCR có scenario/traceability context ở 99 dòng có thông tin; FTMR không có scenario ở cả 100 dòng. Cần giữ mô tả này khi giải thích baseline: không mặc định FCR là sinh lại class chỉ với failure evidence giống FTMR. Hai run cancelled không có prompt contract hợp lệ không tự chứng minh prompt đã chạy rồi vi phạm; cần log trước khi quy lỗi isolation.

### 4.3. RQ3

Ba `metrics_v2.json` trong `results/rq3/in_paper/` có hash khớp hoàn toàn [RQ3_PROVENANCE](../paper/RQ3_PROVENANCE.md): Gemini `63b965...c3b2`, DeepSeek `3d240f...b860`, GLM `32ee98...4c15`.

FAR, decision accuracy, routing và input-token counts được kiểm tra khớp bảng hiện tại; Gemini B1/B2 FAR 57.6923%/26.9231%, routing 42.5926%/66.6667%. GLM error counts đúng 37 + 50 = 87.

Đây là kiểm tra metrics report/hash, chưa tái chấm toàn bộ prediction hoặc tái xác nhận human gold. Những caveat về agreement-selected cohort, 8 natural cases, một human annotator, repaired DeepSeek và compute confounding trong audit vẫn đúng với mô tả trong bài. Không coi 0% FAR trên repaired/sensitivity cohort là chứng minh hệ thống tuyệt đối an toàn.

### 4.4. TRACE–EvoSuite

Paired CSV tái tạo:

- 450 dòng; 150 target; 58 project; reps 42/43/44.
- Verified 248 và 130, tức 55.11% và 28.89%.
- Cặp cả hai verified/TRACE-only/EvoSuite-only/cả hai không verified = 100/148/30/172.
- Delivered BC 42.22945%/28.32011%; MS 44.03321%/26.88889%; STS 47.33990%/28.88889%.
- Candidate BC 70.84311%/46.25090%; MS 61.75803%/41.12073%; STS 75.96664%/45.78620%.
- TRACE tokens 37,564,632; mean duration 157.18011s/117.80624s; tổng khoảng 19.65h/14.73h.

Các point estimates khớp. **Chưa tính lại CI/bootstrap/permutation/Holm** vì chưa chốt analysis artifact thuộc đúng campaign 450 pairs. Không dùng export 45 pairs ở D07 thay thế.

Một điểm audit nên bổ sung: bootstrap phân tầng theo project không tự biến target-level sign-flip test thành project-aware test. Mục 4.6 vẫn cần giải thích giả định độc lập/exchangeability của 150 target differences trong 58 project hoặc thêm sensitivity ở project level. Đây là giới hạn suy luận cần kiểm tra, chưa phải kết luận p-value hiện tại sai.

## 5. Đối chiếu từng ID của bảng audit cũ

| ID | Đánh giá sau kiểm tra | Ghi chú cần dùng khi xử lý |
|---|---|---|
| F01 | Đúng | 244 ppi đã xác nhận; cần nguồn hình tốt hơn nếu xử lý artwork |
| F02 | Đúng, mức biên tập | Caption đúng là rất ngắn; viết thêm chỉ theo những gì hình thực sự thể hiện |
| F03 | Đúng | `.tex` dòng 33–37 không có `\author*`; trang 1 chỉ ghi Contributing authors |
| F04 | Cần xác nhận tác giả | Affiliation đã có institution/city/country; chưa chứng minh sai |
| F05 | Có placeholder | Acknowledgements không tự là statement bắt buộc nếu không có nội dung cần khai |
| F06 | Đúng | Funding chưa điền, dòng 729–730 |
| F07 | Đúng | Competing interests chưa điền, dòng 732–733 |
| F08 | Chưa xác nhận thực tế | Ethics đang Not applicable; không tự đổi |
| F09 | Chưa xác nhận thực tế | Consent to participate đang Not applicable |
| F10 | Chưa xác nhận thực tế | Consent for publication đang Not applicable |
| F11 | Đúng | Data availability còn placeholder; cần access statement đúng tình trạng |
| F12 | Đúng | Code availability còn placeholder; xác định repo/version/access |
| F13 | Đúng | Author contributions chưa điền; tác giả cung cấp vai trò |
| F14 | Chưa thực hiện, không phải build failure đã biết | Kiểm ZIP/portal; lần này không fresh-build |
| F15 | Đang trong giới hạn | Chuẩn hóa word-count convention; portal count là bước kiểm cuối |
| F16 | Đúng về BibTeX hiện tại | `bib15` accepted/pending DOI; chương trình ISSTA vẫn có bài; chưa xác minh DOI mới nhất toàn publisher |
| F17 | Đúng về BibTeX hiện tại | `bib29` tương tự F16 |
| F18 | Đúng về trạng thái source | 5 key đã bỏ; chưa tái tra toàn bộ trạng thái xuất bản của 5 bài trong lần này |
| F19 | Đúng trong manuscript repo, thiếu phạm vi workspace | Có CSV/raw summaries cục bộ; public/reviewer package chưa được xác nhận |
| F20 | Đúng về yêu cầu provenance | Có prompt/config cục bộ, cần bind với campaign và model snapshot |
| F21a | Cần cập nhật | Có code/report; cần script đúng version tạo từng bảng, nhất là RQ2 100-unit và TRACE 450-pair |
| F21b | Cần cập nhật | Có tool-lock/config; chưa đủ để khẳng định đó là môi trường campaign lịch sử |
| F22 | Đúng | Planning thêm calls/tokens; chưa cô lập representation khỏi compute |
| F23a | Đúng | Các RQ1 CSV đọc được có một repetition mỗi method/arm/model |
| F23b | Đúng theo manuscript | RQ1 tests chưa adjust project clustering |
| F23c | Đúng nhưng diễn đạt thiếu | Bảng 2 đã có complete pairs; xem D04 |
| F24 | Đúng về con số, cần wording | Không có superiority TGSLR tổng thể; xem D02–D03 |
| F25 | Đúng với mô tả RQ3 | Agreement là AI inter-pass, không phải human inter-rater reliability |
| F26 | Đúng | Equal evidence không đồng nghĩa equal compute |
| F27 | Đúng | Treatment blinding chưa đủ chứng minh common neutral acceptance contract |
| F28 | Đúng về aggregate hiện có | Paired CSV có delivered CSR/ESR, không raw pre-gate CSR/ESR; chưa kết luận toàn bộ raw logs không có |
| F29a | Đúng, có thể chi tiết hơn | 171 no-test-file + 4 timeout 120s; xem D06 |
| F29b | Đúng, có thể chi tiết hơn | Nhãn đã nói NoRepairInBaseline; cần nguyên nhân gate/log, không gọi là EvoSuite repair |
| F30 | Cần thông tin dùng AI thực tế | Phân biệt copy-editing với tạo nội dung; LLM làm phương pháp nghiên cứu cần mô tả trong Methods |
| F31 | Hợp lý | Ngày truy cập nguồn web giúp rõ phiên bản, không tự là lỗi làm sai kết quả |
| F32 | Nhận xét biên tập có căn cứ | Introduction/Methodology/Conclusion lặp ba contributions; ưu tiên sau provenance |
| F33 | Đúng | Xem trực tiếp trang 27: chỉ reference [33]; không phải lỗi compile |

## 6. Chính sách journal và mức fit

Kiểm tra lại ngày 27/09: [collection](https://link.springer.com/collections/gagdfebeia) vẫn mở, deadline 30/10/2026. TRACE phù hợp hướng AI-driven software engineering; không suy từ fit thành bảo đảm nhận bài.

[Hướng dẫn ISSE](https://link.springer.com/journal/11334/submission-guidelines) xác nhận: khuyến nghị `iicol`; abstract 150–250 từ, 4–6 keywords; tối đa ba cấp heading; corresponding author rõ ràng; combination artwork 600 dpi; references đã published/accepted; original research cần Data Availability. Không quy mọi mục nội bộ P0 thành yêu cầu journal. Author Contributions/Competing Interests còn phải nhập đúng portal; Acknowledgments được hướng dẫn đặt ở title page, trong khi bản này đang ở backmatter. Cần kiểm vị trí khi hoàn tất lời khai. AI copy-editing và tạo nội dung có quy định disclosure khác nhau.

[LaTeX support](https://www.springernature.com/gp/authors/campaigns/latex-author-support) ghi nền tảng `submission.nature.com` dùng TeX Live 2021; test portability vẫn hợp lý.

Hai bài accepted vẫn có trên chương trình chính thức: [Test vs Mutant](https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/31/Test-vs-Mutant-Adversarial-LLM-Agents-for-Robust-Unit-Test-Generation), [Context Matters](https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/151/Context-Matters-Improving-the-Practical-Reliability-of-LLM-Based-Unit-Test-Generatio). Chưa dùng việc không thấy DOI trên trang chương trình để kết luận publisher chưa cấp DOI.

## 7. Thông tin thực sự cần Dũng/nhóm cung cấp

Ưu tiên A/B vì ảnh hưởng cách hiểu kết quả, còn C/D giúp hoàn tất submission. Nếu chưa có bằng chứng, ghi “chưa có”; không cần tạo xác nhận hồi tố.

| Nhóm | Cần cung cấp cụ thể | Dùng để chốt |
|---|---|---|
| A — RQ2 | Xác nhận hai CSV 297+3 ở D01 có phải snapshot chính thức; script/version tạo thống kê 100 unit; protocol/amendment và thời điểm khóa family 10 tests, xử lý cancelled/unexpected và replacement | Sửa phát biểu thiếu compilation/time; xác định analysis là prespecified hay exploratory; kiểm lại Holm/CI |
| B — TRACE 450 pairs | Manifest/hash gắn `paired-comparison.csv` với campaign; config/command/runtime log lúc chạy; giải thích 120s/420s/900s; script tạo bootstrap/permutation/CI của 450 pairs; cách hạch toán token B2 cho EvoSuite | Kiểm fair budget, provenance, chi phí và Table 11–12; phân biệt export 45 pairs |
| B2 — Lineage RQ1 | Hai script ở D09 thuộc dữ liệu synthetic/thử nghiệm hay đã chạy trên campaign thực; bản raw report gốc và manifest export của Gemini 3.7/DeepSeek V4 trong bài | Xác nhận dữ liệu empirical được tách khỏi report bị sửa trực tiếp hoặc rerun chọn theo outcome; chưa kết luận có ảnh hưởng |
| C — Tác giả | Corresponding author + email; affiliation từng người; Funding, conflicts, acknowledgements, ethics/consent theo thực tế; vai trò từng tác giả; AI đã dùng để biên tập hay tạo nội dung/phân tích/hình | Hoàn tất title page/declarations/disclosure, không tự điền thay |
| D — Phát hành/hình | Repo/archive nào sẽ phát hành, thời điểm, reviewer access, license; nguồn chỉnh sửa Figure 1 nếu có | Data/Code Availability và artwork |
| E — Nếu muốn claim mạnh hơn | Equal-compute RQ1/equal-budget B1–B2; holdout RQ3/annotator độc lập; case-level missingness; neutral-gate/raw pre-gate audit nếu đã có | Đóng các hạn chế khoa học; nếu chưa có thì giữ caveat, không xem là dữ liệu bắt buộc phải phát sinh chỉ để hoàn tất ghi chú |

Không cần gửi lại manuscript hoặc những CSV/metrics đã liên kết ở trên. Những gì còn thiếu chủ yếu là **xác nhận nguồn chuẩn, lịch sử phân tích/cấu hình và thông tin tác giả**.

## 8. Thứ tự sửa đề nghị và tiêu chí hoàn tất

1. Chốt provenance RQ2/TRACE và sửa các câu “thiếu dữ liệu” không còn đúng với artifact hiện tại; nêu rõ exploratory/reanalysis khi không có prior freeze.
2. Làm rõ giới hạn inference: sửa câu RQ2 quá bao quát, thừa nhận complete-pair RQ1 hiện có, kiểm sensitivity clustering cho integrated comparison.
3. Bổ sung bảng linking campaign → data hash → script/version → bảng manuscript. Đánh dấu report RQ1 khác phiên bản và export FullChain 45 pairs để tránh nhầm nguồn.
4. Hoàn tất thông tin tác giả, availability và hình theo thông tin được xác nhận.
5. Sau khi nội dung khóa: build package, kiểm portal, render lại PDF và cập nhật build record/hash.

Tiêu chí lần kiểm tra hiện tại: bản note phải nói rõ audit nào khớp source, số nào đã tính lại, số nào chưa tái kiểm, và thông tin nào chỉ tác giả/campaign owner mới xác nhận được. Kết luận “chưa nên coi là submission-ready” vẫn hợp lý, nhưng căn cứ khoa học cần được bổ sung bằng các kiểm tra provenance, D01–D07 và D09, thay vì chỉ dựa vào lỗi định dạng.

## 9. Hash dữ liệu đã sử dụng để đối chiếu cục bộ

| Artifact | SHA-256 |
|---|---|
| RQ1 Gemini CSV | `849b2cc966a062769dab173ff52523bf1a1e28697bb93541fe7f80ed10f96488` |
| RQ1 DeepSeek CSV | `21ad6c376149cae838580d5a54e0cf442a9e19a58c1b798715ae185faf85f073` |
| RQ2 batch chính runs.csv | `454d68c737fce7944a12db96e108b863a73cc30d815f03ac282e5a2eba8c781f` |
| RQ2 replacement runs.csv | `4c6463571d2e07fede8274e6a9b53ef9df40a9d6eaa841f3e5aea3a61ba7840e` |
| TRACE–EvoSuite paired CSV | `ec58c015db187cb43a1882b61906dc13c65916cb59a91fc5247a423d6ee47a15` |

Các hash này ghi nhận bytes đã đọc ngày 27/09. Chúng không thay thế chữ ký/freeze lịch sử, xác nhận dữ liệu nguyên gốc, public release hoặc việc tái thực thi thí nghiệm.
