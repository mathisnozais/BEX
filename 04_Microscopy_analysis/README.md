# Microscopy analysis

## Overview

This repository describes how the confocal data where analysed with CellProfiler and Fiji. It contains the instructions and material to reproduce the analysis reported in the article. To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis described in the "Run the analysis" section below.

## Setup the experiment
### Prerequisites

#### Clone Github repository

Use your favorite method to clone this repository in a chosen folder. This will create a "BEX" folder with all the source code.
You must set an environment variable called WORKING_DIR with a value set to the path to this BEX folder. For instance, if I clone the Git repository in "/home/nozais/workspace", then the WORKING_DIR variable will be set to :

```bash

export WORKING_DIR=/home/nozais/workspace/BEX

```

#### Docker images
The docker we used is from CellProfiler DockerHub with the 4.2.5 version. You can download it with the link bellow : 

```bash

# To get the docker
docker pull cellprofiler/cellprofiler:4.2.5

```

#### Download data

Raw images from confocal are available on Zenodo. 2 different batch of images where acquired on two different confocal microscopes (Nikon and Zeiss)
```bash

# Get the images 
wget -P $WORKING_DIR/04_Microscopy_analysis/01_Data https://zenodo.org/records/14044880/files/Confocal_images.tar.gz
tar -xvzf $WORKING_DIR/04_Microscopy_analysis/01_Data/Confocal_images.tar.gz

```
### Run the analysis
Once the data are dowloaded in the input folder you can run the cellprofiler docker to run the analysis on all the confocal images.

```bash

docker run -v $WORKING_DIR/04_Microscopy_analysis/:/Analysis cellprofiler/cellprofiler:4.2.5 -i /Analysis/01_Data/Confocal_images -o /Analysis/03_Output/CellProfiler -p /Analysis/02_Script/pipeline_spot_mathisv7.cppipe

```
Then you'll find in the output/CellProfiler folder for each image analysed 2 pictures : one with and one without the overlay of the nucleus and spot identified by cellprofiler, and a csv file with the count of nucleus and spot.

#### How to produce the paper images

Here are the reproducible parameter to produce paper images. Indeed we need a crop version of the picture to clearly see the PLA signal without zoom-in.\
You'll need Fiji for example : \
Open the picture of interest\
Edit > selection > specify\
The crop region are listed below : 
- JKTBEXTAL 170322 : 850x850 - x = 895, y = 700  
- JKT BEX 170322 : 850x850 - x = 700, y = 350  
- JKT ACII 170322 : 850x850 - x = 3500 y=1900  
- JKT TAL : 850x850 - x = 3200 y=450

- PEER JKTBEXTAL : 850x850 - x450 y1900  
- PEER TAL : 850x850 - x1700 y2500  
- PEER ACII : 850x850 - x2130 y2300  
- PER BEX 850x850 - x4400y80
  
- 3B6 ACII : 850x850 - x1900y2000
- 3B6 BEX : 850x850 - x3900y4100  
- 3B6 BEXTALL : 850x850 - x3850 y3900  
- 3B6 TAL : 850x850 - x3750y2500

Once the region is selected go to Image > Crop \
Manually set the scale with Analyze > Set scale \
For condition that came from a czi file the distance in pixel = 14.1681, other param are set to 1  # LSM880 \
For condition that came from a nd2 file the distance in pixel = 11.9087, other param are set to 1  # Nikon \
The unit : μm \
Then analyse > tools > scale bar. Using : police 35, thick : 10, width 10um

Barplot where produce with GraphPad Prism using csv from CellProfiler pipeline.