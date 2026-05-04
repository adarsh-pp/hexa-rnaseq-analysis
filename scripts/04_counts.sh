#!/bin/bash

# Convert SAM to BAM
for file in *.sam; do
  samtools view -bS "$file" > "${file%.sam}.bam"
done

# Generate feature counts
featureCounts \
-a /path/to/annotation.gtf \
-p -t exon -g gene_id \
-T 20 \
-o feature_counts.txt \
*.bam
