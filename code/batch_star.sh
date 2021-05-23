#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 02:30:00
#SBATCH -J rna-mapping-star
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load star
module load samtools


STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /domus/h1/siqili/gen-ana/result/rna-mapping/index --genomeFastaFiles /domus/h1/siqili/gen-ana/result/correct-assembly/pilon.fasta --genomeSAindexNbases 12
cd /domus/h1/siqili/gen-ana/raw-data/transcriptome/trimmed/
for i in 6156069 6156067 6156066 6040097 6040096 6040094 6040093 6040092
do
STAR --runThreadN 8 --limitBAMsortRAM 2295432027 --genomeDir /domus/h1/siqili/gen-ana/result/rna-mapping/index --readFilesIn SRR${i}_scaffold_10.1.fastq.gz SRR${i}_scaffold_10.2.fastq.gz \
 --outFileNamePrefix /domus/h1/siqili/gen-ana/result/rna-mapping/SRR${i} --outSAMtype BAM SortedByCoordinate --readFilesCommand zcat
done
