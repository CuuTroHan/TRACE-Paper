# TRACE: Structural Planning, Tool-Grounded Multi-Agent Verification, and Traceability-Guided Local Repair for LLM-Based Java Unit Testing

This repository contains the LaTeX manuscript source, bibliography, styles, figures, and compiled documents for the TRACE paper based on the Springer Nature LaTeX template (`sn-jnl`).

## Overview

- **Main Paper Manuscript**: [`trace-paper.tex`](trace-paper.tex)
- **Compiled PDF**: [`trace-paper.pdf`](trace-paper.pdf)
- **References**: [`trace-references.bib`](trace-references.bib)
- **Pipeline Architecture Diagram**: [`Fig1.png`](Fig1.png)
- **Springer bibliography style**: [`sn-basic.bst`](sn-basic.bst)

The manuscript uses the journal-recommended two-column numbered configuration:

```latex
\documentclass[pdflatex,sn-basic,Numbered,iicol]{sn-jnl}
```

## Building the Paper

To compile the paper using `pdflatex` and `bibtex`:

```bash
pdflatex trace-paper.tex
bibtex trace-paper
pdflatex trace-paper.tex
pdflatex trace-paper.tex
```

On Windows, the local build-check script runs the same sequence, reports the
installed tool versions, rejects blocking LaTeX diagnostics, and prints the
SHA-256 of the resulting PDF:

```powershell
.\scripts\build-paper.ps1
```

This procedure checks **manuscript typesetting only**. It requires PowerShell
and a TeX distribution with `pdflatex` and `bibtex` on `PATH`; it does not pin
that distribution, run in CI, or reproduce the RQ1 experiments. In particular,
it does not verify the RQ1 ledgers, analysis scripts, statistical tests,
Tables 1--2, or scoring rules. The [local build record](BUILD_RECORD.md)
identifies the committed PDF and tool versions, but is not an environment
lock or an independent experimental replication. No GitHub Actions workflow
has been installed in this repository.

The abstract count can be reproduced under both documented tokenization
conventions:

```powershell
.\scripts\count-abstract-words.ps1
```

The current audit disposition is recorded in the
[latest communication to dungng2808](giaotiep/20260921-2102-CuuTroHan-to-dungng2808-phan-hoi-rq1-lan-3.md).
Earlier responses in `giaotiep/` remain historical records; where their
conclusions differ, the latest disposition takes precedence.
