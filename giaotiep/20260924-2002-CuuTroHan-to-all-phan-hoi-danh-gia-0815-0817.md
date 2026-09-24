# Phản hồi đánh giá 08:15 và 08:17 cho bản thảo TRACE

- **Người gửi:** CuuTroHan
- **Người nhận:** all
- **Thời gian:** 2026-09-24 20:02 (Asia/Ho_Chi_Minh)
- **File được đánh giá:**
  - `20260924-0815-chinh-to-CuuTroHan-danh-gia-noi-dung-trace.md`
  - `20260924-0817-quangdhmhe181540-to-CuuTroHan-kiem-tra-phan-hoi-0759-va-ban-sua.md`
- **Phạm vi sửa:** `trace-paper.tex`, `trace-paper.pdf`, `BUILD_RECORD.md`, `RQ3_PROVENANCE.md`

## 1. Kết luận đánh giá

Hai báo cáo nhìn chung chỉ ra đúng các rủi ro còn lại, nhưng báo cáo 08:15 đã
đánh giá bản PDF 25 trang nên một số nhận định không còn phản ánh source hiện
tại. Trước vòng sửa này, commit `3233f79` đã có công thức Decision Accuracy,
Coverage, Selective Accuracy, bảng confusion counts RQ3 và một section riêng
`Threats to Validity`. Vì vậy không tính lại Table RQ3 theo giả định rằng mọi
abstention đều sai; dữ liệu gốc xác nhận `ABSTAIN` là một gold/predicted label
hợp lệ cho Decision Accuracy.

Báo cáo 08:17 kiểm tra đúng các thay đổi ở commit `3233f79` và đúng khi yêu cầu
bổ sung class/route/zero-division/invalid-aggregation vào metric dictionary,
ghi provenance/hash cho artifact ngoài repository, và tách rõ conclusion
validity khỏi reproducibility.

## 2. Những điểm đã làm theo

1. Sửa lỗi ký hiệu tại phần Structural Planning: test method cần sửa là
   `$T_i$`, không phải scenario `$S_i$`.
2. Sửa citation Requirement Planner của TestAgent từ `bib7` thành `bib23`.
3. Sửa mô tả RQ3 để phản ánh đúng phép tính thực tế:
   - Decision Accuracy là exact match trên ba lớp và gold/predicted `ABSTAIN`
     có thể là một quyết định đúng;
   - `ABSTAIN` không thuộc coverage/selective accuracy và không phải accept hay
     repair prediction trong false-passing analysis;
   - invalid/partial-invalid output vẫn được giữ ở case-level denominator.
4. Hoàn thiện metric dictionary RQ3 bằng bảy cause class, quy tắc zero
   denominator, route vocabulary, phép chấm theo membership trong
   `acceptableRoutes`, và quy tắc deterministic aggregation khi specialist
   output hợp lệ/không hợp lệ.
5. Ghi rõ gold decision distribution: 54 `REPAIR_REQUIRED`, 8 `VERIFIED`, 11
   `ABSTAIN` trên 73 case.
6. Thêm `RQ3_PROVENANCE.md` với SHA-256 của cohort manifest, scoring script,
   aggregator, protocol, ba joined CSV và ba `metrics_v2.json` ngoài repository.
7. Hạ causal wording RQ1: đây là package-level comparison của planning cộng
   planning call/compute bổ sung, không cô lập causal effect của plan
   representation dưới equal compute.
8. Đưa differential missingness RQ1 vào Abstract, Results, Answer to RQ1 và
   Conclusion: DeepSeek STS/BC có denominator khác giữa treatment; aggregate
   mean không phải common-cohort contrast và chỉ mang tính mô tả.
9. Giới hạn reporting policy theo từng analysis family thay vì tuyên bố chung
   rằng mọi kết quả đều có effect size, bootstrap CI và Holm correction.
10. Hạ novelty claim về phạm vi “among the approaches reviewed in this study”.
11. Nói rõ tsDetect chỉ là auxiliary architectural signal; các nghiên cứu hiện
    tại không đánh giá test-smell outcome và không dùng nó làm cơ sở empirical
    claim.
12. Đổi tiêu đề FullChain thành exploratory và tiếp tục giới hạn kết luận vào
    TRACE-specific gate chưa được chứng minh construct-neutral.
13. Đổi heading thành `Conclusion validity and reproducibility`.
14. Đổi “latest version of TRACE” thành “TRACE”.

## 3. Những điểm không làm theo và lý do

1. **Không tạo reason code N/A, common-cohort/sensitivity/ITT analysis mới cho
   RQ1.** Aggregate hiện có không chứa reason code cần thiết; tự suy đoán hoặc
   tự điền sẽ làm sai provenance. Manuscript đã công khai limitation và hạ
   headline claim.
2. **Không bịa protocol STS.** Chưa có artifact xác nhận người/công cụ tạo
   reference targets, blind status, annotation reliability hoặc planner access.
3. **Không chạy thí nghiệm budget-matched mới cho RQ1/B2.** Đây là thay đổi
   experimental design, không phải sửa prose; thay vào đó manuscript giới hạn
   claim ở package-level comparison.
4. **Không thêm flow diagram/taxonomy/sensitivity trên toàn bộ 180 RQ3 case.**
   Source hiện có đủ count 180 -> 149 -> 73 và mô tả selection bias, nhưng không
   có taxonomy/sensitivity artifact để báo thêm mà không suy đoán.
5. **Không commit raw empirical package.** Các file nằm ngoài repository và
   chưa có quyết định release/redaction/license của nhóm tác giả. Chỉ ghi hash
   provenance; việc này không được trình bày như một public release.
6. **Không điền author, affiliation, funding, competing interests, data/code
   availability hoặc author contributions.** Đây là thông tin học thuật/pháp
   lý chỉ tác giả được xác nhận.
7. **Không tự xác nhận trạng thái published/accepted của 11 tài liệu
   arXiv-only.** Cần publisher record hoặc acceptance evidence thật.
8. **Không vector hóa Figure 1 từ bitmap.** Cần source SVG/PDF/draw.io gốc để
   tránh tái dựng sai hình.
9. **Không thêm confusion table mới.** Table hiện tại đã có count và đã tự nhất
   quán với ba CSV gốc; nhận định “thiếu confusion counts” trong báo cáo 08:15
   thuộc bản 25 trang cũ.

## 4. Kiểm tra sau sửa

- Build bằng `pdflatex -> bibtex -> pdflatex -> pdflatex`: thành công.
- PDF mới: 27 trang A4.
- Không có LaTeX error, undefined citation/reference, overfull box, duplicate
  label hoặc duplicate PDF destination trong log.
- Toàn bộ 27 trang đã được render và rà trực quan; không thấy chữ/bảng bị cắt,
  chồng lấn hoặc tràn lề.
- Tất cả font PDF là Type 1 và embedded.
- PDF SHA-256:
  `26E69BFF148187D2AD7C116D554E97225F70354782CF28E221D66A2F08DF8D67`.

## 5. Trạng thái còn lại

Bản thảo đã đóng các lỗi source và reporting có thể xác nhận từ bằng chứng hiện
có, nhưng vẫn là **Major Revision / chưa submission-ready** cho tới khi tác giả
hoàn tất metadata/declarations, reference-status audit, Figure 1 production
source, RQ1/STS protocol và empirical release có quyền phát hành.
