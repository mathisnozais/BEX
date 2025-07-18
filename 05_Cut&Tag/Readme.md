# CUT&Tag analysis

## Overview

This part of the repository describes the CUT&Tag histone marks analysis.

CUT&Tag assay have been performed for  3 histone marks (H3K27ac, H3K4me1 and H3K4me3) and 4 samples (a Jurkat WT and 3 CRISPR-edited Jurkat clones "1D9", "2G5", "3B6").


## Setup the experiment
### Install the next-flow pipeline
Install the pipeline (N E X T F L O W   ~  version 25.04.2)
```bash
curl -s https://get.nextflow.io | bash
chmod +x nextflow
mv nextflow $HOME/.local/bin/
nextflow run nf-core/chipseq -profile test,docker --outdir outest
```

> [!NOTE]  
> Modification of /home/user_name/.nextflow/assets/nf-core/chipseq/modules/nf-core/macs3/callpeak/main.nf to add line 44, "--nomodel \\" option to fit to CUT&Tag giving the following block : 
>
>    macs3 \\
>        callpeak \\
>        ${args_list.join(' ')} \\
>        --gsize $macs3_gsize \\
>        --nomodel \\
>        --format $format \\
>        --name $prefix \\
>        --treatment $ipbam \\
>        $control
>

### Download data
Download raw data from GEO [to be updated with the link]

### Analysis
1) run the "CUT&TAG_Git" script that run the next-flow pipeline : 
* quality- and adapter-trim raw reads using Trim Galore! [https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/]
* aligned trimmed read to the human reference genome (GRCh38) using BWA
* generate signal tracks (bigWig) using deepTools
* call peaks call with MACS3 and produce a consensus peak bed files per histone marks
* quantify peaks using featureCounts

2) further analyse in R (see Rmd script)
* Differential peak analysis using DESeq2 (jurkat BEXKO versus jurkat BEXWT)

