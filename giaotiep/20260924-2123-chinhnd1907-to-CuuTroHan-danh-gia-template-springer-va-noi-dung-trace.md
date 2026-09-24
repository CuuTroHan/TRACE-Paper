# Đánh giá template Springer/ISSE và nội dung bản thảo TRACE

- **Người gửi:** chinhnd1907
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-24 21:23 (Asia/Ho_Chi_Minh)
- **Bản thảo được đánh giá:** `trace-paper.tex`, `trace-paper.pdf`
- **Tài liệu liên quan:** `trace-references.bib`, `BUILD_RECORD.md`, `CITATION_AUDIT.md`, `RQ3_PROVENANCE.md`, `Fig1.png`
- **Phạm vi đối chiếu:** Springer Nature LaTeX template và hướng dẫn hiện hành của *Innovations in Systems and Software Engineering* (ISSE)

## 1. Kết luận chung

Bản thảo đã sử dụng đúng họ template Springer Nature và nhìn chung có chất lượng dàn trang tốt. PDF hiện tại gồm 27 trang A4, không quan sát thấy chữ hoặc bảng bị cắt, chồng lấn, tràn lề hay liên kết tham chiếu dạng `??`. Cấu trúc nghiên cứu, research questions, metrics và phần giới hạn kết luận đã được trình bày thận trọng hơn so với các phiên bản trước.

Tuy nhiên, bản thảo vẫn ở trạng thái **Major Revision / chưa submission-ready**. Các nguyên nhân chính gồm:

1. Metadata tác giả và nhiều declarations bắt buộc vẫn là placeholder.
2. Data/Code Availability chưa hoàn thành trong khi empirical package chưa được phát hành công khai.
3. Figure 1 không đạt yêu cầu độ phân giải production artwork của ISSE.
4. Abstract có nguy cơ vượt giới hạn 250 từ tùy quy tắc tách từ.
5. Có 11 tài liệu arXiv-only chưa chứng minh trạng thái published/accepted.
6. Các kết luận thực nghiệm vẫn chịu ảnh hưởng của compute confounding, project clustering, gold-set selection bias và TRACE-specific evaluation gate.

## 2. Đánh giá định dạng theo Springer/ISSE

### 2.1. Những điểm đã đạt

1. Source dùng Springer Nature LaTeX template phiên bản 3.1, December 2024.
2. Khai báo lớp:

   ```latex
   \documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
   ```

   phù hợp với khuyến nghị `[iicol]` của ISSE.
3. Bài dùng hệ thống trích dẫn đánh số và `sn-basic.bst`.
4. Có đúng 6 keywords, nằm trong giới hạn 4--6 keywords của journal.
5. Hệ thống heading không vượt quá ba cấp: section, subsection và subsubsection.
6. Figure và các bảng được đánh số, dẫn chiếu trong nội dung theo thứ tự.
7. Toàn bộ 38 bibliography entries đều được cite; không có citation key thiếu hoặc entry không được sử dụng.
8. Hash của PDF khớp `BUILD_RECORD.md`. Hash source và bibliography cũng khớp record sau khi chuẩn hóa CRLF về LF; chênh lệch hash thô trên Windows chỉ do line ending.

### 2.2. Lỗi chặn submission

#### A. Thông tin tác giả còn placeholder

Source vẫn chứa:

```latex
\author*[1]{\fnm{First} \sur{Author}}\email{author@example.com}
\affil*[1]{\orgdiv{Department}, \orgname{Institution},
  \orgaddress{\city{City}, \country{Country}}}
```

ISSE áp dụng single-blind review và yêu cầu tên tác giả, affiliation, quốc gia và email liên hệ hợp lệ. Cần thay toàn bộ placeholder trước khi nộp.

#### B. Statements and Declarations chưa hoàn chỉnh

Các mục sau vẫn ghi `To be completed by the authors`:

- Acknowledgements;
- Funding;
- Competing interests;
- Data availability;
- Code availability;
- Author contributions.

ISSE nêu rõ submission thiếu declarations phù hợp có thể bị trả lại như hồ sơ chưa hoàn chỉnh. Đặc biệt, original research phải có Data Availability Statement giải thích cách truy cập dữ liệu hỗ trợ kết quả.

#### C. Abstract sát hoặc vượt giới hạn

ISSE yêu cầu abstract từ 150 đến 250 từ. Script hiện tại cho hai kết quả:

- 245 từ nếu từ ghép có dấu gạch nối được tính là một từ;
- 274 từ nếu các thành phần được tách riêng.

Nên rút abstract xuống khoảng 220--230 từ để không phụ thuộc quy tắc đếm của submission system. Ngoài ra, `RQ1`, `RQ2`, `RQ3`, `N/A` và `SF110` cần được giải nghĩa hoặc viết lại vì abstract không nên chứa abbreviation chưa định nghĩa.

Abstract cũng nên đổi câu `Three studies evaluated the components` thành cách diễn đạt rõ hơn: ba component studies và một integrated exploratory comparison.

#### D. Figure 1 chưa đạt chuẩn production artwork

`Fig1.png` có kích thước 1536 x 1024 pixel. Khi đặt ở chiều rộng khoảng 174 mm, độ phân giải hiệu dụng chỉ khoảng 224 dpi. Đây là color/combination artwork có nhiều line và lettering, trong khi hướng dẫn ISSE yêu cầu combination artwork tối thiểu 600 dpi và ưu tiên vector EPS cho vector graphics.

Khuyến nghị:

1. Xuất lại từ source thiết kế gốc thành EPS/PDF vector với font embedded; hoặc
2. Nếu chỉ có bitmap, xuất tối thiểu 600 dpi ở đúng kích thước in cuối cùng.

Caption `Overview of the TRACE framework` cũng quá ngắn so với yêu cầu caption phải mô tả chính xác các thành phần quan trọng của hình.

#### E. Reference-status chưa phù hợp hướng dẫn journal

ISSE yêu cầu reference list chỉ chứa công trình đã xuất bản hoặc đã được chấp nhận. Các key sau đang được ghi nhận là arXiv-only:

`bib8`, `bib9`, `bib11`, `bib15`, `bib19`, `bib20`, `bib23`, `bib24`, `bib26`, `bib27`, `bib29`.

Trước khi nộp, cần thực hiện một trong ba phương án cho từng entry:

1. Thay bằng publisher version và DOI chính thức;
2. Cung cấp bằng chứng accepted/in press phù hợp;
3. Loại bỏ hoặc viết lại claim phụ thuộc vào tài liệu chưa đủ điều kiện.

Các nguồn web như JaCoCo, PIT và JUnit cũng nên có ngày truy cập nếu bibliography style cho phép.

### 2.3. Vấn đề nhỏ cần chỉnh

1. Title hiện khá dài và chiếm ba dòng ở trang đầu. Có thể rút gọn thành một title tập trung vào TRACE và ba cơ chế chính.
2. Một số bảng dùng `\scriptsize`; vẫn đọc được trên PDF nhưng caption và notes nên tự chứa đầy đủ hơn.
3. PDF metadata hiện chưa có title, author và keywords.
4. Khi tạo submission ZIP, chỉ nên đưa các source thực sự dùng. Không nên đưa `sn-article.tex/pdf`, `user-manual.pdf`, bibliography mẫu và các demo assets vào gói nộp.

## 3. Đánh giá nội dung khoa học

### 3.1. Điểm mạnh

1. Ba research questions được tách tương đối rõ theo planning, repair và verification.
2. Bản thảo không chỉ báo cáo p-value mà còn cung cấp effect size, Holm correction, missingness, abstention và cost trade-off.
3. Các kết luận RQ2 và RQ3 đã được hạ mức khẳng định phù hợp với bằng chứng.
4. Bài chủ động công khai các hạn chế quan trọng như:
   - PLANNED có thêm planning call và nhiều token hơn;
   - RQ1 chưa xử lý project clustering;
   - RQ3 chỉ là exploratory evaluation;
   - DeepSeek sử dụng repaired artifact;
   - FullChain dùng TRACE-specific gate chưa chứng minh construct-neutrality;
   - empirical artifacts chưa nằm trong manuscript repository.
5. Các bảng số liệu chính được trình bày nhất quán với phần diễn giải; các phép tính có thể kiểm tra từ count trong bảng không cho thấy sai số số học rõ ràng.

### 3.2. Vấn đề mức nghiêm trọng cao

#### A. Chưa có replication package công khai

Repository hiện không chứa đầy đủ:

- raw result records;
- target/cohort manifests cho toàn bộ nghiên cứu;
- prompt templates và model configurations;
- analysis/statistical scripts;
- scoring implementation cho RQ1, RQ2 và FullChain;
- exact tool/environment lock;
- availability ledger và canonical reports.

`RQ3_PROVENANCE.md` mới chỉ ghi đường dẫn và hash của một số artifact nằm ngoài repository. Hash chứng minh danh tính file nội bộ nhưng không giúp reviewer truy cập hoặc tái lập kết quả.

Đây là rủi ro lớn nhất đối với khả năng kiểm chứng Tables 1--12 và xung đột trực tiếp với Data Availability đang để trống. Cần phát hành một archive bất biến, có DOI hoặc persistent identifier, kèm license và hướng dẫn chạy.

#### B. Methodology chưa đủ chi tiết để tái triển khai TRACE

Nhiều phương trình hiện mô tả set/tuple và quan hệ dữ liệu hơn là thuật toán thực thi. Bài còn thiếu:

- pseudocode cho Structural Planner và scenario-selection policy;
- tiêu chí tạo, loại hoặc đánh dấu uncertain scenario;
- prompt/schema chính xác của Generator, specialist agents và repair agent;
- model snapshot, temperature và decoding parameters;
- retry/failure policy;
- exact build, JaCoCo và PIT commands/configurations;
- cách tạo independent reference target set cho STS;
- specification đầy đủ của acceptance and aggregation rules ngoài phần tóm tắt RQ3.

Nên chuyển các biểu thức mang tính mô tả sang bảng data schema và dành không gian cho pseudocode/algorithm có thể triển khai.

#### C. FullChain--EvoSuite có rủi ro fairness và construct validity

Các vấn đề chính:

1. Cả hai treatment đều đi qua B2 gate được thiết kế quanh TRACE; chưa chứng minh gate trung lập với output của EvoSuite.
2. STS sử dụng structural target contract gần với thiết kế planning của TRACE, có thể ưu tiên FullChain.
3. `Treatment-blinded` không đảm bảo verifier không nhận diện được code do EvoSuite sinh qua naming, scaffolding hoặc style.
4. Không có raw pre-gate CSR và ESR.
5. Phạm vi áp dụng giới hạn 900 giây chưa được mô tả đủ rõ.
6. EvoSuite có 175 `generation_failure` và 139 record mang label `repair_exhausted`; tổng số này rất lớn và cần chứng minh không phát sinh từ harness/configuration mismatch.
7. VSR, delivered CSR và delivered ESR có cùng giá trị do post-gate definition. Đây không phải ba nguồn thông tin độc lập và không nên được trình bày như ba bằng chứng riêng về ưu thế.

Kết quả FullChain chỉ nên được dùng như integrated exploratory result cho tới khi có evaluator-neutral gate, raw pre-gate metrics và baseline configuration audit.

### 3.3. Vấn đề theo từng research question

#### RQ1: Structural Planning

PLANNED sử dụng thêm một planning call và khoảng gấp đôi token so với DIRECT. Do đó, thiết kế hiện tại đánh giá `planning package + additional compute`, không cô lập causal effect của plan representation.

Kết luận phù hợp nhất là:

> Trong các cấu hình được đánh giá, package PLANNED liên quan đến độ tin cậy end-to-end tốt hơn nhưng với chi phí inference cao hơn.

Không nên kết luận rằng planning tự thân là nguyên nhân nếu chưa có equal-compute baseline, chẳng hạn DIRECT được cấp thêm refinement call hoặc token budget tương đương.

Ngoài ra:

- mỗi focal-method/model/treatment chỉ chạy một lần;
- chưa mô hình hóa project clustering;
- DeepSeek STS/BC có denominator khác giữa treatment;
- conditional adequacy trên DeepSeek yếu và không ổn định.

Trong ba component studies, RQ1 vẫn là phần có bằng chứng mạnh nhất, nhưng chỉ ở mức package-level association.

#### RQ2: Scenario-Local Repair

TGSLR đạt 60% core repair success, FTMR 46% và FCR 76%. Sau Holm correction:

- TGSLR không tốt hơn FTMR một cách có ý nghĩa thống kê;
- FCR tốt hơn TGSLR về success;
- FCR cũng có cost thấp hơn trong campaign hiện tại;
- lợi ích Changed LOC của TGSLR được tính trên các tập successful repairs khác nhau;
- regression difference không có ý nghĩa thống kê.

Vì vậy, RQ2 không xác nhận superiority của TGSLR. Contribution nên được định vị là cơ chế locality/ownership/traceability có tiềm năng kiểm soát edit scope, chưa phải phương pháp repair hiệu quả hơn các baseline.

#### RQ3: Specialized Multi-Agent Verification

RQ3 có các nguồn bias/confounding sau:

1. Cohort 73 case được chọn từ các case mà hai AI passes đồng thuận, tạo agreement-selection bias.
2. Chỉ có một human annotator nên không có human inter-rater reliability.
3. 65/73 case là controlled injections, chỉ 8 case tự nhiên.
4. DeepSeek dataset có các row được sửa/rerun sau freeze và chỉ phù hợp làm sensitivity evidence.
5. GLM có số lượng invalid outputs lớn.
6. B2 dùng nhiều specialist calls và token hơn B1, nên kết quả không cô lập giá trị của role specialization.

RQ3 nên tiếp tục được gọi là exploratory. Cần một holdout project-aware được khóa trước scoring, nhiều human annotators độc lập và một equal-budget reviewer baseline.

### 3.4. Statistical inference và reporting

1. Các component studies phần lớn dùng một stochastic run cho mỗi experimental unit. Inference hiện phản ánh khác biệt giữa targets/cases trong một realization cố định, chưa phản ánh between-run model variability.
2. Nhiều mẫu nằm trong cùng project nhưng RQ1--RQ3 chưa xử lý đầy đủ dependency theo project.
3. Các cụm từ `prespecified family` hoặc `according to the protocol` chưa thể kiểm chứng nếu protocol chưa được phát hành và timestamp/freeze chưa được chứng minh.
4. Nên bổ sung project-clustered bootstrap hoặc hierarchical model, nhiều seeds/runs và sensitivity analyses.

### 3.5. Framing, novelty và văn phong

1. Title và phần contributions đang đặt cả ba cơ chế ở mức tương đương, trong khi bằng chứng hiện tại chỉ mạnh tương đối ở RQ1; RQ2 không được hỗ trợ inferentially và RQ3 là exploratory.
2. Nên tách rõ:
   - design contributions được đề xuất;
   - component-level empirical evidence;
   - integrated exploratory evidence.
3. Related Work đưa ra các nhận định dạng `không có framework...` nhưng không có systematic search protocol. Nên tiếp tục dùng cách diễn đạt giới hạn như `among the approaches reviewed in this study`, hoặc bổ sung search strategy.
4. Introduction, Methodology và Conclusion lặp lại pipeline/contributions nhiều lần; có thể rút gọn đáng kể mà không mất thông tin.
5. Abstract đang chứa quá nhiều chi tiết số và caveat, làm thông điệp chính bị loãng.

## 4. Thứ tự xử lý đề xuất

### Mức P0 -- Phải hoàn thành trước submission

1. Điền author, affiliation, corresponding email và ORCID nếu có.
2. Hoàn thiện Funding, Competing Interests, Data Availability, Code Availability và Author Contributions.
3. Xử lý 11 arXiv-only references.
4. Xuất lại Figure 1 thành vector hoặc artwork đạt độ phân giải yêu cầu.
5. Rút abstract về khoảng 220--230 từ và xử lý abbreviation chưa định nghĩa.
6. Tạo submission ZIP chỉ chứa source thực sự cần thiết.

### Mức P1 -- Cần xử lý để giảm nguy cơ bị major review/reject

1. Phát hành replication package có DOI/persistent identifier.
2. Bổ sung implementation details, prompt/configuration appendix và analysis scripts.
3. Audit lại FullChain--EvoSuite về budget, harness, raw pre-gate metrics và gate neutrality.
4. Giảm mức claim của RQ2, RQ3 và integrated comparison ở Abstract/Introduction/Conclusion.
5. Chạy hoặc bổ sung equal-compute/equal-budget baselines.

### Mức P2 -- Nâng chất lượng trình bày

1. Rút title và phần lặp trong Introduction/Methodology/Conclusion.
2. Mở rộng caption Figure 1 và làm captions/notes của bảng tự chứa hơn.
3. Bổ sung PDF metadata.
4. Thêm bảng tóm tắt cho từng contribution: evidence level, supported metrics, unsupported claims và required follow-up.

## 5. Trạng thái kiểm tra kỹ thuật

- PDF hiện tại: 27 trang A4.
- Không thấy broken citation/reference marker trong PDF.
- Không có duplicate label trong source.
- 38 citation keys đều có bibliography entry; 38 bibliography entries đều được cite.
- Figure và tables không bị cắt hoặc chồng lấn khi render toàn bộ PDF.
- SHA-256 PDF khớp `BUILD_RECORD.md`:
  `26E69BFF148187D2AD7C116D554E97225F70354782CF28E221D66A2F08DF8D67`.
- Môi trường đánh giá hiện tại không có MiKTeX/TeX Live nên chưa thực hiện được một fresh build độc lập. Đánh giá compile-clean dựa trên committed PDF, hash consistency và `BUILD_RECORD.md`; đây không thay thế kiểm tra build trên submission environment.

## 6. Kết luận gửi người nhận

Bản thảo hiện có nền tảng trình bày tốt và đã chủ động công khai nhiều limitation quan trọng. Vấn đề còn lại không chủ yếu nằm ở LaTeX layout mà ở submission metadata, production artwork, reference eligibility, empirical release và sức mạnh của experimental design.

Khuyến nghị chưa nộp bản hiện tại. Sau khi hoàn thành P0, cần ưu tiên replication package và fairness audit của FullChain--EvoSuite trước khi chốt wording ở Abstract và Conclusion. Nếu không thể chạy thêm thí nghiệm, nên định vị bài là framework proposal với component evidence ở nhiều mức độ khác nhau, thay vì trình bày cả ba contribution như đã được xác nhận ngang nhau.
