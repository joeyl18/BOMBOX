#!/bin/bash
#SBATCH --job-name=oxymetag_profile
#SBATCH --array=1-113
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --partition=standard
#SBATCH --account=hammert_lab
#SBATCH --output=/pub/joeyl18/BOMBOX/logs/profile_%A_%a.out
#SBATCH --error=/pub/joeyl18/BOMBOX/logs/profile_%A_%a.err

source /opt/apps/mamba/24.3.0/etc/profile.d/conda.sh
conda activate oxymetag

SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" /pub/joeyl18/BOMBOX/samples.txt)

echo "[$(date)] Profiling sample: $SAMPLE"

mkdir -p /pub/joeyl18/BOMBOX/diamond_output/${SAMPLE}

oxymetag profile \
    -i /pub/joeyl18/BOMBOX/results/${SAMPLE} \
    -o /pub/joeyl18/BOMBOX/diamond_output/${SAMPLE} \
    -t 8 \
    -m diamond

echo "[$(date)] Done: $SAMPLE"
EOF