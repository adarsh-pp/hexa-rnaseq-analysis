#############################################
# Functional Enrichment (GO, KEGG, Reactome)
#############################################

library(gprofiler2)

# Load DE results
df <- read.csv("results/deseq2_results.csv")

# Remove NA
df <- df[!is.na(df$padj), ]

# Add classification
df$diffexpressed <- "Not significant"
df$diffexpressed[df$log2FoldChange >= 2 & df$padj < 0.01] <- "Upregulated"
df$diffexpressed[df$log2FoldChange <= -2 & df$padj < 0.01] <- "Downregulated"

# Clean Ensembl IDs
df$ensembl_id <- sub("\\..*", "", df$X)

# Upregulated
up <- df[df$diffexpressed == "Upregulated", ]

up_res <- gost(
  query = up$ensembl_id,
  organism = "hsapiens",
  sources = c("GO:BP","KEGG","REAC"),
  correction_method = "fdr"
)

write.csv(up_res$result, "results/up_enrichment.csv", row.names=FALSE)

# Downregulated
down <- df[df$diffexpressed == "Downregulated", ]

down_res <- gost(
  query = down$ensembl_id,
  organism = "hsapiens",
  sources = c("GO:BP","KEGG","REAC"),
  correction_method = "fdr"
)

write.csv(down_res$result, "results/down_enrichment.csv", row.names=FALSE)
