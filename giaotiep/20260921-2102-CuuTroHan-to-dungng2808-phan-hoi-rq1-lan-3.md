# Phản hồi phản biện RQ1 lần 3: phạm vi build và hồ sơ còn thiếu

- Người gửi: `CuuTroHan`
- Người nhận: `dungng2808`
- Thời điểm: 21/09/2026, 21:02 (Asia/Ho_Chi_Minh)
- Phản biện được xét: `20260921-0232-dungng2808-to-CuuTroHan-phan-bien-rq1-lan-2.md`, commit `eefa5bd`
- Trạng thái: **bản phản hồi/corrigendum hiện hành** cho các kết luận audit RQ1 và Springer trong chuỗi `giaotiep/`. Hai phản hồi ngày 20/09 lúc 23:28 và 23:33, cùng tổng hợp ngày 21/09 lúc 00:05, được giữ làm hồ sơ lịch sử; nếu cách diễn đạt khác nhau, dùng phân định trong file này. Không sửa hồi tố thêm các file cũ.

## Đánh giá tổng quát

Phản biện đúng về giới hạn của build script, nhu cầu có release RQ1 độc lập, việc chưa có CI, provenance của Figure 1 và sự cần thiết của disclosure do tác giả xác nhận. Điểm cần giữ thận trọng là các mâu thuẫn cụ thể của report cũ: Dũng báo đã kiểm tra trong workspace `paper-2`, nhưng các report/ledger đó vẫn không có trong repository hoặc trên máy đang thực hiện phản hồi này. Vì thế tôi không xác nhận độc lập nội dung mâu thuẫn, hash hay trạng thái report.

## Đã sửa và đã kiểm tra

1. **Phân biệt build PDF với tái tạo RQ1.** `README.md` nay gọi `scripts/build-paper.ps1` là quy trình *kiểm tra build cục bộ*: cần PowerShell và `pdflatex`/`bibtex` trên `PATH`, không pin TeX distribution, không chạy CI và không đọc ledger/config/script thống kê. Nó không chứng minh Tables 1--2, exact McNemar, Wilcoxon/Holm, conditional analysis, token totals hoặc N/A/0. Script hiện có không bị diễn giải thành pipeline tái tạo thực nghiệm.
2. **Ghi provenance của PDF đã build.** `BUILD_RECORD.md` lưu MiKTeX-pdfTeX 4.27, MiKTeX-BibTeX 4.2 (MiKTeX 26.5), chuỗi lệnh, PDF 22 trang A4, SHA-256 `2F7D3693610C8967712D1720BFB79101263A4038F6FB09C252637BB0F5BE687E` và hash của source/bib/figure. Đây là bản ghi build theo Git, không phải release dữ liệu RQ1 hay bằng chứng byte-for-byte reproducibility trên mọi máy. Không nhận đã có CI hoặc log/lock được commit.
3. **Bảo toàn lịch sử giao tiếp.** File này được đánh dấu là phản hồi/corrigendum hiện hành; `README.md` dẫn tới đây và nói rõ các file phản hồi trước là hồ sơ lịch sử. Việc chỉnh hai file cũ ở commit `cc40c27` vẫn tra được bằng Git diff; tôi không chỉnh hồi tố thêm hoặc xóa chúng. Bản tổng hợp 00:05 vẫn phản ánh đúng tình trạng tại thời điểm gửi, còn file này cập nhật phạm vi build và những hạn chế mới được nêu.
4. **Kiểm tra Figure 1.** `pdfimages -list trace-paper.pdf` cho ảnh 1536 × 1024 tại trang 6 với x/y-ppi đều 244. `trace-paper.tex` dùng `Fig1.png`; không tìm thấy SVG/PDF/EPS gốc trong workspace hiện tại. Nhận định chất lượng artwork cần cải thiện là hợp lý, nhưng mức DPI chấp nhận cuối cùng phải đối chiếu yêu cầu của journal đích.
5. **Kiểm tra phạm vi dữ liệu.** `../experiments`, `../results` từ repository này và các thư mục tương ứng dưới `R:\BaoVer2` đều không tồn tại trên máy này. Tôi ghi nhận Dũng có thể truy cập chúng ở workspace `paper-2` khác. File phản biện mới đã có trong commit `eefa5bd`, nên không cần commit lại nó.

## Chưa sửa và lý do

| Đề xuất | Quyết định và lý do |
|---|---|
| Tạo `RQ1_RELEASE_MANIFEST`, tái tạo Tables 1--2, kiểm tra thống kê và raw paired deltas | Chưa làm: cần CSV, config, quality report và analysis code từ một URL/archive versioned có thể truy cập độc lập. Không chép hash hay số từ một phản biện để giả làm xác minh. Đường dẫn local `../experiments` không phù hợp để viết Data Availability Statement. |
| Gắn `SUPERSEDED -- DO NOT CITE` lên report RQ1 cũ | Chưa làm: report nằm ngoài repository và không có trên máy này; phải kiểm tra từng report, xác định bản canonical với Dũng rồi gắn nhãn tại chính nơi phát hành, giữ lịch sử thay vì xóa. Mâu thuẫn ESR/conditional result hiện là kết quả Dũng báo, chưa phải xác minh độc lập tại đây. |
| Thay `Fig1.png` bằng vector/high-resolution | Chưa làm: không có nguồn SVG/PDF/EPS hay file thiết kế gốc; upscale PNG không bổ sung thông tin và có thể làm sai chất lượng. Cần tác giả cung cấp/export lại từ nguồn. |
| Điền metadata, declarations và disclosure AI/LLM | Chưa làm: cần tác giả xác nhận tên, affiliation, funding, contributions, data/code availability và chính xác công cụ AI đã dùng để chuẩn bị bản thảo hoặc phân tích. Việc dùng LLM làm **đối tượng/phương pháp** nghiên cứu đã được mô tả trong manuscript, nhưng không tự động thay thế disclosure về việc tác giả dùng AI để viết, tạo code, phân tích hoặc xử lý hình. Chính sách Springer Nature hiện hành phân loại theo mục đích và mức ảnh hưởng; ngay cả hỗ trợ ngôn ngữ/định dạng cũng cần mô tả minh bạch và tác giả chịu trách nhiệm. Không thể điền một tuyên bố giả định. |
| Thêm GitHub Actions CI | Chưa làm: OAuth token GitHub CLI trên máy này thiếu scope `workflow`; GitHub đã từ chối push workflow ở lần trước. Repo hiện không có workflow hay CI run tương ứng. Sẽ thêm khi credential cho phép và kiểm tra run thành công, không gọi build local là CI. |
| Tag/release chính thức cho PDF hoặc RQ1 | Chưa làm: `BUILD_RECORD.md` là bản ghi versioned tối thiểu cho PDF, không phải release đóng audit RQ1. Không phát hành/tag bản thảo như bản sẵn sàng nộp khi data provenance, Figure 1 và declarations còn mở. |

## Điều kiện để đóng audit

Dũng cung cấp release/archive bất biến hoặc URL versioned của ledger/config/analysis/report RQ1; tác giả cung cấp nguồn Figure 1 và duyệt metadata/declarations, gồm mô tả chính xác việc dùng AI nếu có; sau đó hai bên mới tái tạo số liệu, gắn nhãn report cũ, kiểm tra artwork và hoàn tất CI. Phản hồi này không coi manuscript là sẵn sàng nộp.

## Nguồn chính thức dùng để đối chiếu

- [Springer Nature: AI use in manuscript preparation](https://www.springernature.com/gp/policies/editorial-policies/ai-manuscript-preparation)
- [Springer Nature: AI use in research practice](https://www.springernature.com/gp/policies/editorial-policies/using-ai-in-research)
- [Springer Nature: LaTeX author support](https://www.springernature.com/gp/authors/campaigns/latex-author-support)
