# Phan hoi danh gia 2315 va 2342 cho ban thao TRACE

- **Nguoi gui:** CuuTroHan
- **Nguoi nhan:** all
- **Thoi gian:** 2026-09-24 07:59 (Asia/Ho_Chi_Minh)
- **Hai file da xem:**
  - `20260923-2315-DucChinh-to-CuuTroHan-danh-gia-phan-hoi-bon-bao-cao-trace.md`
  - `20260923-2342-quangdhmhe181540-to-CuuTroHan-nhan-xet-phan-hoi-sau-phan-bien.md`
- **Trang thai doi chieu:** da kiem tra voi `trace-paper.tex`, cac CSV/JSON RQ3 trong workspace, log build va huong dan nop bai hien hanh cua ISSE.

## 1. Ket luan danh gia

### File 2315

File 2315 **dung o phan xac nhan cac sua doi da hoan thanh** tai commit `bc56438`: loai Type 3 font, bo `\nocite`, sua citation mapping, giu `sn-basic,Numbered,iicol`, giu heading `Statements and Declarations`, ha claim RQ2/RQ3 va lam ro delivered metrics cua FullChain.

Tuy nhien, ket luan ban thao da hoan thanh 95% va chi con metadata/declarations la **qua lac quan**. Ngoai cac placeholder P0, ban thao van con thieu metric dictionary/confusion counts RQ3, structured threats to validity, empirical package, protocol chi tiet RQ1/FullChain--EvoSuite, vector Figure 1 va xac minh publication status cua cac tai lieu arXiv-only. Vi vay nhan dinh "du dieu kien nop sau khi dien metadata" chua du co so.

### File 2342

File 2342 **dung ve phan lon cac nhan dinh quan trong** va danh gia `major revision` phu hop hon. Dac biet, file nay phat hien dung causal wording con sot trong Conclusion, metric RQ3 chua duoc dinh nghia, confusion counts chua duoc cong khai, caveat dang nam rai rac, va cac blocker ve author/declarations/artifact/figure van ton tai.

Co hai diem can hieu dung muc do:

1. ISSE bat buoc Data Availability Statement, nhung khong noi moi bo du lieu bat buoc phai public. Public immutable package la can thiet de bao ve cac claim auditability/reproducibility cua bai va rat de bi reviewer yeu cau, nhung khong nen mo ta nhu mot quy tac hinh thuc bat buoc cho moi submission trong moi truong hop.
2. Cac tai lieu arXiv-only khong du de tu ket luan da "published/accepted". Can tac gia cung cap publisher version/acceptance evidence, hoac sua claim va bo reference truoc khi nop.

## 2. Noi dung da lam theo

1. **Sua causal wording RQ3 con sot.** Conclusion va cac doan RQ3 lien quan da doi sang ngon ngu quan sat: `had a lower observed`, `had a higher observed`, va nhan manh khong the quy ket nhan qua cho role specialization.
2. **Bo sung metric dictionary va cong thuc RQ3.** Da dinh nghia gold/predicted false-passing, `TP/FP/FN/TN`, FAR, Decision Accuracy, Coverage, Selective Accuracy, Attribution Macro-F1, Routing Accuracy va mau so 54/73.
3. **Lam ro abstention va invalid output.** Abstention khong bi tinh la acceptance hay repair prediction; GLM invalid/partial-invalid case-level outcomes van duoc giu trong denominator thay vi complete-case deletion.
4. **Bo sung confusion counts RQ3.** Table moi ghi truc tiep `TP/FP/FN/TN`, false accepted va positive abstentions cho B0, Gemini B1/B2, DeepSeek repaired B1/B2 va GLM sensitivity B1/B2. Cac so lieu duoc tinh lai tu ba file `predictions_joined_private_gold_v2.csv` trong workspace, khong suy dien tu prose.
5. **Them section `Threats to Validity`.** Da tach thanh construct, internal, external, conclusion/reliability validity; noi ro missingness RQ2, cohort selection RQ3, single annotator, repaired DeepSeek, clustering, gate neutrality va gioi han reproducibility.
6. **Nang cap `CITATION_AUDIT.md`.** Da them ngay kiem tra va danh sach 11 key dang duoc encode arXiv-only can xac minh publisher/acceptance status truoc khi nop.
7. **Cap nhat `BUILD_RECORD.md`.** Ban PDF moi co 26 trang A4; hash va pham vi kiem tra RQ3 da duoc cap nhat.
8. **Build va QA lai.** Build `pdflatex -> bibtex -> pdflatex -> pdflatex` thanh cong; khong co LaTeX error, undefined citation/reference, overfull box, duplicate label/destination; font van 100% Type 1. Tat ca 26 trang da duoc render, va cac trang chua cong thuc/bang RQ3 cung nhu Threats to Validity da duoc kiem tra truc quan.

## 3. Noi dung chua lam theo va ly do

1. **Khong dien author, affiliation, ORCID, corresponding email.** Repository khong co thong tin da duoc nhom tac gia xac nhan; tu suy doan se tao metadata sai trong mot journal single-blind.
2. **Khong dien Funding, Competing Interests, Data/Code Availability va Author Contributions.** Day la tuyen bo phap ly/hoc thuat can tat ca tac gia phe duyet.
3. **Khong them AI-use declaration.** Can biet chinh xac model, muc dich va pham vi su dung. Theo ISSE, AI-assisted copy editing khong can khai bao; generative editorial/content work phai duoc mo ta. Khong the tu chon mot trong hai truong hop.
4. **Khong dua raw empirical package vao repo.** Cac artifact hien nam ngoai manuscript repository, chua co release manifest/license/redaction va chua co xac nhan cua chu so huu du lieu. Can dong goi rieng voi config, prompts, tool/model versions, seeds, scripts va hash.
5. **Khong bo sung STS ground-truth process, N/A reason, sampling frame RQ1, failure taxonomy RQ2, EvoSuite flags, timeout scope, CPU/RAM, cost split va cohort-overlap claim.** Cac thong tin nay khong co trong source manuscript/campaign aggregate; viet them se la bia protocol.
6. **Khong chay moi project-clustered analysis, multi-seed experiment, budget-matched ablation hoac independent holdout.** Day la thuc nghiem moi, khong phai sua dinh dang/prose.
7. **Khong thay Figure 1.** Workspace chi co bitmap 1536x1024 va khong co draw.io/SVG/EPS/PDF source de xuat vector/600 dpi dung nghia.
8. **Khong tu thay 11 reference arXiv-only.** Chua co bang chung publisher/acceptance da duoc xac minh cho tung bai; `CITATION_AUDIT.md` chi danh dau blocker de tac gia xu ly.
9. **Chua dien PDF Author metadata.** Se chi thuc hien sau khi author metadata that duoc xac nhan; dien placeholder vao PDF metadata se lam tinh trang xau hon.
10. **Khong doi document class va heading declarations.** `[pdflatex,sn-basic,Numbered,iicol]` va `Statements and Declarations` phu hop huong dan rieng cua ISSE, nen cac de xuat nguoc lai tu report cu khong duoc ap dung.

## 4. Trang thai sau vong sua

Ban thao da dong duoc cac loi co the sua an toan tu source va artifact hien co cua RQ3. Ban thao **van chua san sang nop** cho den khi nhom tac gia hoan tat metadata/declarations, xac nhan AI-use va reference status, cung cap Figure 1 dat chuan, va phat hanh empirical package/protocol can thiet.
