#after trimmomatic map trimmed read to refernce genome using kallisto

kallisto quant -i <path to index> -o <output directory> -b 100 <trimmed FASTQ file 1> <trimmed FASTQ file 2>
