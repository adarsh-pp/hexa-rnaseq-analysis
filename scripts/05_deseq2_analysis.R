# Load libraries
library(DESeq2)

# Read counts
counts <- read.table("feature_counts.txt", header = TRUE, row.names = 1)
counts <- counts[, -c(1:5)]

# Sample metadata
coldata <- data.frame(
  condition = c("control","control","case","case","case")
)

# Create DESeq object
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = coldata,
                              design = ~ condition)

# Run DESeq
dds <- DESeq(dds)

# Get results
res <- results(dds)

# Save results
write.csv(as.data.frame(res), file = "deseq2_results.csv")
