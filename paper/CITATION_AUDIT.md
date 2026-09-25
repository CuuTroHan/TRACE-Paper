# TRACE citation audit

This table records claim-to-source corrections. Publication metadata was checked against Crossref/ACM records and acceptance against the official ISSTA 2026 program. Reference eligibility was last reviewed on 2026-09-25. Five preprint-only keys were removed from the bibliography and their dependent claims were revised; the remaining keys retain their original identifiers, so the numbering has gaps.

| Claim or named artifact | Verified source and metadata | Bib key |
|---|---|---|
| ChatTester generation and iterative refinement | Yuan et al., *Evaluating and Improving ChatGPT for Unit Test Generation*, *Proceedings of the ACM on Software Engineering* 1(FSE), 1703--1726 (2024), DOI [10.1145/3660783](https://doi.org/10.1145/3660783) | `bib26` |
| ChatUniTest generation--validation--repair | Chen et al., *ChatUniTest: A Framework for LLM-Based Test Generation*, arXiv:2305.04764 / FSE Demo (2024) | `bib4` |
| TestART generation and repair iteration | Gu et al., *ACM Transactions on Software Engineering and Methodology* (2026), DOI [10.1145/3844945](https://doi.org/10.1145/3844945); publisher record adds Kecheng Li to the author list | `bib27` |
| TestLoter hierarchical repair | Yang, Xu, and Wang, *Journal of Computer Languages* 84, 101348 (2025), DOI `10.1016/j.cola.2025.101348` | `bib28` |
| CATGen structured project context and deterministic scaffolding | Chen et al., *Context Matters: Improving the Practical Reliability of LLM-Based Unit Test Generation*, [accepted ISSTA 2026 experience paper](https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/151/Context-Matters-Improving-the-Practical-Reliability-of-LLM-Based-Unit-Test-Generatio); proceedings DOI pending | `bib29` |
| Standardized test-design techniques | ISO/IEC/IEEE 29119-4:2021, *Software testing--Part 4: Test techniques* | `bib30` |
| MAGISTER role-specialized agents | Ahammad, El Bajta, and Radgui, SITA 2025, DOI `10.1109/SITA67914.2025.11273637` | `bib31` |
| Industrial pre-execution filtering at Meta | Alshahwan et al., *Automated Unit Test Improvement Using Large Language Models at Meta* (2024), DOI `10.1145/3663529.3663839` | `bib32` |
| JaCoCo coverage evidence | Official JaCoCo project documentation | `bib33` |
| PIT mutation evidence | Official PIT project documentation | `bib34` |
| JUnit execution evidence | Official JUnit 5 User Guide | `bib35` |
| Defects4J benchmark | Just, Jalali, and Ernst, ISSTA 2014, DOI `10.1145/2610384.2628055` | `bib36` |
| SF110 corpus | Fraser and Arcuri, *ACM TOSEM* 24(2) (2014), DOI `10.1145/2685612` | `bib37` |
| LIBRO bug-reproduction framework | Kang, Yoon, and Yoo, ICSE 2023, DOI `10.1109/ICSE48619.2023.00194` | `bib38` |

## Corrected existing metadata

| Bib key | Correction |
|---|---|
| `bib21` | Publication year corrected from 2026 to 2025 using Crossref metadata for DOI `10.1007/978-3-032-11402-0_7`. |
| `bib22` | Updated to the current title *Hallucination to Consensus: Multi-Agent LLMs for End-to-End JUnit Test Generation* and DOI `10.1145/3803418`. |
| `bib11` | Replaced arXiv metadata with *Proceedings of the ACM on Software Engineering* 1(FSE), 951--971 (2024), DOI [10.1145/3643769](https://doi.org/10.1145/3643769). |
| `bib15` | Replaced arXiv metadata with the [official ISSTA 2026 accepted research-paper program](https://conf.researchr.org/details/issta-2026/issta-2026-research-papers/31/Test-vs-Mutant-Adversarial-LLM-Agents-for-Robust-Unit-Test-Generation); DOI/pages pending. |
| `bib20` | Replaced arXiv metadata with *ACM Transactions on Software Engineering and Methodology* (2026), DOI [10.1145/3818617](https://doi.org/10.1145/3818617). |
| `bib26` | Replaced preprint title, year, and author order with the published FSE 2024 article; see table above. |
| `bib27` | Replaced arXiv metadata with the published TOSEM article and corrected author list; see table above. |
| `bib29` | Replaced arXiv metadata with accepted ISSTA 2026 status; see table above. |

The blanket `\nocite{...}` remains absent. Static checking after these edits found 33 bibliography entries and 33 distinct cited keys, with none missing or unused. A fresh `pdflatex`/`bibtex` build completed on 2026-09-25 without undefined citations or references; see `BUILD_RECORD.md`.

## Reference eligibility outcome and remaining follow-up

[ISSE's reference rule](https://link.springer.com/journal/11334/submission-guidelines) allows cited works that are published or accepted for publication. Of the 11 previously flagged arXiv-only entries, six now have eligible publisher or conference-program records (`bib11`, `bib15`, `bib20`, `bib26`, `bib27`, `bib29`). Five could not be verified as published/accepted as of 2026-09-25:

| Removed key | Preprint | Paper change | What the authors can supply later |
|---|---|---|---|
| `bib8` | [CAT / call-chain-aware test generation](https://arxiv.org/abs/2604.22046) | Removed CAT-specific claim; retained published/accepted context studies. | Publisher page, DOI, or acceptance confirmation. |
| `bib9` | [TATG](https://arxiv.org/abs/2607.03194) | Removed TATG-specific claim. | Publisher page, DOI, or acceptance confirmation. |
| `bib19` | [AgentForge](https://arxiv.org/abs/2604.13120) | Removed Docker-sandbox-specific claim. | Publisher page, DOI, or acceptance confirmation. |
| `bib23` | [Multi-Agent LLM Collaboration / TestAgent](https://arxiv.org/abs/2607.09101) | Removed TestAgent-specific comparisons in Introduction, Related Work, and Methodology; retained RQ3 comparator as an experimental design. | Publisher page, DOI, or acceptance confirmation. Do not substitute the separate FSE 2026 short paper *TestAgent: A Multi-Agent LLM Framework for Repository-Level Unit Test Generation* without checking authors and methods; it is not the same bibliographic record. |
| `bib24` | [Practical Limits of Autonomous Test Repair](https://arxiv.org/abs/2605.01471) | Removed the UI/Playwright analogy. | Publisher page, DOI, or acceptance confirmation; an arXiv DOI alone is insufficient. |

These five are not in `trace-references.bib` or cited by `trace-paper.tex` now. The authors may restore specific claims only after verifying the corresponding published/accepted source. The two accepted ISSTA records still need their final proceedings DOI/pages when assigned. This audit addresses the previously flagged 11 entries, not a full re-audit of every remaining reference.
