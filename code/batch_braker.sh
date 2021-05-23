#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 01:30:00
#SBATCH -J genome-annotation-braker
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key /domus/h1/siqili/.gm_key
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1
bam_dir=/domus/h1/siqili/gen-ana/result/rna-mapping/
cd "/domus/h1/siqili/gen-ana/result/genome-annotation/"
source $AUGUSTUS_CONFIG_COPY
braker.pl --cores=8 --species=durian --useexisting --genome=/domus/h1/siqili/gen-ana/result/correct-assembly/pilon.fasta --bam=$bam_dir/SRR6040092Aligned.sortedByCoord.out.bam,$bam_dir/SRR6040093Aligned.sortedByCoord.out.bam,$bam_dir/SRR6040094Aligned.sortedByCoord.out.bam,$bam_dir/SRR6040096Aligned.sortedByCoord.out.bam,$bam_dir/SRR6040097Aligned.sortedByCoord.out.bam,$bam_dir/SRR6156066Aligned.sortedByCoord.out.bam,$bam_dir/SRR6156067Aligned.sortedByCoord.out.bam,$bam_dir/SRR6156069Aligned.sortedByCoord.out.bam --AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin --AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts --GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy --gff3

