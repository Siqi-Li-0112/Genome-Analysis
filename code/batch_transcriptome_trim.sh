#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 02:30:00
#SBATCH -J rna-reads-trim
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load trimmomatic

cd /domus/h1/siqili/gen-ana/result/transcriptome-trim/
trimmomatic PE \
  -threads 4 \
  -trimlog trim.log \
  /domus/h1/siqili/gen-ana/raw-data/transcriptome/untrimmed/SRR6040095_scaffold_10.1.fastq.gz /domus/h1/siqili/gen-ana/raw-data/transcriptome/untrimmed/SRR6040095_scaffold_10.2.fastq.gz \
  output_forward_paired_R1.fq.gz  output_forward_unpaired_R1.fq.gz output_reverse_paired_R2.fq.gz output_reverse_unpaired_R2.fq.gz \
  ILLUMINACLIP:TruSeq3-SE:2:30:10 \
  SLIDINGWINDOW:4:15 \
  LEADING:3 \
  TRAILING:3
