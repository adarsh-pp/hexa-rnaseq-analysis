#!/bin/bash

# Alignment using HISAT2

REFERENCE=/path/to/hisat2_index/genome

for sample in $(ls *_1_val_1.fq.gz | sed 's/_1_val_1.fq.gz//'); do
  hisat2 -x $REFERENCE \
  -1 ${sample}_1_val_1.fq.gz \
  -2 ${sample}_2_val_2.fq.gz \
  -p 10 \
  -S ${sample}.sam
done
