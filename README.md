# TRACE: Structural Planning, Tool-Grounded Multi-Agent Verification, and Traceability-Guided Local Repair for LLM-Based Java Unit Testing

This repository separates the TRACE manuscript in `paper/` from the unchanged Springer Nature template assets in `template/`. Team discussions remain in `giaotiep/`.

## Overview

- **Main Paper Manuscript**: [`paper/trace-paper.tex`](paper/trace-paper.tex)
- **Compiled PDF**: [`paper/trace-paper.pdf`](paper/trace-paper.pdf)
- **References**: [`paper/trace-references.bib`](paper/trace-references.bib)
- **Original pipeline diagram**: [`paper/Fig1.png`](paper/Fig1.png)
- **Figure 1 artwork instructions**: [`paper/FIGURE1_ARTWORK.md`](paper/FIGURE1_ARTWORK.md)
- **Springer class and bibliography style**: [`template/sn-jnl.cls`](template/sn-jnl.cls), [`template/sn-basic.bst`](template/sn-basic.bst)

The manuscript uses the journal-recommended two-column numbered configuration:

```latex
\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
```

## Building the Paper

To compile on macOS/Linux with `pdflatex` and `bibtex` on `PATH`, run from `paper/`. The search paths point to the separate template folder without changing the official class or style:

```bash
cd paper
TEXINPUTS="../template:" pdflatex trace-paper.tex
BSTINPUTS="../template:" bibtex trace-paper
TEXINPUTS="../template:" pdflatex trace-paper.tex
TEXINPUTS="../template:" pdflatex trace-paper.tex
```

On Windows, the local build-check script runs the same sequence, reports the
installed tool versions, rejects blocking LaTeX diagnostics, and prints the
SHA-256 of the resulting PDF:

```powershell
.\paper\scripts\build-paper.ps1
```

This procedure checks **manuscript typesetting only**. It requires PowerShell
and a TeX distribution with `pdflatex` and `bibtex` on `PATH`; it does not pin
that distribution, run in CI, or reproduce the RQ1 experiments. In particular,
it does not verify the RQ1 ledgers, analysis scripts, statistical tests,
Tables 1--2, or scoring rules. The [local build record](paper/BUILD_RECORD.md)
identifies the committed PDF and tool versions, but is not an environment
lock or an independent experimental replication. No GitHub Actions workflow
has been installed in this repository.

The abstract count can be reproduced under both documented tokenization
conventions:

```powershell
.\paper\scripts\count-abstract-words.ps1
```

The current Springer/ISSE audit is in the
[communication to all](giaotiep/20260925-0948-dungng2808-to-all-audit-springer-isse-va-noi-dung-trace.md).
Earlier responses in `giaotiep/` remain historical records; where their
conclusions differ, use the newer audit and current manuscript files.
