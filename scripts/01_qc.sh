#!/bin/bash

# Quality control using FastQC

fastqc -o qc_results/ *.fastq.gz
