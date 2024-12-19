## Bulk RNA pre-processing

In this section you'll be able to perform the preprocessing of the FASTQ files produced for the CRISPR KO. For preprocessing we used a sh script that can be found here : file in gihub to add.

### Prerequisites

#### Clone Github

Use your favorite method to clone this repository in a chosen folder. This will create a "BEX" folder with all the source code.
You must set an environment variable called WORKING_DIR with a value set to the path to this BEX folder. For instance, if I clone the Git repository in "/home/nozais/workspace", then the WORKING_DIR variable will be set to :

```bash

export WORKING_DIR=/home/nozais/workspace/BEX

```

#### Reference genome

```bash
#Download the reference genome folder used to the reference folder
wget -P $WORKING_DIR/References/ htppsxxxxxx .gz

#extract the folder to obtain the fasta, gtf and index files
gunzip $WORKING_DIR/References/ xxxx .gz
```

#### Working environment

The bulkRNA preprocessing was performed under a conda environment including `multiQC`, `Hisat2`, `Trimmomatic` and `featureCounts`.
The yaml config environment can be found into the [Container folder](Container/RNA_preproc).
```bash
# Create the conda environment using same version and tools as us
conda env create -f $WORKING_DIR/Container/RNA_preproc/RNAbulk_env.yml

conda activate RNAbulk
```

#### Download raw data

Fastq files available on SRA xxxx.
```bash
#Download the Fastq files
# Jurkat rep1
wget -P $WORKING_DIR/01_BulkRNA_preprocessing/01_Data
# Jurkat rep2
wget
# Jurkat rep3
wget

# Triple KO BEX1/2/5 rep1
wget 
# Triple KO BEX1/2/5 rep2
wget
```


### Run the preprocessing

We made a script that briefly will perform a first step of xxx `Trimmomatic`, mapping will be performed with `Hisat2` and the gene count will be performed with `featureCounts`


Before running the script you should modify the rawdata and workdir directory. The rawadata folder should be where you downloaded the data. 
The workdir

> [!NOTE]  
> Do not modify any folder name or rawdata files, it will mess up the automated detection of samples.

```bash

docker run 

```
