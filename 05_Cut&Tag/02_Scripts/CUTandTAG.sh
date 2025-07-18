##### Install the next-flow pipeline #####
# curl -s https://get.nextflow.io | bash
# chmod +x nextflow
# mv nextflow $HOME/.local/bin/
# nextflow run nf-core/chipseq -profile test,docker --outdir outest
'''nextflow info
  Version: 25.04.2 build 5947
  Created: 13-05-2025 21:58 UTC (23:58 CEST)
  System: Linux 5.15.0-131-generic
  Runtime: Groovy 4.0.26 on OpenJDK 64-Bit Server VM 17.0.15+6-Ubuntu-0ubuntu120.04
  Encoding: UTF-8 (UTF-8)
  
  N E X T F L O W   ~  version 25.04.2
'''

cd $WDIR

### Narrow peaks
nextflow run nf-core/chipseq --input 01_RawData/RUN_EN00008978/ChIP_histone/samplesheet_narrow.csv --genome GRCh38 --read_length 150 -profile docker --narrow_peak TRUE --outdir 02_Preprocessed/ChIPseq/H3K4Me3_H3K27Ac_narrow_nomodel/

### Broad peaks
nextflow run nf-core/chipseq --input 01_RawData/RUN_EN00008978/ChIP_histone/samplesheet_broad.csv --genome GRCh38 --read_length 150 -profile docker --outdir 02_Preprocessed/ChIPseq/histones_nf-core_broad_nomodel

