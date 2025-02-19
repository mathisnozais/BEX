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
                                         
                                         
# Install system library for rgeos
RUN apt-get install -y libgeos-dev #needed for new version of seurat
RUN apt-get install -y libcairo2-dev #needed for ComplexHeatmap and scCustomize
RUN apt-get install -y libxt-dev  #needed for ComplexHeatmap and scCustomize
#C library needed for the R pacakges

# Install R packages
RUN R -e 'install.packages( "devtools")'
RUN R -e 'install.packages( "BiocManager")'
RUN R -e 'BiocManager::install(version="3.18")'

RUN R -e 'library(BiocManager)'
RUN R -e 'install.packages( "knitr")'
RUN R -e 'install.packages( "rmarkdown")'

#RUN R -e 'install.packages("yulab.utils")'
RUN R -e 'install.packages("ggplot2")'
RUN R -e 'install.packages("SoupX")'

RUN R -e 'install.packages("Cairo")'
RUN R -e 'BiocManager::install("ComplexHeatmap")'
RUN R -e 'install.packages("scCustomize")'

RUN R -e 'install.packages("remotes")'
RUN R -e 'library(remotes)'
RUN R -e 'remotes::install_version("Seurat", "4.4.0", repos = "http://cran.r-project.org")'
RUN R -e 'remotes::install_version("SeuratObject", "4.1.4",repos = "http://cran.r-project.org")'

RUN R -e 'BiocManager::install("biomaRt",update = FALSE)'
RUN R -e 'install.packages("tidyverse")'
RUN R -e 'install.packages("patchwork")'
RUN R -e 'install.packages("viridis")'
RUN R -e 'install.packages("svglite")'
RUN R -e 'install.packages("paletteer")'
RUN R -e 'install.packages("reshape2")'

EXPOSE 8787

CMD ["/init"]

