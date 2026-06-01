#!/bin/bash
#SBATCH --job-name=oxymetag_extract
#SBATCH --array=1-113
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G
#SBATCH --time=12:00:00
#SBATCH --partition=standard
#SBATCH --account=hammert_lab
#SBATCH --output=/pub/joeyl18/BOMBOX/logs/extract_%A_%a.out
#SBATCH --error=/pub/joeyl18/BOMBOX/logs/extract_%A_%a.err

source /opt/apps/mamba/24.3.0/etc/profile.d/conda.sh
conda activate oxymetag

SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" /pub/joeyl18/BOMBOX/samples.txt)

echo "[$(date)] Processing sample: $SAMPLE"

mkdir -p /pub/joeyl18/BOMBOX/results/${SAMPLE}

oxymetag extract \
    -i ~/symbus_nonhost_reads/${SAMPLE}/${SAMPLE}_R1_nonhost.fastq.gz \
    -o /pub/joeyl18/BOMBOX/results/${SAMPLE} \
    -t 8 \
    --kraken-db /pub/joeyl18/BOMBOX/kraken2_db