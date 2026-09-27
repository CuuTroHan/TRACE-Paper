# Numerical verification of the 2026-09-27 manuscript revision

These read-only recalculations check consistency with local exports, not the
authenticity of raw execution, prospective preregistration, or independent
experimental replication. No experimental input was changed or rerun.

## Coverage and limitations

| Study | Inputs | Checked | Not established here |
|---|---|---|---|
| RQ1 | Two 300-row CSVs under `results/rq1/csv/` | 150 matched methods/model; compile/execute counts, metric denominators and means, tokens/time; McNemar, Wilcoxon, rank-biserial effects, model-wise Holm; conditional paired-executed results | Why values are missing; provider/raw-tool lineage; absence of post-processing; project-aware sensitivity |
| RQ2 | 297-row main CSV plus three-row replacement CSV | 100 matched units; success, stage statuses, duration, cost, Changed LOC, adequacy denominators, regression; all ten tests, Holm and cost effect directions | Bootstrap intervals not regenerated; prospective freeze; raw-case adjudication or adequacy non-inferiority |
| RQ3 | Gemini 3.5 and repaired DeepSeek System 2 reports under `01_DUNG_TRONG_BAO/`; Qwen3.8 Flash report and joined case CSV under `02_HOP_LE_KHONG_DUNG_TRONG_BAO/` | Hash the three report inputs; compare exported metrics and Qwen case-level counts to the manuscript | Final team gold-adjudication ledger, independent labeling, new bootstrap, or fresh model execution |
| Integrated TRACE/EvoSuite | `experiments/full-chain/paired-comparison.csv`, 450 pairs | 150 targets, 58 projects, repetitions 42/43/44; point estimates, 2,000 hierarchical bootstrap replicates, 10,000 target-sign permutations, five-outcome Holm; Tables 11-12 agree to displayed precision | Actual launch budgets, shared B2 cost accounting, gate neutrality, raw execution, project-level permutation sensitivity |

RQ1 continuous differences use decimal subtraction of exported strings before
conversion to floating point; otherwise binary subtraction can split tied ranks.
The signed-rank tests use a normal approximation, remove zero differences,
correct for tied ranks, and do not use a continuity correction.

For RQ2, cost effects consistently use **TGSLR minus comparator**. Relative to
FTMR, rank-biserial correlations are +0.230099, -0.152181, and -0.396970 for tokens,
API calls, and rounds. A rank-based effect can have a different sign from an
arithmetic mean difference. The previous manuscript's three signs used the
opposite convention. Existing TGSLR-FTMR bootstrap mean-difference interval
endpoints were negated/reordered from the previously stated FTMR-TGSLR direction;
they were not regenerated. They remain explicitly unadjusted intervals.

The FullChain wrapper links the original workspace engines; it does not replace
their random-number generator or percentile convention with a different library.
The input has candidate STS/BC/MS, but not candidate CSR/ESR; the latter are not
exported by this wrapper. Delivered VSR/CSR/ESR use fractions; STS/BC/MS in this
CSV use percentage-point units. Multiplying the former by 100 produces the
manuscript's displayed percentages and intervals.

Engine SHA-256 values used:

- `tools/full-chain-benchmark/Analysis/HierarchicalBootstrap.cs`:
  `adbc3298941f3153dba8a70a4799115b88d649f9ec039d41cbd16505026169e7`
- `tools/full-chain-benchmark/Analysis/PairedPermutationTest.cs`:
  `9d5b33e0df8fed7bfa462c054fbdf211ac9f2b1955f6b7ee7c44c3beec71fe00`

## Re-run

Run from the wider `paper-2` workspace, with `TRACE-Paper/`, `results/`,
`experiments/`, and `tools/` present. The inputs are not bundled in this nested
manuscript repository. Use Python 3.12 with NumPy 2.5.3 / SciPy 1.18.1 and .NET 8
for the recorded run. Output files contain input hashes.

```sh
dotnet build TRACE-Paper/paper/scripts/VerifyFullChain/VerifyFullChain.csproj \
  --artifacts-path /tmp/trace-verification-build
dotnet /tmp/trace-verification-build/bin/VerifyFullChain/debug/VerifyFullChain.dll \
  experiments/full-chain/paired-comparison.csv \
  TRACE-Paper/paper/verification/full-chain-results.json
```

The Python script accepts `--workspace` if the inputs reside elsewhere.
Its full-run mode requires co-located RQ1/RQ2 component exports and an
explicit list of the three RQ3 metric reports with `--rq3-metrics`; it
never silently includes the excluded GLM run. In this revision, RQ1/RQ2 entries in
`component-results.json` remain from that earlier verification; only RQ3 was
refreshed from the System 2 package using `--rq3-only-update`,
`--rq3-root R:\BaoVer2`, and explicit `--rq3-metrics` paths for Gemini,
repaired DeepSeek, and Qwen. The mode reads/hashes only those JSON reports and
does not require NumPy or SciPy. It removes the earlier GLM report from the
current comparison. The Qwen metric report is not a new independent score:
the joined CSV and frozen prediction hashes are recorded in
[RQ3_PROVENANCE.md](../RQ3_PROVENANCE.md), with numerical case-level checks
recorded in the current build record. Re-run the RQ3 report refresh and the
standard-library CSV/frozen-prediction checks from this repository's root with:

```sh
python paper/scripts/verify-component-results.py \
  --rq3-only-update --rq3-root R:/BaoVer2 \
  --output paper/verification/component-results.json \
  --rq3-metrics \
  R:/BaoVer2/HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_deepseek_v4_pro_exploratory_v2_free_repaired_20260831/metrics_v2.json \
  R:/BaoVer2/HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_gemini_3_5_flash_google_ai_studio_exploratory_v2_20260826_101118/results/metrics_v2.json \
  R:/BaoVer2/HeThong2_ThucNghiem_TongHop/03_KET_QUA/02_HOP_LE_KHONG_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_qwen3_8_flash_bai_free_20260904/results/metrics_v2.json

python paper/scripts/verify-rq3-qwen.py \
  R:/BaoVer2/HeThong2_ThucNghiem_TongHop/03_KET_QUA/02_HOP_LE_KHONG_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_qwen3_8_flash_bai_free_20260904
```

The C# project's relative engine links expect the directory layout described above.
These scripts produce recalculations, not a general parser/assertion suite for
every prose claim in the LaTeX manuscript; manuscript comparisons were reviewed
alongside their generated reports.

Do not substitute the separate 45-pair `phase11-official-export` JSON for the
450-pair cohort. Do not run metric-modifying or selective-replacement scripts as
part of this verification workflow.
