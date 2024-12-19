#!/bin/bash
#script based on test made on test_preprocessing.txt

#Before lauching please use conda activate RNAbulk
# to export the environment : conda env export --name RNAbulk --file environment.yml
NUM_PROC=$(nproc --all)
NUM_PROC_SMALL=$((NUM_PROC / 3)) #For tools that are limited by RAM capacity, can't use all cores

########################################## STEP 0 #######################################################
####### Modify Variable ######
WORKING_DIR = "$WORKING_DIR/01_BulkRNA_preprocessing"
rawdata="$WORKING_DIR/01_RawData/FASTQ/" #folder with rawdata

unique_names=$(find "$rawdata" -type f -name "*.fastq.gz" | sed 's|.*/||')
unique_names=$(echo "$unique_names" | sed 's/_.*//')


mkdir -p $WORKING_DIR/03_Preprocessed/Trimming
mkdir -p $WORKING_DIR/03_Preprocessed/Mapping
mkdir -p $WORKING_DIR/03_Preprocessed/Count

########################################## STEP 1 #######################################################
####### Check quality and trimming ######

for name in $unique_names; do
	echo "FastQC $name"
	FILE=$rawdata/${name}_1.fastq.gz #checking if the output of the tool is existing
	if [ -f "$FILE" ]; then
		echo "$FILE exists - Skipping FastQC"
	else
		fastqc $rawdata/${name}_1.fastq.gz
		fastqc $rawdata/${name}_2.fastq.gz
	fi
done

FILE=$rawdata/multiqc_report.html #checking if the output of the tool is existing
if [ -f "$FILE" ]; then
	echo "$FILE exists - Skipping MultiQC"
else
	multiqc $rawdata -o $rawdata
fi

# Trimming
cp /home/nozais/miniconda3/envs/RNAbulk/share/trimmomatic-0.39-2/adapters/NexteraPE-PE.fa .
for name in $unique_names; do
	echo "Trimming $name"
	FILE=$WORKING_DIR/03_Preprocessed/Trimming/${name}_1.trimmed.fastq #checking if the output of the tool is existing
	if [ -f "$FILE" ]; then
		echo "$FILE exists - Skipping Trimmomatic"
	else
		trimmomatic PE -threads $NUM_PROC_SMALL $rawdata/${name}_1.fastq.gz $rawdata/${name}_2.fastq.gz \
		$WORKING_DIR/03_Preprocessed/Trimming/${name}_1.trimmed.fastq $WORKING_DIR/03_Preprocessed/Trimming/${name}_1unpaired.trimmed.fastq \
		$WORKING_DIR/03_Preprocessed/Trimming/${name}_2.trimmed.fastq $WORKING_DIR/03_Preprocessed/Trimming/${name}_2unpaired.trimmed.fastq \
		ILLUMINACLIP:NexteraPE-PE.fa:2:30:10:8:TRUE | tee $WORKING_DIR/03_Preprocessed/Trimming/${name}_log.file
		fastqc $WORKING_DIR/03_Preprocessed/Trimming/${name}_1.trimmed.fastq
 		fastqc $WORKING_DIR/03_Preprocessed/Trimming/${name}_2.trimmed.fastq
	fi
done

########################################## STEP 2 #######################################################
####### Mapping rawdata on ref ######
for name in $unique_names; do
  echo "$name"
  FILE=$WORKING_DIR/03_Preprocessed/Mapping/${name}.sam
  if [ -f "$FILE" ]; then
  	echo "$FILE exists - Skipping Hisat2"
  else
  	hisat2 -x /mnt/NASBIOINFO_MN/LALT/BIOINFO/References/Human/Hg38_P14/human_index_Hisat -1 $WORKING_DIR/03_Preprocessed/Trimming/${name}_1.trimmed.fastq -2 $WORKING_DIR/03_Preprocessed/Trimming/${name}_2.trimmed.fastq --summary-file $WORKING_DIR/03_Preprocessed/Mapping/${name}_summary.txt -S $WORKING_DIR/03_Preprocessed/Mapping/${name}.sam -p $NUM_PROC_SMALL
  fi
  
  FILE=$WORKING_DIR/03_Preprocessed/Mapping/${name}.bam
  if [ -f "$FILE" ]; then
  	echo "$FILE exists - Skipping Samtools to Bam"
  else
  	samtools view -@ $NUM_PROC_SMALL -b $WORKING_DIR/03_Preprocessed/Mapping/${name}.sam > $WORKING_DIR/03_Preprocessed/Mapping/${name}.bam
  fi
  
  FILE=$WORKING_DIR/03_Preprocessed/Mapping/${name}_sorted.bam
  if [ -f "$FILE" ]; then
  	echo "$FILE exists - Skipping Samtools sort"
  else
  	samtools sort $WORKING_DIR/03_Preprocessed/Mapping/${name}.bam > $WORKING_DIR/03_Preprocessed/Mapping/${name}_sorted.bam
  	samtools index $WORKING_DIR/03_Preprocessed/Mapping/${name}_sorted.bam 
  fi
  
  rm $WORKING_DIR/03_Preprocessed/Mapping/${name}.bam
done

featureCounts -t exon -C -g gene_id -p -s 2 -T $NUM_PROC_SMALL -a /mnt/NASBIOINFO_MN/LALT/BIOINFO/References/Human/Hg38_P14/hg38.refGene.gtf -o /mnt/NASBIOINFO_MN/LALT/BIOINFO/BEX/03_Preprocessed/Count/allbam_featurecounts.txt /mnt/NASBIOINFO_MN/LALT/BIOINFO/BEX/03_Preprocessed/Mapping/*_sorted.bam 
#param with 2 is library specific, need to be check if launch on other data
