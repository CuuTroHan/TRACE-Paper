# Local LaTeX build record

This is a record of the TRACE PDF after the English translation of Section 4.6
from `Full_Ver4_Publish_VN.docx`, not a claim that the experiments or a locked
build environment are independently reproducible.
The source DOCX is at `../../LamBao/07_BanDangPublish/Full_Ver4_Publish_VN.docx`
relative to this repository and is not included in the Git repository.

| Item | Recorded value |
|---|---|
| Record verified | 2026-09-24 (Asia/Ho_Chi_Minh) |
| Build method | `scripts/build-paper.ps1`: `pdflatex`, `bibtex`, `pdflatex`, `pdflatex` |
| Local environment | Windows; MiKTeX-pdfTeX 4.27 and MiKTeX-BibTeX 4.2 (MiKTeX 26.5); VnTeX 3.2.2 for T5-encoded Vietnamese author names |
| Section 4.6 source DOCX SHA-256 | `E09E5E836E6D5A47AB5EBB68C26FEFE35AE8A9BE5DB0589DD07D99B433B4FF7C` |
| PDF | `trace-paper.pdf`, 27 A4 pages |
| PDF SHA-256 | `C5A12CBD06D18C121EA902A6181A398E6DB92EF1CF23050537EFB68EAC4E9FC7` |
| LaTeX source SHA-256 | `BEC02650117473E6783D939D5E5DDCD41EB6D75BB10C919DD1A94CEE7DB6CF7D` |
| Bibliography SHA-256 | `A7630D11CFB09D89D4F8142D09302FAC4B94972C7052037AB416DEF38C6D91F6` |
| Figure 1 SHA-256 | `5762E853E2871ED8D592F863AF2493F9CF3DD3592E12B8F686CBEC1701B56BE5` |

The local build completed without LaTeX errors, undefined citations or
references, overfull boxes, duplicate labels, or duplicate PDF destinations.
All embedded fonts are Type 1; no Type 3 fonts remain. The title page now lists
the five supplied authors, their FPT educational e-mail addresses, and the
shared FPT University, Vietnam affiliation. PDF Title, Author, Subject, and
Keywords metadata are populated. The generated log and a complete TeX package
lock were not committed. Another installation can produce a different PDF hash
even when the source is identical. No CI workflow or successful CI run is
claimed here.

This record does **not** validate the data behind RQ1 Tables 1--2 or the new
FullChain--EvoSuite comparison in Section 4.6. The RQ3 formulae, class/route
rules, invalid-output aggregation, and confusion counts were checked against
the frozen Gemini, repaired DeepSeek, and GLM metric/CSV artifacts available in
the wider workspace. Their local paths and SHA-256 values are recorded in
`RQ3_PROVENANCE.md`, but the artifacts themselves are not included in this Git
repository. Independently accessible, versioned releases of all study ledgers,
configurations, analysis code, scoring rules, and canonical reports are still
needed.
