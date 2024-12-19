## Container

This section give you access to containers that we used during our analysis. You can have access to the docker file and/or the final docker image.

- Seurat410 is made for scRNAseq of the BEX paper analysis
- RNA431-2 is made for Deseq2 analysis in the BEX paper
- CellProfiler425 is made for PLA image analysis in the BEX paper


```bash

workdir = "Yourpath" # to the clone github
# If you want to build a docker from dockerfile
docker build -t cellprofiler425 /workdir/Container/Dockerofinterest/

# If you want to laod a docker image
docker load --input /workdir/Container/Dockerofinterest/docker.tar

```