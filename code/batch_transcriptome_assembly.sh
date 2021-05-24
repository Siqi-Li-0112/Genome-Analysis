#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 05:00:00
#SBATCH -J transcriptome_assembly_trinity
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load trinity

cd /proj/g2021012/nobackup/work/siqili
dir=/domus/h1/siqili/gen-ana/raw-data/transcriptome/trimmed
Trinity --seqType fq --max_memory 25G  \
         --left $dir/SRR6040092_scaffold_10.1.fastq.gz,$dir/SRR6040093_scaffold_10.1.fastq.gz,$dir/SRR6040094_scaffold_10.1.fastq.gz,$dir/SRR6040096_scaffold_10.1.fastq.gz \
         --right $dir/SRR6040092_scaffold_10.2.fastq.gz,$dir/SRR6040093_scaffold_10.2.fastq.gz,$dir/SRR6040094_scaffold_10.2.fastq.gz,$dir/SRR6040096_scaffold_10.2.fastq.gz \
         --CPU 8 --no_normalize_reads
