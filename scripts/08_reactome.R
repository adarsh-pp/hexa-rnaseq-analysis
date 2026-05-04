#############################################
# Reactome Pathway Analysis
#############################################

library(ReactomePA)
library(org.Hs.eg.db)
library(gprofiler2)

# Load DE results
df <- read.csv("results/deseq2_results.csv")
df <- df[!is.na(df$padj), ]

# Clean IDs
df$ensembl_id <- sub("\\..*", "", df$X)

# Convert to Entrez
entrez <- gconvert(
  query = df$ensembl_id,
  organism = "hsapiens",
  target = "ENTREZGENE_ACC"
)

# Reactome enrichment
res <- enrichPathway(
  gene = entrez$target,
  pvalueCutoff = 0.05,
  readable = TRUE
)

# Save results
write.csv(res@result, "results/reactome_results.csv", row.names=FALSE)
