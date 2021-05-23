#!bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:01:00
#SBATCH -J genome_assembly_canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user siqi.li.2084@student.uu.se


module load bioinfo-tools
module load canu


echo "batch stript"
