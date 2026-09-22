# Local LaTeX build record

This is a record of the TRACE PDF after the English translation of Section 4.6
from `Full_Ver4_Publish_VN.docx`, not a claim that the experiments or a locked
build environment are independently reproducible.
The source DOCX is at `../../LamBao/07_BanDangPublish/Full_Ver4_Publish_VN.docx`
relative to this repository and is not included in the Git repository.

| Item | Recorded value |
|---|---|
| Record verified | 2026-09-23 (Asia/Ho_Chi_Minh) |
| Build method | `scripts/build-paper.ps1`: `pdflatex`, `bibtex`, `pdflatex`, `pdflatex` |
| Local environment | Windows; MiKTeX-pdfTeX 4.27 and MiKTeX-BibTeX 4.2 (MiKTeX 26.5) |
| Section 4.6 source DOCX SHA-256 | `E09E5E836E6D5A47AB5EBB68C26FEFE35AE8A9BE5DB0589DD07D99B433B4FF7C` |
| PDF | `trace-paper.pdf`, 24 A4 pages |
| PDF SHA-256 | `674D1DC0D7A912F51054C005E439A8354AC27DB586848F850C11D101B035E625` |
| LaTeX source SHA-256 | `1945BD53C2655A3FF343C0A59C34A926566BE7FC371AC8B4AE1AB19CD280C57E` |
| Bibliography SHA-256 | `6A0535BE46FFA270D30D27B0EE6B8B8BA4B291F89C0A5F95822F7E613980F372` |
| Figure 1 SHA-256 | `5762E853E2871ED8D592F863AF2493F9CF3DD3592E12B8F686CBEC1701B56BE5` |

The local build completed without LaTeX errors, undefined citations or
references, overfull boxes, or duplicate PDF destinations. The generated log
and a complete TeX package lock were not committed. Another installation can
produce a different PDF hash even when the source is identical. No CI workflow
or successful CI run is claimed here.

This record does **not** validate the data behind RQ1 Tables 1--2 or the new
FullChain--EvoSuite comparison in Section 4.6. Independently accessible,
versioned releases of their ledgers, configurations, analysis code, scoring
rules, and canonical reports are still needed.
