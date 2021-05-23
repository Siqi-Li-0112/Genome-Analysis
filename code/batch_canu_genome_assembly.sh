#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 23:00:00
#SBATCH -J gen-ana-canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

#Load modules
module load bioinfo-tools
module load canu

#My commands
canu -pacbio /home/siqili/gen-ana/raw-data/pacbio_data/SRR6037732_scaffold_10.fq.gz -d /home/siqili/gen-ana/result/canu_genome_assembly -p pacbio genomeSize=24m
