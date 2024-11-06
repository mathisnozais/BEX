# Seurat analysis

## Overview

This repository describes how the scRNAseq data analysis was performed with Seurat. It contains the instructions and material to reproduce the analysis reported in the article.To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis described in the "Run the analysis" section below.

## Setup the experiment
### Prerequisites

Docker container images are available on [zenodo](https://doi.org/10.5281/zenodo.4636520). change link
In order to prepare the environment for analysis execution, it is required to:
- Clone this github repository and set the WORKING_DIR variable
- Download the RStudio / Seurat docker image tar file
- Load the docker image on your system
- Download files to perform the analysis on [zenodo](https://doi.org/10.5281/zenodo.4636520) change link

#### Clone Github repository

Use your favorite method to clone this repository in a chosen folder.This will create a "MycPten" folder with all the source code. <br/>
You must set an environment variable called WORKING_DIR with a value set to the path to this Myc_Pten folder.
For instance, if I clone the Git repository in "/home/nozais/workspace", then the WORKING_DIR variable will be set to :

```bash
export WORKING_DIR=/home/nozais/workspace/Myc_Pten
```

#### Docker images
> :warning: In order to execute analysis, you must load the provided docker images onto your Docker. Docker must be installed on your system. See https://docs.docker.com/install/ for details on Docker installation.

Docker image file is stored on Zenodo :

```bash
# To download Seurat410
wget -P $WORKING_DIR/Images/Docker https://zenodo.org/record/4636520/files/Seurat301v2.tar?download=1 NEED TO CHANGE

# To load it
docker load < $WORKING_DIR/Container/Seurat410/Seurat410.tar

# To run it
docker run -d --name seurat410 -p 9090:8787 -v $WORKING_DIR:/workspace seurat401
```

#### Download data
Using the raw matrix that can be retrieve from ... you can perform the pre processing steps.
You can also directly load our Robject xxx to perform the analysis.

RNA_matrix_sub.csv
Metadata_matrix_sub.csv
```bash

dowload link xxx
```

### Run the analysis
You can access the code chunk by chunk via "Script_BEX_paper" Rmd
One code for pre-processing
one for analysis

