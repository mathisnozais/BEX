# Bulk RNAseq analysis

## Overview

This part of the repository describes how the analysis of the different bulkRNA-seq data were performed.

> [!NOTE]  
> Two different type of data where analysed as bulkRNAseq. TCGA (Figure 2 & 3) and CRISPR KO (Figure 5). 

You can follow the TCGA analysis [here](#tcga-analysis), or the CRISPR-CAS9 BEX KO analysis [here](#crispr-CAS9-analysis).
For both analysis the setup will be similar.

## Setup the experiment
### Prerequisites

Docker container images are available on [zenodo](https://doi.org/10.5281/zenodo.14044880).
In order to prepare the environment for analysis execution, it is required to:
- Clone this github repository and set the WORKING_DIR variable (if it was not previously done following the BulkRNA_preprocessing)
- Download the RStudio / DESeq2 docker image tar file
- Load the docker image on your system
- Download files stored on [zenodo](https://doi.org/10.5281/zenodo.14044880)to perform the analysis.
 
#### Clone Github repository

Use your favorite method to clone this repository in a chosen folder. This will create a "BEX" folder with all the source code.
You must set an environment variable called WORKING_DIR with a value set to the path to this BEX folder. For instance, if I clone the Git repository in "/home/nozais/workspace", then the WORKING_DIR variable will be set to :

```bash

export WORKING_DIR=/home/nozais/workspace/BEX

```

#### Docker images

> [!WARNING] 
> In order to execute analysis, you must load the provided docker images onto your Docker. Docker must be installed on your system. See https://docs.docker.com/install/ for details on Docker installation.

Docker image file is stored on Zenodo :

```bash
# To download RNA431-2
wget -P $WORKING_DIR/Container/RNA_analysis/ https://zenodo.org/records/14044880/files/rna431-2.tar

docker load --input $WORKING_DIR/Container/RNA_analysis/rna431-2.tar

# To run it
docker run -d --name rna431-2 -p 9090:8787 -v $WORKING_DIR:/workspace rna431-2
```

## TCGA analysis

All the analysis to produces the figures can be performed using "RNA_TCGA_BEX.Rmd" script.
TCGA data where obtained via the CDC database. You can re do the downloading step to produce the matrices in the beggining of the rmd.
You can also avoid this step by going to the next rmd section and load directly the raw data matrix.
You can also used as an input a specific matrix for your plot of interest.

### Download data

```bash
#Link to all data available for Seurat Analysis
# Depending on where you want to start in the code you can choose one of those matrices.

	## Matrices with raw TCGA dowloaded data
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/RNA_matrix_TARGET_AML.rds # For AML RNA matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/RNA_matrix_TARGET_P2.rds  # For P2 RNA matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/RNA_matrix_TARGET_P3.rds  # For P3 RNA matrix 

wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/clinial_matrix_TARGET_AML.rds # For AML clinical matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/clinial_matrix_TARGET_P2.rds # For P2 clinical matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/clinial_matrix_TARGET_P3.rds For P3 clinical matrix 

	## Subset and gene converted matrices for T-ALL analysis and figure
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/RNA_matrix_TARGET_TALL_convert.rds # For T-ALL RNA matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/Clinical_matrix_TARGET_TALL_convert.rds # For T-ALL clinical matrix 

	## Subset and gene converted matrices for AL analysis and figure
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/clinical_matrix_TARGET_AL.rds # For Acute Leuk clinical matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/RNA_matrix_TARGET_AL_convert.rds # For Acute Leuk rna matrix 

	## Subset and gene converted matrices for ALL analysis and figure
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/clinical_matrix_TARGET_ALL_convert.rds # For ALL clinical matrix 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data/Object https://zenodo.org/records/14044880/files/RNA_matrix_TARGET_ALL_convert.rds # For ALL RNA matrix 

# Other files needed for the analysis 
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data https://zenodo.org/records/14044880/files/gencode.v36.annotation.gtf

```

## CRISPR-CAS9 analysis

All the analysis to produces the figures can be performed using "Bex_RNA_CRISPR.Rmd" script.
At this step we assume that the pre-processing was already performed. If not you can run the [pre-processing](/01_BulkRNA_preprocessing/README.md) code or start from here by downloading input matrix used.

### Download data

```bash
# Depending on where you want to start in the code choose one of Feature count matrix or Deseq object
# Feature count matrix
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data JKT_CRISPR_featurecounts.txt
# Deseq object 
wget -P $WORKING_DIR/03_BulkRNA_analysis/03_Output https://zenodo.org/records/14044880/files/dds_CRISPR.rds

#Files needed for further analysis that are stored on Zenodo
# Public peak files that were dowloaded from https://remap.univ-amu.fr/target_page/TAL1:9606
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data https://zenodo.org/records/14044880/files/GSE25000.bed #GSE25000
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data https://zenodo.org/records/14044880/files/GSE29180.bed #GSE29180
#Sanda TAL1 target groups, those files where made based on https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11063860/
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data https://zenodo.org/records/14044880/files/SANDA_GR_A.txt #SandaA
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data https://zenodo.org/records/14044880/files/SANDA_GR_B.txt #SandaB
wget -P $WORKING_DIR/03_BulkRNA_analysis/01_Data https://zenodo.org/records/14044880/files/SANDA_GR_C.txt #SandaC
```


