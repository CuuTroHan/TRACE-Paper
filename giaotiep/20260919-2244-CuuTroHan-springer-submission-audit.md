# Springer Submission Audit — TRACE

**Repository:** `TRACE-Paper`  
**Manuscript reviewed:** `trace-paper.tex` and `trace-paper.pdf`  
**Review date:** 19 September 2026  
**Target collection:** [Resilient, Trustworthy, and AI-Driven Software Systems for Next-Generation Applications](https://link.springer.com/collections/gagdfebeia)

## Overall conclusion

The paper's topic is well aligned with the collection: it presents an AI-driven software-engineering approach focused on Java unit-test generation, verification, reliability, and traceability. However, the manuscript is **not ready for submission**. Several mandatory metadata and formatting requirements remain incomplete.

The collection is open for submissions until **30 October 2026**. The participating journal is *Innovations in Systems and Software Engineering*.

## Scope and content review

### Strengths

- The topic fits AI-driven software engineering and software testing, verification, and validation.
- The paper has a clear structure: motivation, related work, methodology, three research questions, results, limitations, and conclusion.
- The authors appropriately qualify several findings as exploratory, especially RQ3, and disclose important limitations such as one run per experimental unit, project clustering, and limited human annotation.
- The rendered PDF uses numbered, square-bracket citations and a heading hierarchy of at most three levels.

### Content risks to address

- The repository contains only manuscript sources, bibliography, template files, figures, and compiled PDFs. It does **not** include the experiment code, datasets, prompts, configurations, raw metric tables, seeds, execution logs, or replication instructions needed to independently verify the reported numbers.
- Cite the SF110 and LIBRO--Defects4J datasets at their first use. The current manuscript names them but does not cite their source publications.
- Record full reproducibility metadata for every model run: exact model ID, provider/API, date, decoding settings, seed, prompt version, tool versions, and repository revision.
- The claims in the paper are internally consistent with the displayed tables, but their empirical correctness cannot be confirmed from this repository alone.
- Proofread the remaining English issues, including `responses During compilation` and `RQ3 Evaluate`, and make decimal separators consistent in English prose and tables.

## Required fixes before submission

| Area | Finding | Required action |
|---|---|---|
| Title page | `First Author`, `Department`, `Institution`, and `author@example.com` are placeholders. | Replace with each author’s name, affiliation, city, country, corresponding-author email, and ORCID where available. |
| Abstract | The rendered abstract is 317 words. | Reduce to 150--250 words; define any abbreviations used in it. |
| Keywords | Seven keywords are provided. | Retain only four to six keywords. |
| LaTeX layout | The document class does not use the journal's requested `[iicol]` option and instead uses `sn-mathphys-num`. | Update the template configuration to `[iicol]`; use `sn-basic` unless the journal confirms another bibliography style. Rebuild and inspect the PDF. |
| Declarations | Acknowledgements, Funding, Conflict of interest, Data availability, Code availability, and Author contribution say `To be completed by the authors.` | Replace every placeholder with a truthful statement. Include a Data Availability Statement and a Code Availability Statement. |
| Tables | Tables 1--7 and 9 are never cited with a `\\ref` in the manuscript. | Cite each table in consecutive numerical order in the body text. |
| Figure 1 | The caption ends with punctuation; the file is not named `Fig1...`; internal lettering is small; the source is a 1536×1024 PNG. | Rename the source to `Fig1...`, remove the final caption punctuation, enlarge lettering to approximately 8--12 pt at final size, and submit a vector graphic or sufficiently high-resolution artwork. |
| References | Eight entries are unformatted preprints with no venue, DOI, or URL in the output; several other entries omit a DOI or stable URL. | Include only published/accepted works unless the editor permits preprints. For each retained preprint, identify it as such and add an arXiv URL. Add DOI links where available. |

## Visual PDF review

The 29-page PDF was rendered and reviewed. No clipped text, table overflow, broken symbols, or unreadable reference links were observed. The main layout issue is the long abstract: it spills onto page 2, leaving a poor title-page transition. Shortening the abstract should correct this.

The table numbering is consecutive (Tables 1--9), and Figure 1 is cited. The remaining table references need to be added as described above.

## Submission checklist

- [ ] Replace all author and affiliation placeholders.
- [ ] Reduce abstract to 150--250 words.
- [ ] Reduce keywords to 4--6.
- [ ] Configure the Springer LaTeX template with `[iicol]` and the appropriate bibliography style.
- [ ] Add in-text references for every table, in numerical order.
- [ ] Repair Figure 1 filename, caption, typography, and source quality.
- [ ] Complete every declaration with factual information.
- [ ] Add dataset citations and a reproducibility/replication package.
- [ ] Audit every bibliography entry for publication status, venue, DOI, and URL.
- [ ] Recompile with the full LaTeX toolchain and perform a final PDF check.

## Official sources

- [Special issue / collection page](https://link.springer.com/collections/gagdfebeia)
- [Innovations in Systems and Software Engineering submission guidelines](https://link.springer.com/journal/11334/submission-guidelines)

