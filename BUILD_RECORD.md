# Local LaTeX build record

This is a record of the existing committed TRACE PDF, not a claim that the
RQ1 experiment or a locked build environment is reproducible. The manuscript
inputs did not change between commit `cc40c27` (which committed this PDF) and
`eefa5bd` (which added only an audit communication file).

| Item | Recorded value |
|---|---|
| Record verified | 2026-09-21 (Asia/Ho_Chi_Minh) |
| Build method | `scripts/build-paper.ps1`: `pdflatex`, `bibtex`, `pdflatex`, `pdflatex` |
| Local environment | Windows; MiKTeX-pdfTeX 4.27 and MiKTeX-BibTeX 4.2 (MiKTeX 26.5) |
| PDF | `trace-paper.pdf`, 22 A4 pages |
| PDF SHA-256 | `2F7D3693610C8967712D1720BFB79101263A4038F6FB09C252637BB0F5BE687E` |
| LaTeX source SHA-256 | `EA631EBAB880D62538E35EA265846E7B8120DFE6B8725931503C1DBA666036CE` |
| Bibliography SHA-256 | `6A0535BE46FFA270D30D27B0EE6B8B8BA4B291F89C0A5F95822F7E613980F372` |
| Figure 1 SHA-256 | `5762E853E2871ED8D592F863AF2493F9CF3DD3592E12B8F686CBEC1701B56BE5` |

The local build completed without LaTeX errors, undefined citations or
references, overfull boxes, or duplicate PDF destinations. The generated log
and a complete TeX package lock were not committed. Another installation can
produce a different PDF hash even when the source is identical. No CI workflow
or successful CI run is claimed here.

This record does **not** validate the data behind RQ1 Tables 1--2. An
independently accessible, versioned release of the RQ1 ledgers, configurations,
analysis code, scoring rules, and canonical reports is still needed.
