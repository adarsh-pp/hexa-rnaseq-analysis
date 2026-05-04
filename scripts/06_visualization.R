#############################################
# Visualization (Volcano, PCA, Heatmap)
#############################################

library(ggplot2)
library(DESeq2)
library(biomaRt)

# Load DESeq object (re-run minimal steps)
counts <- read.table("feature_counts.txt", header = TRUE, row.names = 1)
counts <- counts[, -c(1:5)]

coldata <- data.frame(
  condition = c("control","control","case","case","case")
)

dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = coldata,
                              design = ~ condition)

dds <- DESeq(dds)
res <- results(dds)

df <- as.data.frame(res)
df$gene <- rownames(df)
df <- df[!is.na(df$padj), ]

# Classification
df$diffexpressed <- "Not significant"
df$diffexpressed[df$log2FoldChange >= 2 & df$padj < 0.01] <- "Upregulated"
df$diffexpressed[df$log2FoldChange <= -2 & df$padj < 0.01] <- "Downregulated"

# ---------------- Volcano Plot ----------------
png("results/volcano_plot.png", width=3000, height=2400, res=300)

ggplot(df, aes(log2FoldChange, -log10(padj), col=diffexpressed)) +
  geom_vline(xintercept=c(-2,2), linetype="dashed") +
  geom_hline(yintercept=-log10(0.01), linetype="dashed") +
  geom_point(size=2) +
  theme_classic()

dev.off()

# ---------------- PCA ----------------
vsd <- vst(dds, blind = FALSE)
pca_data <- plotPCA(vsd, intgroup="condition", returnData=TRUE)

png("results/PCA_plot.png", width=3000, height=2400, res=300)

ggplot(pca_data, aes(PC1, PC2, color=condition)) +
  geom_point(size=4) +
  theme_classic()

dev.off()

# ---------------- Heatmap ----------------
vsd_mat <- assay(vsd)

topgenes <- rownames(df)[order(df$padj)][1:20]
mat <- vsd_mat[topgenes, ]

png("results/heatmap.png", width=3000, height=2500, res=300)

heatmap(mat,
        scale="row",
        col=colorRampPalette(c("blue","white","red"))(100))

dev.off()
