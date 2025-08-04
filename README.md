# Ectopic expression of BEX genes in T-cell Acute Lymphoblastic leukemia

Authors : Quessada Julie<sup>1,2*</sup>, Nozais Mathis<sup>1*</sup>, Grosjean Clémence<sup>1</sup>, Pankaew Saran<sup>1,3</sup>, Sara Allelova<sup>1</sup>, Potier Delphine<sup>1</sup>, Loosveld Marie<sup>1,2,@</sup> & Payet Bornet Dominique<sup>1,@</sup>  
1 Aix Marseille Univ, CNRS, INSERM, CRCM, Marseille, France  
2 APHM, Hôpital La Timone, Laboratoire d’Hématologie, Marseille, France  
3 Aix Marseille Univ, CNRS, I2M, Marseille, France  
*These authors contributed equally: Julie Quessada & Mathis Nozais  
@Corresponding authors :Loosveld Marie, Dominique Payet-Bornet

Link to article : (TO come) put DOI  
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14044880.svg)](https://doi.org/10.5281/zenodo.14044880)

If you have any questions on this analysis, please contact [Mathis Nozais](mailto:mathis.nozais@live.fr)

---
### Overview

This repository contains the instructions and material to reproduce the analysis reported in the article. The bio-informatic analysis are divided in 5 part : 
- scRNAseq on PTEN<sup>del</sup> mice
- bulkRNAseq on TCGA pubic data
- bulkRNAseq on CRISPR edited Jurkat cells
- Confocal microscopy
- Cut&Tag

 All the code are available in this github repository. Required data and builded Docker images are available respectively in SRA/GEO and Zenodo. Instructions to reproduce the analysis are provided in the different subdirectories:

- scRNAseq on PTEN<sup>del</sup> mice
    - Seurat preprocessing and analysis of the mice scRNAseq is discribed in the 02_Seurat_analysis folder <br/>
In order to re do the Figure 1 with Seurat Analysis you can follow guidelines and script here : [02_Seurat_analysis script](02_Seurat_analysis/README.md)
- bulkRNAseq on TCGA pubic data
    - Analysis of the TCGA database is discribed in the 03_BulkRNA_analysis folder <br/>
    In order to re do Figure 2 & 3 with TCGA you can follow guidelines and script here : [03_BulkRNA_analysis](03_BulkRNA_analysis/README.md)
- bulkRNAseq on CRISPR edited Jurkat cells
    - Fastq preprocessing of the CRISPR part is discribed in the 01_BulkNRA_preprocessing folder <br/>
	In order to re do Fastq preprocessing you can follow guidelines and script here : [01_BulkNRA_preprocessing](01_BulkNRA_preprocessing/README.md)
    - Analysis is discribed in the 03_BulkRNA_analysis folder <br/>
    In order to re do Figure 5 you can follow guidelines and script here : [03_BulkRNA_analysis](03_BulkRNA_analysis/README.md)
- Confocal microscopy
    - The analysis of the confocal images are described in the 04_Microscopy_analysis folder <br/>
	In order to re do the detection and counting of the nuclei and PLA spot, and to obtain the same image as the paper figure 4 you can follow : [04_Microscopy_analysis ](04_Microscopy_analysis/README.md)

---
### Data Availability
Multiple type of data are available, see here a brief summary and detail access link are provided in each sub-directories.

#### Mice scRNAseq
Raw count matrix and metadata to assign each cell to a sample for the mice scRNAseq experiment are available in this repository.
Final R Seurat object can be dowloaded via Zenodo.

#### TCGA bulkRNA
Data can be dowloaded from the TCGA website and informations are given on wich samples where used in the detailed analysis. You can also download pre-made matrix that we used on Zenodo.

#### CRISPR bulkRNAseq
7 samples in paired-end are available as FASTQ files in SRA/GEO under the accession number : xxxx
Final object can be dowloaded via Zenodo.

#### Microscopy 
Raw image files are accessible via Zenodo. It concern Jurkat and PEER cell lines and also edited Jurkat cells.

#### Docker images
You have access to three dockers : one for scRNAseq analysis (named docker 440), one for bulkRNAseq (named docker RNA431-2) and one for microscopy (CellProfiler425). One conda environment for RNAseq preprocessing
