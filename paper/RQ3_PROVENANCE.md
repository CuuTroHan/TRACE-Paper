# RQ3 external-artifact provenance

This manifest records the external workspace artifacts used to check the RQ3
metric definitions and the numerical consistency of the manuscript. The files
below are **not included in this Git repository**. Their presence and hashes on
one local workspace do not constitute a public empirical release.

## Frozen dataset and scoring implementation

| Artifact | Workspace path (relative to `R:\BaoVer2`) | SHA-256 |
|---|---|---|
| Exploratory-v2 cohort manifest | `ThucNgiem/RQ3_Phase3_Consensus/phase6_exploratory_v2_dataset/registry/phase6_exploratory_v2_manifest.json` | `8A29C26A701007C3008A291EC6C3240081B4D3DD56E96A07468718B90F154669` |
| Exploratory-v2 scoring script | `HeThong2_ThucNghiem_TongHop/01_HE_THONG_2/scripts/score_exploratory_v2.ps1` | `41E824D5BA178BBA9C6F4D31F78BB2ADDFCBE98DCF5E4D289118C955EE4333A0` |
| B2 deterministic aggregator | `HeThong2_ThucNghiem_TongHop/01_HE_THONG_2/RQ3_Evaluator_Wpf/B2Aggregator.cs` | `E8991CB5C3D0097249BB0A38965E16DF144FD254F5B09D4AD967EA10B57D07D3` |
| RQ3 protocol v2 | `HeThong2_ThucNghiem_TongHop/01_HE_THONG_2/protocol/RQ3_PROTOCOL_V2.md` | `6A64E36E1833EDE746EF0FDEFB0EE84579B34A7FA0F2DAD3E34BC9B0995B9484` |

## Joined prediction/gold records and metric reports

| Model/run | Artifact | SHA-256 |
|---|---|---|
| Gemini 3.5 exploratory v2, `20260826_101118` | `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_gemini_3_5_flash_google_ai_studio_exploratory_v2_20260826_101118/results/predictions_joined_private_gold_v2.csv` | `783AEDE26A8F83679CAD1A4A287429EE0507339DEB7E63513D3676CEED5627BF` |
| Gemini 3.5 exploratory v2, `20260826_101118` | `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_gemini_3_5_flash_google_ai_studio_exploratory_v2_20260826_101118/results/metrics_v2.json` | `63B965134CDE417CB975B48D478BE0E79EEA4C6666927EB9348D47D2D265C3B2` |
| DeepSeek V4 repaired sensitivity, `20260831` | `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_deepseek_v4_pro_exploratory_v2_free_repaired_20260831/predictions_joined_private_gold_v2.csv` | `6451F7C11D63A7AE774D29CDE7CF10DBC9CFBC8FDAEDC731C1210D2DFDFC2832` |
| DeepSeek V4 repaired sensitivity, `20260831` | `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_deepseek_v4_pro_exploratory_v2_free_repaired_20260831/metrics_v2.json` | `3D240F687C5BDA0C27BC3B3B8F77BF7DD2335116036AFBB71DF62D1C1BA6B860` |
| GLM sensitivity, `20260831` | `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/results/predictions_joined_private_gold_v2.csv` | `47F021D3787CF44EF694E7DCB059C8568CC7DF798A07B7A5EFDD668AA4100D2A` |
| GLM sensitivity, `20260831` | `HeThong2_ThucNghiem_TongHop/03_KET_QUA/01_DUNG_TRONG_BAO/KQ_Thucnghiem_VerHeThong2_glm_5_3_flash_bai_free_20260831/results/metrics_v2.json` | `32EE98ECEA63140CA0536D4614596A55536E92FA28E3049B04FA06ACB1974C15` |

## Checks supported by these artifacts

- The frozen cohort contains 73 cases per verifier: 54 gold
  `REPAIR_REQUIRED`, 8 gold `VERIFIED`, and 11 gold `ABSTAIN` cases.
- Attribution Macro-F1 is computed on the 54 repair-required cases over the
  seven gold defect causes, with zero returned for a zero denominator.
- Route correctness uses membership in each case's `acceptableRoutes` list.
- B2 prioritizes valid detected causes, requires three valid `CLEAR` findings
  for `VERIFIED`, and otherwise safely abstains when no valid defect finding is
  available.
- Invalid/partial-invalid case-level outputs remain in the denominator rather
  than being deleted as complete-case exclusions.

This record does not verify the RQ1, RQ2, or TRACE--EvoSuite raw data and
does not replace a versioned, redacted, independently accessible empirical
package.
