# TRACE citation audit

This table records the claim-to-source corrections made after reviewing the reports dated 2026-09-23. Metadata was checked against the publisher/Crossref record, the official standard or tool documentation, or the cited arXiv record. Existing keys `bib1`--`bib25` were retained; verified additions use `bib26`--`bib38`. The audit status below was last reviewed on 2026-09-24.

| Claim or named artifact | Verified source and metadata | Bib key |
|---|---|---|
| ChatTester generation and iterative refinement | Yuan et al., *No More Manual Tests? Evaluating and Improving ChatGPT for Unit Test Generation*, arXiv:2305.04207 (2023) | `bib26` |
| ChatUniTest generation--validation--repair | Chen et al., *ChatUniTest: A Framework for LLM-Based Test Generation*, arXiv:2305.04764 / FSE Demo (2024) | `bib4` |
| TestART generation and repair iteration | Gu et al., *TestART: Improving LLM-based Unit Testing via Co-evolution of Automated Generation and Repair Iteration*, arXiv:2408.03095 (2024) | `bib27` |
| TestLoter hierarchical repair | Yang, Xu, and Wang, *Journal of Computer Languages* 84, 101348 (2025), DOI `10.1016/j.cola.2025.101348` | `bib28` |
| CATGen structured project context and deterministic scaffolding | Chen et al., *Context Matters: Improving the Practical Reliability of LLM-Based Unit Test Generation*, arXiv:2607.19682 (2026) | `bib29` |
| Standardized test-design techniques | ISO/IEC/IEEE 29119-4:2021, *Software testing--Part 4: Test techniques* | `bib30` |
| TestAgent Requirement Planner/Generator/Reviewer | Zhang et al., *Multi-Agent LLM Collaboration for Unit Test Generation via Human-Testing-Inspired Workflows*, arXiv:2607.09101 (2026) | `bib23` |
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
| `bib24` | Removed the non-resolving Zenodo DOI and cited arXiv:2605.01471 / DOI `10.48550/arXiv.2605.01471`. |

The blanket `\nocite{...}` was removed. The build now confirms that all 38 bibliography entries are cited and that every citation key resolves.

## Submission-status check still required

ISSE's current reference guidance says that the reference list should contain only works that have been published or accepted for publication. The current bibliography encodes `bib8`, `bib9`, `bib11`, `bib15`, `bib19`, `bib20`, `bib23`, `bib24`, `bib26`, `bib27`, and `bib29` as arXiv-only entries. Their metadata and claim mapping are recorded above, but that does not establish journal-compliant publication or acceptance status. Before submission, the authors must replace each item with its publisher version and DOI when available, provide acceptance evidence, or remove/rewrite the dependent claim. This audit deliberately does not infer acceptance from an arXiv posting.
