# Phản biện toàn diện format Springer, nội dung, logic và tài liệu tham khảo của TRACE

- **Người gửi:** `quangdhmhe181540`
- **Người nhận:** `dungng2808`
- **Thời gian kiểm tra:** 2026-09-29 23:00 (Asia/Ho_Chi_Minh)
- **Commit được kiểm tra:** `bb78fdadf12bc94fa0d8e190d6030aafd3035730`
- **Bản thảo:** `paper/trace-paper.tex`, `paper/trace-paper.pdf`
- **Quy tắc giao tiếp:** `giaotiep/AGENTS.md`
- **Phạm vi:** kiểm tra chỉ đọc; không sửa manuscript, PDF, bibliography, dữ liệu hoặc kết quả thí nghiệm.

## 1. Kết luận của reviewer

**Đề nghị: Major Revision. Bản hiện tại chưa nên submit.**

Bản thảo đã tiến bộ rõ rệt so với snapshot ngày 25/09: dùng đúng class/style Springer Nature, title page đã có corresponding author, declarations đã được điền, các giới hạn của RQ1--RQ3 được công khai tốt hơn, PDF không có lỗi dàn trang rõ ràng và các phép tính chính không có mâu thuẫn số học.

Tuy nhiên, còn một vấn đề có thể ảnh hưởng trực tiếp đến độ tin cậy của kết quả trung tâm: dữ liệu TRACE--EvoSuite hiện tại mô tả campaign 420 giây, trong khi audit ngày 27/09 ghi nhận một archive khác của cùng campaign ID với toàn bộ 450 lệnh ở 60 giây. Kích thước ZIP, hash CSV, timeout và thời lượng đều đã thay đổi. Các file hiện tại tự nhất quán, nhưng chưa có manifest bất biến hoặc hồ sơ rerun đủ để xác thực việc thay thế. Nếu không giải quyết được lineage này, reviewer không thể coi kết quả 55.11% so với 28.89% là đã có provenance đạt yêu cầu.

Ngoài ra còn các lỗi submission cụ thể: abstract có thể bị đếm thành 258 từ, Figure 1 chỉ khoảng 244 dpi, Data/Code Availability chưa cung cấp cách truy cập, chưa có kiểm thử build bản hiện tại bằng `pdflatex`/TeX Live 2021, thiếu disclosure về việc dùng AI cho công việc vượt quá copy-editing, và bibliography có ít nhất ba lỗi tác giả/thứ tự tác giả.

## 2. Phạm vi và bằng chứng đã kiểm tra

Đã đọc đầy đủ sáu file giao tiếp ngày 27/09:

1. `20260927-0943-dungng2808-to-all-doi-chieu-audit-voi-trace-va-bang-chung.md`
2. `20260927-1016-dungng2808-to-all-cap-nhat-paper-va-thong-tin-can-bo-sung.md`
3. `20260927-1107-dungng2808-to-all-rq3-he-thong-2-xac-nhan-va-ton-dong.md`
4. `20260927-1132-CuuTroHan-to-dungng2808-kiem-tra-sua-rq3-qwen-thay-glm.md`
5. `20260927-1428-dungng2808-to-all-cap-nhat-doi-chieu-nguon-rq1.md`
6. `20260927-1456-dungng2808-to-all-chot-tac-gia-va-kiem-tra-evosuite.md`

Đã đọc toàn bộ 776 dòng của `trace-paper.tex`, toàn bộ 33 entry trong `trace-references.bib`, `BUILD_RECORD.md`, `RQ3_PROVENANCE.md`, các báo cáo trong `paper/verification/`, và render kiểm tra toàn bộ 29 trang PDF.

Đã đối chiếu với các nguồn chính thức:

- ISSE Submission Guidelines: <https://link.springer.com/journal/11334/submission-guidelines>
- Springer Nature LaTeX Author Support: <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
- Springer Nature article template December 2024: <https://cms-resources.apps.public.k8s.springernature.io/springer-cms/rest/v1/content/18782940/data/v12>
- Collection: <https://link.springer.com/collections/gagdfebeia>

Giới hạn của lần kiểm tra này: workspace hiện tại không có `R:\BaoVer2`, `results/` hoặc `experiments/` bên ngoài repository, cũng không có `pdflatex`, `bibtex` hoặc `tectonic` trên PATH. Vì vậy, có thể kiểm tra source, PDF, hash, báo cáo verification và tính nhất quán số học, nhưng không thể tái chạy thí nghiệm hoặc xác thực độc lập raw campaign.

## 3. Trạng thái sáu file giao tiếp ngày 27/09

| File | Đánh giá với bản hiện tại |
|---|---|
| 09:43 đối chiếu audit | Là snapshot trước sửa. Các nhận xét về RQ2 thiếu compilation/time đã được sửa; cảnh báo về Figure 1, clustering, gate neutrality và provenance vẫn còn giá trị. |
| 10:16 cập nhật paper | Phần lớn mô tả đúng lần sửa trung gian. Không còn là trạng thái cuối vì paper hiện có bảy tác giả, RQ3 đã đổi Qwen và FullChain đã đổi sang bộ 420 giây. |
| 11:07 audit GLM | Kết luận 87/219 output GLM không hoàn toàn hợp lệ có bằng chứng file rõ. Bản hiện tại đã bỏ GLM khỏi bảng chính; việc này được xử lý hợp lý. |
| 11:32 Qwen thay GLM | Các số Qwen trong paper hiện tại khớp note. Selection sau khi xem bốn run, suy giảm attribution và không tăng routing đã được công khai. Vấn đề selection bias vẫn còn và RQ3 chỉ nên được coi là exploratory. |
| 14:28 nguồn RQ1 | Việc nối 600 CSV rows với run artifacts và XML được ghi rõ. Cảnh báo nguồn token Gemini sau đó được thay bằng xác nhận của tác giả, nhưng chưa có audit provider độc lập. |
| 14:56 tác giả/EvoSuite | Phần tác giả đã bị supersede: note có sáu tác giả, paper hiện có bảy. Phần EvoSuite là bằng chứng lịch sử quan trọng: ZIP 9,855,551,047 byte, CSV hash `ec58...`, 450/450 command dùng 60 s và bốn timeout 120 s; nó mâu thuẫn với bộ 420 s hiện tại và chưa được giải thích bằng manifest/rerun record đầy đủ. |

Không có file giao tiếp nào ngày 27/09 tự nó mô tả đầy đủ bản paper hiện tại. Khi phản hồi review, cần dùng commit/hash hiện tại và ghi rõ file cũ nào đã bị thay thế.

## 4. Kiểm tra format Springer/ISSE

### 4.1. Các mục đạt

| Hạng mục | Kết quả |
|---|---|
| Template | `paper/sn-jnl.cls`, `paper/sn-basic.bst` và `template/sn-article.tex` trùng nội dung với gói Springer Nature December 2024 sau chuẩn hóa line ending. |
| Document class | `\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}`; có `iicol` đúng khuyến nghị ISSE. |
| Title page | Có bảy tác giả, hai affiliation, email và `\author*` cho Nguyen Thi Nguyet. PDF hiển thị corresponding author rõ ràng. |
| Keywords | 6 keywords, nằm trong giới hạn 4--6. |
| Heading | Tối đa `section/subsection/subsubsection`, đúng giới hạn ba cấp. |
| Citation | 33 citation key, 33 BibTeX entry; không thiếu và không có entry không dùng. Citation hiển thị dạng số. |
| Cross-reference | 69 label, không label trùng, không `\ref` thiếu. PDF không có `??`. |
| PDF | 29 trang A4; metadata title/author/subject/keywords đầy đủ; 25 font Type 1/CFF đều embedded; không Type 3. |
| Dàn trang | Đã xem toàn bộ 29 trang; không thấy clipping, overlap, text block ra ngoài trang hoặc bảng bị cắt. Font nhỏ nhất trong text/table khoảng 7 pt. |
| Declarations | Funding, competing interests, ethics, consent và author contributions đã có nội dung, không còn placeholder. |

Hash PDF hiện tại là `461465BF30CE09D3772E248B3955B283BEA2687E02E3ACBFE4D47C5005070039`, khớp `BUILD_RECORD.md`. Hash source trong build record là hash của nội dung LF-normalized (`EF60...`); checkout Windows dùng CRLF nên byte hash trực tiếp là `CDDF...`. Build record cần nói rõ quy ước chuẩn hóa để người kiểm tra không hiểu nhầm source không khớp.

### 4.2. Các mục chưa đạt hoặc còn rủi ro

#### F01 — Abstract chưa an toàn với giới hạn 250 từ

Script hiện tại đếm:

- 229 từ khi giữ compound có dấu gạch nối;
- 258 từ khi tách compound.

ISSE yêu cầu 150--250 từ. Vì cách đếm của submission portal chưa được kiểm tra, abstract hiện có nguy cơ vượt giới hạn. Cần rút xuống dưới 250 theo cách đếm bảo thủ; mục tiêu nên khoảng 230--240 kể cả khi tách từ ghép.

#### F02 — Figure 1 không đạt chuẩn artwork

Figure 1 là PNG 1536 x 1024 px, hiển thị khoảng 453.54 x 302.36 pt, tương đương khoảng 244 dpi. Springer yêu cầu combination artwork tối thiểu 600 dpi; chữ trong hình ở kích thước in cũng nhỏ hơn khuyến nghị 8--12 pt. Caption hiện đã mô tả tốt hơn, nhưng caption không khắc phục chất lượng file hình. Cần nguồn vector hoặc xuất lại hình ở kích thước/độ phân giải phù hợp.

#### F03 — Data/Code Availability chưa phải statement có thể dùng để submit

Hai câu hiện tại chỉ nói package đang được chuẩn bị và chưa chốt access/version. Hướng dẫn ISSE yêu cầu Data Availability Statement giải thích cách truy cập dữ liệu hỗ trợ kết quả, hoặc điều kiện truy cập nếu không public. Trạng thái hiện tại không giúp editor/reviewer truy cập dữ liệu và chưa đáp ứng mục tiêu của statement.

#### F04 — Chưa kiểm tra build bản hiện tại bằng môi trường submission

Build hiện tại dùng Tectonic/XeTeX; class option là `pdflatex`. Springer ghi Snapp biên dịch bằng TeX Live 2021 và yêu cầu source compile được bằng `pdflatex`. Một version cũ đã build bằng MiKTeX, nhưng chưa có bằng chứng bản source hiện tại build sạch bằng `pdflatex`/TeX Live 2021 trong ZIP tự chứa. Cần test đúng package sẽ upload.

#### F05 — Thiếu disclosure về AI hỗ trợ tạo/sửa nội dung và phân tích

Các file giao tiếp ghi Codex đã hỗ trợ kiểm tra, viết ghi chú và sửa manuscript/numerical reporting. Springer miễn khai báo cho copy-editing thuần túy, nhưng yêu cầu ghi trong Methods khi LLM tham gia vượt quá chỉnh ngữ pháp/phong cách. Với mức hỗ trợ được ghi lại ở đây, không nên coi toàn bộ là copy-editing. Cần mô tả công cụ, phạm vi sử dụng, phần con người kiểm tra và trách nhiệm cuối cùng; không liệt kê AI là tác giả.

#### F06 — Acknowledgements đặt ở backmatter

Hướng dẫn ISSE yêu cầu Acknowledgements ở một mục riêng trên title page. Source hiện đặt `\bmhead{Acknowledgements}` sau `\backmatter`. Cần kiểm theo đúng workflow/template của journal hoặc hỏi editorial office; ít nhất không nên coi vị trí hiện tại là đã chắc chắn đạt.

#### F07 — Một số điểm title page cần tác giả xác nhận

- Tên không dấu, thứ tự, affiliation, email và ORCID cần khớp hồ sơ nộp bài.
- `Viet Nam` và `Vietnam` đang dùng không thống nhất giữa hai affiliation.
- Dagger ghi cả bảy tác giả đóng góp ngang nhau, trong khi Nguyen Thi Nguyet còn có vai trò supervision bổ sung. Điều này không tự sai, nhưng câu “equal contribution” phải phản ánh đúng thực tế và được cả bảy người đồng ý.
- Submission đồng nghĩa tất cả đồng tác giả đã duyệt bản cuối; build record hiện chưa ghi nhận việc duyệt bản cuối của toàn bộ tác giả.

#### F08 — Dàn trang sạch nhưng còn điểm biên tập

Các bảng ở trang 20--23 dày và dùng cỡ chữ nhỏ, dù chưa thấy clipping. Trang 29 chỉ có references [28]--[33] ở cột trái và để trống phần lớn trang. Đây không phải lỗi compile, nhưng có thể tối ưu sau khi nội dung được khóa. Title dài và Introduction/Conclusion lặp lại contributions nhiều lần; nên biên tập gọn để giảm 29 trang và tải nhận thức cho reviewer.

## 5. Kiểm tra nội dung và logic khoa học

### 5.1. Kiểm tra số học

Không phát hiện lỗi số học nội bộ trong các con số chính:

- RQ1: 237/300 = 79.00%, 289/300 = 96.33%, 174/300 = 58.00%, 265/300 = 88.33%.
- Tỷ lệ token PLANNED/DIRECT gộp hai model = 2.1961, hiển thị 2.20 là đúng.
- RQ2: chênh lệch success +14 và -16 điểm; W/T/L 21/72/7 và 4/76/20; matched OR 3.00 và 0.20 đúng.
- RQ3: các F1/FAR trong confusion table tái tính đúng, kể cả Gemini và Qwen.
- Integrated: 248/450 = 55.11%, 130/450 = 28.89%; 100 + 148 + 30 + 172 = 450; TRACE verified = 100 + 148 = 248, EvoSuite verified = 100 + 30 = 130.
- EvoSuite 56.3287 giờ / 450 = 450.63 s/run, khớp manuscript.

Các JSON verification khớp các bảng ở mức hiển thị. Điều này xác nhận consistency của export hiện có, không xác thực lịch sử tạo ra export.

### 5.2. RQ1 — Có bằng chứng định lượng, nhưng token và inference còn giới hạn

Điểm tốt:

- Paper đã bỏ causal wording mạnh và nói rõ PLANNED là package gồm planning cộng compute bổ sung.
- Primary/conditional analyses, missing denominators, một run mỗi unit và project clustering đều được công khai.
- Số liệu effectiveness khớp CSV/report được ghi trong verification.

Điểm còn mở:

- File 14:28 ghi 432/450 Gemini response cũ không có usage metadata. Sau đó các usage field được bổ sung và tác giả xác nhận đây là provider-reported usage, nhưng không có audit độc lập về nguồn/timestamp/cách thêm trường.
- Paper hiện nói “reported token usage” như một measurement đã chốt. Cần manifest/log bất biến cho các usage field hoặc mô tả rõ đây là số do tác giả xác nhận sau campaign.
- Các test chưa project-clustered và chỉ một run per focal method/model/treatment. Kết luận nên tiếp tục giới hạn ở hai configuration, không khái quát cho LLM nói chung.

### 5.3. RQ2 — Diễn giải hiện tại hợp lý nhưng chưa xác nhận Contribution 2 về effectiveness

Paper đã làm đúng khi gọi đây là exploratory reanalysis, giữ cancelled/failed, sửa chiều effect size và không tuyên bố TGSLR vượt trội. FCR có cả scenario context và thay đổi edit scope nên không phải baseline chỉ khác phạm vi sửa; paper đã nói rõ.

Các giới hạn chính:

- Family 10 tests không có bằng chứng freeze trước khi xem outcomes.
- Bootstrap CI gốc chưa được tái sinh trong repository; một số interval chỉ được đổi dấu theo hướng contrast. Việc đổi dấu là đúng toán học, nhưng vẫn cần script/version tạo interval ban đầu.
- Coverage/mutation thiếu trên các successful subset khác nhau; không có scenario conformance/STS/oracle strength. Vì vậy RQ2 chỉ đo core repair, chưa đo đầy đủ acceptance contract được mô tả trong Methodology.
- Một run, một model, sáu project không đủ để kết luận traceability tự nó cải thiện effectiveness. Paper hiện thừa nhận điều này; không nên làm conclusion mạnh hơn.

### 5.4. RQ3 — Chỉ là exploratory/sensitivity, chưa đủ để xác nhận Contribution 3

Các metric và confusion counts hiện nhất quán. Việc bỏ GLM có lý do vì 87/219 output không hoàn toàn hợp lệ. Việc đưa Qwen vào kèm disclosure selection bias tốt hơn việc che giấu quá trình chọn.

Tuy nhiên, thiết kế hiện có các rủi ro lớn:

- Một thành viên gán nhãn 73 case; team chốt bằng trao đổi miệng, không có record case-level hoặc human inter-rater agreement.
- 73 case được chọn từ pool 180 đã tiếp xúc prototype; không có holdout prospectively frozen.
- DeepSeek là artifact repaired sau freeze.
- Qwen được chọn sau khi xem bốn run và có delta F1 lớn nhất; đây là outcome-based selection.
- B2 dùng khoảng ba lần input token B1, nên không cô lập được hiệu quả role specialization khỏi compute.
- Qwen cải thiện FAR/F1 nhưng attribution Macro-F1 giảm 23.65 điểm và routing không tăng.

Paper đã nói “do not generally confirm Contribution 3”, đây là kết luận đúng. Abstract chỉ nêu kết quả Gemini thuận lợi; nên bảo đảm abstract không khiến người đọc hiểu RQ3 đã xác nhận chung, nhất là khi main result là mixed và model selection hậu nghiệm.

### 5.5. TRACE--EvoSuite — Vấn đề provenance nghiêm trọng nhất

So sánh hai snapshot cho thấy:

| Thuộc tính | Audit 27/09 lúc 14:56 | Trạng thái hiện tại |
|---|---:|---:|
| Campaign ID | `official-150-20260920-r42-r44-v1` | Cùng ID |
| ZIP size | 9,855,551,047 byte | 9,814,962,042 byte |
| Paired CSV SHA-256 | `ec58c015...e47a15` | `c858f7f1...c9904b` |
| EvoSuite search budget | 450/450 dùng 60 s | 450/450 dùng 420 s |
| Process timeout | 4 run ở 120 s | 4 run ở 480 s |
| Mean EvoSuite duration | 117.81 s | 450.63 s |

Đây không phải khác biệt line ending hoặc cách diễn đạt; archive, CSV và timing evidence đã được thay thế. `full-chain-archive-audit.json` hiện còn ghi rõ full archive chưa được hash, chỉ dùng size để nhận diện. Current files tự nhất quán, nhưng chính report cũng nói audit không xác thực execution.

Trước khi giữ claim 420 giây, cần một hồ sơ lineage có thể audit:

1. xác định đây là rerun mới hay re-export/reconstruction;
2. dùng campaign ID/version mới nếu execution khác;
3. full SHA-256 của ZIP, raw records, CSV, cohort manifest, config, command và source commit;
4. start/end timestamps và log launcher cho từng run;
5. giải thích vì sao effectiveness counts giữ nguyên trong khi budget/timing/archive thay đổi;
6. giữ archive 60 s bất biến và nêu quan hệ giữa hai campaign;
7. script tạo CSV từ raw records và bằng chứng không sửa outcome thủ công.

Nếu không cung cấp được lineage này, lựa chọn khoa học an toàn là không trình bày bộ 420 giây như historical campaign đã xác thực; cần rerun sạch hoặc hạ/remove claim integrated tương ứng.

Các giới hạn khác của integrated study vẫn còn:

- B2 là TRACE-specific gate; treatment blinding không chứng minh construct neutrality đối với EvoSuite.
- Delivered CSR, delivered ESR và VSR bằng nhau theo định nghĩa, nên ba dòng không phải ba bằng chứng độc lập.
- Permutation test dùng 150 target-level differences nhưng không cluster theo 58 project. Hierarchical bootstrap có project level không làm p-value sign-flip trở thành project-aware.
- EvoSuite B2 provider calls/tokens bị ghi cứng bằng 0. Ước lượng 7.23 triệu token là post hoc proxy khác model/tokenizer và không thay được usage thật.
- Raw pre-gate CSR/ESR không có trong export; không nên suy delivered rates thành raw generator rates.

### 5.6. Quan hệ giữa contributions và evidence

Contribution 1 có bằng chứng mạnh nhất nhưng vẫn là package-level association, không phải equal-compute causal ablation. Contribution 2 hiện chủ yếu chứng minh contract/locality; success/cost lại không vượt baseline sau correction và FCR tốt hơn ở nhiều outcome. Contribution 3 chưa được xác nhận do gold provenance, selection bias và compute confounding. Integrated result không thể dùng để “bù” cho ba component vì nó không cô lập component nào và còn gate/provenance issue.

Kết luận hiện tại nhìn chung đã thận trọng hơn, nhưng câu “Structural Planning provides the clearest empirical evidence of improving end-to-end reliability” chỉ nên hiểu trong hai configuration và thiết kế hiện có. Không nên chuyển thành claim phổ quát hoặc causal.

## 6. Audit toàn bộ tài liệu tham khảo

### 6.1. Kết luận chung

- Có 33 references và tất cả đều được cite.
- 24 entry có DOI; cả 24 DOI đều resolve trong Crossref/publisher metadata.
- Chín entry không có DOI đều truy được nguồn thật hoặc trang chính thức: ChatUniTest, hai bài ISSTA 2026, MetaGPT, SWE-agent, ISO 29119-4, JaCoCo, PIT và JUnit.
- **Không phát hiện reference hoàn toàn bịa đặt.**
- Có lỗi metadata cần sửa trước submit.

### 6.2. Lỗi tác giả/metadata xác định được

| Key | Vấn đề | Bằng chứng/metadata đúng |
|---|---|---|
| `bib3` | Thiếu tác giả **Janis Benefelds**; cũng thiếu pages 263--272. | DOI <https://doi.org/10.1109/ICSE-SEIP.2017.27> ghi M. Moein Almasi, Hadi Hemmati, Gordon Fraser, Andrea Arcuri, Janis Benefelds. |
| `bib14` | Đủ tám tên nhưng **sai thứ tự tác giả**. | DOI <https://doi.org/10.1145/3696630.3728544> ghi Mark Harman, Jillian Ritchey, Inna Harper, Shubho Sengupta, Ke Mao, Abhishek Gulati, Christopher Foster, Hervé Robert. |
| `bib17` | Metadata arXiv và bản xuất bản ICLR không đồng nhất; paper hiện dùng `Jiaqi Chen` và đặt Ceyao Zhang trước Jinlin Wang. | Bản ICLR chính thức <https://proceedings.iclr.cc/paper_files/paper/2024/hash/6507b115562bb0a305f1958ccc87355a-Abstract-Conference.html> dùng **Jonathan Chen** và thứ tự ... Yuheng Cheng, **Jinlin Wang, Ceyao Zhang**, ... Nên cite theo version of record. |
| `bib4` | Bài thật và tác giả đúng, nhưng thiếu DOI/pages và venue chưa đầy đủ. | ChatUniTest, Companion FSE 2024, pp. 572--576, DOI <https://doi.org/10.1145/3663529.3663801>. |
| `bib18` | Bài thật, title/tác giả đúng, nhưng thiếu DOI, volume và pages của version of record. | NeurIPS 2024 official page <https://proceedings.neurips.cc/paper_files/paper/2024/hash/5a7c947568c1b1328ccc5230172e1e7c-Abstract-Conference.html>, DOI <https://doi.org/10.52202/079017-1601>, volume 37, pp. 50528--50652. |

### 6.3. Entry accepted/future và web documentation

- `bib15` là bài có thật trên chương trình ISSTA 2026 Research Papers: <https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/31/Test-vs-Mutant-Adversarial-LLM-Agents-for-Robust-Unit-Test-Generation>. Trang hiện ghi chương trình tentative; chưa nên giả định DOI/pages nếu publisher chưa phát hành.
- `bib29` là bài có thật, được ghi là **Experience Paper** trong track Research Papers: <https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/151/Context-Matters-Improving-the-Practical-Reliability-of-LLM-Based-Unit-Test-Generatio>. Cần cập nhật PACMSE/DOI/pages khi có version of record và giữ đúng loại bài.
- `bib30` khớp ISO/IEC/IEEE 29119-4:2021, Edition 2: <https://www.iso.org/standard/79430.html>.
- `bib33`--`bib35` là tài liệu web có thật, nhưng `year=2026` chưa cho biết version/access date. Nên ghi tool/version thực dùng trong Methods và thêm ngày truy cập cho trang động.

Ngoài các điểm trên, title, author list, year và venue của các DOI còn lại khớp metadata nguồn ở mức audit này. Không nên gọi bibliography “đã sạch hoàn toàn” cho đến khi sửa năm entry nêu trên và cập nhật hai bài ISSTA khi proceedings xuất bản.

## 7. Danh sách yêu cầu sửa theo mức ưu tiên

### P0 — Phải xử lý trước submission

1. Chốt provenance 60 s/420 s của FullChain bằng rerun record và hash manifest bất biến; nếu không chốt được, không giữ claim 420 s như dữ liệu historical đã xác thực.
2. Hoàn tất Data/Code Availability với URL/reviewer access, version/tag/DOI, license, manifest và hướng dẫn tái lập; không chỉ ghi “being prepared”.
3. Thêm disclosure trung thực về AI hỗ trợ substantive editing/analysis theo policy Springer, cùng quy trình human verification.
4. Sửa abstract để chắc chắn không vượt 250 từ theo cách đếm bảo thủ.
5. Sửa metadata tác giả của `bib3`, `bib14`, `bib17`; bổ sung version-of-record cho `bib4`, `bib18`.
6. Thay Figure 1 bằng vector hoặc artwork đạt chuẩn 600 dpi và chữ đọc được ở kích thước in.
7. Build đúng submission ZIP bằng `pdflatex` trên TeX Live 2021 hoặc portal, kiểm citation/figure/font/log, rồi render lại toàn bộ PDF.
8. Có xác nhận của cả bảy tác giả về tên, thứ tự, affiliation, equal contribution, declarations và bản cuối.

### P1 — Cần để kết luận khoa học đáng tin hơn

1. Chạy project-aware sensitivity/permutation cho integrated comparison và, nếu có thể, RQ1/RQ2.
2. Cung cấp source provenance bất biến cho Gemini token usage; nếu không, ghi rõ author-confirmed/post hoc metadata.
3. Đóng gói script/bootstrap RQ2 và reason-coded missingness RQ1.
4. Đối với RQ3, giữ kết luận exploratory; một claim confirmatory cần holdout mới, freeze trước model selection và nhiều annotator độc lập.
5. Audit B2 gate trên EvoSuite để chứng minh construct neutrality hoặc báo thêm outcome trước gate bằng acceptance contract trung lập.
6. Thu thập provider usage thật cho nhánh EvoSuite/B2 thay vì hard-coded zero hoặc proxy token estimate.

### P2 — Biên tập sau khi evidence đã khóa

1. Rút gọn title, Introduction, Methodology và Conclusion để giảm lặp contributions.
2. Đổi các câu mở đầu equation dạng “In which” thành “where” và rà lại English phrasing.
3. Tối ưu table density và page break bibliography; đây là chất lượng trình bày, không phải lỗi dữ liệu.
4. Chuẩn hóa `Viet Nam`/`Vietnam`, ORCID và cách viết tên theo hồ sơ xuất bản.

## 8. Tiêu chí để reviewer đổi kết luận

Reviewer có thể chuyển từ **Major Revision / chưa submission-ready** sang mức có thể submit khi có đủ:

- manifest giải thích và khóa được lineage FullChain 420 s;
- data/code package hoặc reviewer-access package thực sự truy cập được;
- bibliography sửa đúng version of record;
- abstract, Figure 1 và pdflatex portal build đạt yêu cầu;
- AI disclosure và xác nhận của toàn bộ tác giả;
- manuscript giữ đúng giới hạn của RQ2/RQ3 và bổ sung project-aware sensitivity cho claim integrated.

Nếu lineage 420 s không thể xác minh, đây không còn là lỗi câu chữ. Khi đó cần rerun campaign có ID mới hoặc loại/hạ kết luận integrated; không nên dùng nội dung hiện tại để khẳng định bộ 420 giây là cùng campaign đã được ghi nhận ngày 27/09.
