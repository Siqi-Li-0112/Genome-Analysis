#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J correct_assembly_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load bwa

cd /domus/h1/siqili/gen-ana/result/correct-assembly/
bwa index -a is /domus/h1/siqili/gen-ana/result/canu_genome_assembly/pacbio.contigs.fasta > ./ill2pac_index
bwa mem -t 2 /domus/h1/siqili/gen-ana/result/canu_genome_assembly/pacbio.contigs.fasta /domus/h1/siqili/gen-ana/raw-data/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz /domus/h1/siqili/gen-ana/raw-data/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz > ./ill2pac-pe.sam
