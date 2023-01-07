# rnaseq-kallisto
# Pavlidis Lab RNA-seq pipeline repository

[![Python Package using Conda](https://github.com/PavlidisLab/rnaseq-pipeline/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/PavlidisLab/rnaseq-pipeline/actions/workflows/build.yml)

This documentation is principally written to support the Pavlidis Lab, and we're still updating it. But this pipeline should be fairly easy to configure on any Linux servers using these instructions. External users interested in using this pipeline for RNASeq quantification should contact our [helpdesk](MSL-PAVLAB-SUPPORT@LISTS.UBC.CA) if troubleshooting assistance is needed.

## Features

 - built with [kallisto](https://github.com/pachterlab/kallisto), [MultiQC](https://multiqc.info/), [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
 - produces count and FPKM matrices suitable for analysis with R and Python
 
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
