# Cập nhật tác giả, declarations, Abstract và kiểm tra EvoSuite

Ngày 27/09/2026. Đây là bản làm việc, **chưa chốt để submit**. Không chạy lại
thí nghiệm, không sửa dữ liệu đầu vào, không commit/push trong lượt này.

## 1. Những gì đã sửa trong paper

- Thêm Nguyen Thi Nguyet ở cuối danh sách: tổng cộng **sáu tác giả**, giữ nguyên
  thứ tự năm sinh viên. Đánh dấu corresponding author, email
  `nguyetnt41@fpt.edu.vn`; cập nhật cả metadata PDF.
- Dùng chung affiliation FPT University và địa chỉ Hòa Lạc bên dưới.
- Funding: `The authors received no funding for this research.`
- Acknowledgements: `None.` theo xác nhận không có người/đơn vị cần cảm ơn riêng.
- Data/Code availability: ghi đúng trạng thái đang chuẩn bị, chưa có thông tin
  truy cập và phiên bản hoàn chỉnh; không tự tạo DOI, license hay cam kết công bố.
- Contributions: ghi vai trò hướng dẫn của cô Nguyệt; giữ yêu cầu xác nhận vai
  trò chi tiết của cả sáu người, chưa tự khai đóng góp ngang nhau.
- Competing interests chưa được người dùng xác nhận nên còn để trống có đánh dấu.
- Ethics/Consent: đổi lời khẳng định `Not applicable` trước đây thành cần xác
  nhận, vì người dùng mới nói “có vẻ”. Những dòng này phải được chốt trước nộp.
- Abstract: 216 từ nếu đếm theo khoảng trắng; không dùng SF110 chưa giải thích;
  tránh suy luận nhân quả riêng cho planning; dùng **estimated token cost**;
  ghi rõ ngân sách tìm kiếm EvoSuite 60 giây và giới hạn tính trung lập của gate.
- Đồng bộ cách nói về ước lượng token ở §4.2, §4.3.4, §4.3.5 và Conclusion.
- Bổ sung phát hiện từ ZIP vào §4.6, Threats và Conclusion. **12 bảng số liệu,
  Figure 1 và caption hiện tại đều giữ nguyên**.

## 2. Giải thích các mục thông tin tác giả

### Corresponding author và contributing author có mâu thuẫn không?

Không. Cô Nguyệt vừa là đồng tác giả, vừa là đầu mối liên hệ với tạp chí.
Trong template, email cô xuất hiện ở dòng `Corresponding author(s)`, còn email
năm bạn ở dòng `Contributing authors`. Đây là cách trình bày của template,
không có nghĩa cô không đóng góp hoặc không phải tác giả.

Chưa tự thêm ghi chú equal contribution hoặc co-first author. Việc ghi tên cô
trong bản nháp theo yêu cầu không thay cho cô/nhóm duyệt bản cuối và đồng ý nộp.
Vai trò “hướng dẫn” là thông tin đã biết; cần cho biết cô còn tham gia thiết kế,
diễn giải kết quả hoặc sửa nội dung học thuật như thế nào.

### Mục tên, thứ tự và affiliation cần xác nhận gì?

Đây là thông tin nhận diện người viết, khác với tuyên bố công việc từng người.
Cần thống nhất cách viết tên trên paper, hệ thống nộp bài và ORCID nếu có.
Khi hệ thống tách họ/tên, không nhập toàn bộ tên Việt vào ô Family name.

| Tên hiển thị | Family name / surname | Given names |
|---|---|---|
| Nguyen Tuan Dung | Nguyen | Tuan Dung |
| Vuong Kieu Anh | Vuong | Kieu Anh |
| Doan Huu Minh Quang | Doan | Huu Minh Quang |
| Ngo Duc Chinh | Ngo | Duc Chinh |
| Tran Van Han | Tran | Van Han |
| Nguyen Thi Nguyet | Nguyen | Thi Nguyet |

Tên không dấu được giữ theo bản hiện có; nếu hồ sơ công bố của một người dùng
cách khác, người đó cần xác nhận trước khi chốt. Không tự đoán khoa/bộ môn.

Affiliation đang dùng:

> FPT University, Hoa Lac Hi-Tech Park, Km 29 Thang Long Boulevard, Hoa Lac Commune, Hanoi, Viet Nam.

Phần địa danh phù hợp [trang liên hệ chính thức của FPT University](https://daihoc.fpt.edu.vn/en/lien-he/).
Trang này không xác nhận mã bưu chính `100000`; bản sửa tạm bỏ mã này, không
thay bằng mã khác do phỏng đoán. Nếu trường yêu cầu một địa chỉ chuẩn cụ thể,
hãy gửi mẫu chính thức đó.

### Funding và Competing interests khác nhau thế nào?

Funding là nguồn hỗ trợ cho nghiên cứu. Competing interests là những lợi ích
hoặc quan hệ liên quan có thể ảnh hưởng cách thực hiện/diễn giải nghiên cứu.
Không nhận funding **không tự động** chứng minh không có competing interests.

Đánh giá hiện tại: trong các tài liệu đã kiểm tra, chưa thấy một lợi ích cạnh
tranh cụ thể được nêu ra. Tuy nhiên, code và CSV không cho biết tình trạng sở
hữu, hợp đồng hoặc các quan hệ riêng của sáu tác giả. Vì vậy chưa thể chứng nhận
“không có” thay nhóm.

Mỗi người cần tự kiểm tra: có cổ phần/lợi ích thương mại trong TRACE hoặc nhà
cung cấp được đánh giá không; có patent, hợp đồng tư vấn, tiền thù lao, tài trợ
API/cloud liên quan không; có quan hệ với đơn vị/cá nhân liên quan cần công bố
không. Việc là nhóm phát triển TRACE được mô tả trong bài, nhưng không loại trừ
những lợi ích khác nếu có.

Nếu cả sáu xác nhận không có, có thể chốt bằng câu dự thảo:

> The authors declare no competing interests relevant to this study.

Đây chưa phải tuyên bố đã được xác nhận. Tham khảo
[hướng dẫn tác giả ISSE](https://link.springer.com/journal/11334/submission-guidelines).

### “Cả năm đều làm” có được không?

Được nếu mô tả đúng thực tế, nhưng cần nói **cùng làm những việc gì**. Không cần
chia tỷ lệ 20% hoặc gán mỗi người độc quyền một việc. Có thể gom tên cùng vai trò:

> Nguyen Tuan Dung, Vuong Kieu Anh, Doan Huu Minh Quang, Ngo Duc Chinh, and Tran Van Han contributed to [the activities actually shared by all five]. Nguyen Thi Nguyet contributed to supervision and [any other confirmed activities].

Các hoạt động để nhóm chọn/xác nhận: lên ý tưởng, thiết kế phương pháp, viết
phần mềm, chạy thí nghiệm, chuẩn bị dữ liệu, phân tích thống kê, viết bản đầu,
đọc và sửa bài. Không tự điền toàn bộ vào tất cả mọi người. Câu “cùng tham gia”
không đồng nghĩa “đóng góp ngang nhau”. Câu xác nhận mọi tác giả duyệt bản cuối
chỉ thêm khi việc đó thực sự đã xảy ra.

### Data/Code và Ethics/Consent

Khi package xong, cần gửi: URL truy cập, release/tag hoặc commit cố định, phạm vi
RQ1/RQ2/RQ3/FullChain, hướng dẫn tái lập và thông tin license/quyền phân phối đã
được nhóm kiểm tra. Không đưa API key, token truy cập hay file cấu hình bí mật
vào release. Không mặc nhiên lấy repo bản thảo làm repo dữ liệu thực nghiệm.

Với nghiên cứu chỉ đánh giá phần mềm, `Not applicable` có thể phù hợp cho các mục
Ethics/Consent. Nhưng cần xác nhận không có nghiên cứu trên người/động vật,
khảo sát/phỏng vấn, dữ liệu cá nhân cần bảo vệ hoặc nội dung nhận diện cá nhân
cần đồng ý công bố. Đặc biệt, annotator RQ3 là thành viên nhóm tạo nhãn kỹ thuật
hay người tham gia được tuyển và được thu thập dữ liệu đánh giá? Sự có mặt của
một annotator không tự động biến nghiên cứu thành nghiên cứu trên người, cũng
không đủ để tự kết luận miễn xét duyệt. Nếu trường có quy trình liên quan, cần
đối chiếu với cô hướng dẫn. Không tự tạo số phê duyệt hoặc giấy miễn trừ.

## 3. Kết quả kiểm tra phần EvoSuite

Nguồn: `experiments/full-chain/runs/official-150-20260920-r42-r44-v1.zip`
(9,855,551,047 byte). Đọc chọn lọc trong ZIP, không giải nén toàn bộ.

| Đối chiếu | Kết quả |
|---|---|
| CSV trong ZIP và CSV dùng tính bảng | Trùng byte; SHA-256 `ec58c015db187cb43a1882b61906dc13c65916cb59a91fc5247a423d6ee47a15` |
| Raw terminal records | 900: 450 FullChain, 450 EvoSuite |
| Lệnh EvoSuite và khóa target/repetition | 450 lệnh, 450 khóa; khớp đủ terminal records |
| Search budget thực tế trong lệnh | **450/450 dùng `-Dsearch_budget=60`** |
| Protocol/config chính thức | Search allocation 420 s; nominal whole-run budget 900 s |
| Search process timeout | 4 lệnh `TimedOut: True`, exit 137; raw reason cùng bốn run ghi 120 s |
| Các run timeout | PT-O-021 / 42, 43, 44; PT-O-138 / 43 |
| EvoSuite đã qua một verification pass | 275/450; 175 còn lại ghi 0 pass |
| EvoSuite token/provider-request counters | 0 ở cả 450 records, kể cả 275 run có verification |

Script kiểm tra: `paper/scripts/inspect-full-chain-archive.py`.
Output máy đọc: `paper/verification/full-chain-archive-audit.json`.
Lệnh tái kiểm tra nằm trong `paper/verification/README.md`.

### Ý nghĩa của 60, 120, 420 và 900 giây

- **60 s:** giá trị search budget thực tế được truyền vào EvoSuite, có bằng
  chứng cho toàn bộ cohort. Không phải 60 s tổng thời gian cả pipeline.
- **120 s:** timeout tiến trình được ghi ở bốn terminal records. Mã adapter hiện
  tại cộng thêm 60 s vào search timeout, phù hợp 60 + 60 = 120. Đây không phải
  một search allocation thứ hai.
- **420 s:** search allocation của protocol, không phải giá trị đã dùng trong
  các command được lưu. Đây là deviation cần công khai.
- **900 s:** giới hạn whole-run trên giấy/config; chỉ có thông tin này không
  chứng minh hai treatment đã sử dụng hay được thực thi giới hạn hoàn toàn bằng nhau.

Nguồn mã hiện tại `tools/full-chain-benchmark/EvoSuiteAdapter.cs`
xây dựng `-Dsearch_budget`
từ tham số runner, dùng timeout tiến trình search + 60 s, gọi B2 rồi ghi cứng
`TotalProviderRequests: 0` và `TotalTokensUsed: 0`. Mã hiện tại giúp giải thích,
nhưng chưa được nối với hash một source revision lịch sử của campaign.

Không có căn cứ để thay các số 0 thành một tổng token đoán. Cần usage logs/provider
records của các lời gọi B2 để phục hồi. Nếu không phục hồi được, phải coi chi phí
nhánh EvoSuite là **incompletely measured**, không tuyên bố hệ thống đó không tốn LLM.

### Có bắt buộc chạy lại không?

Số VSR 248/450 so với 130/450 vẫn là thống kê của cohort đã chạy, không bị đổi chỉ
vì phát hiện timeout. Nhưng không được trình bày như kết quả EvoSuite search 420 s
hay một đối chứng đã chứng minh công bằng ngân sách. Không thể “sửa config” bây
giờ để làm lịch sử thành 420 s.

Nếu muốn kết luận theo protocol 420 s, cần campaign mới với launcher/config khóa
rõ ràng và counters chi phí đúng, hoặc sensitivity có thiết kế công khai. Nếu
giữ nguyên dữ liệu, chỉ kết luận cho cấu hình 60 s và nêu deviation/giới hạn như
bản sửa; điều này không bảo đảm reviewer sẽ chấp nhận. Chưa thực hiện rerun hoặc
sửa runner vì người dùng mới yêu cầu kiểm tra phần này.

## 4. Estimated token: đã đổi cách viết nhưng chưa giải quyết nguồn ước lượng

432/450 response Gemini RQ1 không có usage metadata; CSV đã nối được với metrics
nhưng chưa biết thuật toán tạo token trong run records. Đã gắn nhãn estimate,
giữ số gốc và nói rõ thiếu phương pháp/tokenizer. DeepSeek có usage fields nhưng
chưa cộng độc lập từng response để chốt provider totals trong lượt này.

Thông tin vẫn cần: script/hàm tạo token count, tokenizer và version nếu dùng,
hoặc cách fallback khi provider không trả usage; prompt/output/planning có được
tính đủ không; retry có nằm trong tổng không. Nếu chưa xác định được, có thể
giữ số này như ước lượng hạn chế hoặc bỏ kết luận định lượng token, nhưng không
được tự mô tả một công thức không có bằng chứng.

## 5. Danh sách thông tin cần nhóm trả lời

1. Xác nhận sáu tên, thứ tự hiện tại, cô Nguyệt làm corresponding author và đồng
   ý nhận email nộp bài. ORCID nếu có.
2. Năm bạn thực sự cùng làm những hoạt động nào; cô đóng góp gì ngoài hướng dẫn?
3. Cả sáu có hay không các lợi ích/quan hệ liên quan được nêu ở phần 2?
4. Annotator RQ3 là ai theo vai trò (không cần gửi dữ liệu cá nhân); có hoạt động
   nghiên cứu trên người hoặc dữ liệu nhận diện cá nhân không?
5. Phương pháp tạo token estimates Gemini, hoặc chỉ đường tới script/hàm tương ứng.
6. Khi sẵn sàng: link và version package dữ liệu/code. Chưa cần gửi lại ZIP đã có.
7. Chọn giữ so sánh EvoSuite 60 s với giới hạn rõ ràng, hay thiết kế chạy bổ sung
   theo 420 s. Đây là quyết định nghiên cứu, không chỉ là sửa câu chữ.
8. Kiểm tra phạm vi AI hỗ trợ bản thảo/phân tích để khai báo đúng thực tế; không
   mặc định mọi công việc vừa thực hiện chỉ là sửa ngữ pháp.

PDF đã build 28 trang, kiểm tra ảnh render toàn bộ trang và xem kỹ trang đầu,
declarations; không thấy clipping/overlap, không có overfull hoặc unresolved
references. Log còn underfull và warning encoding package. Figure 1 giữ nguyên
theo yêu cầu, bao gồm hạn chế độ phân giải đã báo trước. Kiểm tra này không phải
cam kết bài đã sẵn sàng nộp hay chắc chắn được nhận.
