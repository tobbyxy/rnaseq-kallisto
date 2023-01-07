#after trimmomatic map trimmed read to refernce genome using kallisto

kallisto quant -i <path to index> -o <output directory> -b 100 <trimmed FASTQ file 1> <trimmed FASTQ file 2>

**Note:After running kallisto, you should have a set of output files in the output directory. The most important file is the "abundance.h5" file, which contains the estimated counts for each transcript.t **
