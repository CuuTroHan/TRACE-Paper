# Nhiệm vụ của Dũng: khóa dữ liệu, mã nguồn và replication package

## Mục tiêu

Đóng blocker lớn nhất về khả năng kiểm chứng các kết quả RQ1, RQ2, RQ3 và thí
nghiệm FullChain--EvoSuite. Đầu ra cuối phải cho reviewer truy cập được dữ liệu,
cấu hình và mã phân tích thực sự hỗ trợ Tables 1--12, thay vì chỉ có đường dẫn
cục bộ và SHA-256 trong workspace của nhóm.

**Mức ưu tiên:** P0/P1, phải hoàn thành trước khi chốt Data Availability và Code
Availability.

## Hiện trạng cần xử lý

- Repository bài báo chưa chứa raw records, cohort/target manifest, prompt,
  model configuration, analysis script và environment lock đầy đủ cho cả bốn
  campaign.
- `RQ3_PROVENANCE.md` mới chứng minh danh tính một số file cục bộ; reviewer
  không truy cập được các file đó.
- RQ1 còn chênh denominator STS/BC giữa treatment DeepSeek và thiếu reason code
  công khai cho N/A.
- FullChain--EvoSuite còn thiếu raw pre-gate CSR/ESR, mô tả chi tiết timeout,
  audit harness/configuration và bằng chứng về tính trung lập của evaluation
  gate.
- ISSE yêu cầu bài nghiên cứu gốc phải có Data Availability Statement giải thích
  cách truy cập dữ liệu hỗ trợ kết quả và phân tích.

## Dũng cần cung cấp cho agent

1. **Chỉ định bản canonical/frozen** cho từng campaign:
   - RQ1 DIRECT--PLANNED;
   - RQ2 TGSLR--FTMR--FCR;
   - RQ3 B0--B1--B2 của từng model;
   - FullChain--EvoSuite.
2. Với mỗi campaign, gửi đường dẫn chính xác tới:
   - raw records và derived tables;
   - target/cohort manifest;
   - prompt template và schema đầu ra;
   - model ID/snapshot, seed, temperature, decoding/retry policy;
   - Maven/Gradle, JUnit, JaCoCo, PIT và EvoSuite configuration;
   - script tạo bảng, thống kê và figure;
   - canonical report được nhóm chấp nhận.
3. Giải thích bằng văn bản file nào đã bị thay thế, file nào là sensitivity
   evidence, và file nào tuyệt đối không được dùng. Đặc biệt phải xác nhận tình
   trạng DeepSeek RQ3 repaired artifact.
4. Xác nhận dữ liệu nào có thể công khai, dữ liệu nào cần redact, lý do hạn chế,
   quyền/licence áp dụng và người chịu trách nhiệm phát hành.
5. Chọn nơi phát hành bất biến: Zenodo/Figshare/OSF hoặc GitHub release được lưu
   trữ dài hạn. Nếu dùng Zenodo, cung cấp community/owner và quyết định licence.
6. Cung cấp hoặc xác nhận không tồn tại:
   - reason code cho N/A của RQ1;
   - raw pre-gate CSR/ESR của FullChain và EvoSuite;
   - log giải thích 175 `generation_failure` và 139 `repair_exhausted` của
     EvoSuite;
   - evaluator-neutral/equal-budget follow-up runs.
7. Chốt quyết định khoa học nếu không thể chạy thêm thí nghiệm: giữ kết quả ở
   mức exploratory/package-level và cho phép agent hạ claim tương ứng.

## Agent có thể giúp Dũng làm

1. Quét các thư mục Dũng chỉ định, lập inventory, SHA-256, kích thước, schema và
   dependency graph; phát hiện file trùng hoặc report mâu thuẫn.
2. Tạo cấu trúc replication package gồm `README`, `MANIFEST`, `LICENSE`,
   `environment`, `data/raw`, `data/derived`, `prompts`, `configs`, `scripts` và
   `reports` mà không tự chọn dữ liệu canonical thay Dũng.
3. Chạy lại analysis script, đối chiếu output với Tables 1--12 và ghi rõ bảng nào
   tái tạo được hoặc chưa tái tạo được.
4. Tạo checksum manifest, release notes, lệnh tái lập và bảng ánh xạ
   paper-table-to-artifact.
5. Redact dữ liệu theo quy tắc Dũng/pháp lý đã xác nhận; agent không tự quyết
   định dữ liệu nào là bí mật.
6. Soạn Data Availability và Code Availability bằng tiếng Anh từ URL/DOI và
   điều kiện truy cập đã được Dũng xác nhận.
7. Cập nhật manuscript, bibliography cho dataset DOI và build/kiểm tra PDF sau
   khi nhóm phê duyệt nội dung release.

## Agent không thể tự quyết định hoặc tự bịa

- Không thể tự chọn một CSV/report làm ground truth khi workspace có nhiều bản.
- Không thể khẳng định dữ liệu được phép công khai nếu chưa có xác nhận của nhóm.
- Không thể tạo ra raw run, seed, timestamp, protocol freeze hoặc kết quả thí
  nghiệm đã bị thiếu.
- Không thể thay DOI/persistent release bằng đường dẫn máy cục bộ.

## Đầu ra Dũng phải bàn giao

- [ ] Một file phản hồi trong `giaotiep/` gửi `to-CuuTroHan`, nêu rõ canonical
  path của từng campaign và các artifact bị loại.
- [ ] Một replication package đã kiểm tra, có README, licence và checksum.
- [ ] URL bất biến/DOI hoặc ít nhất release URL công khai đã khóa version.
- [ ] Bảng ánh xạ Tables 1--12 sang file/script tạo ra chúng.
- [ ] Kết quả audit RQ1 N/A và FullChain--EvoSuite pre-gate/harness.
- [ ] Hai đoạn tiếng Anh đã duyệt: Data Availability và Code Availability.

## Tiêu chí hoàn thành

Nhiệm vụ chỉ được coi là xong khi một máy không có workspace `R:\BaoVer2` có
thể tải package, kiểm tra checksum, xác định đúng cohort/configuration và chạy
được ít nhất các script tạo lại số liệu tổng hợp chính. Nếu còn artifact không
thể phát hành, statement phải nói rõ cách yêu cầu truy cập và điều kiện tái sử
dụng; không ghi chung chung “available upon request” nếu chưa có quy trình thật.

## Phụ thuộc và bàn giao tiếp theo

- Gửi URL/DOI và wording cho Chính để hoàn thiện declarations.
- Gửi toàn bộ release manifest cho Hán (`myseflt`) để kiểm tra gói submission.

## Nguồn chính thức cần tuân theo

- ISSE Submission Guidelines, Research Data Policy:
  <https://link.springer.com/journal/11334/submission-guidelines>
- Springer Nature Research Data Policy:
  <https://www.springernature.com/gp/authors/research-data-policy>
