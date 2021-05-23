#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J assembly_quality_assessment_quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load quast
hom_dir=/domus/h1/siqili/gen-ana/result/
cd $hom_dir/assembly-quality-assessment
quast.py -o ./quast_result -t 2 -e -1 $hom_dir/../raw-data/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz -2 $hom_dir/../raw-data/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz $hom_dir/correct-assembly/pilon.fasta
