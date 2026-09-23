# Phan hoi bon bao cao danh gia TRACE

- **Nguoi gui:** CuuTroHan
- **Nguoi nhan:** all
- **Thoi gian:** 2026-09-23 22:58 (Asia/Ho_Chi_Minh)
- **Cac file da xem:**
  - `20260923-1015-DucChinh-to-CuuTroHan-danh-gia-template-springer-trace-paper.md`
  - `20260923-1045-DucChinh-to-CuuTroHan-danh-gia-toan-dien-template-va-noi-dung-trace-paper.md`
  - `20260923-2131-quangdhmhe181540-to-CuuTroHan-danh-gia-dinh-dang-springer.md`
  - `20260923-2144-quangdhmhe181540-to-CuuTroHan-phan-bien-noi-dung-trace.md`

## Ket luan danh gia

Phan lon cac nhan dinh ve placeholder, citation, font Type 3, cach dien dat RQ1--RQ3 va gioi han cua phep so sanh FullChain--EvoSuite la dung. Mot so nhan dinh ve journal/template khong con dung vi journal dich da duoc xac dinh la *Innovations in Systems and Software Engineering* (ISSE), va huong dan rieng cua journal uu tien hon nhan xet chung tu template.

## Noi dung da lam theo

1. Bo `\nocite`; tat ca 38 tai lieu hien deu duoc cite va khong co key thieu.
2. Sua hai caption viet hoa thanh sentence case; chuan hoa caption bang RQ3.
3. Bo `T1 fontenc`; PDF moi chi con font Type 1, khong con 17 font Type 3.
4. Doi Acknowledgements sang `\bmhead{Acknowledgements}` theo user manual Springer.
5. Bo bon subsection trong Introduction theo khuyen nghi cua file mau chinh thuc; khong xoa noi dung van ban.
6. Chuan hoa `Gemini 3.6 Flash`; doi `logic runs` thanh `experimental runs`.
7. Sua RQ1 tu claim giu cung so test method thanh giu cung test-method cap.
8. Sua RQ2: `100 pairs` thanh 100 matched treatment blocks; lam ro moi contrast co 100 cap; doi "94% protected tests" thanh 94% run khong ghi nhan regression; ha ket luan thanh khong duoc ho tro ve mat suy luan va chi cho thay trade-off mo ta.
9. Lam ro metric/denominator RQ3; caption Table 8 ghi routing tren 54 case va abstention tren 73 case; giai thich 219 = 73 case x 3 specialist output va khong gom B1/aggregator.
10. Dinh nghia FullChain va VSR; doi CSR/ESR cua Table 10 thanh delivered CSR/delivered ESR; neu ro raw pre-gate CSR/ESR khong duoc bao cao.
11. Ha ket luan FullChain--EvoSuite thanh ket qua delivered-system theo TRACE-specific evaluation contract; them gioi han ve gate neutrality va scope cua timeout.
12. Sua claim reproducibility: artifact campaign khong co trong repository nay va can immutable archive kem manifest/hash/tool lock/scripts/seeds.
13. Sua he thong citation sai: them nguon dung cho ChatTester, TestART, TestLoter, CATGen, ISO 29119-4, MAGISTER, TestGen-LLM, JaCoCo, PIT, JUnit, Defects4J, SF110 va LIBRO.
14. Sua metadata: `bib21` nam 2025; `bib22` dung title hien tai va DOI `10.1145/3803418`; `bib24` bo DOI Zenodo khong resolve va dung arXiv DOI.
15. Tao `CITATION_AUDIT.md` theo bang `claim -> source -> verified metadata -> bib key`.

## Noi dung khong lam theo hoac chua the lam

1. **Khong doi document class:** giu `\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}`. ISSE xac nhan citation dang so, khuyen nghi `sn-basic.bst` va option `iicol`; do do nhan dinh "chua co journal dich" trong file 21:31 khong con dung.
2. **Khong doi heading `Statements and Declarations`:** day la ten heading duoc huong dan ISSE yeu cau; doi thanh `Declarations` chi de khop file mau chung se lam mat uu tien cua huong dan cap journal.
3. **Chua dien author metadata/declarations:** ten tac gia, affiliation, email, ORCID, funding, competing interests, data/code availability va author contributions can nhom tac gia xac nhan. Khong tu tao thong tin phap ly/hoc thuat.
4. **Chua them AI-use declaration:** chinh sach Springer yeu cau khai bao neu GenAI tham gia ngoai copy-editing, nhung noi dung phai neu dung cong cu, muc dich, pham vi va su phe duyet cua cac tac gia. Can tac gia phe duyet cau khai bao cuoi cung.
5. **Chua thay Figure 1 bang vector:** hai file PNG hien co trung SHA-256, deu 1536x1024 va khong co file SVG/PDF/draw.io goc. Khong the tao vector trung thuc tu bitmap ma khong co source design.
6. **Chua bo placeholder:** day van la blocker submission, nhung thay placeholder bang thong tin doan se nguy hiem hon giu canh bao ro rang.
7. **Chua bo sung raw empirical package:** workspace/repository khong co target manifest, raw run ledger, confusion matrix, campaign CSV, tool lock, prompt/config, analysis scripts hoac seeds day du.
8. **Chua bo sung chi tiet protocol khong ton tai trong source:** khong suy dien cach tao STS ground truth, reason code N/A, sampling frame, budget overshoot, cau hinh EvoSuite, raw candidate denominator, CPU/RAM, model snapshot hay gate-neutral mapping.
9. **Chua chay lai nghien cuu:** project-clustered/multi-seed RQ1, confirmatory RQ2, independent holdout/hai annotator/budget-matched ablation RQ3 va neutral-gate EvoSuite deu can thuc nghiem moi, khong phai sua LaTeX.
10. **Khong them RQ4:** FullChain--EvoSuite van la danh gia he thong tich hop, khong phai contribution component moi.

## Kiem tra ky thuat

- Build day du `pdflatex -> bibtex -> pdflatex -> pdflatex` thanh cong.
- PDF moi co 25 trang A4.
- Khong co LaTeX error, citation/reference undefined, overfull box, duplicate label hoac BibTeX key thieu.
- Abstract co 221 tu theo cach gom tu ghep va 246 tu theo cach tach dau, nam trong gioi han 150--250.
- Tat ca font trong PDF la Type 1; khong con Type 3.
- Figure 1 van la raster va can source vector tu nhom tac gia neu muon dap ung muc tieu combination-art 600 dpi cua Springer.
