cat > /pub/joeyl18/BOMBOX/oxymetag/scripts/setup_kraken2.sh << 'EOF'
#!/bin/bash
#SBATCH --job-name=kraken2_setup
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --partition=standard
#SBATCH --account=hammert_lab
#SBATCH --output=/pub/joeyl18/BOMBOX/logs/kraken2_setup_%j.out
#SBATCH --error=/pub/joeyl18/BOMBOX/logs/kraken2_setup_%j.err

set -eo pipefail

mkdir -p /pub/joeyl18/BOMBOX/kraken2_db
mkdir -p /pub/joeyl18/BOMBOX/logs

echo "[$(date)] Starting Kraken2 database download from S3"

wget --continue --tries=5 --timeout=120 --progress=dot:giga \
    -O /pub/joeyl18/BOMBOX/kraken2_db/k2_standard_20240605.tar.gz \
    https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20240605.tar.gz

echo "[$(date)] Download complete. Extracting..."

tar -xzvf /pub/joeyl18/BOMBOX/kraken2_db/k2_standard_20240605.tar.gz \
    -C /pub/joeyl18/BOMBOX/kraken2_db/

echo "[$(date)] Verifying..."

for f in hash.k2d opts.k2d taxo.k2d; do
    if [ -f "/pub/joeyl18/BOMBOX/kraken2_db/$f" ]; then
        echo "OK: $f"
    else
        echo "MISSING: $f" >&2
        exit 1
    fi
done

rm -f /pub/joeyl18/BOMBOX/kraken2_db/k2_standard_20240605.tar.gz

echo "[$(date)] Done! Database ready at /pub/joeyl18/BOMBOX/kraken2_db"
EOF