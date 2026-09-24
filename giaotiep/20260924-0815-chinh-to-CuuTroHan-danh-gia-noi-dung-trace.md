# Đánh giá nội dung bản thảo TRACE

- **Người gửi:** chinh
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-24 08:15 (Asia/Ho_Chi_Minh)
- **Phạm vi kiểm tra:** `trace-paper.tex`, `trace-paper.pdf`, `trace-references.bib`, `CITATION_AUDIT.md`, `BUILD_RECORD.md` và các phản biện trước trong thư mục `giaotiep/`
- **Bản được đánh giá:** PDF 25 trang và nguồn LaTeX tại commit hiện hành
- **Mức đánh giá đề xuất:** **Major Revision — chưa nên nộp ngay**

## 1. Kết luận tổng quan

Bản thảo đã có câu chuyện nghiên cứu tương đối rõ: Structural Planning, Traceability-Guided Scenario-Local Repair và Tool-Grounded Specialized Multi-Agent Verification được nối với ba câu hỏi nghiên cứu và một đánh giá hệ thống tích hợp. Abstract, các bảng kết quả và Conclusion nhìn chung cùng phản ánh một thông điệp. Phần RQ2 đã được hạ giọng đúng mức, không che giấu việc Full-Class Regeneration có tỷ lệ thành công và chi phí tốt hơn TGSLR. Các count và tỷ lệ phần trăm chính được trình bày tương đối nhất quán, còn PDF không có lỗi dàn trang nghiêm trọng như chữ chồng, bảng bị cắt hoặc font không đọc được.

Tuy nhiên, nhận định rằng bản thảo đã hoàn thiện khoảng 95% là quá lạc quan nếu tính cả tính hợp lệ của phép đo và khả năng kiểm chứng thực nghiệm. Bản hiện tại còn bốn nhóm vấn đề đáng kể:

1. Định nghĩa metric RQ3 mâu thuẫn với chính các con số trong bảng.
2. RQ1 có số lượng quan sát N/A khác nhau giữa hai treatment dù tuyên bố dùng cùng reference target set.
3. So sánh FullChain--EvoSuite sử dụng một verification gate hướng theo TRACE và chưa chứng minh tính trung lập với EvoSuite.
4. Repository chưa có empirical package cần thiết để kiểm chứng độc lập các bảng và phép kiểm định.

Các vấn đề này ảnh hưởng trực tiếp đến kết luận khoa học, không chỉ là lỗi diễn đạt hoặc định dạng.

## 2. P0 — Các vấn đề cần xử lý trước khi nộp

### 2.1. RQ3 có mâu thuẫn giữa định nghĩa decision accuracy, coverage và selective accuracy

Tại [`trace-paper.tex:291`](../trace-paper.tex#L291), bản thảo viết rằng invalid output và abstention được báo cáo riêng, không được coi là quyết định đúng. Tuy nhiên, các số liệu trong Table 6 không thỏa mãn định nghĩa này.

Ví dụ với Gemini B2:

- Coverage = 82.19% = 60/73 quyết định được covered.
- Selective accuracy = 70.00% = 42/60 quyết định covered là đúng.
- Nếu abstention không được tính là đúng, decision accuracy trên toàn bộ 73 case phải là 42/73 = 57.53%.
- Table 6 lại báo 65.75% = 48/73.

Như vậy có thêm sáu trường hợp đang được tính là đúng ngoài 42 quyết định covered. Khả năng hợp lý nhất là một số abstention trùng với gold abstention và đã được tính đúng trong decision accuracy, trái với mô tả tại dòng 291. Hiện tượng tương tự xuất hiện ở DeepSeek B1 và các hàng GLM.

**Yêu cầu sửa:**

- Công bố công thức chính xác cho decision accuracy, decision coverage và selective accuracy.
- Nói rõ một abstention có thể là một lớp dự đoán đúng hay chỉ là quyết định không được covered.
- Thêm confusion matrix hoặc ít nhất bảng count cho từng loại quyết định.
- Tính lại Table 6 nếu câu tại dòng 291 mới là định nghĩa mong muốn; ngược lại, sửa phần định nghĩa để phản ánh phép tính thực tế.

### 2.2. RQ1 có differential missingness và aggregate mean chưa so sánh cùng cohort

Tại [`trace-paper.tex:279`](../trace-paper.tex#L279), bản thảo nói DIRECT và PLANNED được tính Structural-Target Satisfaction trên cùng reference target set, được xác định độc lập trước khi sinh test. Tại [`trace-paper.tex:299`](../trace-paper.tex#L299), invalid, non-compiling và non-executing run được gán 0; N/A chỉ dùng khi không có target hoặc denominator hợp lệ.

Tuy nhiên, [`trace-paper.tex:326`](../trace-paper.tex#L326) báo số quan sát DeepSeek như sau:

- DIRECT: STS/BC = 148/148.
- PLANNED: STS/BC = 141/140.

Nếu reference target set và điều kiện denominator thật sự giống nhau, số N/A không nên thay đổi theo treatment. Chênh lệch này cho thấy missingness có thể phụ thuộc vào treatment hoặc quy trình đo, trong khi các run lỗi đã được tuyên bố là nhận 0.

Hệ quả là các giá trị aggregate như BC 43.51% của DIRECT và 70.58% của PLANNED được tính trên các tập quan sát khác nhau. Đây lại là một kết quả được đưa lên Abstract và Conclusion.

**Yêu cầu sửa:**

- Cung cấp reason code cho từng trường hợp N/A theo model và treatment.
- Giải thích vì sao cùng target set nhưng denominator khác nhau.
- Báo phân tích trên common paired cohort có dữ liệu ở cả hai treatment.
- Thêm sensitivity/ITT analysis, ví dụ gán 0 hoặc worst-case cho measurement missing nếu phù hợp với protocol.
- Không dùng aggregate delta làm headline cho đến khi differential missingness được giải quyết.

### 2.3. Structural-Target Satisfaction chưa đủ định nghĩa để tái lập

STS là metric trung tâm của RQ1 nhưng bản thảo chưa nói rõ:

- Ai hoặc công cụ nào tạo reference target set.
- Target được tạo từ AST/CFG, annotation thủ công hay kết hợp cả hai.
- Tiêu chí để kết luận một generated test đã satisfy target.
- Người kiểm định có blind với treatment hay không.
- Có kiểm tra độ tin cậy giữa các annotator hay không.
- Structural Planner có được nhìn thấy chính target set dùng để chấm hay không.

Nếu target set được tạo bằng logic gần với PLANNED, metric có nguy cơ ưu ái treatment. Cần một metric dictionary và protocol cụ thể trước khi xem STS là bằng chứng độc lập cho contribution.

### 2.4. FullChain--EvoSuite chưa bảo đảm tính trung lập của evaluation contract

[`trace-paper.tex:560`](../trace-paper.tex#L560) thừa nhận B2 gate hướng theo TRACE và chưa chứng minh construct-neutral đối với EvoSuite. Gate này phụ thuộc vào scenario conformance, mapping và các khái niệm mà test do EvoSuite sinh ra có thể không sở hữu theo cùng hình thức. Treatment blinding không tự động loại bỏ structural bias của evaluator.

Ngoài ra, giới hạn 900 giây chưa xác định rõ được áp dụng trên target--repetition--treatment hay ở phạm vi khác. FullChain có tối đa hai TGSLR round trong khi EvoSuite không có repair round. Việc so sánh vẫn có thể hợp lý ở cấp delivered system nếu tổng ngân sách thật sự ngang nhau, nhưng manuscript hiện chưa cung cấp đủ thông tin để xác nhận điều đó.

**Yêu cầu sửa:**

- Dùng evaluator trung lập không đòi hỏi artifact đặc thù của TRACE; hoặc
- Chứng minh B2 áp dụng tương đương cho output của hai hệ thống; hoặc
- Hạ FullChain--EvoSuite thành exploratory, luôn ghi rõ “under the TRACE-specific gate”.
- Làm rõ phạm vi time limit, tài nguyên phần cứng, command và cấu hình EvoSuite.
- Không coi delivered CSR, delivered ESR và VSR là ba bằng chứng độc lập khi chúng có cùng giá trị do định nghĩa gate.

### 2.5. Thiếu empirical package để kiểm chứng các kết quả

[`trace-paper.tex:277`](../trace-paper.tex#L277) và [`trace-paper.tex:637`](../trace-paper.tex#L637) công khai rằng các artifact thực nghiệm không có trong repository này. `BUILD_RECORD.md` cũng chỉ xác nhận quy trình build LaTeX, không xác nhận dữ liệu thực nghiệm.

Hiện chưa có các thành phần tối thiểu sau:

- Manifest của 150 SF110 targets và tiêu chí chọn mẫu.
- Repository revision của từng project.
- Raw ledger cho RQ1--RQ3.
- Danh sách 100 RQ2 fault units và mapping LIBRO--Defects4J.
- 180 RQ3 candidate cases, flow chọn 73 case và gold labels.
- Confusion matrices cho B0/B1/B2.
- FullChain--EvoSuite paired CSV và availability ledger.
- Prompt, model snapshot, decoding/thinking settings và configuration.
- Analysis scripts cho McNemar, Wilcoxon, Holm, bootstrap và permutation tests.
- Tool lock, seed manifest và SHA-256 manifest của raw artifacts.

Với một công trình lấy auditability và traceability làm đóng góp, thiếu empirical release là một điểm yếu nội tại, không chỉ là thiếu phụ lục.

### 2.6. Placeholder và declarations vẫn chặn submission

[`trace-paper.tex:26`](../trace-paper.tex#L26) vẫn dùng `First Author`, `author@example.com` và affiliation mẫu. Funding, competing interests, data availability, code availability và author contributions vẫn còn `To be completed by the authors` tại phần cuối bài.

Không nên tự suy đoán các thông tin này, nhưng nhóm tác giả phải hoàn tất trước khi nộp.

## 3. P1 — Lỗi nội dung và lập luận cần chỉnh

### 3.1. Citation TestAgent vẫn còn trỏ sai

Tại [`trace-paper.tex:151`](../trace-paper.tex#L151), câu nói về Requirement Planner của TestAgent đang dùng `\cite{bib7}`. `bib7` là bài *Test Intention Guided LLM-Based Unit Test Generation*; nguồn TestAgent trong bibliography là `bib23`.

Đây là lỗi còn sót sau citation audit và cần đổi thành `\cite{bib23}`.

### 3.2. Nhầm scenario với test method tại dòng 151

Cùng câu trên viết “TRACE fixes the implementation test $S_i$”. Theo toàn bộ ký hiệu của bài:

- $S_i$ là atomic scenario.
- $T_i$ là test method hiện thực scenario.

Câu đúng phải thể hiện TRACE sửa implementation/test method $T_i$, không phải sửa $S_i$.

### 3.3. RQ1 chưa cô lập được tác động của planning khỏi tác động của compute bổ sung

Hai treatment có cùng generation budget nhưng PLANNED có thêm planning call và dùng gần gấp đôi token. Vì vậy thiết kế hiện tại đo toàn bộ package “planning + thêm inference/context”, chưa cô lập việc biểu diễn structural plan khỏi lợi thế của compute bổ sung.

Để hỗ trợ claim về “individual impact of structural planning”, nên có một baseline budget-matched, chẳng hạn DIRECT được cấp thêm call/token tương đương nhưng không tạo structural plan. Nếu không thể chạy thêm, wording phải nói rõ đây là package-level planning ablation, không phải causal isolation hoàn chỉnh.

### 3.4. RQ3 có cohort-selection bias

Từ 180 candidate cases, nghiên cứu chỉ giữ 73 case mà hai lượt AI cùng xác nhận mapping và compatible focal method. Đây là một agreement-enriched cohort, có thể loại chính các case mơ hồ mà verifier phải xử lý trong thực tế.

Bản thảo đã thừa nhận RQ3 là exploratory nhưng vẫn nên:

- Có flow diagram 180 -> 149 agreement -> 73 final.
- Báo taxonomy cho các case bị loại.
- Thực hiện sensitivity analysis trên toàn bộ 180 case nếu có thể.
- Dùng holdout độc lập với ít nhất hai human annotators trong vòng confirmatory.

### 3.5. B2 chưa phải ablation riêng của role specialization

B2 khác B1 đồng thời ở số agent call, token budget, decomposition và aggregation policy. Do đó RQ3 đánh giá package B2 chứ chưa xác định causal effect riêng của specialized roles.

Cần budget-matched ablation hoặc đổi contribution claim từ “accuracy of specialization” thành “performance of the specialized-verification package under the evaluated budget”.

### 3.6. tsDetect được nhấn mạnh nhưng không được đánh giá

tsDetect xuất hiện trong pipeline và phần contribution như một nguồn evidence về test quality, nhưng các RQ và bảng kết quả không báo test-smell outcome. Nếu đây không phải phần được đánh giá, nên hạ vai trò của tsDetect trong contribution; nếu vẫn giữ, cần thêm metric và kết quả tương ứng.

### 3.7. Novelty claim đang tuyệt đối hơn phạm vi literature review

Các câu như “verification has not yet been separated...” hoặc các prior systems “do not publish...” là negative novelty claims trên một không gian nghiên cứu rộng, nhưng bài chưa có systematic search protocol.

Nên đổi sang cách diễn đạt có thể bảo vệ hơn, ví dụ:

> Among the approaches reviewed in this study, we did not identify a framework that jointly maintains immutable scenario ownership, independently provenance-linked verifier reports, and scenario-level repair routing.

### 3.8. Reporting policy chưa được áp dụng nhất quán

[`trace-paper.tex:293`](../trace-paper.tex#L293) nói kết quả được báo cùng effect size, 95% bootstrap CI và Holm correction. Tuy nhiên, không phải mọi nhóm kết quả đều có đầy đủ ba thành phần này; RQ1 không báo CI cho các delta/effect size và các kiểm định bổ sung của RQ3 không hiệu chỉnh multiple testing.

Nên giới hạn câu mô tả theo từng analysis family thay vì phát biểu như một chính sách chung cho toàn bài.

## 4. Những điểm làm tốt nên giữ

1. Abstract, RQ, bảng và Conclusion nhìn chung thống nhất về thông điệp.
2. RQ1 phân biệt end-to-end score với paired-executed conditional quality.
3. RQ2 kết luận “not supported inferentially” là phù hợp với kết quả sau Holm correction.
4. Bản thảo công khai repaired DeepSeek artifact, invalid outputs, abstention và giới hạn của gold labeling trong RQ3.
5. FullChain section sử dụng ITT và giữ lại các terminal failures thay vì chỉ phân tích successful cases.
6. Các count và tỷ lệ chính như CSR/ESR, RQ2 success, VSR và Gemini FAR có tính tự nhất quán số học.
7. PDF 25 trang không có lỗi trình bày nghiêm trọng; bảng và công thức nhìn chung đọc được.
8. Citation audit đã sửa phần lớn mapping sai và loại bỏ `\nocite` cưỡng ép.

## 5. Các điểm trình bày nhỏ

- “latest version of TRACE” tại [`trace-paper.tex:74`](../trace-paper.tex#L74) gợi ý có phiên bản trước nhưng bài không giải thích; có thể đổi thành “TRACE”.
- Figure 1 là ảnh raster khoảng 1536 x 1024; ở kích thước toàn trang mật độ hiệu dụng thấp hơn mức lý tưởng cho production. Nên lấy source SVG/PDF/draw.io nếu có.
- Trang chứa Figure 1 có nhiều khoảng trắng do float placement, nhưng đây chưa phải lỗi chặn nộp.
- PDF metadata hiện chưa có title/author/keywords đầy đủ.
- Nên có một mục `Threats to Validity` riêng thay vì phân tán phần lớn giới hạn trong các đoạn kết quả và Conclusion.

## 6. Thứ tự xử lý đề xuất

1. Chốt lại định nghĩa và tính toán các metric RQ3; sửa Table 6 cùng phần Measurement.
2. Truy nguyên toàn bộ N/A của RQ1; tính lại phân tích trên common cohort và sensitivity/ITT.
3. Viết đầy đủ định nghĩa STS và protocol tạo reference target set.
4. Quyết định lại vai trò của FullChain--EvoSuite: evaluator trung lập hoặc exploratory TRACE-specific comparison.
5. Xuất empirical package ẩn danh, có immutable version và hash manifest.
6. Sửa citation `bib7 -> bib23` và lỗi ký hiệu `$S_i -> T_i$` tại dòng 151.
7. Hạ các novelty/causal claims chưa được thiết kế hiện tại hỗ trợ.
8. Điền author metadata, declarations và tuyên bố sử dụng GenAI nếu chính sách journal yêu cầu.
9. Sau khi dữ liệu và định nghĩa đã khóa, cập nhật lại Abstract, Tables, Conclusion và build PDF cuối.

## 7. Phán quyết cuối

- **Ý tưởng và kiến trúc:** có tiềm năng, trình bày tương đối rõ.
- **Tính nhất quán số học bề mặt:** nhìn chung tốt, ngoại trừ mâu thuẫn metric RQ3.
- **Độ mạnh RQ1:** phần mạnh nhất, nhưng bị ảnh hưởng bởi differential missingness, STS construct validity và compute mismatch.
- **Độ mạnh RQ2:** descriptive; chưa hỗ trợ inferential cho ưu thế TGSLR.
- **Độ mạnh RQ3:** exploratory; chưa xác nhận riêng đóng góp của role specialization.
- **FullChain--EvoSuite:** kết quả nội bộ đáng chú ý nhưng chưa đủ trung lập để tuyên bố so sánh tổng quát.
- **Khả năng tái lập từ repository hiện tại:** chưa đạt do thiếu empirical package.
- **Khuyến nghị:** **Major Revision trước khi submission**.
