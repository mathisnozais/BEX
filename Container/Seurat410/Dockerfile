FROM rocker/r-ver:4.1.0

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=1.4.1717
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

#to replace their install-rstudio and user conf that don't work
COPY Rstudio.sh /
RUN chmod +x /Rstudio.sh && /Rstudio.sh

RUN /rocker_scripts/install_pandoc.sh

RUN apt-get update && apt-get install -y optipng \
                                         pandoc \
                                         libpng-dev \
                                         zlib1g-dev \
                                         libssl-dev \
                                         libcurl4-openssl-dev

#RUN apt-get install -y gcc-7 g++-7 gfortran-7
RUN apt-get install -y libglpk-dev


RUN apt-get update && apt-get install -y libxml2-dev libhdf5-serial-dev libudunits2-dev 
RUN  apt-get update \ 
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install libx11-dev freeglut3 freeglut3-dev libpng-dev

COPY userconf.sh /etc/cont-init.d/userconf

# Install R packages

#RUN R -e 'install.packages("remotes")'

RUN R -e 'install.packages( "devtools")'
RUN R -e 'install.packages( "BiocManager",version = "3.14")'
RUN R -e 'library(BiocManager)'


EXPOSE 8787

CMD ["/init"]
