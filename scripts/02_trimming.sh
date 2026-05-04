#!/bin/bash

# Adapter trimming using TrimGalore

for sample in $(ls *_1.fastq.gz | sed 's/_1.fastq.gz//'); do
  trim_galore --paired --fastqc \
  ${sample}_1.fastq.gz ${sample}_2.fastq.gz \
  -o trimmed_reads/
done
