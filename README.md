# rnaseq-kallisto

This pipeline performs the following task
processes RNA seq data using kallisto for mapping

- perform quality control on FastQ files using [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- view quality of reads using [MultiQC](https://multiqc.info/)
- align reads of each sample in a run against reference genome (using [kallisto](https://github.com/pachterlab/kallisto)) 
- count reads in features (using HTSeq-count)
- normalize read counts (using DESeq)
- calculate RPKMs (using edgeR)
- perform DE analysis for standard designs (using DESeq2)
- variant calling, filtering and annotation

 
 ## Downloading and installing

Clone this repository:

```bash
git clone --recurse-submodules https://github.com/tobbyxy/rnaseq-kallisto
cd rnaseq-kallisto
```

Create and activate a Conda environment with all the required software
dependencies:

```bash
conda env setup -f environment.yml
conda activate rnaseq-kallisto
```

## Setting up a genomic reference


This tutorial uses a human reference from Ensembl, you can download by heading to
  - https://ftp.ensembl.org/pub/release-108/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz

To build index run the kallisto script or run

```bash
kallisto index -i Homo_sapiens.GRCh38.cdna.all.index Homo_sapiens.GRCh38.cdna.all.fa 
```


## Normalization
To obtain FPKM values (fragments per kilobase of exon per million fragments mapping), you will need to convert the counts to RPKM (reads per kilobase of exon per million reads).
samtools view -c -F 4 <BAM file>
