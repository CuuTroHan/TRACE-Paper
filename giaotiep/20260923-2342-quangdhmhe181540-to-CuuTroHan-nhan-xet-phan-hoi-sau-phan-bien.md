# Nhận xét phản hồi và bản sửa TRACE sau hai báo cáo phản biện

- **Người gửi:** quangdhmhe181540
- **Người nhận:** CuuTroHan
- **Thời gian:** 2026-09-23 23:42 (Asia/Ho_Chi_Minh)
- **Commit được kiểm tra:** `bc5643845d72f430b105ea4593ecf3b3e8c833a6`
- **Hai báo cáo làm cơ sở:**
  - `20260923-2131-quangdhmhe181540-to-CuuTroHan-danh-gia-dinh-dang-springer.md`
  - `20260923-2144-quangdhmhe181540-to-CuuTroHan-phan-bien-noi-dung-trace.md`
- **File phản hồi được kiểm tra:** `20260923-2258-CuuTroHan-to-all-phan-hoi-bon-bao-cao-danh-gia-trace.md`
- **Các file bản thảo được đối chiếu:** `trace-paper.tex`, `trace-paper.pdf`, `trace-references.bib`, `CITATION_AUDIT.md`, `BUILD_RECORD.md`

## Kết luận điều hành

Hai báo cáo lúc 21:31 và 21:44 **đúng logic ở phần lớn các nhận định quan trọng**. Báo cáo định dạng đã phát hiện đúng placeholder, Type 3 font, `\nocite`, heading Acknowledgements và nhu cầu chốt journal. Báo cáo nội dung đã phát hiện đúng citation mapping sai, diễn giải quá mức ở RQ2/RQ3, sự nhập nhằng của delivered CSR/ESR, giới hạn của B2 gate và thiếu empirical package.

Agent sửa bản thảo ở commit `bc56438` đã **làm đúng phần lớn các sửa đổi an toàn có thể thực hiện chỉ từ repository** và đã đúng khi không tự bịa author metadata, declarations, raw artifact hoặc protocol chưa tồn tại. Tuy nhiên, agent **chưa làm đầy đủ toàn bộ khuyến nghị**. Một số mục trong file phản hồi lúc 22:58 diễn đạt như đã giải quyết xong nhưng thực tế mới giải quyết một phần, đặc biệt là định nghĩa metric RQ3, causal wording, reproducibility, cấu hình thí nghiệm và fairness của FullChain--EvoSuite.

Phán quyết hiện tại:

- **Logic của hai báo cáo:** đạt, có một số nhận định chỉ đúng tại commit cũ `2239b71` hoặc cần journal-level guidance.
- **Logic của file phản hồi 22:58:** nhìn chung đạt và trung thực về các việc chưa thể làm.
- **Mức độ thực hiện khuyến nghị:** làm tốt phần format/citation/prose; làm một phần phần methodology; chưa giải quyết các blocker cần dữ liệu hoặc xác nhận của tác giả.
- **Sẵn sàng nộp ISSE:** chưa đạt.

## 1. Kiểm tra lại theo hướng dẫn chính thức của journal ISSE

Journal đích đã được xác định là *Innovations in Systems and Software Engineering* (ISSE). Hướng dẫn chính thức hiện hành:

<https://link.springer.com/journal/11334/submission-guidelines>

Các điểm trong file phản hồi 22:58 được xác nhận là đúng:

1. ISSE khuyến nghị Springer Nature LaTeX template và option `[iicol]`.
2. ISSE yêu cầu citation dạng số trong ngoặc vuông và cho phép dùng `sn-basic.bst`.
3. Heading đúng theo journal là **Statements and Declarations**; không nên đổi thành `Declarations` chỉ để bám file mẫu chung.
4. Abstract phải từ 150 đến 250 từ. Bản hiện tại có 221 từ khi gộp từ ghép và 246 từ khi tách từ ghép, nên đạt.
5. Journal yêu cầu 4--6 keywords. Bản hiện tại có 6, nên đạt.
6. ISSE dùng single-blind review, vì vậy title page phải có tên tác giả, affiliation và email corresponding author thật; không được giữ placeholder để ẩn danh.
7. Original research bắt buộc có Data Availability Statement.
8. Combination artwork có nhiều chữ/sơ đồ màu cần tối thiểu 600 dpi; Figure 1 hiện chỉ khoảng 244 dpi ở kích thước được đặt trong PDF.
9. Việc dùng LLM ngoài AI-assisted copy editing phải được mô tả phù hợp trong Methods hoặc vị trí tương đương, với trách nhiệm cuối cùng thuộc về tác giả.

Do đó, quyết định giữ `sn-basic`, `Numbered`, `iicol` và `Statements and Declarations` là hợp lý cho ISSE. Nhận định “chưa có journal đích” trong báo cáo 21:31 chỉ phản ánh trạng thái thông tin tại commit `2239b71`, không còn là blocker ở commit hiện tại.

## 2. Đối chiếu báo cáo định dạng 21:31 với bản hiện tại

| Khuyến nghị | Trạng thái | Nhận xét |
|---|---|---|
| Điền author/email/affiliation thật | **Chưa làm** | `trace-paper.tex:27-28` vẫn là `First Author`, `author@example.com`, `Department`, `Institution`, `City`, `Country`; đây là P0 vì ISSE single-blind |
| Hoàn tất declarations | **Chưa làm** | Các dòng `660, 665, 668, 680, 683, 686` vẫn là `To be completed by the authors.` |
| Loại Type 3 font | **Đã làm đúng** | Bỏ `T1 fontenc`; PDF mới chỉ còn Type 1 embedded font |
| Xác nhận journal đích | **Đã làm đúng** | ISSE xác nhận `iicol`, numbered citations và `sn-basic.bst` |
| Bỏ subsection trong Introduction | **Đã làm** | Bốn subsection đã được gộp; đây là lựa chọn hợp lý theo template mẫu nhưng không phải blocker riêng của ISSE |
| Đổi Acknowledgements sang `\bmhead` | **Đã làm đúng** | Hiện dùng `\bmhead{Acknowledgements}` |
| Đổi `Statements and Declarations` thành `Declarations` | **Không nên làm** | Agent đúng khi không làm, vì ISSE yêu cầu chính xác heading `Statements and Declarations` |
| Bỏ `\nocite` | **Đã làm đúng** | 38/38 entry hiện đều được cite thật; không có key thiếu |
| Bổ sung PDF metadata | **Chưa làm, ưu tiên thấp** | Title/Author/Keywords metadata vẫn rỗng; chỉ nên điền sau khi chốt author và chính sách submission |
| Rebuild và kiểm tra PDF | **Đã làm theo build record** | `BUILD_RECORD.md` ghi build thành công; PDF 25 trang, hash khớp, không còn Type 3 |

Kết luận phần format: agent đã thực hiện đúng các sửa đổi kỹ thuật chính. Các blocker còn lại không phải lỗi của class/template mà là thông tin submission thật và chất lượng Figure 1.

## 3. Đối chiếu báo cáo nội dung 21:44 với bản hiện tại

### 3.1 Citation và bibliography

**Đã làm đúng phần lớn:** citation mapping cho ChatTester, TestART, TestLoter, CATGen, ISO 29119-4, TestAgent, MAGISTER, TestGen-LLM, JaCoCo, PIT, JUnit, Defects4J, SF110 và LIBRO đã được thay bằng key phù hợp hơn. `bib21`, `bib22`, `bib24` đã được sửa như phản biện. `CITATION_AUDIT.md` đã được tạo và 38 citation key đều resolve.

**Chưa thể coi là đóng hoàn toàn:** `CITATION_AUDIT.md` mới ghi metadata tóm tắt, chưa ghi ngày truy cập, URL/DOI kiểm chứng cho mọi hàng, trạng thái “published/accepted/preprint”, hoặc bằng chứng rằng từng source thực sự hỗ trợ đúng từng claim. ISSE yêu cầu reference list chỉ chứa công trình đã published hoặc accepted; các entry arXiv cần được tác giả kiểm tra trạng thái xuất bản/acceptance và thay bằng bản publisher khi có.

### 3.2 RQ1

| Khuyến nghị | Trạng thái |
|---|---|
| Đổi “same number of methods” thành “same cap” | **Đã làm đúng** |
| Làm rõ ai/tool tạo STS ground truth và cách validate | **Chưa làm** |
| Giải thích N/A reason theo treatment | **Chưa làm** |
| Bổ sung sampling frame 150 methods/58 projects | **Chưa làm** |
| Project-clustered hoặc hierarchical analysis, nhiều seed | **Chưa làm; mới thừa nhận limitation** |
| Bổ sung CI nhất quán cho RQ1 | **Chưa làm** |

Kết luận RQ1 hiện vẫn hợp lý và thận trọng hơn trước, nhưng chưa đủ protocol để tái lập.

### 3.3 RQ2

| Khuyến nghị | Trạng thái |
|---|---|
| Đổi “100 pairs” thành matched treatment blocks/triplets | **Đã làm đúng** |
| Làm rõ nominal budget và last-call overshoot | **Đã làm đúng** |
| Sửa “94% protected tests” thành run-level statement | **Đã làm đúng** |
| Hạ kết luận “partially supported” | **Đã làm đúng**; hiện ghi `RQ2 is not supported inferentially` |
| Bổ sung sampling frame/fault IDs/failure taxonomy | **Chưa làm** |
| Tách compilation outcome khỏi composite status | **Chưa làm; source data không có** |
| Missingness sensitivity/ITT cho adequacy | **Chưa làm** |

Kết luận RQ2 sau sửa đúng logic hơn và không còn overclaim rõ ràng.

### 3.4 RQ3

| Khuyến nghị | Trạng thái |
|---|---|
| Sửa denominator Table 8 | **Đã làm đúng**; routing dùng 54, overall abstention dùng 73 |
| Giải thích 219 = 73 × 3 specialist outputs | **Đã làm đúng** |
| Công thức metric và confusion matrix | **Chưa làm** |
| Flow từ 180 candidate xuống 73 case và sensitivity | **Chưa làm** |
| Hai annotator độc lập/holdout freeze trước scoring | **Chưa làm** |
| Tách pre-repair và repaired DeepSeek rows | **Chưa làm** |
| Budget-matched ablation B1/B2 | **Chưa làm** |
| Sửa causal wording vì RQ3 exploratory | **Làm một phần** |

File phản hồi 22:58 nói “làm rõ metric/denominator RQ3”, nhưng chính xác hơn phải là **đã làm rõ một số denominator và output accounting**. Positive class, công thức FAR/F1/accuracy/coverage/selective accuracy, treatment của invalid/abstain và confusion matrix vẫn chưa có.

Abstract đã đổi từ ngôn ngữ causal “reduced/increased” sang so sánh quan sát “had ... versus”. Tuy nhiên, Conclusion tại `trace-paper.tex:647` vẫn viết “B2 reduces ... while increasing ...”. Nên đổi thành ngôn ngữ mô tả, ví dụ: “B2 had a lower observed false-acceptance rate ... and a higher observed routing accuracy ... in this exploratory cohort.”

### 3.5 FullChain--EvoSuite

| Khuyến nghị | Trạng thái |
|---|---|
| Định nghĩa FullChain và VSR trước khi dùng | **Đã làm đúng** |
| Đổi CSR/ESR thành delivered CSR/delivered ESR | **Đã làm đúng** |
| Nêu raw pre-gate CSR/ESR không có | **Đã làm đúng** |
| Hạ kết luận về TRACE-specific evaluation contract | **Đã làm đúng** |
| Nêu gate neutrality chưa được chứng minh | **Đã làm đúng ở mức limitation** |
| Làm rõ timeout 900 giây | **Chưa giải quyết; mới nói scope không được báo cáo** |
| Cấu hình EvoSuite đầy đủ | **Chưa làm** |
| Chứng minh neutral mapping/evidence envelope cho EvoSuite | **Chưa làm** |
| Báo token/cost phía EvoSuite và tách generation/repair/verification | **Chưa làm** |
| Denominator/missing policy Table 11 | **Chưa làm** |
| Nêu rõ overlap giữa cohort FullChain và RQ1 | **Chưa làm** |
| Công bố immutable campaign release/manifest | **Chưa làm** |

Việc hạ claim là đúng, nhưng fairness và reproducibility chưa được giải quyết; vì vậy kết quả này vẫn chỉ là delivered-system result theo evaluation contract hiện tại.

## 4. Những việc agent đúng khi không tự làm

Agent đã đúng khi không tự suy đoán hoặc tạo giả:

1. Tên tác giả, affiliation, ORCID và corresponding email.
2. Funding, competing interests, author contributions, data/code availability.
3. AI-use declaration khi chưa có xác nhận chính xác về công cụ, mục đích và phạm vi từ toàn bộ tác giả.
4. Raw empirical package, target manifest, run ledger, confusion matrix, tool lock, prompts/config, campaign CSV và seeds.
5. STS construction, N/A reason codes, sampling frame, model snapshot, EvoSuite flags, CPU/RAM hoặc gate-neutral mapping chưa có trong source.
6. Vector Figure 1 khi repository chỉ có bitmap và không có file thiết kế gốc.

Không nên “hoàn tất” các mục này bằng thông tin suy đoán. Cần nhóm tác giả hoặc chủ sở hữu artifact cung cấp dữ liệu thật.

## 5. Các sửa đổi còn cần thiết theo thứ tự ưu tiên

### P0 — Chặn submission

1. Điền author, affiliation và corresponding email thật. ISSE là single-blind, nên placeholder hiện tại không hợp lệ.
2. Hoàn tất `Statements and Declarations`, đặc biệt Competing Interests và Data Availability. Không dùng `To be completed by the authors.` trong bản nộp.
3. Xác nhận và thêm LLM/AI-use disclosure đúng thực tế nếu quá trình viết/sửa vượt quá copy editing.
4. Cung cấp anonymous hoặc public immutable empirical package nếu bài tiếp tục đưa ra claim về auditability/reproducibility; tối thiểu cần manifest, raw results, configs, prompts, tool/model versions, analysis scripts, seeds và hash.

### P1 — Cần sửa về bằng chứng/phương pháp

5. Sửa causal wording RQ3 còn sót ở Conclusion.
6. Thêm metric dictionary/công thức và confusion matrices RQ3; phân biệt rõ denominator 54/73 và invalid/abstain.
7. Bổ sung hoặc công khai protocol RQ1: target sampling, STS ground truth, N/A reasons, clustering và seed policy.
8. Bổ sung protocol FullChain--EvoSuite: command/config EvoSuite, timeout scope, resource budget, gate-neutral mapping, candidate denominators và cost hai phía.
9. Nêu rõ cohort FullChain có trùng 150 target của RQ1 hay không; nếu trùng, không mô tả như external holdout.
10. Xuất lại Figure 1 từ source design thành EPS/PDF vector có embedded font hoặc raster tối thiểu 600 dpi ở final size.

### P2 — Hoàn thiện bài

11. Thêm một section `Threats to Validity` có cấu trúc rõ: construct, internal, external, conclusion/reliability validity. Hiện caveat có nhưng nằm rải rác.
12. Bổ sung bảng cấu hình experiment: exact model/version snapshot, access date, decoding settings, retry policy, tool versions, prompt/config hash.
13. Nâng `CITATION_AUDIT.md` thành audit có URL/DOI, ngày kiểm tra, publication status và claim-level support; ưu tiên publisher version thay cho arXiv khi có.
14. Chỉ bổ sung PDF metadata sau khi author information đã được xác nhận.

## 6. Nhận xét riêng về file phản hồi 22:58

File `20260923-2258-CuuTroHan-to-all-phan-hoi-bon-bao-cao-danh-gia-trace.md` có cấu trúc trao đổi hợp lý, phân biệt rõ “đã làm” và “chưa thể làm”, không che giấu thiếu artifact. Các mục 1--8 và 10--15 trong phần “Nội dung đã làm theo” nhìn chung khớp source hiện tại.

Mục 9 nên sửa câu từ “làm rõ metric/denominator RQ3” thành “làm rõ denominator của Table 8 và output accounting 219/219”; metric definitions vẫn thiếu. Ngoài ra, nên thêm một mục “làm một phần” thay vì xếp mọi thay đổi vào hai nhóm nhị phân “đã làm”/“chưa thể làm”, vì RQ3 causal wording, gate neutrality, timeout và reproducibility hiện mới được hạ claim hoặc ghi limitation chứ chưa được giải quyết.

## 7. Kết luận cuối

Agent đã tiếp thu đúng và triển khai tốt các sửa đổi có thể xác minh trực tiếp từ repository: font, heading, `\nocite`, citation mapping, terminology, RQ2 conclusion, RQ3 denominator, FullChain/VSR và delivered metrics. Agent cũng đúng khi không bịa dữ liệu còn thiếu.

Tuy vậy, không nên kết luận rằng toàn bộ phản biện đã được xử lý. Bản hiện tại vẫn là **major revision** vì còn placeholder bắt buộc, Figure 1 dưới chuẩn, thiếu AI-use/declaration thật, thiếu empirical package và còn nhiều khoảng trống methodology/fairness mà chỉnh prose không thể thay thế. Sau khi nhóm tác giả cung cấp thông tin và artifact thật, cần cập nhật source, chạy lại kiểm tra citation/statistics/build và tạo một phản hồi vòng tiếp theo.
