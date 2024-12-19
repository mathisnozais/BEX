# Bulk RNAseq analysis

## Overview

This repository describes how the analysis of the CRISPR KO where performed.

## Setup the experiment
### Prerequisites

Docker container images are available on [zenodo](https://doi.org/10.5281/zenodo.4636520). change link
In order to prepare the environment for analysis execution, it is required to:
- Clone this github repository and set the WORKING_DIR variable (if it was not previously done following the BulkRNA_preprocessing)
- Download the RStudio / DESeq2 docker image tar file
- Load the docker image on your system
- Download files to perform the analysis on [zenodo](https://doi.org/10.5281/zenodo.4636520) change link
 
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
wget -P $WORKING_DIR/Container/RNA_analysis/ htppsxxxxxx

docker load --input $WORKING_DIR/Container/RNA_analysis/rna431-2.tar

# To run it
docker run -d --name rna431-2 -p 9090:8787 -v $WORKING_DIR:/workspace rna431-2
```

> [!NOTE]  
> Two different type of data where analysed as bulkRNAseq. TCGA (Figure 2 & 3) and CRISPR KO (Figure 5). The following instruction will be first for [TCGA](#Run the TCGA analysis)and then [CRISPR KO](#Run the CRISPR-CAS9 KO bulkRNA-seq analysis).
## Run the TCGA analysis

### Download data
You can avoid running pre-processing code by downloading the final object used.
```bash

dowload link xxx
```
### Pre-processing 
First of all we need to prepare a DESeq2 object with all the data that matters for the projet from TCGA. 
We created 3 object one with Acute Leukemia, one with only Acute Lymphoblastic Leukemia (ALL) and one with only T cell Acute Lymphoblastic leukemia (T-ALL).
Using RNA_TCGA_BEX_preproc.Rmd you'll be able to perform our pre-processing to create the objects.



### Plot 
Using RNA_TCGA_BEX_analysis.Rmd you'll be able to reproduce plot that we use in our paper.

WILL NEED TO CLEAN THE FILE PATH IN RMD


## Run the CRISPR-CAS9 KO bulkRNA-seq analysis
### Download data
You can avoid running pre-processing code by downloading the final object used.
```bash

wget -P folder of interest xxxx site
```

### Pre-processing
Before starting you should activate your conda environment. All the script is automated you'll need to modify the path to the raw data that you should have dwoloaded here : xxx

```bash
conda activate RNAbulk

```
### Plot 


