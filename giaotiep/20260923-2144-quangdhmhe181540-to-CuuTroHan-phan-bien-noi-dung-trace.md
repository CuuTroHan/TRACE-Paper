# Phản biện nội dung bản thảo TRACE

- **Người gửi:** quangdhmhe181540
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-23 21:44 (Asia/Ho_Chi_Minh)
- **File đã xem xét:** `trace-paper.tex`, `trace-paper.pdf`, `trace-references.bib`, README/build record và các artifact hiện có trong repository
- **Bản làm cơ sở:** commit `2239b71`
- **Mức đánh giá đề xuất:** **Major Revision — chưa sẵn sàng để gửi phản biện**
- **Báo cáo liên quan:** `20260923-2131-quangdhmhe181540-to-CuuTroHan-danh-gia-dinh-dang-springer.md`

## Kết luận điều hành

Ý tưởng trung tâm của TRACE tương đối rõ: tách planning, gắn scenario với test method, thu thập bằng chứng công cụ và định tuyến sửa lỗi. Abstract, ba RQ, bảng kết quả và Conclusion nhìn chung kể cùng một câu chuyện; đa số count/phần trăm và các kiểm định McNemar có thể tính lại từ số liệu được báo và không phát hiện sai số số học rõ ràng.

Tuy nhiên, có bốn nhóm vấn đề chặn submission:

1. **Citation mapping bị sai có hệ thống** ở Introduction và Methodology; nhiều câu đang dẫn đến tài liệu hoàn toàn khác nội dung được nêu.
2. **Không có empirical package trong repository**, nên không thể kiểm chứng các bảng, CI, Wilcoxon, bootstrap, permutation test hoặc campaign `official-150-20260920-r42-r44-v1`.
3. **Thiết kế/định nghĩa metric chưa đủ để tái lập**, đặc biệt với Structural-Target Satisfaction, decision schema của B2, các metric RQ3 và delivered-system metrics.
4. **Một số diễn giải vượt quá bằng chứng**: RQ1 nói giữ cố định số test method dù thực tế chỉ cố định trần; RQ2 gọi là “partially supported” dù không có bằng chứng suy luận thuận lợi và thiếu chính metric traceability/conformance; đánh giá FullChain dùng B2 exploratory làm gate nhưng chưa chứng minh gate trung lập với EvoSuite.

Vì vậy, trước khi chỉnh câu chữ hoặc polish PDF, cần sửa citation, khóa artifact lineage và viết lại phần experimental protocol đủ chi tiết.

## P0 — Citation và bibliography không đáng tin cậy ở trạng thái hiện tại

### 1. Citation key sai nội dung

Các lỗi dưới đây có thể xác định trực tiếp bằng cách so câu văn trong `trace-paper.tex` với metadata của `trace-references.bib`:

| Vị trí | Câu/đối tượng được nêu | Citation hiện tại | Tài liệu thực tế mà key đang trỏ đến | Đánh giá |
|---|---|---|---|---|
| 45 | “LLMs can generate tests...” | `bib1,bib2,bib11` | EvoSuite, Randoop, Code-Aware Prompting | `bib1` và `bib2` không phải nghiên cứu LLM |
| 45 | mutation score / test-smell evidence | `bib12`, `bib13` | CoverUp; Mutation-Guided Unit Test Generation | Không phải PIT/tsDetect; tsDetect thực tế là `bib25` |
| 49 | ChatTester, ChatUniTest, TestART, TestLoter | `bib2,bib3,bib9,bib10` | Randoop, industrial test generation, TATG, Tracets4J | Cả nhóm citation không khớp bốn hệ thống được gọi tên |
| 49 | CATGen | `bib5` | Bài TestPilot của Schäfer et al. | Sai tài liệu; CATGen không có entry riêng |
| 51, 59, 139 | ISO/IEC/IEEE 29119-4:2021 | `bib6` | HITS | Sai hoàn toàn; bibliography không có entry cho standard |
| 51, 59, 162 | TestAgent | `bib7` | Test Intention Guided LLM-Based Unit Test Generation | Sai; TestAgent thực tế là `bib23` |
| 51, 61, 232 | MAGISTER | `bib8` | Call-Chain-Aware LLM-Based Test Generation | Sai; MAGISTER không có entry riêng |
| 55, 61, 200 | JaCoCo, PIT, tsDetect | `bib11,bib12,bib13` | Ba nghiên cứu LLM khác | Không phải tài liệu gốc của ba tool |
| 61, 232 | TestAgent/MAGISTER | `bib7,bib8` | Test Intention/CAT | Sai như trên |
| 97 | ChatUniTest và CATGen | `bib3,bib5` | Industrial evaluation và TestPilot | Không khớp hai hệ thống được nêu |
| 196 | các repair round của prior work | `bib2,bib3,bib9,bib10` | Randoop, industrial evaluation, TATG, Tracets4J | Chỉ một phần liên quan; không chứng minh đầy đủ phát biểu |

Đây không phải lỗi trình bày nhỏ: citation sai làm mất nền tảng cho novelty claim và related-work comparison. Các câu tại dòng 51, 59, 61 và 232 đang dùng citation sai để khẳng định khác biệt của TRACE với prior work.

### 2. Nguồn thực sự đang thiếu khỏi bibliography

Ít nhất cần thêm và trỏ lại đúng các nguồn sau:

- ChatTester: [No More Manual Tests? Evaluating and Improving ChatGPT for Unit Test Generation](https://arxiv.org/abs/2305.04207).
- TestART: [arXiv:2408.03095](https://arxiv.org/abs/2408.03095).
- TestLoter: DOI `10.1016/j.cola.2025.101348`.
- CATGen: [arXiv:2607.19682](https://arxiv.org/abs/2607.19682).
- ISO/IEC/IEEE 29119-4:2021: [IEEE standard record](https://standards.ieee.org/ieee/POSIX/7500/).
- MAGISTER: DOI `10.1109/SITA67914.2025.11273637`.
- Tài liệu/citation chính thức cho JaCoCo, PIT, JUnit, Defects4J, SF110 và LIBRO.
- Nếu câu về industrial pre-execution filter tại dòng 45 nói đến TestGen-LLM at Meta, cần cite đúng DOI `10.1145/3663529.3663839`, không phải ChatUniTest.

### 3. Metadata bibliography còn lỗi hoặc không ổn định

- `trace-references.bib:1-3` tự ghi rằng 25 entry được “reconstruct” từ in-text citations của một PDF 18 trang. Đây là dấu hiệu nguồn tham khảo chưa được tác giả xác nhận trực tiếp; PDF hiện tại đã là 24 trang.
- `bib24` dùng DOI `10.5281/zenodo.19944395`, nhưng DOI này không resolve trong lần kiểm tra và không có metadata tương ứng. Nguồn xác minh được cho đúng tiêu đề/tác giả là [arXiv:2605.01471](https://arxiv.org/abs/2605.01471), DOI arXiv `10.48550/arXiv.2605.01471`.
- `bib22` dùng tiêu đề cũ “A Multi-Agent LLM-Based JUnit Test Generation with Strong Oracles”. Bản arXiv hiện tại v7 có tiêu đề [Hallucination to Consensus: Multi-Agent LLMs for End-to-End JUnit Test Generation](https://arxiv.org/abs/2506.02943) và đã có related DOI `10.1145/3803418`. Cần cite version cụ thể hoặc cập nhật metadata.
- `bib21` ghi năm 2026, trong khi Crossref trả metadata 2025 cho DOI `10.1007/978-3-032-11402-0_7`; cần xác nhận năm chính thức trên trang publisher/volume.

### Hành động bắt buộc

Không sửa từng key rời rạc. Hãy tạo một bảng `claim → source → verified metadata → bib key`, duyệt toàn bộ citation theo câu, sau đó bỏ `\nocite{bib1,...,bib25}` để các entry không thực sự được cite không bị che giấu.

## P0 — Chưa có bằng chứng thực nghiệm để kiểm chứng các claim

Repository hiện chỉ có manuscript, PDF, bibliography, template, một hình và script build/count abstract. Không có:

- danh sách 150 target và tiêu chí chọn;
- repository revision/commit của 58 project;
- `pipeline.yaml`, prompt, decoding/thinking settings và exact model snapshot;
- raw run records/ledger cho RQ1--RQ3;
- 100 RQ2 fault units và mapping tới Defects4J/LIBRO;
- 180 candidate/73 selected cases, gold labels và injection operators của RQ3;
- confusion matrices B0/B1/B2;
- campaign CSV, availability ledger và manifest của FullChain--EvoSuite;
- script tính Wilcoxon, McNemar/Holm, bootstrap/permutation và seed implementation;
- tool lock, Maven/EvoSuite command, JaCoCo/PIT configuration hoặc raw report.

Do đó, câu tại `trace-paper.tex:288` rằng artifacts được lưu để hỗ trợ replication và câu tại dòng 648 rằng CSV/raw records/ledger hỗ trợ reproducibility **chưa thể được xác minh từ repository này**. `BUILD_RECORD.md` cũng nói rõ nó chỉ xác minh build LaTeX, không xác minh thí nghiệm.

Nếu artifact được giữ ở workspace/repository khác để phục vụ double-blind review, bản thảo phải cung cấp anonymous artifact link, immutable release ID và SHA-256 manifest. “At publication ... must be released” chưa đủ cho một bài đặt trọng tâm vào auditability và reproducibility.

## P1 — Đánh giá RQ1

### Điểm tốt

- Thiết kế paired theo focal method là hợp lý hơn so sánh hai mẫu độc lập.
- Count và phần trăm CSR/ESR khớp: 142/150, 147/150, 124/150, 135/150, 95/150, 142/150, 50/150 và 130/150 đều được làm tròn đúng.
- Exact McNemar từ discordant pairs khớp số báo cáo: 5/0 → `p=0.0625`; 11/0 → `p=0.0009766`; 50/3 → `p≈5.52e-12`; 81/1 → `p≈3.43e-23`.
- Holm correction trong Table 2 nhất quán với các p-value được trình bày.
- Phần conditional analysis đã thận trọng phân biệt end-to-end reliability với quality khi cả hai treatment đều execute.

### Vấn đề cần sửa

1. **Mâu thuẫn về kiểm soát số test method.** Dòng 63 nói giữ cố định “number of generated test methods”, nhưng dòng 290/308 chỉ giữ `maximum limit of six`; dòng 381 cho thấy số method thực tế khác mạnh, đặc biệt DeepSeek 5.74 so với 2.92. Cần đổi claim thành “same cap” ở toàn bài hoặc thực hiện matched-method-count analysis.
2. **Structural-Target Satisfaction chưa có ground truth độc lập rõ ràng.** Dòng 290 nói có “same reference target set, determined independently before test generation”, nhưng không nêu ai/tool nào tạo target set, cách validation, độ tin cậy giữa annotator, tiêu chí match hay việc Planner có nhìn thấy chính target set đó không. Nếu target set được dẫn xuất bởi logic gần với PLANNED, metric có nguy cơ ưu ái treatment.
3. **N/A denominator không nhất quán với định nghĩa.** Dòng 310 nói invalid/non-compiling/non-executing nhận 0 và N/A chỉ dùng khi không có target/denominator hợp lệ. Tuy nhiên STS/BC n khác giữa DIRECT và PLANNED trên cùng DeepSeek target set (148/148 so với 141/140). Cần bảng reason code cho từng N/A và chứng minh missingness không phụ thuộc treatment.
4. **Sampling chưa mô tả.** Vì sao chọn 150 method từ 58/110 project, tiêu chí loại project/method, phân bố độ phức tạp và overlap với FullChain chưa có.
5. **Project clustering và stochastic variance chưa được mô hình hóa.** Tác giả đã thừa nhận điểm này, nhưng p-value method-level vẫn có thể quá lạc quan. Cần project-clustered bootstrap/permutation hoặc mixed/hierarchical analysis và nhiều seed.
6. Dòng 304 hứa báo 95% CI cùng effect size, nhưng RQ1 không có CI cho delta/effect size. Cần thống nhất reporting policy.

Kết luận RQ1 hiện tại khá thận trọng và có thể giữ sau khi làm rõ sáu điểm trên; đây là phần mạnh nhất của paper.

## P1 — Đánh giá RQ2

### Điểm tốt

- Core success 60/46/76 và W/T/L 21/72/7, 4/76/20 tự nhất quán.
- Exact McNemar thô từ 21/7 là `p≈0.01254`; từ 4/20 là `p≈0.001544`; các giá trị Holm 0.0752 và 0.0108 là khả dĩ trong family 10 tests được mô tả.
- Paper đã thừa nhận Changed LOC/adequacy chỉ là descriptive trên các success subset khác nhau.

### Vấn đề cần sửa

1. **100 fault units chưa có sampling frame.** Cần project-wise counts, bug IDs, failure taxonomy, inclusion/exclusion, cách lấy từ LIBRO--Defects4J và chứng minh ba treatment nhận cùng initial artifact.
2. Dòng 395 gọi “100 pairs”, nhưng có ba treatment trên mỗi unit; thuật ngữ đúng là 100 matched blocks/triplets, còn mỗi contrast mới tạo paired comparison.
3. **Budget không thực sự cứng.** Dòng 292/393 cho phép call cuối vượt 75,000 token. Cần báo số/độ lớn overshoot theo treatment; nếu không, “same repair budget” chưa được bảo đảm.
4. **Composite status che mất cơ chế thất bại.** CSV không có compilation outcome riêng; compile/pass/bug reveal/regression bị gộp. Điều này khiến paper không thể nói TRACE cải thiện bước nào và làm yếu construct validity.
5. **Câu “preserving 94% of protected tests” tại dòng 474 không suy ra từ 6/100 runs có regression.** Có thể nói “94% runs recorded no regression” nếu đúng; muốn nói phần trăm protected tests phải có tổng số protected tests và số test bị chuyển pass→fail.
6. **“RQ2 is partially supported” đang quá mạnh.** So với FTMR, không contrast nào còn significant sau Holm; so với FCR, TGSLR kém hơn đáng kể về success và cost; Changed LOC chỉ descriptive trên success subsets; CSV lại thiếu scenario conformance/structural target. Cách kết luận an toàn hơn: “RQ2 is not supported inferentially; results suggest a descriptive locality trade-off requiring confirmatory evaluation.”
7. Missing ToolFailed/ReportMissing/NotRun có thể không missing at random. Không nên chỉ complete-case mean; cần thêm worst-case/ITT sensitivity hoặc lý do missing theo treatment.

## P1 — Đánh giá RQ3

### Điểm tốt

- Paper công khai rằng gold set có AI assistance, chỉ một human annotator và DeepSeek set bị sửa hậu kiểm.
- Gemini counts tự nhất quán: FAR B1 = 15/26 = 57.69%; FAR B2 = 7/26 = 26.92%; coverage B2 = 60/73 = 82.19%; False-pass F1 B2 = `2×16/(2×16+8+10)=64%`.
- Kết luận chính dùng Gemini point estimates và không dùng repaired DeepSeek như confirmatory evidence.

### Vấn đề cần sửa

1. **Cohort-selection bias.** Từ 180 candidate chỉ giữ 73 case mà cả hai AI pass đồng ý mapping. Đây là một agreement-enriched/easier cohort, loại chính những trường hợp mơ hồ mà verifier cần xử lý. Phải báo flow diagram và sensitivity trên 180 case, không chỉ cohort 73.
2. **Gold standard chưa độc lập.** AI tham gia mapping/scenario và mutant relevance; chỉ một human adjudicator. Cần ít nhất hai annotator độc lập, adjudication protocol, agreement và holdout được freeze trước khi chạy B0/B1/B2.
3. **Metric chưa được định nghĩa bằng công thức.** Thiếu positive class, denominator và treatment của invalid/abstain cho FAR, False-pass F1, decision accuracy, coverage, selective accuracy, attribution Macro-F1 và routing accuracy. Nên cung cấp confusion matrix cho từng model/verifier.
4. **Table 8 trộn denominator.** Caption nói “on 54 REPAIR_REQUIRED cases”, routing percentages đúng là trên 54, nhưng abstention 17.81%, 12.33%, 23.29%, 53.42%, 39.73% lần lượt tương ứng 13/73, 9/73, 17/73, 39/73, 29/73 — tức denominator 73. Cần ghi rõ `overall abstention (n=73)` hoặc tính lại trên 54.
5. “219/219 valid outputs” tại dòng 561 chưa giải thích 219 là 73×3 specialist calls, có bao gồm B1/Aggregator hay không. Cần output accounting diagram.
6. Sáu DeepSeek rows bị thay sau freeze/gold scoring, trong đó bốn targeted rerun bằng model ID khác. Việc hạ xuống sensitivity analysis là đúng, nhưng bảng nên tách pre-repair và repaired set thay vì chỉ để repaired row ở bảng chính.
7. B2 khác B1 cả role decomposition lẫn số call/token; do đó RQ3 hiện đánh giá package B2, không xác định causal effect của specialization. Cần budget-matched ablation hoặc đổi wording contribution.
8. Các McNemar p bổ sung chưa hiệu chỉnh multiple testing và data clustered. Abstract chỉ nên gọi đây là exploratory descriptive evidence, không dùng ngôn ngữ causal “reduced” nếu không kèm phạm vi.

## P1 — Đánh giá FullChain so với EvoSuite

1. **FullChain và VSR xuất hiện trong abstract trước khi được định nghĩa.** Cần định nghĩa FullChain là cấu hình tích hợp cụ thể của TRACE và định nghĩa Verified-Suite Rate trước khi dùng acronym.
2. **Khả năng overlap với RQ1.** Cả hai dùng 150 target từ 58 SF110 project. Cần nói rõ có phải cùng target hay không và liệu FullChain design/hyperparameter đã được điều chỉnh sau khi xem RQ1. Nếu cùng cohort, đây không phải external holdout.
3. **Thiếu cấu hình EvoSuite.** Chỉ có version 1.2.0 và timeout; cần command đầy đủ, search budget, criterion, assertion strategy, sandbox/memory/JDK, flaky handling, seed mapping và cách ghép focal method.
4. **Gate neutrality chưa được chứng minh.** B2 được thiết kế quanh scenario--test conformance của TRACE nhưng lại làm primary delivery gate cho cả EvoSuite. Treatment blinding không tự động loại construct bias. Cần mô tả cách EvoSuite được tạo neutral scenario mapping/evidence envelope, hoặc dùng gate thuần tool làm primary và B2 làm secondary safety analysis.
5. **VSR = CSR = ESR cho cả hai treatment.** Điều này cho thấy CSR/ESR trong Table 10 là post-delivery/post-verifier outcomes, không còn là raw compilation/execution success. Không nên gọi chúng như metric độc lập nếu candidate compile/execute nhưng bị B2 reject bị ghi 0. Hãy đổi tên thành delivered-CSR/delivered-ESR và báo raw candidate CSR/ESR riêng.
6. Holm family chứa các outcome lặp hoàn toàn CSR/ESR/VSR. Việc này không tạo false positive nhưng làm testing family thiếu ý nghĩa; nên xác định một primary delivery outcome và các secondary raw outcomes không trùng.
7. **Resource fairness/cost chưa đủ.** FullChain có hai repair rounds và 37.6M provider tokens; EvoSuite không có LLM generation nhưng vẫn đi qua B2, nên B2 token của phía EvoSuite phải tồn tại. “EvoSuite provider-token total was not reported” làm mất cost comparison. Cần tách generation, repair, verification tokens/latency cho từng treatment cùng CPU/memory.
8. “global wall-clock limit of 900 seconds” cần nói rõ là per target-repetition-treatment hay toàn campaign.
9. Table 11 không nêu denominator/missing policy của candidate metrics. Cần count candidate hợp lệ và ITT version trước gate.
10. Campaign ID chỉ là chuỗi trong paper. Cần anonymous immutable artifact/release và manifest để chứng minh “prespecified”/“Official”.

Kết quả 248/450 so với 130/450, chênh 26.22 điểm phần trăm và decomposition 148/30/100/172 là tự nhất quán. Tuy nhiên, với các điểm 3--7 chưa giải quyết, kết luận chỉ nên là “integrated delivered-system result under this TRACE-specific evaluation contract”, không phải bằng chứng trung lập rằng phương pháp sinh test tốt hơn EvoSuite.

## P2 — Phương pháp và cách trình bày cần bổ sung

- `f_analyze`, `P_struct`, `G_trace`, `f_aggregate`, `f_repair_local` hiện là notation/tuple definitions, chưa phải thuật toán có thể cài đặt. Nên thêm pseudocode và schema cụ thể.
- “fixed decision schema” tại dòng 230 là thành phần quyết định của Contribution 3 nhưng schema/precedence/conflict rules/thresholds không được công bố.
- Cần bảng cấu hình cho từng experiment: provider, exact immutable model snapshot, access date, temperature/top-p/thinking level, seed semantics, context/output limit, prompt hash, retry policy. Model alias có thể thay đổi: tài liệu DeepSeek ngày 2026-09-10 cho biết `deepseek-v4-flash` đã route sang V4.1 Flash; chỉ ghi “DeepSeek V4 Flash” không đủ tái lập. Nguồn: [DeepSeek changelog](https://api-docs.deepseek.com/updates/) và [Google Gemini model IDs](https://ai.google.dev/gemini-api/docs/interactions-overview).
- Cần định nghĩa exact AST/CFG extraction tool, branch/exception representation, equivalent mutant policy, PIT mutators/timeouts, JaCoCo scope và tsDetect version.
- Nên thêm section “Threats to Validity” có bốn nhóm: construct, internal, external, conclusion/reliability validity. Hiện các caveat bị rải rác nên reviewer khó đánh giá.
- Novelty claims “not yet addressed” tại dòng 51/77/81 cần được hạ thành “we did not find...” hoặc dựa trên search protocol rõ ràng, đặc biệt khi citation mapping hiện sai.
- Một số thuật ngữ dễ gây hiểu sai: `proprietary test method` nên là `owned test method`; “parallel relationship” nên là `bijective mapping`; “logic runs” cần định nghĩa; `Official campaign` không nên viết hoa nếu không phải tên protocol đã đăng ký.
- Phần Introduction/Methodology lặp contribution nhiều lần; có thể rút các tuple giải thích hiển nhiên để dành chỗ cho protocol, dataset và validity.

## Tính nhất quán giữa `.tex` và PDF

- PDF hiện tại chứa đúng các kết quả mới nhất của source: abstract có FullChain, Section 4.6, Conclusion và 25 references.
- SHA-256 PDF khớp `BUILD_RECORD.md`; SHA-256 của source/bib sau chuẩn hóa CRLF→LF cũng khớp record.
- Không phát hiện mâu thuẫn nội dung giữa `.tex` và text trích xuất từ PDF. Các vấn đề trong báo cáo này nằm ở nội dung khoa học/citation chứ không phải lệch source–PDF.

## Những điểm mạnh nên giữ

- Cấu trúc ba contribution ↔ ba RQ dễ theo dõi.
- Phân biệt raw tool evidence với LLM inference là một framing tốt.
- RQ1 tách end-to-end score và paired-executed conditional quality.
- Có effect size, multiple-testing correction và các caveat về single run/project clustering.
- RQ2 không che giấu việc FCR có success/cost tốt hơn.
- RQ3 công khai repaired artifact, invalid outputs, abstention và human-label limitation.
- FullChain section dùng ITT và tránh complete-case deletion khi campaign không có MissingEvidence.
- Abstract và Conclusion không tuyên bố universal superiority; phạm vi kết luận nhìn chung được giới hạn đúng.

## Thứ tự sửa đề xuất

1. Dừng chỉnh prose; khóa lại 25 references bằng nguồn gốc và sửa toàn bộ citation mapping.
2. Xuất anonymous empirical release cho RQ1--RQ3 và FullChain, kèm manifest/hash/tool lock/analysis scripts.
3. Viết metric dictionary và confusion matrices; sửa denominator Table 8.
4. Sửa protocol RQ1: same cap vs same count, target-set construction, N/A reasons, clustering/multi-seed.
5. Hạ kết luận RQ2 hoặc chạy confirmatory study có scenario conformance/structural target và strict budget.
6. Làm lại RQ3 trên independent holdout với hai human annotators và budget-matched ablation.
7. Chứng minh B2 gate trung lập cho EvoSuite, báo raw candidate CSR/ESR và cost đầy đủ hai phía.
8. Thêm Threats to Validity, exact configuration table và artifact-availability statement.
9. Sau khi số liệu/artifact đã khóa, cập nhật lại Abstract, Tables, Conclusion và rebuild PDF.

## Phán quyết cuối

- **Ý tưởng/kiến trúc:** có tiềm năng và trình bày tương đối mạch lạc.
- **Tính nhất quán số học từ các count được báo:** nhìn chung đạt; chưa kiểm chứng được raw data.
- **Citation integrity:** không đạt, cần sửa hệ thống.
- **Reproducibility từ repository hiện tại:** không đạt.
- **Độ mạnh của bằng chứng RQ1:** khá nhất nhưng cần cluster/multi-seed và làm rõ construct.
- **Độ mạnh của bằng chứng RQ2:** descriptive, chưa hỗ trợ inferential cho contribution.
- **Độ mạnh của bằng chứng RQ3:** exploratory; chưa đủ xác nhận Contribution 3.
- **FullChain–EvoSuite:** kết quả nội bộ nhất quán nhưng evaluation contract/fairness chưa đủ để kết luận trung lập.
- **Khuyến nghị submission:** Major Revision trước khi gửi.
