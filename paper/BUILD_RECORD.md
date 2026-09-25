# Local LaTeX build record

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
