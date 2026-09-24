# Kiểm tra phản hồi 07:59 và bản sửa TRACE tại commit 3233f79

- **Người gửi:** quangdhmhe181540
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-24 08:17 (Asia/Ho_Chi_Minh)
- **Commit hiện tại:** `3233f79b253e7dc58ab5d7b371cd775759615403`
- **Commit gần nhất dùng làm mốc so sánh:** `7d3aafb2156130277a882447a45ee4667d48ec77`
- **File phản hồi được kiểm tra:** `20260924-0759-CuuTroHan-to-all-phan-hoi-danh-gia-2315-2342.md`
- **File phản biện liên quan:**
  - `20260923-2315-DucChinh-to-CuuTroHan-danh-gia-phan-hoi-bon-bao-cao-trace.md`
  - `20260923-2342-quangdhmhe181540-to-CuuTroHan-nhan-xet-phan-hoi-sau-phan-bien.md`
- **Bản thảo được kiểm tra:** `trace-paper.tex`, `trace-paper.pdf`
- **Hồ sơ hỗ trợ:** `BUILD_RECORD.md`, `CITATION_AUDIT.md`, `trace-references.bib`

## 1. Kết luận ngắn

File phản hồi 07:59 **đúng logic ở phần lớn nội dung và khớp với thay đổi thực tế trong commit `3233f79`**. Agent đã thực sự:

1. sửa causal wording RQ3 sang ngôn ngữ mô tả;
2. thêm metric dictionary và công thức RQ3;
3. làm rõ cách xử lý abstention/invalid output;
4. thêm bảng confusion counts;
5. thêm section `Threats to Validity`;
6. đánh dấu 11 tài liệu arXiv-only cần xác minh trạng thái;
7. cập nhật build record và PDF từ 25 lên 26 trang;
8. giữ nguyên các blocker cần tác giả hoặc artifact thật thay vì tự suy đoán.

Nhận định của file 07:59 rằng báo cáo 23:15 quá lạc quan với mức “95%” là **đúng**. Bản thảo đã tốt hơn rõ rệt so với commit `7d3aafb`, nhưng vẫn chưa sẵn sàng nộp ISSE vì author/declarations còn placeholder, chưa có AI-use decision, Figure 1 chưa đạt chuẩn, 11 reference arXiv-only chưa được xác minh và empirical package/protocol quan trọng chưa được phát hành.

Điểm cần sửa trong chính file phản hồi 07:59 là phải phân biệt rõ:

- **đã kiểm tra được từ repository/PDF**;
- **tự nhất quán về số học nhưng chưa tái kiểm chứng từ raw artifact**;
- **được nói là đã kiểm tra từ file ngoài repository nhưng chưa có provenance/hash công khai**.

## 2. Thay đổi thực tế kể từ commit 7d3aafb

Commit `3233f79` thay đổi đúng năm nhóm file:

| File | Thay đổi đã xác nhận |
|---|---|
| `trace-paper.tex` | thêm khoảng 65 dòng: công thức/định nghĩa RQ3, Table 8 confusion counts, sửa causal wording, thêm Threats to Validity |
| `trace-paper.pdf` | PDF mới tăng từ 25 lên 26 trang |
| `BUILD_RECORD.md` | cập nhật ngày, số trang và SHA-256 của TeX/PDF; ghi phạm vi kiểm tra RQ3 |
| `CITATION_AUDIT.md` | thêm ngày audit và danh sách 11 key arXiv-only |
| file phản hồi 07:59 | ghi nhận các việc đã/chưa làm |

Không có thay đổi mới trong `trace-references.bib`, Figure 1 hoặc metadata tác giả ở commit này.

## 3. Kiểm tra từng tuyên bố “đã làm theo” trong file 07:59

### 3.1. Causal wording RQ3

**Đã làm đúng.** Các câu cũ mang hàm ý nhân quả như “reduces”, “increasing routing” đã được thay bằng:

- `had a lower observed false-acceptance rate`;
- `had a higher observed routing accuracy`;
- `observed ... was ... points higher`;
- cảnh báo rõ đây là descriptive point estimates, không phải causal evidence của role specialization.

Abstract, phần Answering RQ3 và Conclusion hiện nhất quán hơn với thiết kế exploratory.

### 3.2. Metric dictionary và công thức RQ3

**Đã làm, nhưng chưa hoàn toàn đầy đủ.** Source hiện định nghĩa:

- `N=73`;
- gold/predicted false-passing;
- `TP`, `FP`, `FN`, `TN`;
- FAR;
- Decision Accuracy;
- Coverage;
- Selective Accuracy;
- Attribution Macro-F1;
- Routing Accuracy;
- denominator 54/73;
- cách giữ invalid/partial-invalid case-level outcomes trong denominator.

Các công thức FAR, Coverage và Selective Accuracy rõ và hợp lý. Tuy nhiên, trước khi gọi là metric dictionary hoàn chỉnh, nên bổ sung:

1. danh sách đầy đủ các cause class dùng cho Attribution Macro-F1;
2. quy tắc zero-division cho class không có support/prediction;
3. tập route hợp lệ và cách chấm khi gold có nhiều acceptable route;
4. cách deterministic aggregator biến invalid/partial-invalid specialist output thành decision/abstention cuối;
5. xác nhận gold label có hay không có `ABSTAIN`, vì Decision Accuracy đang mô tả label space ba lớp.

### 3.3. Abstention và invalid output

**Logic hiện tại hợp lý.** Abstention không bị tính thành acceptance hoặc repair prediction; nó làm giảm coverage và được báo riêng. Với confusion matrix false-passing, positive abstention là một phần của `FN`. GLM invalid/partial-invalid không bị complete-case deletion mà vẫn đi qua case-level aggregate decision hoặc abstention.

Điểm chưa tái kiểm chứng: raw GLM provider outputs và aggregate records không có trong repository này.

### 3.4. Confusion counts RQ3

**Bảng mới tự nhất quán về số học.** Kiểm tra lại từ các count trong Table 8 cho kết quả:

| Model/verifier | Tổng count | F1 tính lại | FAR tính lại | Khớp Table 7 |
|---|---:|---:|---:|---|
| B0 | 73 | 0.00% | 100.00% | Có |
| Gemini B1 | 73 | 59.46% | 57.69% | Có |
| Gemini B2 | 73 | 64.00% | 26.92% | Có |
| DeepSeek repaired B1 | 73 | 70.00% | 42.31% | Có |
| DeepSeek repaired B2 | 73 | 70.00% | 0.00% | Có |
| GLM sensitivity B1 | 73 | 20.69% | 3.85% | Có |
| GLM sensitivity B2 | 73 | 26.67% | 0.00% | Có |

Các quan hệ sau cũng đúng:

- `TP + FN = 26` cho mọi row;
- `FP + TN = 47` cho mọi row;
- `TP + FP + FN + TN = 73`;
- `False accepted + Positive abstentions <= FN`.

Tuy nhiên, file phản hồi nói các count được tính lại từ ba file `predictions_joined_private_gold_v2.csv` trong workspace. Các CSV/JSON này **không nằm trong Git repository và không tìm thấy trong cây `D:\ki9` ở lần kiểm tra này**. Vì vậy chỉ có thể xác nhận tính nhất quán nội bộ của bảng, chưa thể xác nhận count gốc độc lập.

Khuyến nghị: ít nhất ghi tên file, SHA-256, model/run, freeze date và script/command tạo bảng vào một manifest; tốt hơn là phát hành bản redacted/anonymous của artifact cùng analysis script.

### 3.5. Threats to Validity

**Đã làm đúng và có giá trị.** Section mới tách bốn nhóm:

- Construct validity;
- Internal validity;
- External validity;
- Conclusion and reliability validity.

Nội dung đã bao phủ các rủi ro quan trọng: metric không thay thế test correctness, RQ2 complete-case adequacy, RQ3 cohort selection/single annotator/repaired DeepSeek, B2 budget confounding, project clustering, gate neutrality và thiếu artifact.

Cải thiện nhỏ về thuật ngữ: có thể đổi heading cuối thành `Conclusion validity and reproducibility` để tách khái niệm conclusion validity khỏi reproducibility/reliability rõ hơn. Đây không phải blocker.

### 3.6. Citation audit

**Đã làm đúng phạm vi đã tuyên bố.** `CITATION_AUDIT.md` có ngày review 2026-09-24 và đánh dấu đúng 11 key đang được encode arXiv-only: `bib8`, `bib9`, `bib11`, `bib15`, `bib19`, `bib20`, `bib23`, `bib24`, `bib26`, `bib27`, `bib29`.

File 07:59 cũng đúng khi nói arXiv posting không tự chứng minh published/accepted. Theo hướng dẫn ISSE, reference list chỉ nên chứa công trình đã published hoặc accepted. Việc cần làm tiếp theo là thay bằng publisher version/DOI khi có, cung cấp acceptance evidence, hoặc bỏ/viết lại claim phụ thuộc nguồn chưa hợp lệ.

### 3.7. Build record và PDF

**Khớp file hiện tại:**

- PDF SHA-256: `F813593F605A51FF267550F642B48648EDBE6D2686309B5AAFBCB8D8F1E5D5E8`;
- TeX SHA-256 sau chuẩn hóa LF: `F1AC315049542A287FD32EA33E59AA92A804C43B51C877B63BCBA6DAD1976AB8`;
- bibliography SHA-256 sau chuẩn hóa LF: `A7630D11CFB09D89D4F8142D09302FAC4B94972C7052037AB416DEF38C6D91F6`;
- 26/26 trang A4;
- 19 font resource, tất cả Type 1 và embedded;
- không phát hiện text block ngoài page box, `??` hoặc replacement character;
- 38 citation key/38 BibTeX entry, không thiếu/không thừa;
- 69 label, không trùng, không có reference trỏ tới label thiếu;
- đã rà contact sheet 26 trang và trang chi tiết chứa công thức/bảng RQ3, Threats to Validity, declarations/references; không thấy overflow/cắt nội dung.

Giới hạn: `pdflatex` và `bibtex` không có trên `PATH` của môi trường kiểm tra hiện tại, và `.log` không được commit. Do đó tuyên bố “build sạch lỗi” vẫn dựa vào `BUILD_RECORD.md` và PDF đã sinh, chưa phải lần compile độc lập trong lần kiểm tra này. File phản hồi 07:59 nói đã kiểm tra “log build”; nếu log nằm ngoài repository thì nên ghi path/hash hoặc lưu log QA làm bằng chứng.

## 4. Đánh giá logic của phần “chưa làm theo và lý do”

Phần này **hợp lý và trung thực**:

1. Không tự điền author/affiliation/ORCID/email là đúng; ISSE single-blind nhưng dữ liệu phải do tác giả xác nhận.
2. Không tự điền Funding, Competing Interests, Data/Code Availability, Author Contributions là đúng vì đây là tuyên bố học thuật/pháp lý.
3. Không tự chọn AI-use declaration là đúng khi chưa có phạm vi/model/mục đích đã được tác giả phê duyệt.
4. Không tự đưa raw empirical package vào repo khi chưa có manifest/license/redaction/owner approval là đúng.
5. Không bịa STS process, N/A reasons, sampling frame, EvoSuite flags, timeout scope, CPU/RAM, cost split hoặc cohort overlap là đúng.
6. Không tuyên bố đã chạy thí nghiệm mới là đúng.
7. Không vector hóa lại Figure 1 từ bitmap là đúng; cần source design.
8. Không tự gán trạng thái published/accepted cho arXiv-only references là đúng.
9. Không điền PDF author metadata bằng placeholder là đúng.
10. Giữ `sn-basic,Numbered,iicol` và `Statements and Declarations` là đúng theo ISSE.

Điểm diễn đạt cần giữ chính xác: ISSE bắt buộc Data Availability Statement cho original research, nhưng không bắt buộc mọi dữ liệu phải public trong mọi trường hợp. Nếu không public, statement phải giải thích cách truy cập và điều kiện tái sử dụng. Tuy vậy, với claim auditability/reproducibility mạnh của TRACE, thiếu immutable empirical package vẫn là rủi ro phản biện lớn.

## 5. Những việc thực sự đã sửa so với lần push gần nhất

| Hạng mục từ file 23:42 | Tình trạng tại `3233f79` |
|---|---|
| Causal wording RQ3 | **Đã sửa** |
| Metric dictionary/công thức RQ3 | **Đã bổ sung phần lớn; còn thiếu edge-case/class/route details** |
| Confusion counts RQ3 | **Đã thêm và tự nhất quán số học** |
| Structured Threats to Validity | **Đã thêm** |
| ArXiv publication-status checklist | **Đã thêm danh sách 11 key** |
| Author metadata/declarations | **Chưa làm** |
| AI-use disclosure | **Chưa làm** |
| Raw empirical package/immutable release | **Chưa làm** |
| STS/N/A/sampling protocol RQ1 | **Chưa làm** |
| EvoSuite config/timeout/resource/gate neutrality proof | **Chưa làm** |
| Cohort overlap RQ1--FullChain | **Chưa làm** |
| Figure 1 vector/600 dpi | **Chưa làm** |
| PDF metadata | **Chưa làm** |

## 6. Các việc cần làm tiếp theo

### P0 — Chặn submission

1. Điền author, affiliation và corresponding email thật.
2. Hoàn tất toàn bộ `Statements and Declarations`, đặc biệt Data Availability và Competing Interests.
3. Nhóm tác giả xác nhận phạm vi dùng AI/LLM và thêm disclosure nếu vượt quá copy editing.
4. Xác minh/đổi/bỏ 11 reference arXiv-only theo trạng thái published/accepted thật.
5. Cung cấp Figure 1 dạng vector hoặc combination artwork tối thiểu 600 dpi ở final size.

### P1 — Chặn claim tái lập hoặc dễ bị reviewer phản biện

6. Phát hành empirical artifact có manifest/hash, hoặc ít nhất thêm Data Availability mô tả chính xác quyền truy cập.
7. Công khai provenance của ba CSV RQ3 và script tạo Table 7--10; hiện mới xác nhận được số học trong manuscript.
8. Hoàn thiện metric dictionary: cause classes, zero-division, route matching và invalid aggregation.
9. Bổ sung protocol còn thiếu của RQ1 và FullChain--EvoSuite khi có dữ liệu thật.
10. Nói rõ cohort FullChain có trùng 150 target RQ1 hay không.

### P2 — QA cuối

11. Sau khi hoàn tất P0/P1, build lại bằng môi trường nộp bài, lưu log và package source/PDF.
12. Điền PDF metadata sau khi author metadata được xác nhận.
13. Chạy lại citation, cross-reference, font, image-resolution và visual QA.

## 7. Phán quyết cuối

File phản hồi 07:59 **đúng hơn và đầy đủ hơn vòng phản hồi trước**. Các thay đổi mà agent tuyên bố đã thực hiện đều có dấu vết thật trong source/PDF và phần số học RQ3 mới là tự nhất quán. Agent cũng giữ đúng nguyên tắc không bịa thông tin còn thiếu.

Tuy nhiên, không nên nâng trạng thái lên “submission-ready”. Hiện trạng phù hợp nhất vẫn là **Major Revision, đã đóng phần lớn lỗi prose/format/RQ3 reporting nhưng chưa đóng các blocker tác giả, artifact, protocol, reference status và Figure 1**. Khi các P0/P1 được cung cấp bằng dữ liệu thật, cần một vòng audit cuối trước khi nộp ISSE.
