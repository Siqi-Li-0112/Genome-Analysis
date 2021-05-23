#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J correct_assembly_pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load Pilon
module load samtools
cd /domus/h1/siqili/gen-ana/result/correct-assembly/
samtools sort ill2pac-pe.sam -o ill2pac-pe.bam
samtools index ill2pac-pe.bam ill2pac-pe.bai
java -jar $PILON_HOME/pilon.jar --genome /domus/h1/siqili/gen-ana/result/canu_genome_assembly/pacbio.contigs.fasta --frags ill2pac-pe.bam
