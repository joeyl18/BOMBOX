# Bumblebee Gut Microbiome Oxygen Tolerance Analysis
Metagenomic analysis of bumblebee gut microbiome. The general goal of the project is to find a relationship that explains the differences between bumblebees with different levels of oxygen tolerance. These differences can come from envrionmental factors like alitutde and climate or genetic differences like taxonomic differences or species differences. Samples across 20 different bumblebee species in the US and Colombia are used for analysis. The bioinformatic tool OxyMetaG is utilized to predict the aerobe/anaerobe ratio of gut bacteria of the bumblees sampled using 20 pfam identified.

## 

## Bioinformatic Pipeline
The pipeline consists of 5 major steps
1. Classificaion
Using unmapped reads (clean, host-filtered), the Kraken2 database classifies reads by taxonomy. Kraken2 fastq files are created (all reads are labeled by species). 
2. Extract
Bacteria reads are extracted from the Kraken2 fastq files using KrakenTools. Bacteria fastq files are created.
3. Alignment
Bacteria reads are matched to aerobic and anerobic PFAMS identified by OxyMetaG. 
4. Modeling
Create table with GAM (R) that models aerobe % from pfam ratios
5. Table
Table consists sample ID (one bumblebee), Aerobic/Anaerobic ratio, Aerobe pfams, Anaerobe pfams, and Predicted aerobe percentage

## Computing Environment

## Requirements
