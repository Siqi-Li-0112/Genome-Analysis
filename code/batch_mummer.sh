#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J assembly_quality_assessment_mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load MUMmer
cd "/domus/h1/siqili/gen-ana/result/assembly-quality-assessment/MUMmerplot_result/"
nucmer  -p nucmer  "/domus/h1/siqili/gen-ana/raw-data/durian-scaffold10-ncbi.fasta" "/domus/h1/siqili/gen-ana/result/correct-assembly/pilon.fasta"
#mummerplot -Q /domus/h1/siqili/gen-ana/result/correct-assembly/pilon.fasta -f -l -t png  nucmer.delta
delta-filter -1 nucmer.delta > nucmer_filtered.delta
#mummerplot -c -f -t png  nucmer_filtered.delta
mummerplot --large -l -t png  nucmer_filtered.delta
