rule trimmomatic:
    input:
        r1="fastq/{sample}.R1-subset.fastq.gz",
        r2="fastq/{sample}.R2-subset.fastq.gz"
    output:
        r1_clean="trimmed_fastq/{sample}.R1-subset.clean.fastq.gz",
        r1_unpaired="trimmed_fastq/{sample}.R1-subset.unpaired.fastq.gz",
        r2_clean="trimmed_fastq/{sample}.R2-subset.clean.fastq.gz",
        r2_unpaired="trimmed_fastq/{sample}.R2-subset.unpaired.fastq.gz"
    params:
        adapter_file="TruSeq3-PE-2.fa"
    shell:
        "trimmomatic PE -threads 2 -phred33 {input.r1} {input.r2} {output.r1_clean} {output.r1_unpaired} {output.r2_clean} {output.r2_unpaired} ILLUMINACLIP:{params.adapter_file}:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36"

wildcard_constraints:
    sample = "(\w+)"
