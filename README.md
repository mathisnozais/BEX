# Ectopic expression of BEX genes in T-cell Acute Lymphoblastic leukemia

Authors : Quessada Julie<sup>1,2*</sup>, Nozais Mathis<sup>1*</sup>, Grosjean Clémence<sup>1</sup>, Pankaew Saran<sup>1,3</sup>, Sara Allelova<sup>1</sup>, Potier Delphine<sup>1</sup>, Loosveld Marie<sup>1,2</sup> & Payet Bornet Dominique<sup>1,@</sup>

1 Aix Marseille Univ, CNRS, INSERM, CRCM, Marseille, France
2 APHM, Hôpital La Timone, Laboratoire d’Hématologie, Marseille, France 
3 Aix Marseille Univ, CNRS, I2M, Marseille, France 

*These authors contributed equally: Julie Quessada & Mathis Nozais

@Corresponding authors : Dominique Payet-Bornet

Link to article : (TO come) put DOI

to modify: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4636520.svg)](https://doi.org/10.5281/zenodo.4636520)

If you have any questions on this analysis, please contact [Mathis Nozais](mailto:mathis.nozais@live.fr)

---
### Overview
This repository contains the instructions and material to reproduce the analysis reported in the article. Source code is available in the github repository. Required data and builded Docker images are available respectively in SRA/GEO and Zenodo. Instructions to reproduce the analysis are provided in the different subdirectories:

depuis la matrice de compte brut subset sur les souris!
- Fastq preprocessing is discribed in the 01_DATA folder <br/>
In order to re do Fastq preprocessing you can follow guidelines and script here : [01_FASTQ_Preprocessing script](01_FASTQ_Preprocessing/README.md)
- Seurat analysis is discribed in the 02_Seurat_analysis folder <br/>
In order to re do Seurat Analysis you can follow guidelines and script here : [02_Seurat_analysis script](02_Seurat_analysis/README.md)

- 03_DESEQ2_analysis folder
- 04_Microscopy_analysis


---
### Data Availability
#### Count matrix

#### Seurat analysis
- Seurat rmd script to reproduce the preprocessing can be found [here](02_Seurat_analysis/01_Script/Experiment_preprocessing.Rmd) and analysis rmd script [here](02_Seurat_analysis/01_Script/Experiment_analysis.Rmd) change link

#### Deseq analysis

#### Microscopy analysis

#### Docker images
You have access to three dockers : one for scRNAseq analysis (name docker 410), one for bulkRNAseq (RNA.... name docker) and one for microscopy (name docker). All availabe in [Zenodo](https://doi.org/10.5281/zenodo.4636520) change link