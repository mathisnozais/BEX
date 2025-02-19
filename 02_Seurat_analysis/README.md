# Seurat analysis

## Overview

This repository describes how the scRNAseq data analysis was performed with Seurat. It contains the instructions and material to reproduce the analysis reported in the article.
To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis described in the "Run the analysis" section below.

## Setup the experiment
### Prerequisites

Docker container images are available on [zenodo](https://doi.org/10.5281/zenodo.14044880).
In order to prepare the environment for analysis execution, it is required to:
- Clone this github repository and set the WORKING_DIR variable
- Download the RStudio / Seurat docker image tar file
- Load the docker image on your system
- Download files to perform the analysis on [zenodo](https://doi.org/10.5281/zenodo.14044880)

#### Clone Github repository

Use your favorite method to clone this repository in a chosen folder.This will create a "MycPten" folder with all the source code. <br/>
You must set an environment variable called WORKING_DIR with a value set to the path to this Myc_Pten folder.
For instance, if I clone the Git repository in "/home/nozais/workspace", then the WORKING_DIR variable will be set to :

```bash
export WORKING_DIR=/home/nozais/workspace/BEX
```

#### Docker images
> :warning: In order to execute analysis, you must load the provided docker images onto your Docker. Docker must be installed on your system. See https://docs.docker.com/install/ for details on Docker installation.

Docker image file is stored on Zenodo :

```bash
# To download the docker "Seurat440"
wget -P $WORKING_DIR/Container/Seurat440 https://zenodo.org/records/14044880/files/Seurat440paper.tar

# To load it
docker load < $WORKING_DIR/Container/Seurat440/Seurat440paper.tar

# To run it
docker run -d --name seurat440paper -p 8787:8787 -v $WORKING_DIR:/workspace seurat440paper
```

#### Download data
Using the raw count matrix that can be retrieve with this repository you can perform the pre processing steps.
You can also directly load our Robject to perform the analysis.

For raw count matrices you have access to gene count, HTO information ie:sample of origin of the cells and ADT count ie: Protein expression level
- Raw count matrices
	- RNA_matrix_sub.csv
	- Metadata_matrix_sub.csv
	- ADT_matrix_sub.csv

```bash
# Get Robject to perform analysis
wget -P $WORKING_DIR/01_Data https://zenodo.org/records/14044880/files/BC_BEX_mice.Robj

```

For supplementary figure
```bash

# Mice thymus in scRNAseq
# From Scarauzzino et al - https://www.embopress.org/doi/full/10.15252/embj.2021110023
# Raw data can be accessed here : 
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE184544 # With thymus_tot and thymus_DN
wget -P $WORKING_DIR/01_Data https://zenodo.org/records/14044880/files/ThymusWT_clean_cc-regressed_noADT.Robj # Processed object 


# Human thymus in scRNAseq 
# From Li et al - https://www.nature.com/articles/s41467-024-51767-y
# https://zenodo.org/records/13207776
wget -P $WORKING_DIR/01_Data https://zenodo.org/records/13207776/files/thymus.sc.RDS #already processed object


# From Park et al - https://www.science.org/doi/10.1126/science.aay3224
# https://zenodo.org/records/5500511
wget -P $WORKING_DIR/01_Data https://zenodo.org/records/5500511/files/thymus_annotated_matrix_files.zip
unzip thymus_annotated_matrix_files.zip # we are only interested in HTA08.v01.A05.Science_human_fig1.h5ad

# Park data modified for Seurat 
wget -P $WORKING_DIR/01_Data https://zenodo.org/records/14044880/files/Park_dataset.robj

```

#### Analysis
You can use the script ["BEX_scRNA_Git"](/02_Seurat_analysis/02_Script/BEX_scRNA_Git.Rmd)   for the conversion.


> [!NOTE]  
> For Park et al, available data are in h5ad format. We converted it to an robj that you can directly download. If you want to perform the conversion you can follow the command [down bellow](#h5ad-conversion) 


### Run the analysis
You can access the code chunk by chunk via "BEX_scRNA_Git" Rmd. You'll be able to perform the preprocessing starting with the raw count matrices.
Then you'll be able to reproduce the figure in the paper.

## H5AD conversion

We made a Docker image stored on Zenodo, to convert H5AD to Seurat object as many solution on internet failed. 

> [!WARNING] 
> This method is memory consumming + the data from Park are pretty heavy thus when testing on our computer it uses around 50 Go of RAM.
> Be sure you have enought RAM avalaible to avoid crashing your computer.


```bash

# To download the docker "H5AD"
wget -P $WORKING_DIR/Container/H5AD https://zenodo.org/records/14044880/files/h5ad.tar

# To load it
docker load < $WORKING_DIR/Container/H5AD/h5ad.tar

# To run it
docker run -d --name h5ad -p 8787:8787 -v $WORKING_DIR:/workspace h5ad
```
You will need h5ad file from Park et al for example
```bash
# From Park et al - https://www.science.org/doi/10.1126/science.aay3224
# https://zenodo.org/records/5500511
wget -P $WORKING_DIR/01_Data https://zenodo.org/records/5500511/files/thymus_annotated_matrix_files.zip
unzip thymus_annotated_matrix_files.zip # we are only interested in HTA08.v01.A05.Science_human_fig1.h5ad
```
Then you can use the script ["H5AD_Park_Git"](/02_Seurat_analysis/02_Script/H5AD_Park_Git.rmd)   for the conversion.
