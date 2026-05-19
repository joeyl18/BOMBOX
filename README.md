# Bumblebee Gut Microbiome Oxygen Tolerance Analysis
Metagenomic analysis of bumblebee gut microbiome. The general goal of the project is to find a relationship that explains the differences between bumblebees with different levels of oxygen tolerance. These differences can come from envrionmental factors like alitutde and climate or genetic differences like taxonomic differences or species differences. Samples across 20 different bumblebee species in the US and Colombia are used for analysis. The bioinformatic tool OxyMetaG is utilized to predict the aerobe/anaerobe ratio of gut bacteria of the bumblees sampled using 20 pfam identified.

## 

## Bioinformatic Pipeline
The pipeline consists of 5 major steps
1. Classificaion (Kraken2)
Classify unmapped reads with taxonomy database
2. Extract (KrakenTools)
Extract bacteria reads using KrakenTools
3. Alignment (DIAMOND)
Match bacteria reads to aerobic and anerobic PFAMS identified by OxyMetaG. 
4. Modeling (GAM)
Create table with GAM (R) that models aerobe % from pfam ratios
5. Visualize (ggplot2)
Visualize data from table consisting sample ID (one bumblebee), Aerobic/Anaerobic ratio, Aerobe pfams, Anaerobe pfams, and Predicted aerobe percentage.

## Computing Environment

## Requirements
The pipeline uses the following bioinformatic tools:
### Classification:
- [kraken2](https://github.com/DerrickWood/kraken2) (kraken2/2.1.2)  
### Extraction:
### Alignment:
- [DIAMOND](https://github.com/bbuchfink/diamond)
diamond/2.0.15

## Input Data
- Metagenomic FASTQ files from Bombus gut samples 
- Sample metadata: species, collection country, alttitude, colony ID
- OxyMetaG Pfam database 
## Output Data
- Predicted aerobes % (per sample)
- Sum RPK scores (per sample)
- t-test and ANOVA outputs (p-values)
- Figures
## Contributors
- Joey lin ---- Bioinformatic analysis, R visualization, Interpretation
## Citations
OxyMetaG

Bueno de Mesquita, C.P., Stallard-Olivera, E., Fierer, N. (2025). 
Quantifying the oxygen preferences of bacterial communities using a 
metagenome-based approach.

Kraken2 and KrakenTools
Lu, J., Rincon, N., Wood, D.E. et al. Metagenome analysis using the Kraken 
software suite. Nat Protoc 17, 2815–2839 (2022). 
https://doi.org/10.1038/s41596-022-00738-y

DIAMOND
Buchfink, B., Xie, C. & Huson, D. Fast and sensitive protein alignment using 
DIAMOND. Nat Methods 12, 59–60 (2015). 
https://doi.org/10.1038/nmeth.3176

