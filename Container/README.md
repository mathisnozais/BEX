## Container

This section give you access to containers that we used during our analysis. You can have access to the docker file and/or the final docker image.

- Seurat440 is made for scRNAseq of the BEX paper analysis
- RNA431-2 is made for Deseq2 analysis (both for CRISPR & TCGA) in the BEX paper
- CellProfiler425 is made for PLA image analysis in the BEX paper
- H5AD is made to convert H5AD to Seurat object
- Conda environment for RNA preprocessing

In the respective folder you'll find dockerfile used to create our docker. You can either try to build them or directly download them via Zenodo.
Example to build a docker
```bash
WORKING_DIR = "Yourpath" # to the cloned github

# If you want to build a docker from dockerfile
docker build -t seurat440 $WORKING_DIR/Container/Seurat440/

# Then you'll be able to do : 
docker run -d --name seurat440 -p 8787:8787 -v $WORKING_DIR:/workspace seurat440
```

Download docker images via Zenodo link :
```bash
# Seurat440
wget -P $WORKING_DIR/Container/Seurat440 https://zenodo.org/records/14044880/files/Seurat440paper.tar

# RNA431-2
wget -P $WORKING_DIR/Container/RNA_analysis/ https://zenodo.org/records/14044880/files/rna431-2.tar

# H5AD
wget -P $WORKING_DIR/Container/H5AD https://zenodo.org/records/14044880/files/h5ad.tar

# Then if you want to laod a docker image
docker load --input $WORKING_DIR/Container/Dockerofinterest/docker.tar

```

Docker available differently : 
```bash
# Docker CellProfiler425 is accessible via DockerHub
docker pull cellprofiler/cellprofiler:4.2.5

# RNA preprocess
TO PUT SOMETHING HERE
```
