#!/bin/bash

#Before lauching please use conda activate RNAbulk
# to export the environment : conda env export --name RNAbulk --file environment.yml
NUM_PROC=$(nproc --all)
NUM_PROC_SMALL=$((NUM_PROC / 3)) #For tools that are limited by RAM capacity, can't use all cores

########################################## STEP 0 #######################################################
####### Modify Variable ######
WORKING_DIR="/home/nozais/workspace/BEX" # path to the cloned github
rawdata="/home/nozais/workspace/BEX/01_BulkRNA_preprocessing/01_RawData" #folder with rawdata

unique_names=$(find "$rawdata" -type f -name "*.fastq.gz" | sed 's|.*/||')
unique_names=$(echo "$unique_names" | sed 's/_.*//')

########################################## STEP 1 #######################################################
####### Check quality and trimming ######

for name in $unique_names; do
	echo "FastQC $name"
	FILE=$rawdata/${name}_1.fastq.gz #checking if the output of the tool is existing
	if [ -f "$FILE" ]; then
		echo "$FILE exists - Skipping FastqC"
	else
		fastqc $rawdata/${name}_1.fastq.gz
		fastqc $rawdata/${name}_2.fastq.gz
	fi
done

multiqc $rawdata -o $rawdata

# Trimming
cp /home/nozais/miniconda3/envs/RNAbulk/share/trimmomatic-0.39-2/adapters/NexteraPE-PE.fa .
for name in $unique_names; do
	echo "Trimming $name"
	FILE=$workdir/02_Preprocessed/Trimming/${name}_1.trimmed.fastq #checking if the output of the tool is existing
	if [ -f "$FILE" ]; then
		echo "$FILE exists - Skipping Trimmomatic"
	else
		trimmomatic PE -threads $NUM_PROC_SMALL $rawdata/${name}_1.fastq.gz $rawdata/${name}_2.fastq.gz \
		$workdir/02_Preprocessed/Trimming/${name}_1.trimmed.fastq $workdir/02_Preprocessed/Trimming/${name}_1unpaired.trimmed.fastq \
		$workdir/02_Preprocessed/Trimming/${name}_2.trimmed.fastq $workdir/02_Preprocessed/Trimming/${name}_2unpaired.trimmed.fastq \
		ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:8:TRUE | tee $workdir/02_Preprocessed/Trimming/${name}_log.file
		fastqc $workdir/02_Preprocessed/Trimming/${name}_1.trimmed.fastq
 		fastqc $workdir/02_Preprocessed/Trimming/${name}_2.trimmed.fastq
	fi
done

########################################## STEP 3 #######################################################
####### Prepare reference ######
# Reference should be downloaded before launching the script

FILE=$workdir/02_Preprocessed/Mapping/${name}.sam
hisat2-build $workdir/01_BulkRNA_preprocessing/Reference/hg38.p14.fa human_index_Hisat

########################################## STEP 2 #######################################################
####### Mapping rawdata on ref ######
for name in $unique_names; do
  echo "$name"
  FILE=$workdir/02_Preprocessed/Mapping/${name}.sam
  if [ -f "$FILE" ]; then
  	echo "$FILE exists - Skipping Hisat2"
  else
  	hisat2 -x /mnt/NASBIOINFO_MN/LALT/BIOINFO/References/Human/Hg38_P14/human_index_Hisat -1 $workdir/02_Preprocessed/Trimming/${name}_1.trimmed.fastq -2 $workdir/02_Preprocessed/Trimming/${name}_2.trimmed.fastq --summary-file $workdir/02_Preprocessed/Mapping/${name}_summary.txt -S $workdir/02_Preprocessed/Mapping/${name}.sam -p $NUM_PROC_SMALL
  fi
  
  FILE=$workdir/02_Preprocessed/Mapping/${name}.bam
  if [ -f "$FILE" ]; then
  	echo "$FILE exists - Skipping Samtools to Bam"
  else
  	samtools view -@ $NUM_PROC_SMALL -b $workdir/02_Preprocessed/Mapping/${name}.sam > $workdir/02_Preprocessed/Mapping/${name}.bam
  fi
  
  FILE=$workdir/02_Preprocessed/Mapping/${name}_sorted.bam
  if [ -f "$FILE" ]; then
  	echo "$FILE exists - Skipping Samtools sort"
  else
  	samtools sort $workdir/02_Preprocessed/Mapping/${name}.bam > $workdir/02_Preprocessed/Mapping/${name}_sorted.bam
  	samtools index $workdir/02_Preprocessed/Mapping/${name}_sorted.bam 
  fi
  
  rm $workdir/02_Preprocessed/Mapping/${name}.bam
done

featureCounts -t exon -C -g gene_id -p -s 2 -T $NUM_PROC_SMALL -a /mnt/NASBIOINFO_MN/LALT/BIOINFO/References/Human/Hg38_P14/hg38.refGene.gtf -o /mnt/NASBIOINFO_MN/LALT/BIOINFO/BEX/02_Preprocessed/Count/allbam_featurecounts.txt /mnt/NASBIOINFO_MN/LALT/BIOINFO/BEX/02_Preprocessed/Mapping/*_sorted.bam 
#param with 2 is library specific, need to be check if launch on other data
