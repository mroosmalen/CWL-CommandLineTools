class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: lastal
baseCommand:
  - lastal
inputs:
  - id: reference
    type: File?
    inputBinding:
      position: 1
  - id: query
    type: File?
    inputBinding:
      position: 2
  - id: p
    type: File?
    inputBinding:
      position: 0
      prefix: '-p'
    doc: Specify a match/mismatch score matrix. Options -r and -q will be ignored.
  - 'sbg:toolDefaultValue': '1'
    id: Q
    type: int?
    inputBinding:
      position: 0
      prefix: '-Q'
    doc: >-
      This option allows lastal to use sequence quality scores, or PSSMs, for
      the queries. 0 means read queries in fasta format (without quality
      scores); 1 means fastq-sanger format; 2 means fastq-solexa format; 3 means
      fastq-illumina format; 4 means prb format; 5 means read PSSMs. (Warning:
      Illumina data is not necessarily in fastq-illumina format; it is often in
      fastq-sanger format.)
  - id: output_name
    type: string?
outputs:
  - id: output
    type: stdout
    streamable: true
stdout: $(inputs.output_name)
label: lastal
arguments:
  - position: 0
    prefix: '-P'
    valueFrom: $(runtime.cores)
requirements:
  - class: InlineJavascriptRequirement
