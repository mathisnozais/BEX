# Ectopic expression of BEX genes in T-cell Acute Lymphoblastic leukemia

Authors : Quessada Julie<sup>1,2*</sup>, Nozais Mathis<sup>1*</sup>, Grosjean Clémence<sup>1</sup>, Pankaew Saran<sup>1,3</sup>, Sara Allelova<sup>1</sup>, Potier Delphine<sup>1</sup>, Loosveld Marie<sup>1,2</sup> & Payet Bornet Dominique<sup>1,@</sup>  
1 Aix Marseille Univ, CNRS, INSERM, CRCM, Marseille, France  
2 APHM, Hôpital La Timone, Laboratoire d’Hématologie, Marseille, France  
3 Aix Marseille Univ, CNRS, I2M, Marseille, France  
*These authors contributed equally: Julie Quessada & Mathis Nozais  
@Corresponding authors : Dominique Payet-Bornet

Link to article : (TO come) put DOI  
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14044880.svg)](https://doi.org/10.5281/zenodo.14044880)

If you have any questions on this analysis, please contact [Mathis Nozais](mailto:mathis.nozais@live.fr)

---
### Overview
This repository contains the instructions and material to reproduce the analysis reported in the article. The bio-informatic analysis are divided in 4 part : mice scRNAseq, TCGA bulkRNAseq, CRISPR bulkRNAseq and microscopy.



 Source code is available in the github repository. Required data and builded Docker images are available respectively in SRA/GEO and Zenodo. Instructions to reproduce the analysis are provided in the different subdirectories:
- Fastq preprocessing of the CRISPR part is discribed in the 01_BulkNRA_preprocessing folder <br/>
In order to re do Fastq preprocessing you can follow guidelines and script here : [01_FASTQ_Preprocessing script](01_FASTQ_Preprocessing/README.md)
- Seurat analysis of the mice scRNAseq is discribed in the 02_Seurat_analysis folder <br/>
In order to re do Seurat Analysis you can follow guidelines and script here : [02_Seurat_analysis script](02_Seurat_analysis/README.md)
- TCGA and CRISPR are on folder 03_DESEQ2_analysis for <br/>
In order to 
- The analysis of the confocal images are described in the 04_Microscopy_analysis folder <br/>
In order to re do the detection and counting of the nuclei and PLA spot, and to obtain the same image as the paper.

---
### Data Availability
#### mice scRNAseq
We give you access to the raw count matrix and metadata to assign each cell to a sample for the mice scRNAseq.

#### CRISPR KO bulkRNA
We give you access to FASTQ files.

#### TCGA bulkRNA
Data can be dowloaded from the TCGA website and informations are given on wich samples where used.

#### Microscopy 
Raw files 

#### Seurat analysis
- Seurat rmd script to reproduce the preprocessing can be found [here](02_Seurat_analysis/01_Script/Experiment_preprocessing.Rmd) and analysis rmd script [here](02_Seurat_analysis/01_Script/Experiment_analysis.Rmd) change link

#### Deseq analysis

#### Microscopy analysis

#### Docker images
You have access to three dockers : one for scRNAseq analysis (name docker 410), one for bulkRNAseq (RNA.... name docker) and one for microscopy (name docker). All availabe in [Zenodo](https://doi.org/10.5281/zenodo.4636520) change link