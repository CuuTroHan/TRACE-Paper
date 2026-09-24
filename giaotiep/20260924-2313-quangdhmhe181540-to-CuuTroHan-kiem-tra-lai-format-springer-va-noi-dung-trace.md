# Kiểm tra lại format Springer/ISSE và nội dung bản thảo TRACE

- **Người gửi:** quangdhmhe181540
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-24 23:13 (Asia/Ho_Chi_Minh)
- **Commit được kiểm tra ban đầu:** `70e6ac63bc3f9cb9be52cde3b9cd602a34a517e9`
- **Cập nhật sau khi pull:** `9de2d0f` đã điền năm tác giả, e-mail, affiliation chung và PDF metadata; các nhận xét dưới đây đã được cập nhật tương ứng
- **Bản thảo:** `trace-paper.tex`, `trace-paper.pdf`
- **Tài liệu hỗ trợ:** `trace-references.bib`, `BUILD_RECORD.md`, `CITATION_AUDIT.md`, `RQ3_PROVENANCE.md`, `Fig1.png`
- **Chuẩn đối chiếu:** Springer Nature article template tháng 12/2024 và hướng dẫn hiện hành của *Innovations in Systems and Software Engineering* (ISSE)

## 1. Kết luận tổng thể

Bản thảo đang dùng **đúng họ template Springer Nature và đúng cấu hình hai cột mà ISSE khuyến nghị**. PDF 27 trang có dàn trang ổn định, không thấy chữ/bảng bị cắt, không có marker `??`, toàn bộ font được nhúng và các trích dẫn/tham chiếu nội bộ đều phân giải được.

Các thay đổi mới cũng đã cải thiện đáng kể logic báo cáo: compute confounding của RQ1, missingness khác denominator, quy tắc aggregate của RQ3, provenance của RQ3 và hạn chế của TRACE-specific gate trong FullChain--EvoSuite đều đã được nói rõ hơn.

Tuy nhiên, kết luận cuối vẫn là **Major Revision / chưa submission-ready**. Các blocker chính là:

1. đã có danh sách tác giả nhưng chưa chỉ định corresponding author, affiliation còn thiếu city/đơn vị chi tiết và sáu mục cuối bài vẫn là placeholder;
2. Abstract đang ở sát giới hạn và chứa abbreviation chưa được định nghĩa;
3. Figure 1 chỉ đạt khoảng 244 dpi ở kích thước đặt trong PDF, thấp hơn yêu cầu production artwork;
4. 11 tài liệu vẫn là arXiv-only và chưa chứng minh trạng thái published/accepted;
5. empirical package chưa được phát hành nên số liệu RQ1, RQ2 và FullChain chưa thể tái kiểm chứng độc lập;
6. một số câu trong Abstract/Conclusion vẫn mạnh hơn mức bằng chứng của thiết kế;
7. fairness của FullChain--EvoSuite chưa được giải quyết bằng evaluator-neutral gate và raw pre-gate metrics.

## 2. Đối chiếu trực tiếp với template chính thức

### 2.1. Xác minh bộ template

Đã tải lại ZIP chính thức từ trang Springer Nature LaTeX Author Support và so sánh với repo:

- `sn-jnl.cls`: trùng byte-for-byte với bản chính thức;
- `sn-article.tex`: trùng byte-for-byte với bản chính thức;
- `sn-basic.bst`: nội dung trùng bản chính thức, chỉ khác line ending CRLF/LF;
- phiên bản template: 3.1, December 2024.

Nguồn chính thức:

- Springer Nature LaTeX Author Support: <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
- ISSE Submission Guidelines: <https://link.springer.com/journal/11334/submission-guidelines>

Khai báo hiện tại:

```latex
\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
```

phù hợp với khuyến nghị của ISSE về Springer Nature template, numeric citation và lựa chọn `[iicol]`.

### 2.2. Các điểm format đã đạt

| Hạng mục | Kết quả | Nhận xét |
|---|---|---|
| Springer Nature class | Đạt | Dùng đúng `sn-jnl` chính thức |
| Hai cột | Đạt | Có option `iicol` |
| Citation style | Đạt | `sn-basic`, đánh số trong ngoặc vuông |
| Heading depth | Đạt | Nội dung chính chỉ dùng section/subsection/subsubsection, không vượt ba cấp |
| Keywords | Đạt | Có đúng 6 keywords, nằm trong giới hạn 4--6 |
| Citation keys | Đạt kỹ thuật | 38 key được cite, 38 BibTeX entries, không thiếu và không thừa |
| Labels/references | Đạt kỹ thuật | 69 labels, không duplicate, không có reference tới label không tồn tại |
| Figure/table numbering | Đạt | 1 figure và 12 tables đều có caption/label và được dẫn chiếu |
| PDF page size | Đạt | 27/27 trang đều là A4, 595.28 x 841.89 pt |
| PDF overflow | Đạt | Không phát hiện text block nằm ngoài page box; rà trực quan không thấy bảng/chữ bị cắt |
| PDF font | Đạt | 20 font resources đều là Type 1 và đều embedded sau khi bổ sung font tiếng Việt |
| PDF metadata | Đạt sau pull | Title, Author, Subject và Keywords đã được điền ở commit `9de2d0f` |
| Broken marker | Đạt | Không thấy `??` hoặc replacement character trong text layer |
| Build record | Khớp | PDF hash và normalized-LF hash của TeX/Bib khớp `BUILD_RECORD.md` |

### 2.3. Giới hạn của kiểm tra build

Môi trường hiện tại không có `pdflatex` và `bibtex` trên PATH, nên chưa thực hiện được fresh build độc lập. Kết luận dàn trang/build dựa trên:

- committed PDF;
- kiểm tra hash;
- kiểm tra cấu trúc TeX/Bib;
- kiểm tra text layer, page box, font embedding;
- render và rà trực quan toàn bộ 27 trang;
- build record do môi trường MiKTeX trước đó tạo.

Không nên diễn đạt bước kiểm tra này thành “đã tái build độc lập trên môi trường submission”.

## 3. Các lỗi format/submission còn lại

### 3.1. P0 -- Author metadata đã được điền nhưng chưa hoàn tất

Commit `9de2d0f` đã thay placeholder bằng năm tác giả, năm e-mail `@fpt.edu.vn` và affiliation chung `FPT University, Vietnam`. Tên tiếng Việt hiển thị có dấu và PDF metadata đã được điền; đây là thay đổi đúng.

Các việc còn thiếu trước submission:

1. chưa có tác giả nào dùng `\author*`, nên chưa chỉ định corresponding author;
2. affiliation chưa có city và chưa có khoa/bộ môn/cơ sở chính thức;
3. cần xác nhận cách ghi English affiliation chính thức của FPT University;
4. thêm ORCID nếu có.

ISSE dùng single-blind review và yêu cầu tên tác giả, affiliation, city/country và một active e-mail của corresponding author. Vì vậy, phần author metadata đã tiến bộ rõ nhưng vẫn chưa hoàn tất theo submission checklist.

### 3.2. P0 -- Statements and Declarations chưa hoàn thành

Heading `Statements and Declarations` đã đúng theo journal, nhưng còn sáu chuỗi `To be completed by the authors`:

- Acknowledgements;
- Funding;
- Competing interests;
- Data availability;
- Code availability;
- Author contributions.

ISSE nói rõ original research phải có Data Availability Statement và submission thiếu declaration phù hợp có thể bị trả lại vì chưa hoàn chỉnh. Nếu không có Acknowledgements thì bỏ mục hoặc ghi theo quyết định của tác giả; không để placeholder. Funding/Competing Interests/Author Contributions phải do tác giả xác nhận, không được AI tự điền.

Nếu LLM/AI được dùng để tạo nội dung học thuật của manuscript ngoài phạm vi copy editing, tác giả cũng cần quyết định và khai báo đúng chính sách Springer; không được tự suy đoán rằng không cần disclosure.

### 3.3. P0 -- Abstract có rủi ro vượt giới hạn và abbreviation chưa định nghĩa

ISSE yêu cầu 150--250 từ. Script hiện cho:

- 245 từ khi coi từ ghép có gạch nối là một từ;
- 274 từ khi tách các thành phần gạch nối.

Do đó Abstract chỉ “đạt” dưới một cách đếm và có nguy cơ bị hệ thống submission báo vượt giới hạn. Nên rút xuống khoảng 220--230 từ.

Các abbreviation/identifier chưa được giải nghĩa rõ trong Abstract gồm `RQ1`, `RQ2`, `RQ3`, `SF110` và `N/A`. Câu `Three studies evaluated the components` cũng chưa phản ánh chính xác việc bài có ba component studies **và** một integrated exploratory comparison.

### 3.4. P0 -- Figure 1 chưa đạt chuẩn artwork

`Fig1.png` có kích thước 1536 x 1024 px. Trong PDF, hình được đặt rộng khoảng 453.54 pt, tương đương khoảng 160 mm, nên độ phân giải hiệu dụng chỉ khoảng **243.8 dpi**.

Đây là color/combination artwork có line và lettering. ISSE yêu cầu combination artwork tối thiểu 600 dpi; line art bitmap còn có yêu cầu cao hơn. Cần:

1. xuất lại từ source thiết kế thành EPS/PDF vector với font embedded; hoặc
2. nếu buộc dùng bitmap, xuất ở kích thước in cuối với tối thiểu 600 dpi.

Caption hiện chỉ là `Overview of the TRACE framework`, chưa nhận diện đầy đủ các block, luồng và ký hiệu quan trọng. Nên mở rộng caption để hình có thể hiểu độc lập hơn.

### 3.5. P0 -- Reference eligibility chưa hoàn tất

ISSE yêu cầu reference list chỉ gồm công trình đã xuất bản hoặc đã được chấp nhận. Repo hiện ghi 11 key sau là arXiv-only:

`bib8`, `bib9`, `bib11`, `bib15`, `bib19`, `bib20`, `bib23`, `bib24`, `bib26`, `bib27`, `bib29`.

Trước submission, từng entry cần được:

1. thay bằng publisher version và DOI chính thức; hoặc
2. kèm bằng chứng accepted/in press; hoặc
3. loại bỏ/viết lại claim phụ thuộc nếu chưa đủ điều kiện.

Việc metadata arXiv đúng không đồng nghĩa với việc tài liệu đã đạt điều kiện reference của journal.

### 3.6. P1/P2 -- Các điểm format còn lại

- PDF metadata đã được điền ở commit `9de2d0f`; cần giữ đồng bộ nếu title, thứ tự tác giả hoặc keywords tiếp tục thay đổi.
- Title hiện dài và chiếm ba dòng; nên rút gọn để thông điệp chính rõ hơn.
- Nhiều bảng dùng `\scriptsize`; vẫn đọc được nhưng khá dày. Nên tối ưu column text và caption thay vì tiếp tục giảm font.
- Khi tạo submission ZIP, chỉ đưa các source được manuscript sử dụng. Không đưa `sn-article.tex/pdf`, `user-manual.pdf`, bibliography mẫu và demo assets nếu hệ thống không yêu cầu.
- Nên thử build submission ZIP trên môi trường sạch tương thích hệ thống nộp bài trước khi gửi.

## 4. Kiểm tra logic và tính nhất quán nội dung

### 4.1. Các điểm đã sửa đúng trong bản mới

1. **RQ1 compute confounding:** bài đã nói rõ PLANNED có thêm planning call và nhiều total inference compute hơn, nên đây là package-level comparison chứ không cô lập causal effect của plan representation.
2. **RQ1 missingness:** bài đã nêu DeepSeek STS/BC có denominator khác giữa treatment và aggregate thiếu N/A reason code; các mean này được gọi là descriptive.
3. **RQ2 claim level:** kết luận đã đúng hơn khi nói RQ2 không được hỗ trợ inferentially và chỉ cho thấy locality/traceability trade-off.
4. **RQ3 metric dictionary:** đã định nghĩa false-passing class, FAR, decision coverage, selective accuracy, bảy cause classes, route vocabulary và multiple acceptable routes.
5. **RQ3 aggregator:** thứ tự priority và điều kiện VERIFIED/ABSTAIN đã được mô tả đủ rõ hơn.
6. **RQ3 provenance:** đã thêm `RQ3_PROVENANCE.md` với path và SHA-256 của manifest, protocol, scorer, aggregator, CSV và metric JSON.
7. **FullChain framing:** section đã được đổi thành exploratory và nói rõ TRACE-specific gate chưa chứng minh construct-neutrality.
8. **Threats to Validity:** các hạn chế construct/internal/external/conclusion validity đã được trình bày khá thẳng thắn.

### 4.2. Kiểm tra số học nội bộ

Các phép tính có thể kiểm tra trực tiếp từ bảng đều nhất quán:

- RQ1: các count/percentage CSR và ESR khớp mẫu 150; aggregate count khớp tổng hai model; chênh lệch percentage point trong phần diễn giải khớp bảng.
- RQ1 Holm: thứ tự và adjusted p-value trong hai family năm metric khớp quy tắc Holm từ các p-value được báo cáo.
- RQ2: `21/72/7` cho TGSLR--FTMR tạo chênh lệch +14 success; `4/76/20` cho TGSLR--FCR tạo chênh lệch -16 success.
- RQ3: mọi hàng confusion matrix có `TP+FP+FN+TN=73`; False-pass F1 và FAR khớp các count được công bố.
- RQ3 routing delta: 24.08 điểm trên Gemini và 9.26 điểm trên DeepSeek/GLM khớp Table 8.
- FullChain: `248/450=55.11%`, `130/450=28.89%`, delta 26.22 điểm; `148+30+100+172=450`, đồng thời `148+100=248` và `30+100=130`.
- Hash PDF, normalized TeX và normalized Bib khớp `BUILD_RECORD.md`.

Kết luận: **không phát hiện lỗi số học nội bộ rõ ràng trong các bảng/chênh lệch chính**.

### 4.3. Ranh giới của việc kiểm chứng dữ liệu

| Study | Có thể kiểm tra từ repo | Chưa thể kiểm tra độc lập |
|---|---|---|
| RQ1 | Số học giữa bảng và diễn giải | 600 raw runs, target ledger, N/A reason codes, test scripts, clustering/sensitivity analysis |
| RQ2 | W/T/L, rates và descriptive differences | 300 raw runs, compile outcome, scenario conformance, structural target, oracle strength |
| RQ3 | Công thức, confusion arithmetic, table consistency | CSV/JSON gốc và exact scoring run trong môi trường hiện tại |
| FullChain | Count/rate arithmetic và paired-count identities | 900 terminal records, raw pre-gate CSR/ESR, tool lock, gate neutrality, analysis script |

`RQ3_PROVENANCE.md` là cải thiện đúng hướng nhưng chưa phải replication package. Các file được ghi ở `R:\BaoVer2`; ổ `R:` không được mount trong môi trường kiểm tra hiện tại và artifact không nằm trong Git repository, nên hash/provenance chưa thể được xác minh độc lập ở đây.

### 4.4. Các vấn đề logic còn phải sửa

#### A. Abstract và Conclusion vẫn còn wording mạnh hơn thiết kế

Abstract viết `planning increased ...`, còn Conclusion viết `show that Structural Planning clearly improves ...`. Hai câu này dễ được đọc như causal claim, trong khi chính Methods/Threats thừa nhận:

- PLANNED có thêm call và gần gấp đôi token;
- không equal-compute;
- mỗi unit chủ yếu chỉ chạy một lần;
- chưa xử lý project clustering đầy đủ;
- STS/BC có differential missingness.

Nên dùng nhất quán:

> The PLANNED package was associated with higher observed end-to-end reliability within the evaluated configurations, at higher inference cost.

Không nên dùng `planning increased` hoặc `clearly improves` nếu chưa có equal-compute baseline.

#### B. RQ1 chưa cô lập contribution của plan representation

Thiết kế hiện so sánh DIRECT với `planning + additional call + additional tokens`. Điều này hợp lệ như package comparison nhưng chưa chứng minh riêng structural plan tạo ra hiệu quả. Cần một trong hai:

1. thêm equal-call/equal-token DIRECT baseline; hoặc
2. định vị contribution hoàn toàn ở mức integrated planning package và bỏ causal language.

Ngoài ra, cần phát hành cách tạo independent reference target set cho STS, scenario-selection policy và N/A reason codes.

#### C. RQ2 chưa đo đầy đủ chính cơ chế được đề xuất

CSV không có independent compilation field, scenario conformance, structural-target satisfaction hoặc oracle-strength evidence. Vì vậy experiment chưa kiểm tra toàn bộ TRACE acceptance contract và chưa chứng minh TGSLR tốt hơn FTMR/FCR.

Kết luận hiện tại đã thận trọng hơn, nhưng contribution nên được gọi là design mechanism cho locality/ownership/traceability, chưa phải superior repair method.

#### D. RQ3 vẫn là exploratory evidence có nhiều nguồn bias

- cohort 73 case được chọn sau agreement filtering từ 180 candidate;
- chỉ có một human annotator;
- 65/73 case là controlled injections, chỉ 8 natural cases;
- DeepSeek dùng repaired artifact sau freeze;
- GLM có nhiều invalid outputs;
- B2 có nhiều calls/tokens hơn B1 nên chưa cô lập role specialization.

Các limitation đã được nêu, đây là điểm tốt. Tuy nhiên, cần project-aware holdout khóa trước scoring, nhiều human annotators và equal-budget reviewer baseline trước khi xác nhận Contribution 3.

#### E. FullChain--EvoSuite vẫn có fairness/construct-validity risk cao

Các vấn đề chưa đóng:

1. B2 gate được thiết kế theo TRACE và chưa chứng minh evaluator-neutral với output EvoSuite;
2. STS contract có thể gần với planning representation của TRACE;
3. treatment blinding không ngăn model nhận ra code style/naming/scaffolding của EvoSuite;
4. không có raw pre-gate CSR/ESR;
5. scope của giới hạn 900 giây chưa được xác định rõ;
6. EvoSuite có 175 `generation_failure` và 139 record mang taxonomy `repair_exhausted`, tỷ lệ rất lớn và cần baseline/harness audit;
7. VSR, delivered CSR và delivered ESR bằng nhau do post-gate definition, không phải ba bằng chứng độc lập.

Vì vậy, FullChain result nên tiếp tục là **integrated exploratory delivered-system result**, không dùng để tuyên bố TRACE nhìn chung vượt EvoSuite.

#### F. Methodology vẫn chưa đủ cho reimplementation

Bài còn thiếu hoặc chưa phát hành:

- exact prompts và output schemas;
- model snapshot, temperature, decoding/retry parameters;
- pseudocode có thể triển khai cho Structural Planner và scenario selection;
- exact Maven/Gradle, JUnit, JaCoCo và PIT commands/configuration;
- source và procedure của independent STS reference target set;
- complete treatment configuration và tool/environment lock;
- analysis/statistical scripts cho RQ1, RQ2 và FullChain.

Các tuple/set equation hiện mô tả data model tốt nhưng chưa thay thế được algorithm/configuration cần cho reproduction.

#### G. Novelty claim cần search protocol hoặc wording hẹp hơn nữa

Các câu dạng `we did not identify a framework...` đã được giới hạn bằng `among the approaches reviewed in this study`, nhưng bài chưa trình bày systematic search strategy. Nên:

- bổ sung search sources, query, date range và inclusion/exclusion criteria; hoặc
- tiếp tục hạ wording thành scope-limited observation, không phải exhaustive novelty claim.

## 5. Thứ tự sửa đề xuất

### P0 -- Phải hoàn thành trước submission

1. Chỉ định corresponding author; hoàn thiện city/khoa/cơ sở trong affiliation và thêm ORCID nếu có.
2. Hoàn tất Funding, Competing Interests, Data Availability, Code Availability và Author Contributions; xử lý Acknowledgements.
3. Rút Abstract xuống 220--230 từ, giải nghĩa/bỏ abbreviation chưa định nghĩa và đổi causal wording.
4. Xuất lại Figure 1 dạng vector hoặc artwork tối thiểu 600 dpi; mở rộng caption.
5. Xử lý 11 arXiv-only references theo publisher/acceptance status.
6. Tạo submission ZIP tối giản và test build trong môi trường sạch.

### P1 -- Cần làm để giảm nguy cơ major review/reject

1. Phát hành immutable empirical package có DOI/persistent identifier, license, hash manifest và README tái chạy.
2. Phát hành prompts/configs/tool lock/scoring/analysis scripts.
3. Audit FullChain--EvoSuite bằng evaluator-neutral gate, raw pre-gate metrics và baseline configuration/harness report.
4. Đổi wording RQ1 ở Abstract/Conclusion sang association/package-level evidence.
5. Bổ sung equal-compute baseline cho RQ1 và equal-budget baseline cho RQ3 nếu có thể.
6. Bổ sung project-clustered/hierarchical analysis và nhiều stochastic repetitions.

### P2 -- Nâng chất lượng trình bày

1. Rút title và các đoạn lặp lại pipeline/contributions.
2. Giữ PDF metadata đồng bộ với title, thứ tự tác giả và keywords cuối cùng.
3. Tối ưu bảng dày và captions/notes để tự chứa hơn.
4. Thêm bảng evidence map: contribution, dataset, supported claim, unsupported claim, limitation.

## 6. Phán quyết cuối

- **Đúng template Springer Nature/ISSE ở cấp class, layout và bibliography mechanics:** Có.
- **PDF có lỗi dàn trang rõ ràng:** Không phát hiện.
- **Các bảng chính có nhất quán số học nội bộ:** Có.
- **Đã xác minh độc lập toàn bộ số liệu từ raw artifacts:** Chưa.
- **Nội dung đã thận trọng và logic hơn bản trước:** Có.
- **Đủ điều kiện submission ngay:** Chưa.

Khuyến nghị giữ trạng thái **Major Revision**. Bước quan trọng nhất không còn là chỉnh LaTeX cơ bản mà là hoàn tất metadata/declarations, artwork, reference eligibility, replication package và giảm claim cho đúng sức mạnh của experimental design.
