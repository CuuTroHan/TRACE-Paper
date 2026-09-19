# TRACE: Structural Planning, Tool-Grounded Multi-Agent Verification, and Traceability-Guided Local Repair for LLM-Based Java Unit Testing

This repository contains the LaTeX manuscript source, bibliography, styles, figures, and compiled documents for the TRACE paper based on the Springer Nature LaTeX template (`sn-jnl`).

## Overview

- **Main Paper Manuscript**: [`trace-paper.tex`](trace-paper.tex)
- **Compiled PDF**: [`trace-paper.pdf`](trace-paper.pdf)
- **References**: [`trace-references.bib`](trace-references.bib)
- **Pipeline Architecture Diagram**: `framework-pipeline-blue-v4-compact.png`

## Building the Paper

To compile the paper using `pdflatex` and `bibtex`:

```bash
pdflatex trace-paper.tex
bibtex trace-paper
pdflatex trace-paper.tex
pdflatex trace-paper.tex
```
