#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J differential-expression-ana-htseq-gtf
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se

module load bioinfo-tools
module load htseq
module load samtools

cd /domus/h1/siqili/gen-ana/result/differential-expression-analysis/htseq/
grep "transcript_id" "/domus/h1/siqili/gen-ana/result/genome-annotation/braker/durian/augustus.hints.gtf" > "/domus/h1/siqili/gen-ana/result/genome-annotation/braker/durian/augustus.hints.copy.gtf"
for i in 6156069 6156067 6156066 6040097 6040096 6040094 6040093 6040092
do
#samtools index "/domus/h1/siqili/gen-ana/result/rna-mapping/SRR${i}Aligned.sortedByCoord.out.bam"
htseq-count -f bam -s no "/domus/h1/siqili/gen-ana/result/rna-mapping/SRR${i}Aligned.sortedByCoord.out.bam" "/domus/h1/siqili/gen-ana/result/genome-annotation/braker/durian/augustus.hints.copy.gtf" > SRR${i}.count
done
