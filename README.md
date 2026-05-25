# 🧬 RNA-seq Analysis of _HEXA_-Associated Neurodevelopmental Abnormalities

## 📌 Overview

This project investigates transcriptomic alterations in foetal brain tissue samples carrying _HEXA_ gene mutations, associated with severe developmental abnormalities.

RNA-seq data from affected and control samples were analysed to identify differentially expressed genes and disrupted biological pathways contributing to the observed pathology.

## 🧠 Background

The _HEXA_ gene encodes a lysosomal enzyme responsible for degradation of GM2 gangliosides in neuronal cells. Mutations in _HEXA_ impair this function, leading to toxic accumulation and neurodevelopmental defects.

Interestingly, in this analysis:

>No significant change in _HEXA_ expression was observed, suggesting that pathology arises from functional impairment rather than transcriptional dysregulation.

## 📂 Data
- 5 paired-end RNA-seq samples
  - 2 control (healthy brain tissue)
  - 3 case (affected foetal brain tissue)

⚠️ Raw sequencing data is not included due to access restrictions. This repository focuses on reproducible workflow and analysis.

## ⚙️ Workflow

<code>FASTQ → QC → Trimming → Alignment → Quantification → Differential Expression → Functional Analysis</code>

## 📦 Requirements

- R (≥ 4.0)
- DESeq2
- ggplot2
- biomaRt
- gprofiler2
- ReactomePA
- STRINGdb
  
## 🧪 Methods
🔹 Quality Control & Trimming
-  FastQC
- TrimGalore
  
🔹 Alignment
- HISAT2 (hg38 reference genome)
- Samtools (BAM conversion and processing)

🔹 Quantification
- featureCounts (GENCODE annotation)

🔹 Differential Expression
- DESeq2
- Threshold:
  - adjusted p-value < 0.01
  - |log2FoldChange| ≥ 2
    
🔹 Functional & Pathway Analysis
- gProfiler (GO, KEGG)
- ReactomePA (pathway enrichment)
- STRINGdb (protein–protein interaction networks)

## 📊 Key Results
- 1997 differentially expressed genes
  - 401 upregulated
  - 1596 downregulated
- Clear separation between case and control samples (PCA)
- Notable gene patterns:
  - Upregulated: HLA-E, HLA-C, XIST
  - Downregulated: HOXA2, HOXA5, HOXB2
 
## 🧠 Biological Insights

🔴 Developmental Dysregulation
- Downregulation of HOX genes suggests impaired developmental patterning

🔵 Extracellular Matrix Disruption
- Altered ECM organisation indicates defects in neuronal migration and structure

🟣 Signalling Pathways
- Dysregulation of GPCR signalling suggests altered neuronal communication

⚠️ Key Observation
>_HEXA_ expression unchanged → pathology likely due to enzyme dysfunction, not expression-level changes

## 📈 Visualisations
- PCA plot → clear clustering of case vs control samples
- Volcano plot → strong differential expression signal
- Heatmap → distinct gene expression patterns
- PCA → Grouping of the samples
- Gprofiler plot → Enrichment results
- Reactome pathway plots → Pathways withs differentially expressed genes
- STRING network → interconnected functional modules

## ⚠️ Limitations
- Small sample size
- RNA-level analysis (no protein validation)
- Observational study (no experimental validation)

## 🔁 Reproducibility
Pipeline scripts are available in the scripts/ directory for:
- Quality control
- Trimming
- Alignment
- Quantification
- Differential expression analysis

## 🔥 Key Takeaway

This analysis demonstrates that _HEXA_ mutations lead to widespread disruption of neurodevelopmental pathways, rather than direct transcriptional changes in HEXA itself.

These findings highlight the importance of pathway-level dysregulation in understanding developmental disorders.

## 🧠 About This Project

This project was developed as part of a bioinformatics training module and has been refined into a reproducible workflow demonstrating RNA-seq analysis and biological interpretation.
