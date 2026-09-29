# TRACE: đã sửa gì và còn cần tác giả cung cấp gì

> Cập nhật RQ1 lúc 14:28: đã nối đủ 600 dòng CSV với run artifacts và đối chiếu XML coverage/mutation. Xem [kết quả kiểm tra nguồn RQ1](20260927-1428-dungng2808-to-all-cap-nhat-doi-chieu-nguon-rq1.md). Các mục RQ1 bên dưới đã được cập nhật; không còn yêu cầu gửi lại raw artifacts đã có.
>
> Cập nhật tiếp lúc 14:56: đã thêm cô Nguyệt, sửa declarations/Abstract và xác nhận cả 450 lệnh EvoSuite dùng search budget 60 s. [Note tác giả và audit EvoSuite mới nhất](20260927-1456-dungng2808-to-all-chot-tac-gia-va-kiem-tra-evosuite.md) thay thế trạng thái tương ứng trong báo cáo cũ bên dưới.

- Thời điểm: 2026-09-27 10:16, Asia/Ho_Chi_Minh.
- Người gửi/người nhận: `dungng2808` → `all`; ghi chú do Codex hỗ trợ, không thay thế xác nhận của tác giả.
- Yêu cầu thực hiện: sửa trực tiếp manuscript dựa trên audit và dữ liệu `results/`, `experiments/full-chain/`.
- Đã cập nhật: [LaTeX](../paper/trace-paper.tex), [PDF](../paper/trace-paper.pdf), [build record](../paper/BUILD_RECORD.md), [hướng dẫn kiểm tra số liệu](../paper/verification/README.md).
- Không sửa dữ liệu thí nghiệm, không chạy lại model/Java/PIT, không thực thi script nâng/chỉnh metric, không cập nhật Google Docs hay công bố dữ liệu ra ngoài.

## 1. Kết luận

Các số liệu chính trong bản thảo có thể đối chiếu với các export mà Dũng cung cấp.
Không cần gửi lại CSV RQ1/RQ2, ba metric report RQ3 hay CSV 450 cặp FullChain.
Không cần gửi lại mã bootstrap/permutation FullChain: đã tìm được trong workspace
và chạy lại thành công trên đúng cohort.

Vấn đề chính đã sửa là **diễn giải bằng chứng và định nghĩa phép đo**, không phải
thay headline results để làm kết quả đẹp hơn. RQ2 còn có lỗi quy ước dấu effect
size; dấu đã được sửa theo phép tính paired. Bản mới vẫn chưa phải bản sẵn sàng
nộp: thông tin tác giả/declarations và một số bằng chứng nguồn gốc thực nghiệm
cần được chốt.

## 2. Các thay đổi đã đưa vào manuscript

| Vị trí | Thay đổi | Căn cứ và giới hạn |
|---|---|---|
| Figure 1 | Mở rộng caption giải thích luồng và đầu ra; giữ nguyên ảnh | Không tự vẽ lại hay giả tăng chất lượng ảnh gốc |
| §4.2 | Phân biệt một lần chạy ở các component study với ba repetition ở integrated study; ghi RQ2 là exploratory reanalysis | Không dùng multiple-testing correction như bằng chứng preregistration |
| §4.3 RQ1 | Giữ nguyên paired tests; giải thích cách giữ tied ranks và vì sao complete pairs không giải quyết missingness của các mean non-N/A | 600 dòng CSV; kiểm định chính và conditional paired-executed đều khớp |
| §4.4.1 RQ2 | Nêu rõ FCR cũng có scenario/traceability context; làm rõ 99 unit + một replacement unit | FCR thay cả edit scope, không phải context-free baseline |
| §4.4.1 RQ2 | Sửa `Unexpected` thành failure category, không phải tên status; ghi rõ giữ cancelled/failed trong 100 matched blocks | Hai cancelled và một failure thuộc cohort vẫn được giữ |
| §4.4.2 RQ2 | Bỏ khẳng định không thể báo cáo compilation; thêm terminal stage evidence | TGSLR 72/15/13, FTMR 79/11/10, FCR 86/0/14 theo Succeeded/Failed/NotRun; NotRun không phải compile failure |
| §4.4.2 RQ2 | Thay câu khẳng định quá mức bằng kết luận đúng phạm vi | TGSLR–FTMR success có Holm p=0.0752; FCR cao hơn TGSLR với p=0.0108 trong exploratory reanalysis |
| §4.4.3 RQ2 | Thống nhất cost difference = TGSLR minus comparator | TGSLR–FTMR: r_rb tokens/API/rounds = +0.230/-0.152/-0.397; trước đây ba dấu ngược chiều này |
| §4.4.3 RQ2 | Đổi chiều interval FTMR–TGSLR sang TGSLR–FTMR bằng phép đổi dấu hai đầu; ghi rõ unadjusted | Chưa tái sinh bootstrap CI RQ2; không mô tả việc đổi dấu là chạy lại bootstrap |
| §4.4.3 RQ2 | Bổ sung duration 161.57/187.23/144.92 s | Trung bình whole-run theo timestamp; không gọi là latency LLM hay thời gian repair thuần; không thêm vào Holm family |
| §4.4.5 và Conclusion | Bỏ câu bao quát “RQ2 is not supported inferentially” | Có bằng chứng paired favoring FCR, nhưng chưa chứng minh TGSLR superiority, regression benefit, hay adequacy non-inferiority |
| §4.6.1 | Làm rõ protocol 900 s cho mỗi target–repetition–treatment, search EvoSuite 420 s; nêu conflict với bốn lý do timeout 120 s | Protocol không đủ để xác nhận cấu hình thực chạy; không tự chọn một timeout để coi là sự thật |
| §4.6.1 | Phân biệt CI bootstrap theo project với permutation theo target | Bootstrap project-aware không khiến target-sign permutation tự động trở thành project-clustered test |
| §4.6.5 | Giải thích taxonomy failure | 12 tool-category rows là 10 lỗi tạo TGSLR context + 2 plan zero-scenario, không khẳng định 12 JaCoCo/PIT crash |
| §4.6.5 | Giải thích EvoSuite 171 no-test-file + 4 process timeout, 139 NoRepairInBaseline | Không suy diễn EvoSuite đã chạy repair; cần log để quy nguyên nhân generator/harness |
| §4.6.5 | Làm rõ zero token EvoSuite không chứng minh chi phí inference toàn pipeline bằng 0 | Cần xác nhận cost của shared B2 gate |
| §4.6.6 | Nêu đã tính lại point estimates, CI và p-value trên CSV 450 cặp | Không dùng JSON `phase11-official-export` chỉ có 45 cặp để xác nhận cohort này |
| §5 và §6 | Đồng bộ threats/conclusions với các giới hạn trên | Giữ RQ3 exploratory, repaired DeepSeek/sensitivity và gate-neutrality caveat |
| References/PDF | Giữ nội dung bibliography, tránh tách một entry để DOI rơi riêng sang trang sau | BBL được tái sinh; thay đổi chủ yếu do xuống dòng tự động |

## 3. Kiểm tra đã chạy

- RQ1: hai model × 300 dòng; exact McNemar, Wilcoxon, rank-biserial, Holm năm outcome/model; kiểm tra thêm conditional paired-executed STS/BC/MS. Kết quả khớp mức làm tròn trong bài.
- RQ2: 297 + 3 dòng thành 100 matched task blocks × ba strategy. Counts/means, compilation stage, duration, adequacy denominator và mười paired tests khớp sau khi sửa chiều effect size.
- RQ3: đọc ba `metrics_v2.json` của cohort `in_paper` và đối chiếu các con số được báo cáo. Không gọi đây là tái chấm gold/prediction hay tái chạy bootstrap RQ3.
- FullChain: 450 cặp, 150 target, 58 project, repetition 42/43/44. Dùng engine C# hiện có, 2.000 bootstrap, 10.000 permutations, seed 20260919; khớp Bảng 11–12 tới chữ số hiển thị. VSR 248/450 vs 130/450; CI delta [14.22; 38.36] điểm phần trăm; raw p xấp xỉ 0.0001.
- Build PDF bằng Tectonic 0.17.0: 28 trang A4, 12 bảng, một hình, 33 references; không lỗi citation/reference, missing glyph hay overfull box. Đã xem ảnh render cả 28 trang; xem lại trang references sau lần chỉnh cuối.
- Log còn underfull warnings và encoding warning của package; không gọi build là “zero warnings”. Không khẳng định đã kiểm tra TeX Live 2021.
- Các hash input và kết quả máy đọc được nằm tại [component-results.json](../paper/verification/component-results.json) và [full-chain-results.json](../paper/verification/full-chain-results.json).

Sau kiểm tra bổ sung RQ1: cả 600 dòng CSV khớp run metrics; đã đọc 439 JaCoCo XML
và 439 PIT XML, không phát hiện sai lệch ở các phép đối chiếu branch/mutation đã
thực hiện. Còn cần xác minh nguồn token Gemini (432/450 response files không giữ
usage metadata), không gọi đó là thiếu toàn bộ nguồn dữ liệu RQ1. Bootstrap CI
RQ2 chưa được tái sinh; RQ3 chưa được tái chấm độc lập từ gold; historical
config/cost FullChain chưa giải quyết. Các kiểm tra file không phải tái chạy
thí nghiệm độc lập hoặc xác nhận quyền public release.

## 4. Cần Dũng/nhóm xác nhận hoặc cung cấp

### A. Cần trước khi coi là submission-ready

1. **Corresponding author và declarations.** Cho biết ai là corresponding author, email dùng để nộp; xác nhận tên/thứ tự năm tác giả và affiliation. Cung cấp Funding (có/không, tên quỹ/mã grant), Competing interests, Acknowledgements, đóng góp thực tế từng tác giả; xác nhận Ethics/Consent hiện ghi Not applicable có đúng không. Cho biết AI đã hỗ trợ viết/dịch/sửa bài ở phạm vi nào nếu cần khai báo. Không tự suy ra “no funding/no conflict” từ việc chưa có dữ liệu.

2. **Nguồn token Gemini RQ1, không phải thiếu raw artifacts.** Đã tìm đúng hai campaign trong `experiments/rq1/runs`, nối đủ 600 dòng CSV, kiểm tra config hash và XML branch/mutation. Không yêu cầu gửi lại dữ liệu này. Cần kiểm tra code/log tạo token trong `run.json`, vì 432/450 file response Gemini không giữ usage metadata. Phải phân biệt provider-reported và estimated tokens trước khi chốt kết luận chi phí. Các script nhắm Gemini 3.1 Pro là vấn đề riêng; chưa có bằng chứng trong các đối chiếu hiện tại rằng chúng tác động hai campaign dùng trong bài.

3. **Cấu hình thực chạy FullChain.** Cung cấp launch command/config snapshot/commit được dùng cho campaign `official-150-20260920-r42-r44-v1`, nhất là override `--evo-timeout`; kèm log bốn timeout 120 s và một vài trường hợp no-test-file. Cần phân biệt process timeout, search budget 420 s và overall hard budget 900 s, chứ không chỉ gửi file config hiện tại. Các log này cũng giúp xác định phần lỗi do generator hay harness.

4. **Chi phí B2 của hai arm FullChain.** Cho biết B2 có được gọi cho EvoSuite không và các call/token/duration ấy được ghi ở đâu; token cột EvoSuite=0 là không dùng, chưa thu thập hay bị loại khỏi counter? Cung cấp usage ledger gốc của cả hai arm hoặc đường dẫn có sẵn. Không gửi API key/secret; cần log đã redacted.

5. **Chính sách Data/Code availability.** Cho biết nhóm được phép công khai những gì, repo/archive/DOI dự kiến, license, thời điểm release và cơ chế reviewer access nếu chưa public. Không tự đặt URL hoặc cam kết phát hành thay tác giả. Nếu artifact đã có ở nơi khác, chỉ cần gửi link/đường dẫn và version/hash, không phải upload lại dữ liệu đang có.

### B. Cần để đóng nốt kiểm tra hoặc tăng độ mạnh kết luận

6. **Figure 1:** gửi nguồn sửa được (SVG/PDF vector, draw.io, PPTX...) nếu có. PNG hiện tại 1536×1024, hiệu dụng khoảng 244 dpi; caption đã sửa nhưng nguồn ảnh chưa được cải thiện. Không cần gửi lại cùng PNG.

7. **RQ2 analysis provenance:** nếu có analysis plan/amendment đã đóng băng trước khi xem outcome, gửi version/time/hash; nếu không có, giữ cách viết exploratory hiện tại là phù hợp. Nếu có script gốc tạo bootstrap CI (10.000 resamples, seed 20260814), gửi đường dẫn để tái kiểm tra OR/mean-difference intervals; chỉ seed là chưa đủ vì còn thứ tự cặp và convention percentile.

8. **RQ1 missingness / RQ3 gold:** nếu đã tồn tại reason-coded ledger cho N/A RQ1 hoặc gold manifest có version/hash cùng prediction mapping RQ3, chỉ giúp vị trí. Không yêu cầu tạo ngược bằng chứng để hợp thức hóa kết quả; nếu chưa có thì giữ limitation và thiết kế kiểm tra mới. Với RQ3, independent holdout/second annotator là công việc nghiên cứu bổ sung, không phải điều có thể sửa bằng câu chữ.

## 5. Mẫu trả lời ngắn cho Dũng

```text
Corresponding author + email:
Tên/thứ tự/affiliation đã đúng chưa:
Funding / conflict / acknowledgements:
Đóng góp từng tác giả:
Ethics/consent và phạm vi AI hỗ trợ:
RQ1: token Gemini trong run.json lấy từ provider usage, tokenizer hay ước lượng; log bổ sung nếu có:
FullChain: config/launch snapshot, giải thích 120/420/900 s:
FullChain: B2 tokens/time được tính cho mỗi arm như thế nào:
Data/code: nơi release, quyền truy cập, license, thời điểm:
Figure 1 vector/source:
RQ2 plan/bootstrap script, RQ1 N/A ledger, RQ3 gold manifest (nếu có):
```

## 6. Liên hệ với audit trước

[Bản đối chiếu lúc 09:43](20260927-0943-dungng2808-to-all-doi-chieu-audit-voi-trace-va-bang-chung.md)
là snapshot **trước khi sửa**; số dòng/hash và trạng thái lỗi trong đó không tự
chuyển thành mô tả bản PDF hiện tại. Ghi chú này và build record mới là nguồn
theo dõi việc đã sửa/chưa sửa. Những vấn đề dữ liệu chưa giải quyết vẫn giữ mở;
không đánh dấu hoàn tất toàn bộ audit chỉ vì PDF build được.
