rule kallisto_index:
    input:
        "resources/transcriptome.cdna.fasta",
    output:
        "results/kallisto/transcripts.idx",
    log:
        "results/logs/kallisto/index.log",
    conda:
        "../envs/kallisto.yaml"
    shell:
        "kallisto index -i {output} {input} 2> {log}"
 
rule kallisto_quant:
    input:
        r1_clean="trimmed_fastq/{sample}.R1-subset.clean.fastq.gz",
        r2_clean="trimmed_fastq/{sample}.R2-subset.clean.fastq.gz"
    output:
        directory="kallisto_output/{sample}"
    params:
        index="path/to/index"
    shell:
        "kallisto quant -i {params.index} -o {output.directory} -b 100 {input.r1_clean} {input.r2_clean}"

wildcard_constraints:
    sample = "(\w+)"
