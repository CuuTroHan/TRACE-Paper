# Local LaTeX build record

## Current source revision: 2026-09-28, exploratory B2 token estimate

The manuscript's cost paragraph now labels the 7.23-million-token EvoSuite B2
figure as a post hoc sensitivity estimate, not recorded campaign usage.
`scripts/estimate-evosuite-b2-tokens.py` and
`verification/evosuite-b2-token-estimate.json` document the tokenizer counts,
67-case calibration, inputs, outputs, and limitations. The calculation was
reproduced with `tiktoken==0.14.0`; the script passed `py_compile`.

The open editor's built-in compiler was run after the source edit. It stopped
at `sn-jnl.cls` because this manuscript depends on a class file outside the
standalone editor. At the user's request, the project was then built in place
with Tectonic's `-Z search-path=../template`. The updated 29-page
`trace-paper.pdf` contains the estimate on page 23. The build exited
successfully without LaTeX errors, undefined citations/references, missing
characters, or overfull boxes. Pages 22--24 were rendered and visually
inspected without overlap or clipping; the existing underfull-box and
algorithm.sty encoding warnings remain.

| Artifact | SHA-256 |
|---|---|
| trace-paper.tex | `86ed920cc2e14c8e9a1a2ca406387d2423fddcaf91b867e426bb4e24aa7a34ec` |
| trace-paper.pdf | `d3635dc7952ece7f5922d7d5a1dbc330eeb35b445ec11bfcc076e2935926172d` |
| verification/evosuite-b2-token-estimate.json | `f498ae2d590e87f7e9d2591cfcdf5a0d84a661a43966ff7cd039ae6e9d079557` |

## Earlier revision: 2026-09-28, EvoSuite measured timing reconciled

The extracted 420-second campaign now contains measured process metadata and
updated terminal durations for all 450 EvoSuite runs. The revised
`scripts/audit-evosuite-timing.py` checks command budget, measured search
duration and completion timestamp, other available stage timestamps, terminal
whole-run duration and completion timestamp, and paired CSV duration. It found
no timing inconsistency in 450/450 runs. Pre-compile and search metadata are
present in every run; 275 runs have JaCoCo metadata and 233 have PIT metadata.
The terminal EvoSuite durations sum to 56.33 hours, mean 450.63 seconds per run.

The current archive audit matches the current 450-row CSV and 900-record
terminal export; all 450 archived commands use 420 seconds. The statistical
report was recomputed from the current CSV and reproduces Tables 11--12.
The manuscript now reports EvoSuite descriptive whole-run duration and removes
the obsolete 407-run timing-contradiction claim. Preserved 60-second evidence
is identified as a pre-update state, not the source of the current results.
No experimental source data were edited in this manuscript revision.

Tectonic compiled the paper to 29 pages, with no errors, undefined references
or citations, missing characters, or overfull boxes. Existing underfull-box
and algorithm.sty encoding warnings remain. Pages 1, 21, 22, and 25 were
rendered and visually inspected without clipping or overlap. The built-in
editor's compiler cannot resolve the external Springer class; the project
Tectonic build uses the supplied template search path.

| Artifact | SHA-256 |
|---|---|
| trace-paper.tex | `c46ef426763d7f9ccce9768ca5ed2ee1eb4df38c014b6328da91c4a5b3d564fc` |
| trace-paper.pdf | `b769f767eaca29e7e80099667ad8daaac3a99f9282b93db322fcdb30c1bb00c7` |

## Earlier revision: 2026-09-28, EvoSuite timing inconsistency disclosed

The extracted campaign was audited using `scripts/audit-evosuite-timing.py`.
All 450 commands specify 420 seconds; 407 stdout search durations exceed the
CSV whole-run durations. CSV values agree with the retained terminal duration
fields, so regenerating CSV from those records would not resolve the conflict.
No new whole-run measurement was found in the supplied campaign paths. Search
stage durations and filesystem timestamps are not substituted for end-to-end
measurements; no 360-second offset is added to historical durations.

`verification/evosuite-timing-consistency.json` contains source hashes and
per-run diagnostics; the adjacent CSV is a diagnostic listing, not a replacement
experimental export. The main experimental CSV, terminal records, log files,
and archive were not edited. New measured whole-run records are required to
complete the requested experimental re-export and recomputation.

The manuscript withholds the EvoSuite runtime comparison and removes 14.73
hours / 117.81 seconds per run as applicable runtime summaries. Current and
preserved pre-update command/timeout records are distinguished. Effectiveness
tables remain unchanged and are not relabeled as newly verified executions.
The current PDF has 29 pages. The native compiler cannot resolve the external
Springer class; the existing Tectonic build succeeded without errors, undefined
references/citations, missing characters, or overfull boxes. Existing underfull
and algorithm.sty encoding warnings remain. Pages 1 and 21--29 were rendered
and visually inspected, without clipping or overlap.

| Artifact | SHA-256 |
|---|---|
| trace-paper.tex | `aeabbcf7f40afc21d0523ce9d4ac7b125488a046ca7b7d6d14792ae4523adb12` |
| trace-paper.pdf | `00e7c8152bef9db69785eddb8f9b59ab4b3cb504e56f91652742572bc9263847` |

## Earlier revision: 2026-09-28, author-confirmed reported token usage

The user confirmed that Gemini usage is reported by the routing provider and
requested no further provenance checks. The manuscript now uses the wording
"reported token usage" without naming the service. The earlier provisional
and unresolved-source qualifications were removed from the measurement,
cost, RQ1-answer, abstract, and conclusion passages. The existing totals and
ratios are unchanged. This classification relies on the author's confirmation;
no new independent provider audit was performed. Historical records below
retain the earlier audit conclusions and are superseded on this point.

The project Tectonic build succeeded with 28 pages and no errors, unresolved
references/citations, missing characters, or overfull boxes. Existing
underfull-box and algorithm.sty encoding warnings remain. Pages 1 and 12--28
were rendered and visually inspected, with no clipping or overlap observed.
The source editor remains available; its native compiler cannot resolve the
external Springer class. EvoSuite budget evidence is unchanged.

| Artifact | SHA-256 |
|---|---|
| trace-paper.tex | `e971aa420004d8ad0f00b53f03cedf68c1308913b2ab36277c62a916c006b771` |
| trace-paper.pdf | `ccedb64d3e897a1e620635eade7241afaadbea203d13a69bb63b63021c77555c` |

## Earlier revision: 2026-09-28, current versus archived EvoSuite configuration

The comparison design now states that both the written protocol and current
adapter specify 420 seconds. It preserves the archived 450-command evidence
of 60-second searches and does not relabel the reported outcomes as 420-second
results. The timeout explanation refers to the archived 60-second allocation
plus process overhead, rather than treating the current 420-second default as
the historical setting. Gemini source qualification remains unchanged because
provider provenance has not been independently established.

The native compiler still cannot resolve the external Springer class. The
existing Tectonic project build succeeded: 28 pages, no errors, undefined
references/citations, missing characters, or overfull boxes. Page 21 was
rendered and inspected. Existing underfull/algorithm encoding warnings remain.

| Artifact | SHA-256 |
|---|---|
| trace-paper.tex | `3edfc5f779f2e3ad1c493f711e940b1c391179bbc92259382025d952d237e470` |
| trace-paper.pdf | `ce98c81532f7949161e760368167c172a4cda980daf78acf2b81b5b4a6364f31` |

## Earlier revision: 2026-09-28, RQ1 token-accounting reconciliation

This record supersedes the older build records below. The RQ1 Gemini cost
summary now uses the current response usage fields summed by run: DIRECT
648,981 tokens (mean 4,326.54) and PLANNED 1,600,571 (mean 10,670.47), a
146.63% increase and a 2.47 ratio. DeepSeek response usage matches all 300
run-level CSV token totals; its reported values remain unchanged. The pooled
PLANNED/DIRECT token ratio is 2.1961 (2.20 displayed). Abstract, measurement
methods, cost discussion, RQ1 answer, and conclusion were reconciled.

These are provisional Gemini accounting estimates: 432 preserved pre-update
responses lacked usage, while the current usage fields were added later.
Their origin/calculation method has not been independently established. All
300 current Gemini response sums match updated run metadata, but the old
metrics/CSV retain fixed token counts. The old component verification report
therefore remains a record of those CSVs, not the revised Gemini cost source.
See `verification/rq1-current-token-accounting.json` for totals, comparisons,
and hashes of the 900 response files and 600 run records inspected. No CSV,
run, response, or effectiveness result was modified by this manuscript edit.

The native editor was opened, but its compiler cannot resolve the external
Springer class (`sn-jnl.cls`). Compilation succeeded with the existing project
build: `tectonic -Z search-path=../template --keep-logs --keep-intermediates
--outdir /tmp/trace-rq1-cost-update trace-paper.tex`, from `paper/`.
The final PDF has 28 A4 pages. The log contains no errors, unresolved citations
or references, missing characters, or overfull boxes; existing underfull-box
and algorithm.sty encoding warnings remain. All 28 pages were rendered and
visually inspected, with page 15 additionally inspected at 1800-pixel
resolution. No clipping or overlaps were observed. Abstract: 217
whitespace-separated words. Figure 1, author declarations, and all
effectiveness tables are unchanged. This update does not certify submission
readiness or independently reproduce the experiments.

| Artifact | SHA-256 |
|---|---|
| PDF | `9a412c23c6c9f3bbccebbb9cc11cc17904ef03a83efe57bd7108f4dae7d9e8a0` |
| LaTeX | `7bced5f75d14822b86bed605c74c1087d8c13fa9d6d128aec4da1f1d623213a9` |
| BBL (unchanged) | `aa9b382ba0ec95a358cc2a57fc1bbf79421e571c06405f2269bb6925284c7a23` |

## Earlier revision: 2026-09-27, all seven authors equal; ethics/consent confirmed

This section supersedes the earlier records below. The manuscript is still a
working draft, not a submission-ready or author-approved artifact.

The user confirmed no competing interests. The declaration now reads:
"The authors declare no competing interests relevant to this study."
The user confirmed that all seven authors contributed equally and participated
in all research activities. The contribution statement now covers conception
and design, software, experiments, data preparation, analysis/interpretation,
and drafting/revision, with Nguyen Thi Nguyet's known supervision retained.
The user also confirmed no ethics-review requirement, after reporting no human
participant study, no personal-data research/publication, and internal team
annotation for RQ3. Ethics approval and both consent declarations now read
"Not applicable." No final-manuscript approval statement was added.
Data/code is still being prepared and Figure 1 is unchanged.

At the user's request, all seven authors now carry the template's dagger
marker and the shared note "These authors contributed equally to this work."
Nguyen Thi Nguyet retains the corresponding-author star in addition to the dagger.
Trung Tran is the sixth author, immediately before Nguyen Thi Nguyet,
as requested by the user, with email `trungt@epu.edu.vn`
and affiliation 2: Faculty of Information Technology, Electric Power University,
Hanoi, Vietnam. He has an equal-contribution dagger but no corresponding-author
star. PDF metadata and the completed contribution statement cover seven authors.
The expanded title page initially left an orphaned introduction in the right
column and produced a 1.22282-point overfull vertical box. A page break after
the title block now starts the introduction on page 2 and resolves that warning.
The preceding manuscript content and archive-audit changes remain intact.

| Item | Recorded value |
|---|---|
| Build | macOS, Tectonic 0.17.0, XeTeX/xdvipdfmx; Springer class/options unchanged |
| Command from `paper/` | `tectonic -Z search-path=../template --keep-logs --keep-intermediates --outdir /tmp/trace-all-equal-KSLsty trace-paper.tex` |
| PDF | 28 A4 pages; seven authors; Nguyen Thi Nguyet designated corresponding author |
| PDF SHA-256 | `3bfd81f4d0c703ac2d33f47cbcc68e93627a6ddb4260a9272decf66d147374db` |
| LaTeX SHA-256 | `570c7b76a0edfa08f4c49ffc922a25d3c4bf6ccf294a53f287eed06539225198` |
| BBL SHA-256 | `aa9b382ba0ec95a358cc2a57fc1bbf79421e571c06405f2269bb6925284c7a23` |
| Figure 1 | Original raster and existing expanded caption unchanged in this update |
| Abstract | 216 whitespace-separated words; 234 with hyphenated components split |

The build completed without errors, unresolved citations/references, missing
characters, or overfull boxes. Underfull-box warnings and the bundled
`algorithm.sty` encoding warning remain. All 28 pages were rendered and reviewed
in the preceding revision. For this update, the title and declarations page 26
were re-rendered and inspected at 1500-pixel resolution. Layout-preserving text
extraction changes only on pages 1 and 26; the other 26 pages are identical to
the preceding revision. No clipping or overlap
was observed. Fonts are embedded Type 1C, without Type 3. Figure 1 retains its
previous resolution limitation; no new high-resolution master is claimed.

Funding, acknowledgements, no competing interests, equal contributions,
shared contribution roles, and ethics/consent applicability reflect the user's
confirmation. Final-manuscript approval by all authors has not been stated.
Data/code access details are not finalized.
The affiliation omits the unverified supplied postal code `100000`. RQ1 token
costs are explicitly estimates; this does not resolve estimator provenance.

The archived-command audit in `verification/full-chain-archive-audit.json`
confirms a 60-second EvoSuite search setting in all 450 runs, a deviation from
the written 420-second allocation. It also identifies incomplete EvoSuite token
accounting. The manuscript now discloses these findings. No experiment was
rerun, no underlying input was edited, and effectiveness tables were unchanged.

## Earlier revision: 2026-09-27 (not the current PDF)

This section supersedes the historical record below for the current source and
PDF. The revision reconciles the manuscript with the exports in the wider
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
