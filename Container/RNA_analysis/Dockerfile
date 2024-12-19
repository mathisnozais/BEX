FROM rocker/r-ver:4.3.1

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2023.09.1+494
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV QUARTO_VERSION=default

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_quarto.sh

RUN apt-get update && apt-get install -y optipng \
                                         pandoc \
                                         libpng-dev \
                                         zlib1g-dev \
                                         libssl-dev \
                                         liblzma-dev \
                                         libbz2-dev \
                                         libglpk-dev \
                                         libcurl4-openssl-dev

 

#RUN apt-get update && apt-get install -y libxml2-dev libhdf5-serial-dev libudunits2-dev 
#RUN  apt-get update \ 
 # && export DEBIAN_FRONTEND=noninteractive \
 # && apt-get -y install libx11-dev freeglut3 freeglut3-dev libpng-dev 


# Install R packages
RUN R -e 'install.packages( "devtools")'
RUN R -e 'install.packages( "BiocManager")'
#RUN R -e 'BiocManager::install(version="3.18")'
RUN R -e 'library(BiocManager)'

RUN R -e 'install.packages( "rmarkdown")'
RUN R -e 'install.packages( "knitr")'
RUN R -e 'install.packages( "ggplot2")'
RUN R -e 'install.packages( "dplyr")'

## RNA seq tools
RUN R -e 'BiocManager::install("Rsubread")'
RUN R -e 'BiocManager::install("edgeR")'
RUN R -e 'BiocManager::install("DESeq2")'
RUN R -e 'BiocManager::install("TCGAbiolinks")'

## Extra
RUN R -e 'install.packages("RColorBrewer")'
RUN R -e 'BiocManager::install("org.Hs.eg.db")'
RUN R -e 'BiocManager::install("enrichplot")'
RUN R -e 'BiocManager::install("clusterProfiler")'
RUN R -e 'install.packages("msigdbr")'
RUN R -e 'BiocManager::install("pathview")'

RUN R -e 'library(devtools)'
RUN R -e 'devtools::install_version("rjson",version="0.2.15")' #needed for complexheatmpa
RUN R -e 'BiocManager::install("ComplexHeatmap")' 
RUN R -e 'BiocManager::install("ChIPQC")'

#RUN R -e 'install.packages("remotes")'
#RUN R -e 'BiocManager::install("pcaMethods")'
#RUN R -e 'remotes::install_github("alisonmoss3/dataVisEasy",ref="main")'
#RUN R -e 'install.packages("kableExtra")'
#RUN R -e 'install.packages("gplots")'
#RUN R -e 'install.packages("Hmisc")'

EXPOSE 8787

CMD ["/init"]
