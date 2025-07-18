# CUT&Tag analysis

## Overview

This part of the repository describes the CUT&Tag histone marks analysis.

CUT&Tag assays have been performed for 3 histone marks (H3K27ac, H3K4me1 and H3K4me3) across 4 samples : a Jurkat WT and 3 CRISPR-edited Jurkat clones ("1D9", "2G5", "3B6").


## Setup
### Install the next-flow pipeline

The analysis is based on the [nf-core/chipseq](https://nf-co.re/chipseq) pipeline (N E X T F L O W   ~  version 25.04.2).  

```bash
curl -s https://get.nextflow.io | bash
chmod +x nextflow
mv nextflow $HOME/.local/bin/
````

Tes the pipeline with :
```bash
nextflow run nf-core/chipseq -profile test,docker --outdir outest
```

> [!NOTE]  
> Modify `/home/user_name/.nextflow/assets/nf-core/chipseq/modules/nf-core/macs3/callpeak/main.nf` by adding the `--nomodel \\` option (line 44) to adapt to CUT&Tag.
The modified MACS3 block should look like that : 
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
Download raw data from GEO [link to be added]

### Analysis
1) run next-flow pipeline using the "CUTandTAG.sh" script. 
This will run the following steps : 
* Quality and adapter trimming using Trim Galore
* Alignment to the human genome (GRCh38) using BWA
* Signal track generation (bigWig files) with deepTools
* Peak calling using MACS3
* Consensus peak set generation per histone mark
* Peak quantification using featureCounts


2) Downstream analysis in R (see Rmd script)
Downstream analyses were performed in R (see the XXX.Rmd script). 
* Differential peak analysis using DESeq2 (jurkat BEXKO versus jurkat BEXWT) and Generation of count tables available in GEO: Raw counts; Library size–normalized counts; Variance-stabilized counts (vst()) for each histone mark.



