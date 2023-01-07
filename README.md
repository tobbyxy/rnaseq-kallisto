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


The pipeline automatically generate the RSEM/STAR index and all that is
required is to drop the GTF annotations file and the primary assembly FASTA
files under `pipeline-output/genome/<reference_id>` subdirectory.

For example, you can setup a mouse reference from Ensembl by downloading the
following files under `pipeline-output/genomes/mm10_ensembl98`:

 - ftp://ftp.ensembl.org/pub/release-98/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
 - ftp://ftp.ensembl.org/pub/release-98/gtf/mus_musculus/Mus_musculus.GRCm38.98.gtf.gz


## Normalization
To obtain FPKM values (fragments per kilobase of exon per million fragments mapping), you will need to convert the counts to RPKM (reads per kilobase of exon per million reads).
samtools view -c -F 4 <BAM file>
