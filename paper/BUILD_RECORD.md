# Local LaTeX build record

## Current revision: 2026-09-27 (RQ3 Qwen sensitivity)

This revision replaces incomplete GLM numerical rows with the complete
Qwen3.8 Flash System 2 run, discloses that Qwen was selected after inspecting
four alternatives, and updates the gold-label provenance language to match the
author's report of team adjudication. The manuscript presents Qwen's lower
false-acceptance rate alongside its 23.65-point attribution Macro-F1 decline
and unchanged routing. Source exports were not changed.

| Item | Recorded value |
|---|---|
| Build environment | Windows, MiKTeX 26.5 BibTeX and installed pdfLaTeX; Springer class/options retained |
| Build command | From `paper/`, `pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -output-directory <temporary-dir> trace-paper.tex`, then `bibtex <temporary-dir>/trace-paper`, then `pdflatex` twice; `TEXINPUTS`/`BSTINPUTS` pointed at `../template` and `BIBINPUTS` at `paper/` |
| PDF | `trace-paper.pdf`, 28 A4 pages |
| PDF SHA-256 | `53282E661344156726C3E9F8385925F2FE755A8AECABE7204DC2FB7590CD9D61` |
| LaTeX SHA-256 | `3F6CA315964C6348E9478EC940F3F337CF20759EA87BDE2CA0C421BB9C21532F` |
| Generated BBL SHA-256 | `70AD7392F46362101AAF0352649BFF9F8A14425F7840595BE8992E0C7877840B` |

The final pdfLaTeX log has no LaTeX errors, unresolved citations/references,
overfull boxes, or missing-character warnings. The Qwen case-level verifier
(`paper/scripts/verify-rq3-qwen.py`) passed: 219 distinct case-verifier
rows, 219 valid B2 specialist findings, all displayed Qwen metrics, and the
decision/FAR/routing exact McNemar values agree with the frozen System 2 CSV
and metric report. The bootstrap interval was read from that report, not
regenerated. RQ3 pages 17--20 and its four tables were rendered and visually
inspected; no table clipping or overlap was observed. The built-in desktop
compiler returned `Unable to find standard directories for platform` on
this host; the MiKTeX build above succeeded. The author team's final
gold-adjudication ledger was not available for independent audit.

## Earlier revision: 2026-09-27 (historical PDF)

This section records the earlier source and PDF. That revision reconciled the manuscript with the exports in the wider
`paper-2` workspace. It does not certify the underlying experiments or submission
readiness. Figure 1's raster is unchanged; its caption has been expanded.

| Item | Recorded value |
|---|---|
| Build environment | macOS; Tectonic 0.17.0, XeTeX/xdvipdfmx backend; original Springer class/options retained |
| Build command, from `paper/` | `tectonic -Z search-path=../template --keep-logs --keep-intermediates --outdir /tmp/trace-revision-rBeBiy trace-paper.tex` |
| PDF | `trace-paper.pdf`, 28 A4 pages |
| PDF SHA-256 | `0cb75db6be6b2f7e6ca09d5ab34b51075a11b14b0791e0cd2ae987e626acec2c` |
| LaTeX SHA-256 | `d7e380d14d3a8bbac2797a8c9e0de4391174e083040c6868db42f7d810e716d2` |
| Generated BBL SHA-256 | `aa9b382ba0ec95a358cc2a57fc1bbf79421e571c06405f2269bb6925284c7a23` |
| Bibliography/Figure 1 | Unchanged; hashes in the historical record below |
| Statistical environment | Python 3.12, NumPy 2.5.3, SciPy 1.18.1; .NET SDK 8.0.423, net8.0 verification project |

The build completed without errors, unresolved citations/references, missing
characters, duplicate labels/destinations, or overfull boxes. Underfull-box
warnings remain; the bundled `algorithm.sty` also emits a source-encoding
warning. All 28 pages were rendered and visually inspected; after preventing
split bibliography entries, pages 26-28 were re-rendered and checked. No clipped
tables, overlaps, or detached bibliography DOI fragments were observed. The PDF
has 12 tables, one figure, 33 cited bibliography entries, and embedded Type 1C
fonts, with no Type 3 fonts. Title/author/subject/keyword metadata are populated.
Six author-supplied declaration/acknowledgement placeholders intentionally
remain. Figure 1 is still the original raster, not a new high-resolution master.

Numerical verification is documented in [verification/README.md](verification/README.md).
It includes RQ1 primary and conditional paired tests; RQ2 summaries, ten Holm
tests, and corrected effect-size directions; RQ3 metric-report extraction; and
recomputed FullChain Tables 11-12 using the existing statistical engines on the
450-pair CSV. This is not an independent rerun of Java/JUnit/JaCoCo/PIT or of the
LLM campaigns. RQ2 bootstrap intervals and RQ3 gold-label scoring were not
independently regenerated in this revision. Inputs and original FullChain
engines are external to this nested repository, so the verification folder is
not a standalone public reproducibility package.

The previous TinyTeX/pdfLaTeX executable was unavailable in the current shell;
this build used Tectonic instead. No TeX Live 2021 compatibility, locked TeX
environment, or CI build is claimed. The Section 4.6 numbers were checked against
the CSV, not against the historical DOCX hash. The current external-to-manuscript
DOCX is not treated as the numerical source of truth.

## Historical record: 2026-09-25 (not the current PDF)

This is a record of the TRACE PDF built from the current LaTeX and BibTeX
sources, including unaccented author names and the updated reference list.
Figure 1 uses its original `Fig1.png` and original caption by request. This
build consistently names the integrated pipeline `TRACE` (not the local
campaign nickname) throughout the manuscript. This record is not a claim
that the experiments or a locked build environment are
independently reproducible.
The Section 4.6 source DOCX is external to this repository and was not
available for re-verification during the folder move.

| Item | Recorded value |
|---|---|
| Record verified | 2026-09-25 (Asia/Ho_Chi_Minh) |
| Build method | `pdflatex`, `bibtex`, `pdflatex`, `pdflatex` from `paper/` with `TEXINPUTS=../template:` and `BSTINPUTS=../template:`; isolated temporary output directory |
| Local environment | macOS; TinyTeX/TeX Live 2026, pdfTeX 1.40.29, BibTeX 0.99e; unaccented author names require no T5 font |
| Previously recorded Section 4.6 DOCX SHA-256 (not reverified here) | `E09E5E836E6D5A47AB5EBB68C26FEFE35AE8A9BE5DB0589DD07D99B433B4FF7C` |
| PDF | `trace-paper.pdf`, 27 A4 pages |
| PDF SHA-256 | `9E89982A3F59B0ECAD11B1FC55996931270817C4727B4554B702DDBCFAF846AA` |
| LaTeX source SHA-256 | `88D7EC5D84355A0EE1824CFAE2F09CF0D7DACE73F96B994C95D4152FE468AA55` |
| Bibliography SHA-256 | `CD7F17F42D565A13AFE391F257538E7510B1B64361408B30C7C3260BC0889D2C` |
| Generated BBL SHA-256 | `14EE95CC54F03020A7D9603894D22C31A0B03882342C7734577EC0B21628BEE2` |
| Figure 1 SHA-256 | `5762E853E2871ED8D592F863AF2493F9CF3DD3592E12B8F686CBEC1701B56BE5` (`Fig1.png`) |

The local build completed without LaTeX errors, undefined citations or
references, missing characters, overfull boxes, duplicate labels, or duplicate
PDF destinations. The bibliography contains 33 cited entries. All embedded
fonts are Type 1; no Type 3 fonts remain. The title page lists the five supplied
authors without Vietnamese diacritics, their FPT educational e-mail addresses,
and the shared FPT University, Hanoi, Vietnam affiliation. PDF Title, Author,
Subject, and Keywords metadata are populated. The source retains the journal's
recommended `iicol` option, so the article body is two-column. Figure 1 was
visually checked on page 6 at print layout. `pdfimages -list` reports its
1536 x 1024 px raster image at 244 x 244 effective dpi, below the journal's
600 dpi combination-artwork requirement; this remains an open submission issue.
The generated log and a complete TeX package lock were not committed. Another installation
can produce a different PDF hash even when the source is identical. No CI
workflow or successful CI run is claimed here.

This record does **not** validate the data behind RQ1 Tables 1--2 or the new
TRACE--EvoSuite comparison in Section 4.6. The RQ3 formulae, class/route
rules, invalid-output aggregation, and confusion counts were checked against
the frozen Gemini, repaired DeepSeek, and GLM metric/CSV artifacts available in
the wider workspace. Their local paths and SHA-256 values are recorded in
`RQ3_PROVENANCE.md`, but the artifacts themselves are not included in this Git
repository. Independently accessible, versioned releases of all study ledgers,
configurations, analysis code, scoring rules, and canonical reports are still
needed.
