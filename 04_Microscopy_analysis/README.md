# Microscopy analysis

## Overview

This repository describes how the confocal data where analysed with CellProfiler en Fiji. It contains the instructions and material to reproduce the analysis reported in the article. To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis described in the "Run the analysis" section below.

## Setup the experiment
### Prerequisites


#### Docker images
Docker image file is stored on Zenodo :

```bash
# To download 
wget -P $WORKING_DIR/Images/Docker https://zenodo.org/record/4636520/files/Seurat301v2.tar?download=1 NEED TO CHANGE

# To load it
docker load < $WORKING_DIR/Container/xxx/xxx.tar

# To run it
docker run 
```

#### Download data


### Run the analysis


#### How to produce the paper images

Here are the reproducible parameter to to produce paper images. Indeed we need a crop version of the picture to clearly see the PLA signal without zoom-in.

Open Czi and Images > Color > split channel
Images > Color > Merge
Edit > selection > specify

For JKTBEXTAL 170322 : 850x850 - x = 895, y = 700  
JKT BEX 170322 : 850x850 - x = 700, y = 350

JKT ACII 170322 : 850x850 - x = 3500 y=1900

JKT TAL : 850x850 - x = 3200 y=450

PEER JKTBEXTAL : 850x850 - x450 y1900

PEER TAL : 850x850 - x1700 y2500
PEER ACII : 850x850 - x2130 y2300
PER BEX 850x850 - x4400y80

Clone CRISPR:
3B6 ACII : 850x850 - x50y4100
3B6 BEX : x3900y4100
3B6 BEXTALL : x3850 y3900
3B6 TAL x3750y2500

G3 ACII : x2100y1900
G3 BEX : x3850y3900
G3 BEXTAL : x50y2500
G3 TAL : x0y2400
Image > Crop