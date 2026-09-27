# Nhờ Dũng rà soát bản sửa RQ3: Qwen3.8 Flash thay GLM

- Thời điểm: 2026-09-27 11:32, Asia/Ho_Chi_Minh.
- Người gửi: `CuuTroHan`; người nhận: `dungng2808`.
- Căn cứ: [ghi chú kiểm tra Hệ thống 2 lúc 11:07](20260927-1107-dungng2808-to-all-rq3-he-thong-2-xac-nhan-va-ton-dong.md). Ghi chú đó là snapshot **trước** bản sửa này.

Dung vui lòng kiểm tra các thay đổi dưới đây và phản hồi rõ mục nào đúng, mục nào cần chỉnh trước khi chốt bài.

## Những gì đã sửa

1. [Bản thảo LaTeX](../paper/trace-paper.tex) và [PDF build lại](../paper/trace-paper.pdf): bỏ hai dòng GLM khỏi từng bảng RQ3 (safety/quality, confusion, attribution/routing, paired uncertainty); đưa Qwen3.8 Flash vào thay. Không sửa dữ liệu thực nghiệm hoặc metric gốc của bất kỳ run nào.
2. Bảng Qwen mới: B1/B2 false-pass F1 `59.46% / 76.92%`; FAR `38.46% / 7.69%`; decision accuracy `73.97% / 78.08%`; coverage `72.60% / 82.19%`; selective accuracy `81.13% / 81.67%`. Confusion counts B1 `TP=11, FP=0, FN=15, TN=47`, false accepted `10`, positive abstentions `5`; B2 `TP=20, FP=6, FN=6, TN=41`, false accepted `2`, positive abstentions `2`.
3. Phần chẩn đoán nêu rõ bất lợi của B2 trên Qwen: attribution Macro-F1 `45.49% → 21.84%` (giảm `23.65` điểm phần trăm), routing `59.26% → 59.26%` (không tăng); abstention `27.40% → 17.81%`. Bảng uncertainty ghi decision McNemar `p=0.664`, F1 delta `+17.46 [0.00; 37.29]` điểm phần trăm, FAR `p=0.0078`, routing `p=1.0000`. B2 dùng `2.97×` input token và `221` API calls so với `83` của B1.
4. Bài công khai rằng Qwen được chọn **sau khi xem** bốn run Hệ thống 2 hợp lệ ngoài bộ cũ. F1 delta B2–B1 của các run đó: DeepSeek V4 Flash `+2.08`, Gemini 3.7 Google `+8.27`, Gemini 3.7 local medium `+10.01`, Qwen `+17.46` điểm phần trăm. Vì đây là chọn theo kết quả, bài chỉ xem Qwen là sensitivity/exploratory, không kết luận xác nhận tính ưu việt. Bài cũng giải thích GLM Hệ thống 2 có 87/219 output không hoàn toàn hợp lệ nên không đưa vào so sánh định lượng hiện tại.
5. Sửa mô tả gold: theo thông tin Dũng cung cấp, kết quả gold cuối do Dũng và nhóm tự làm/thẩm định; các script và AI annotation nhìn thấy trong workspace chỉ là test. Vì hồ sơ thẩm định cuối của nhóm không ở trong workspace này, bài không còn tuyên bố “một human annotator”, không dùng AI inter-pass agreement làm độ tin cậy của gold cuối, và nói rõ chưa kiểm chứng được số người gán nhãn độc lập hay human inter-rater agreement.
6. Cập nhật [RQ3 provenance](../paper/RQ3_PROVENANCE.md), [verification README](../paper/verification/README.md), [báo cáo metric đối chiếu](../paper/verification/component-results.json), [script làm mới báo cáo](../paper/scripts/verify-component-results.py), thêm [script kiểm tra Qwen theo CSV](../paper/scripts/verify-rq3-qwen.py), và [build record](../paper/BUILD_RECORD.md). Nguồn Qwen nằm dưới thư mục lịch sử `02_HOP_LE_KHONG_DUNG_TRONG_BAO`; tên thư mục chưa được đổi dù bản thảo nay dùng run này.

## Kiểm tra đã chạy

- Script CSV đọc 219 case-verifier rows không trùng, đối chiếu 219 specialist finding B2 đều `OK`, hash prediction/CSV/metric, các ô Qwen trong bảng và exact McNemar: **PASS**.
- PDF build bằng MiKTeX qua `pdflatex → bibtex → pdflatex → pdflatex`: **28 trang**, không có lỗi LaTeX, unresolved reference, overfull box hay missing character trong log cuối; bốn bảng RQ3 đã xem bằng bản render.
- [Build record](../paper/BUILD_RECORD.md) ghi hash của PDF, nguồn LaTeX và BBL. Compiler tích hợp của desktop báo lỗi môi trường; bản PDF giao là kết quả build MiKTeX thành công.

## Dũng cần xác nhận

1. Những số Qwen và diễn giải hai chiều ở mục 2–4 có đúng với run mà nhóm muốn đưa vào bài không? Đặc biệt xin rà lại sự giảm attribution rất lớn và việc routing không tăng.
2. Cách mô tả gold ở mục 5 có phản ánh đúng quy trình cuối của nhóm không? Nếu nhóm có ledger/biên bản, xin cung cấp mô tả đã được nhóm duyệt về số người gán nhãn, cách giải quyết bất đồng, điều kiện chọn 73 case và mức có thể công khai; hiện bài không tự điền các chi tiết đó.
3. Nhóm có đồng ý công khai việc chọn Qwen sau khi xem bốn run và giữ kết luận RQ3 ở mức exploratory không? Nếu cần tuyên bố confirmatory, phải có holdout độc lập/freeze trước khi chọn model và phân tích mới.
4. Xin rà lại việc để Qwen trong thư mục lịch sử “hợp lệ không dùng trong báo” nhưng liên kết run ấy từ bản thảo và provenance. Nếu nhóm đổi cấu trúc gói phát hành, cập nhật đường dẫn/hash trước khi nộp.
5. Xin kiểm tra PDF cuối, nhất là bốn bảng RQ3 và phần Threats/Conclusion, rồi ghi lại mục nào cần sửa cùng đề xuất câu chữ hoặc số liệu chính xác.

Tài liệu này là yêu cầu **rà soát**, không phải xác nhận thay cho Dũng hoặc nhóm rằng bản sửa đã được phê duyệt.

## Bổ sung sau phản hồi của Dũng

Dũng xác nhận nhóm chốt nhãn gold cuối qua trao đổi bằng lời nói và không lưu biên bản/bảng duyệt theo từng case. Do đó, câu ở mục 5 rằng hồ sơ ấy “không ở trong workspace” và câu hỏi về khả năng cung cấp ledger ở mục rà soát số 2 đã được làm rõ: hồ sơ viết đó không tồn tại. [Bản thảo hiện tại](../paper/trace-paper.tex) và [RQ3 provenance](../paper/RQ3_PROVENANCE.md) đã được sửa để ghi đúng giới hạn này. Không suy từ các file AI annotation thử nghiệm rằng chúng thay cho quyết định cuối của nhóm; cũng không ghi ngược một biên bản như thể được tạo cùng lúc với quá trình gán nhãn.
