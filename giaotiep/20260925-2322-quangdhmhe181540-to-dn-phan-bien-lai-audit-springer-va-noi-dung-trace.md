# Phản biện lại audit Springer/ISSE và nội dung TRACE

- **Người gửi:** quangdhmhe181540
- **Người nhận:** dn
- **Thời gian:** 2026-09-25 23:22 (Asia/Ho_Chi_Minh)
- **Commit được kiểm tra:** `e03978cdf7810fabaa8480121c2d55acccae69dd`
- **Bản thảo:** `paper/trace-paper.tex`, `paper/trace-paper.pdf`
- **Tài liệu được phản biện:** `giaotiep/20260925-0948-dungng2808-to-all-audit-springer-isse-va-noi-dung-trace.md`
- **Tài liệu hỗ trợ:** `paper/BUILD_RECORD.md`, `paper/CITATION_AUDIT.md`, `paper/RQ3_PROVENANCE.md`, `paper/FIGURE1_ARTWORK.md`, `paper/trace-references.bib`
- **Chuẩn đối chiếu:** Springer Nature article template December 2024, ISSE Submission Guidelines và trang collection *Resilient, Trustworthy, and AI-Driven Software Systems for Next-Generation Applications*

## 1. Kết luận ngắn

Báo cáo 09:48 **đúng ở phần lớn các kết luận quan trọng**: bản thảo dùng đúng template Springer Nature/ISSE, chủ đề phù hợp collection, PDF có dàn trang ổn định, Figure 1 vẫn không đạt chuẩn artwork, declarations chưa hoàn tất, dữ liệu/thực nghiệm chưa thể tái kiểm chứng độc lập và các giới hạn RQ1--RQ3/TRACE--EvoSuite được nhận diện hợp lý.

Tuy nhiên, báo cáo 09:48 chưa hoàn toàn chính xác/cập nhật. Cần sửa ít nhất các điểm sau:

1. header của báo cáo vẫn ghi commit nền `c45eea2` và “có chỉnh sửa cục bộ chưa commit”, trong khi trạng thái đã được commit tại `e03978c`;
2. abstract hiện được script đếm là **201/222 từ**, không phải 201/216;
3. `SF110` vẫn là abbreviation chưa được định nghĩa trong abstract;
4. câu `planning increased...` trong Abstract và `Structural Planning clearly improves...` trong Conclusion còn mang sắc thái causal quá mạnh so với equal-compute limitation;
5. việc bỏ dấu tiếng Việt trong tên tác giả không nên tự coi là đã đóng hoàn toàn; cần năm tác giả xác nhận tên xuất bản/ORCID để tránh sai định danh;
6. `bib15` và `bib29` có bằng chứng từ program của ISSTA 2026, nhưng ít nhất trang `bib15` ghi program còn tentative; nên giữ snapshot/bằng chứng acceptance và tiếp tục cập nhật DOI/pages;
7. repository build dựa vào `TEXINPUTS/BSTINPUTS` trỏ sang thư mục `template/`; submission ZIP phải tự chứa và build được mà không phụ thuộc cấu hình môi trường cục bộ.

Kết luận cuối vẫn là **Major Revision / chưa submission-ready**.

## 2. Nguồn chính thức đã kiểm tra lại

- ISSE Submission Guidelines: <https://link.springer.com/journal/11334/submission-guidelines>
- Springer Nature LaTeX Author Support: <https://www.springernature.com/gp/authors/campaigns/latex-author-support>
- Collection: <https://link.springer.com/collections/gagdfebeia>

Trang collection hiện xác nhận:

- collection đang mở nhận bài;
- participating journal là ISSE;
- deadline full paper là **30 October 2026**;
- scope có AI-driven software engineering và software testing/verification/validation for AI-based systems.

Do đó, nhận định của báo cáo 09:48 rằng TRACE phù hợp chủ đề collection là hợp lý. Đây là đánh giá về topic fit, không phải bảo đảm paper sẽ qua editorial screening hoặc peer review.

## 3. Đối chiếu từng nhóm kết luận của báo cáo 09:48

| Nội dung trong audit 09:48 | Kết quả kiểm tra lại | Kết luận |
|---|---|---|
| Dùng đúng Springer Nature template December 2024 | `template/sn-jnl.cls` và `template/sn-article.tex` trùng bản ZIP chính thức; `sn-basic.bst` chỉ khác line ending | Đúng |
| `pdflatex,sn-basic,Numbered,iicol` phù hợp ISSE | Khớp hướng dẫn journal về template, two-column và numbered references | Đúng |
| PDF 27 trang A4, layout sạch | 27/27 trang là A4; không thấy text block ngoài page box, marker `??` hoặc replacement character | Đúng |
| Font PDF đạt | 20 font resources, tất cả Type 1 và embedded | Đúng |
| Abstract khoảng 201--216 từ | Script hiện trả 201 nếu nhóm từ ghép và 222 nếu tách từ ghép | Cần sửa con số 216 thành 222; vẫn nằm trong 150--250 |
| Abstract đã bỏ abbreviation chưa định nghĩa | Đã bỏ RQ1/RQ2/RQ3, nhưng vẫn còn `SF110` chưa định nghĩa | Chưa hoàn toàn đúng |
| Có đúng 6 keywords | Source có 6 keywords | Đúng |
| Title page đạt một phần | Có 5 tác giả, e-mail, FPT University, Hanoi, Vietnam; chưa có corresponding author | Đúng |
| Tên tác giả không dấu đã xử lý xong | Build portability tốt hơn nhưng có nguy cơ sai định danh xuất bản | Chỉ đóng sau khi tác giả xác nhận |
| Còn sáu placeholder | Có đúng 6 chuỗi `To be completed by the authors.` | Đúng |
| Figure 1 khoảng 244 dpi | PDF chứa ảnh 1536 x 1024 px ở khoảng 243.8 dpi | Đúng |
| Caption Figure 1 quá chung | Caption chỉ là `Overview of the TRACE framework` | Đúng |
| 33 citation/33 bibliography entries | 33 key được cite, 33 entries, không thiếu/không thừa | Đúng kỹ thuật |
| Đã xử lý 11 reference bị gắn cờ | 5 key đã bỏ; 6 key có publisher/program evidence | Đúng về thao tác, vẫn cần follow-up status |
| Page 27 gần như trắng | Trang 27 chỉ có reference [33] và page number | Đúng, chỉ là vấn đề thẩm mỹ |
| Dữ liệu chưa tái lập độc lập | Raw artifacts đầy đủ không nằm trong repo; ổ `R:` trong provenance không có ở môi trường kiểm tra | Đúng |
| RQ1/RQ2/RQ3/TRACE còn giới hạn bằng chứng | Các limitation được manuscript thừa nhận và vẫn tồn tại | Đúng |

## 4. Kiểm tra format theo Springer/ISSE

### 4.1. Các điểm đã đạt

1. Source dùng đúng class:

   ```latex
   \documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
   ```

2. Template trong `template/` khớp gói Springer Nature chính thức tháng 12/2024.
3. Heading chính không vượt ba cấp: section, subsection, subsubsection.
4. Có một figure và 12 tables; toàn bộ đều có caption/label và được dẫn chiếu.
5. Trích dẫn numeric và bibliography được giải quyết đầy đủ ở committed PDF/BBL.
6. PDF metadata có Title, Author, Subject và Keywords.
7. PDF gồm 27 trang A4, không thấy chữ/bảng bị cắt hoặc tràn lề khi render toàn bộ.
8. Hash PDF khớp `paper/BUILD_RECORD.md`:

   ```text
   9E89982A3F59B0ECAD11B1FC55996931270817C4727B4554B702DDBCFAF846AA
   ```

9. Hash TeX/Bib/BBL trong build record khớp sau khi chuẩn hóa line ending về LF. Raw hash trên Windows khác là do CRLF, không phải nội dung khác.

### 4.2. Giới hạn kiểm tra build

Môi trường hiện tại không có `pdflatex` và `bibtex` trên PATH, nên chưa fresh-build độc lập lần nữa. Có thể xác nhận:

- committed PDF và hash;
- BBL, citation/label consistency;
- page size, text layer, font embedding;
- hình nhúng và effective DPI;
- visual layout toàn bộ 27 trang.

Không nên chuyển kết luận này thành “đã build độc lập trên Windows/TeX Live 2021”. Build sạch được ghi trong `BUILD_RECORD.md` là từ TinyTeX/TeX Live 2026 trên macOS.

### 4.3. P0 -- Abstract

Abstract hiện nằm trong giới hạn word count theo cả hai cách đếm của script:

- grouped hyphenated compounds: 201;
- split hyphenated compounds: 222.

Các việc còn phải chỉnh:

1. giải nghĩa hoặc bỏ `SF110` vì ISSE yêu cầu abstract không chứa abbreviation chưa định nghĩa;
2. đổi câu:

   > showed that planning increased aggregate execution success...

   thành wording package-level, ví dụ:

   > the PLANNED package was associated with higher aggregate execution success...

3. cân nhắc đổi câu cuối `The results show improved delivered reliability` thành `The observed results indicate higher delivered reliability within the evaluated settings` để nhất quán với gate-neutrality caveat.

### 4.4. P0 -- Title page và tên tác giả

Đã có năm tác giả, e-mail và `FPT University, Hanoi, Vietnam`, nhưng:

1. chưa có tác giả nào dùng `\author*`, nên chưa có corresponding author rõ ràng;
2. cần xác nhận `Hanoi` và đơn vị/khoa/cơ sở có đúng cho cả năm tác giả;
3. ORCID nên được thêm nếu có;
4. tên không dấu phải được từng tác giả xác nhận là publication name mong muốn và khớp ORCID/những bài đã công bố.

Việc dùng tên không dấu không phải lỗi compile, nhưng có thể gây sai author identity/indexing. Nếu tên chính thức có dấu, nên dùng cách encoding tương thích và test trên môi trường submission thay vì mặc định bỏ dấu.

### 4.5. P0 -- Statements and Declarations

Các mục còn placeholder:

- Acknowledgements;
- Funding;
- Competing interests;
- Data availability;
- Code availability;
- Author contributions.

Ba mục Ethics approval, Consent to participate và Consent for publication đang ghi `Not applicable`, nhưng vẫn cần tác giả xác nhận đúng với dữ liệu/nghiên cứu thực tế.

ISSE yêu cầu original research có Data Availability Statement. Author Contributions và Competing Interests còn phải được cung cấp ở submission interface. Không được để AI tự suy đoán nội dung pháp lý/học thuật này.

Nhóm cũng cần quyết định AI-assistance disclosure dựa trên cách AI thực sự được dùng. Chính sách journal nói copy editing đơn thuần không cần khai báo, nhưng generative editorial work/autonomous content creation phải được xem xét và tác giả chịu trách nhiệm.

### 4.6. P0 -- Figure 1

Kiểm tra PDF xác nhận:

- raster size: 1536 x 1024 px;
- placement: khoảng 453.54 x 302.36 pt;
- effective resolution: khoảng 243.8 x 243.8 dpi;
- caption: `Overview of the TRACE framework`.

Đây là combination artwork có nhiều line, icon và lettering; ISSE yêu cầu tối thiểu 600 dpi. Hướng dẫn trong `paper/FIGURE1_ARTWORK.md` là đúng: cần source SVG/PDF/EPS/Office thật hoặc render bitmap trực tiếp từ source ở độ phân giải phù hợp; không chỉ upscale PNG hiện tại.

Caption cũng nên mô tả bảy block, evidence flow và repair/abstention route thay vì chỉ nêu “overview”.

### 4.7. P0 -- Submission package

Repo tách source ở `paper/` và class/BST ở `template/`. Script local thiết lập:

```text
TEXINPUTS=../template
BSTINPUTS=../template
```

Submission portal không được giả định sẽ có hai biến môi trường này. Cần tạo một submission ZIP độc lập, tốt nhất là một thư mục phẳng hoặc layout đã test, chứa đúng:

- main `.tex`;
- `.bib` hoặc `.bbl` theo đúng cách source tham chiếu;
- `sn-jnl.cls`;
- `sn-basic.bst`;
- Figure 1 final;
- các dependency thực sự cần.

Sau đó build ZIP đó trên TeX Live 2021 hoặc môi trường portal. Nếu nộp `.bbl`, phải bảo đảm `.tex` thực sự dùng nó theo hướng dẫn của submission system; không đưa một BBL không được main source tham chiếu như file thừa.

## 5. Kiểm tra bibliography và reference audit

### 5.1. Những gì đã xác nhận

- 33 distinct citation keys;
- 33 BibTeX entries;
- không có missing citation;
- không có uncited entry;
- 5 preprint-only key `bib8`, `bib9`, `bib19`, `bib23`, `bib24` đã được bỏ khỏi source/BibTeX;
- các câu phụ thuộc trực tiếp đã được sửa hoặc bỏ;
- các DOI/publisher metadata mới đã làm bibliography tốt hơn đáng kể.

### 5.2. Điểm cần thận trọng

1. `bib15` và `bib29` hiện dựa vào ISSTA 2026 program. Đây là bằng chứng mạnh rằng bài nằm trong research-paper program, nhưng trang `bib15` ghi program “tentative and subject to change”. Nên lưu snapshot/bằng chứng acceptance chính thức và cập nhật DOI/pages ngay khi proceedings xuất bản.
2. `paper/CITATION_AUDIT.md` tự nói đây chưa phải full re-audit của mọi reference. Không nên gọi toàn bộ bibliography đã được chứng nhận hoàn toàn.
3. `bib4`, `bib17`, `bib18` có venue publication nhưng thiếu DOI/pages trong BibTeX; đây không nhất thiết là lỗi eligibility, nhưng nên hoàn thiện metadata nếu publisher record có sẵn.
4. JaCoCo, PIT và JUnit là living web documentation; nên thêm access date nếu style cho phép.

## 6. Kiểm tra logic và số liệu nội bộ

### 6.1. Các phép tính có thể xác minh từ manuscript

- RQ1 CSR: `237/300 = 79.00%`, `289/300 = 96.33%`.
- RQ1 ESR: `174/300 = 58.00%`, `265/300 = 88.33%`.
- RQ2: TGSLR `60/100`, FTMR `46/100`, FCR `76/100`.
- RQ2 W/T/L: `21-7 = +14` và `4-20 = -16`, khớp chênh lệch success.
- RQ3: mọi confusion row có `TP+FP+FN+TN=73`; False-pass F1/FAR khớp các count.
- TRACE VSR: `248/450 = 55.11%`.
- EvoSuite VSR: `130/450 = 28.89%`.
- Pair breakdown: `148+30+100+172 = 450`; TRACE verified `148+100=248`; EvoSuite verified `30+100=130`.

Không phát hiện lỗi số học nội bộ rõ ràng trong các con số chính.

### 6.2. RQ1 -- wording vẫn cần sửa

Thiết kế đã nói rõ PLANNED có thêm planning call và gần gấp đôi token, nên chỉ hỗ trợ package `planning + additional inference compute`. Tuy nhiên:

- Abstract vẫn viết `planning increased...`;
- Conclusion vẫn viết `Structural Planning clearly improves...`.

Hai câu này mạnh hơn phần Methods/Threats. Nên đổi nhất quán sang association/package-level wording. Nếu muốn causal claim cho plan representation, cần equal-compute/equal-call baseline.

Các limitation khác vẫn còn:

- chủ yếu một stochastic run cho mỗi unit;
- chưa xử lý đầy đủ project clustering;
- DeepSeek STS/BC có differential non-missing denominators;
- thiếu reason-coded missingness và public raw records.

### 6.3. RQ2 -- kết luận hiện hợp lý nhưng bằng chứng còn hẹp

Manuscript đã làm đúng khi kết luận RQ2 không được hỗ trợ inferentially. TGSLR không hơn FTMR sau Holm và FCR có success cao hơn/cost thấp hơn trong campaign hiện tại.

RQ2 vẫn chưa đo đầy đủ scenario conformance, structural-target satisfaction, independent compile outcome và oracle strength. Contribution nên tiếp tục được định vị là ownership/locality/traceability mechanism, không phải superior repair method.

### 6.4. RQ3 -- chỉ là exploratory evidence

Các giới hạn vẫn đúng như audit 09:48:

- 73/180 case được chọn sau agreement filtering;
- chỉ một human annotator;
- 65 controlled injections và 8 natural cases;
- repaired DeepSeek artifact sau freeze;
- GLM invalid outputs cao;
- B2 có ngân sách calls/tokens lớn hơn B1.

`paper/RQ3_PROVENANCE.md` có hash/path nhưng artifact nằm ngoài repo; ổ `R:` không tồn tại trong môi trường hiện tại. Vì vậy chỉ kiểm tra được công thức và arithmetic, chưa kiểm tra được raw provenance.

### 6.5. TRACE--EvoSuite -- số liệu tự nhất quán, fairness chưa đóng

Điểm mạnh:

- paired design được mô tả rõ;
- count/rate/CI/p-value presentation nhất quán nội bộ;
- manuscript đã gọi evaluation là exploratory;
- đã công khai TRACE-specific gate limitation.

Vấn đề còn lại:

1. chưa chứng minh B2 gate construct-neutral với EvoSuite;
2. treatment blinding không loại trừ generator fingerprint qua naming/scaffolding/style;
3. không có raw pre-gate CSR/ESR;
4. VSR, delivered CSR và delivered ESR bằng nhau theo post-gate definition, không phải ba bằng chứng độc lập;
5. 175 `generation_failure` và 139 `repair_exhausted` của EvoSuite cần record-level harness/configuration audit;
6. scope thực tế của 900-second limit chưa rõ;
7. raw campaign records và analysis scripts chưa được phát hành.

Kết luận hợp lý nhất vẫn là: TRACE có delivered-system outcomes cao hơn trong campaign/evaluation contract đã ghi, chưa chứng minh evaluator-neutral hoặc universal superiority.

## 7. Đánh giá cấu trúc và văn phong

### Điểm tốt

- Research questions và ba component studies được tổ chức rõ.
- Threats to Validity tách construct/internal/external/conclusion validity.
- Reporting có effect size, multiple-testing correction, missingness, abstention và cost.
- Abstract mới ngắn và dễ đọc hơn bản trước.
- Tên `TRACE` đã được dùng nhất quán thay cho campaign nickname.

### Điểm nên cải thiện

1. Introduction, Methodology và Conclusion vẫn lặp lại pipeline/contributions khá nhiều.
2. Một số caption bảng còn chung, ví dụ `Results of paired tests`; nên làm captions tự chứa hơn.
3. Title dài và chiếm nhiều dòng, nhưng đây là vấn đề biên tập chứ không phải lỗi template.
4. `\raggedbottom` khác default template; chỉ giữ nếu có lý do dàn trang rõ.
5. Trang 27 chỉ có reference [33]; nên tối ưu sau khi nội dung đã khóa, không dùng negative spacing nguy hiểm.
6. Novelty claims dạng `we did not identify...` chỉ nên được hiểu trong tập tài liệu đã review; nếu muốn claim exhaustive cần search protocol.

## 8. Thứ tự xử lý đề xuất

### P0 -- trước submission

1. Chốt corresponding author, affiliation chính thức và publication name/ORCID của từng tác giả.
2. Hoàn tất sáu placeholder; xác nhận ba mục Ethics/Consent đang ghi `Not applicable`.
3. Sửa Abstract: định nghĩa/bỏ `SF110`, đổi causal wording; cập nhật audit count thành 201/222.
4. Đổi `Structural Planning clearly improves` trong Conclusion sang package-level association.
5. Xuất Figure 1 từ source thật thành vector hoặc >=600 dpi và viết caption mô tả đầy đủ.
6. Tạo submission ZIP tự chứa, không phụ thuộc `TEXINPUTS/BSTINPUTS`; test trên TeX Live 2021/portal.
7. Giữ bằng chứng acceptance cho `bib15`/`bib29`, tiếp tục cập nhật DOI/pages.
8. Cập nhật header của audit 09:48 sang commit `e03978c` và bỏ mô tả “local uncommitted”.

### P1 -- để giảm nguy cơ major review/reject

1. Phát hành replication package hoặc cấp reviewer access có kiểm soát, kèm DOI/persistent identifier, license và hash manifest.
2. Công bố prompt/schema, model snapshots, retry policy, tool lock và analysis scripts.
3. Audit TRACE--EvoSuite về gate neutrality, harness failures và raw pre-gate metrics.
4. Chạy equal-compute RQ1/equal-budget RQ3 baseline nếu còn thời gian.
5. Bổ sung stochastic repetitions và project-clustered/hierarchical analysis.

## 9. Phán quyết cuối gửi dn

- **Báo cáo 09:48 có đúng phần lớn không?** Có.
- **Có thể dùng báo cáo đó làm checklist chính không?** Có, sau khi sửa các điểm nêu ở Mục 1 và cập nhật commit provenance.
- **Template Springer/ISSE có đúng không?** Đúng ở cấp class/options/layout/bibliography mechanics.
- **PDF hiện có lỗi dàn trang nghiêm trọng không?** Không phát hiện.
- **Figure 1 đạt chuẩn production artwork chưa?** Chưa.
- **Nội dung và số liệu có tự nhất quán không?** Các phép tính kiểm tra được từ manuscript là nhất quán.
- **Toàn bộ kết quả đã được xác minh từ raw data chưa?** Chưa.
- **Bài đã submission-ready chưa?** Chưa; giữ mức **Major Revision**.

Ưu tiên cao nhất hiện nay là corresponding author/declarations, Abstract và causal wording, Figure 1, self-contained submission package, rồi đến replication/fairness audit. Các vấn đề còn lại chủ yếu nằm ở tính hợp lệ học thuật và khả năng tái lập, không còn là lỗi LaTeX cơ bản.
