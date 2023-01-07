#run trimmomatic on paired end fastq files

trimmomatic PE -threads <num threads> -phred33 <FASTQ file 1> <FASTQ file 2> <trimmed FASTQ file 1> <unpaired file 1> <trimmed FASTQ file 2> <unpaired file 2> ILLUMINACLIP:<adapter file>:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

#or run using for loop all fastq files

for i in `ls fastq/*.R1-subset.fastq.gz | cut -f2 -d'/'` 
do 
    base=`echo ${i} | cut -f1 -d'.'`
	trimmomatic PE -threads 2 -phred33 fastq/${base}.R1-subset.fastq.gz fastq/${base}.R2-subset.fastq.gz trimmed_fastq/${base}.R1-subset.clean.fastq.gz trimmed_fastq/${base}.R1-subset.unpaired.fastq.gz trimmed_fastq/${base}.R2-subset.clean.fastq.gz trimmed_fastq/${base}.R2-subset.unpaired.fastq.gz ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 HEADCROP:12 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:30 
done
