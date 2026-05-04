#############################################
# STRING Network Analysis
#############################################

library(STRINGdb)

# Load DE results
df <- read.csv("results/deseq2_results.csv")
df <- df[!is.na(df$padj), ]

# Take top 100 genes
top <- df[order(df$padj), ][1:100, ]

# Clean symbols
genes <- unique(top$X)
genes <- genes[genes != ""]

gene_df <- data.frame(gene=genes)

# Initialize STRING
string_db <- STRINGdb$new(
  version="12.0",
  species=9606,
  score_threshold=200
)

mapped <- string_db$map(gene_df, "gene", removeUnmappedRows=TRUE)

png("results/STRING_network.png", width=4000, height=3500, res=300)

string_db$plot_network(mapped$STRING_id)

dev.off()
