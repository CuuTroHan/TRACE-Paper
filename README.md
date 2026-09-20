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

On Windows, the checked build script runs the same sequence, records the
installed tool versions, rejects blocking LaTeX diagnostics, and prints the
SHA-256 of the resulting PDF:

```powershell
.\scripts\build-paper.ps1
```

The abstract count can be reproduced under both documented tokenization
conventions:

```powershell
.\scripts\count-abstract-words.ps1
```
