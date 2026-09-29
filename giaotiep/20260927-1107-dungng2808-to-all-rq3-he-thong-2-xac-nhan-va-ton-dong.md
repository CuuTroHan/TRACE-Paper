# RQ3: những điều đã xác định về kết quả Hệ thống 2

- Thời điểm ghi nhận: 2026-09-27 11:07, Asia/Ho_Chi_Minh.
- Người gửi/người nhận: `dungng2808` → `all`; Codex hỗ trợ kiểm tra và ghi chép theo yêu cầu của Dũng. Các kết luận về file được nêu riêng với thông tin Dũng xác nhận.
- Phạm vi kiểm tra: **chỉ kết quả Hệ thống 2** trong `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/`, dữ liệu đầu vào Hệ thống 2 và bản sao tương ứng tại `ThucNgiem/KQ_Thucnghiem_SauTinhChinh/`. Không dùng kết quả Hệ thống 1 để đánh giá GLM.
- Đây là snapshot hiện tại để xử lý các việc còn lại sau. Chưa sửa dữ liệu thí nghiệm, metric, README hay manuscript trong lần kiểm tra này.

## 1. Bộ dữ liệu và phép ghép theo case

[Manifest exploratory v2](../../../HeThong2_ThucNghiem_TongHop/02_DAU_VAO/phase6_exploratory_v2_dataset/registry/phase6_exploratory_v2_manifest.json) ghi `FROZEN_EXPLORATORY_V2`, 73 case thuộc 14 project; 65 case controlled injection và 8 case natural. SHA-256 của manifest là:

```text
8A29C26A701007C3008A291EC6C3240081B4D3DD56E96A07468718B90F154669
```

Thư mục `02_DAU_VAO/phase6_exploratory_v2_dataset/gold/private/` có 73 file gold JSON; `cases/public/` và `envelopes/` cũng có đúng 73 case tương ứng. Các mã `case_id` khớp một-một giữa manifest, public case và gold. 73/73 đường dẫn source trong manifest tồn tại và hash source khớp; 73/73 hash file envelope cũng khớp.

Ba run Hệ thống 2 dùng trong bài là Gemini 3.5 Flash, DeepSeek V4 Pro bản repaired và GLM 5.3 Flash, nằm dưới `03_KET_QUA/01_DUNG_TRONG_BAO/`. Mỗi run có 219 prediction, tức 73 case × B0/B1/B2, không thiếu hoặc trùng cặp `case_id` × verifier. Đối chiếu tổng cộng 657 dòng `predictions_joined_private_gold_v2.csv` với prediction JSON, gold JSON và public case cho thấy không có sai lệch ở các trường đã kiểm tra: `case_id`, project, decision, cause, route, trạng thái output, token/API count, nhãn gold và hash envelope. Hash envelope trong prediction là hash của nội dung JSON do runner đọc (không gồm UTF-8 BOM), nên khác hash byte của file envelope trong manifest; cả 657 giá trị đều khớp khi tính đúng theo cách của runner.

Tính lại từ CSV các chỉ số decision accuracy, false-acceptance rate, routing accuracy và số output lỗi cho B0/B1/B2 của cả ba run: không có sai lệch so với `metrics_v2.json`. SHA-256 của ba file metric trong gói Hệ thống 2 trùng với ba hash đầu vào RQ3 ghi trong [component-results.json](../paper/verification/component-results.json), tức đây là đúng các export được dùng để đối chiếu manuscript.

Các kiểm tra trên xác nhận **tính liên kết và nhất quán số liệu của những file hiện có**; chúng không tự kiểm chứng nội dung nhãn gold bằng một lần gán nhãn độc lập.

## 2. Kết quả GLM của Hệ thống 2

Run được kiểm tra: [GLM trong thư mục dùng cho bài](../../../HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/). [Run manifest](../../../HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/predictions/run_manifest.json) ghi `b1_model` và `b2_model` là `glm-5.3-flash`, cùng endpoint B.AI. Trường `model` tổng quát vẫn mang giá trị mặc định `google/gemini-2.5-flash`; trong runner, B1/B2 dùng các trường cấu hình riêng `b1_model`/`b2_model`. Không nên đọc trường tổng quát đó là model thực chạy cho B1/B2.

Từ [prediction JSON gốc](../../../HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/predictions/predictions.json):

| Verifier | `OK` | `INVALID_OUTPUT` | `PARTIAL_INVALID_OUTPUT` |
|---|---:|---:|---:|
| B0 | 73 | 0 | 0 |
| B1 | 36 | 37 | 0 |
| B2 | 23 | 0 | 50 |
| **Tổng** | **132** | **37** | **50** |

Vậy run có đủ **219 dòng prediction**, nhưng **87 dòng có trạng thái output không hoàn toàn hợp lệ**. [Run manifest](../../../HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/predictions/run_manifest.json) ghi `invalid_outputs: 87`, `complete: false`; [metrics_v2.json](../../../HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/results/metrics_v2.json) cũng ghi 37 output lỗi ở B1 và 50 ở B2. Trong 37 B1 `INVALID_OUTPUT`, rationale ghi 34 trường hợp không có JSON token và ba trường hợp JSON chưa hoàn chỉnh. B2 `PARTIAL_INVALID_OUTPUT` nghĩa là ít nhất một kết quả specialist trong case đó không hợp lệ; một số quyết định tổng hợp vẫn được tạo. Chưa quy nguyên nhân kỹ thuật cuối cùng của các lỗi này.

SHA-256 của prediction, metric và run manifest ở gói tổng hợp trùng hoàn toàn với các file cùng tên trong `ThucNgiem/KQ_Thucnghiem_SauTinhChinh/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/`. Vì vậy, số 87 không phát sinh do đọc nhầm một bản sao khác. [README của run GLM](../../../HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/README.md) ghi “219/219 output hợp lệ”; câu này mâu thuẫn với prediction, manifest và metric. `219` là số dòng có mặt, không phải số output hợp lệ.

## 3. Thông tin Dũng xác nhận về gold cuối

Dũng xác nhận script và AI annotation được nhắc trong trao đổi trước là phần **thử nghiệm**, còn gold/kết quả cuối sử dụng cho nghiên cứu do Dũng và nhóm tự thực hiện. Codex hiện không có quyền truy cập hồ sơ gán nhãn cuối của nhóm để kiểm tra quy trình đó. Do vậy, không suy từ sự tồn tại của script hoặc file AI annotation rằng chúng là quy trình gán nhãn cuối hay rằng gold cuối thiếu thẩm định của nhóm. Nhận định trước của Codex theo hướng đó đã được rút lại.

Các kiểm tra file ở mục 1 chỉ xác nhận prediction, gold JSON và metric đang có trong workspace ghép khớp theo case. Việc xác nhận ai đã phê duyệt từng nhãn gold cuối thuộc hồ sơ của nhóm, chưa được kiểm tra trong snapshot này.

**Bổ sung sau snapshot:** Dũng xác nhận nhóm đã trao đổi và chốt nhãn cuối bằng lời nói, không lập biên bản hay bảng duyệt theo từng case. Vì vậy, câu “không có quyền truy cập hồ sơ gán nhãn cuối” ở trên chỉ phản ánh hiểu biết tại thời điểm 11:07; không có hồ sơ viết riêng để cung cấp. Các file gold cuối và hash vẫn cho phép đối chiếu số liệu, nhưng không chứng minh độc lập được ai chốt từng nhãn hoặc mức đồng thuận giữa người gán nhãn.

## 4. Việc còn tồn đọng để xử lý sau

1. Tìm nguyên nhân và quyết định cách xử lý 37 `INVALID_OUTPUT` B1 cùng 50 `PARTIAL_INVALID_OUTPUT` B2 trong run GLM Hệ thống 2. Không diễn giải `false-acceptance rate = 0` của B2 như bằng chứng an toàn tuyệt đối khi run còn các output không hoàn toàn hợp lệ.
2. Sửa câu “219/219 output hợp lệ” trong README GLM; rà lại những câu kết luận mạnh ở `CAU_HINH_MODEL.md` cho phù hợp với trạng thái `complete: false`. Chưa thay metric hoặc dữ liệu khi chưa chốt cách xử lý run.
3. Nếu nhóm muốn đóng yêu cầu truy vết gold với người rà soát bên ngoài, cung cấp version/hash hoặc biên bản xác nhận của **bộ gold cuối do nhóm phê duyệt** khi phù hợp quyền truy cập. Không dùng tài liệu thử nghiệm AI để thay thế hồ sơ đó.
4. Việc chấm lại toàn bộ RQ3 từ gold/prediction và tái sinh các bootstrap CI, cũng như quyết định cách trình bày GLM trong manuscript, sẽ được bàn sau. Snapshot này mới đối chiếu các chỉ số cốt lõi và tính liên kết theo case.
