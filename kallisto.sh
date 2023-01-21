#Kallisto script

#make sure you have your trimmed fastq and reference fasta
#for this tutorial we are using the human genome, you can download from here
#wget https://ftp.ensembl.org/pub/release-108/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz

#unzip fasta file 
gzip -d Homo_sapiens.GRCh38.cdna.all.fa.gz

#Use kallisto to build index from reference fasta

#install kallisto

kallisto index -i Homo_sapiens.GRCh38.cdna.all.index Homo_sapiens.GRCh38.cdna.all.fa

#Now lets map our trimmed fastq to our built index

kallisto quant -i Homo_sapiens.GRCh38.cdna.all.index -o count -t 8 

#redo this code
for i in `ls trimmed_fastq/*.R1-subset.clean.fastq.gz | cut -f2 -d'/'` 
do 
	base=`echo ${i} | cut -f1 -d'.'`
        kallisto quant -i Homo_sapiens.GRCh38.cdna.all.index -o ./out/${base} -t 8 trimmed_fastq/${base}.R1-subset.clean.fastq.gz -trimmed_fastq/${base}.R2-subset.clean.fastq.gz 
	
done