rule fastqc:
    input:
        "{sample}.fastq.gz"
    output:
        "fastqc/{sample}_fastqc/fastqc_report.html"
    shell:
        "fastqc -o fastqc {input} -t 2"

wildcard_constraints:
    sample = "(\w+)"

