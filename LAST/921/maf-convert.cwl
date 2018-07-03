class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: maf_convert
baseCommand:
  - maf-convert
inputs:
  - 'sbg:toolDefaultValue': sam
    id: format
    type:
      - 'null'
      - type: enum
        symbols:
          - axt
          - blast
          - blasttab
          - chain
          - html
          - psl
          - sam
          - tab
        name: format
    inputBinding:
      position: 1
  - id: input
    type: File?
    streamable: true
    inputBinding:
      position: 2
  - 'sbg:altPrefix': '--dictfile'
    id: dictfile
    type: File?
    inputBinding:
      position: 0
      prefix: '-f'
    doc: >-
      Get a sequence dictionary from DICTFILE. This affects sam format only. You
      can create a dict file using
  - 'sbg:altPrefix': '--readgroup'
    id: readgroup
    type: string?
    inputBinding:
      position: 0
      prefix: '-r'
    doc: >-
      Specify read group information. This affects sam format only. Example: -r
      'ID:1 PL:ILLUMINA SM:mysample'
  - id: output_name
    type: string?
outputs:
  - id: output
    type: stdout
    streamable: true
stdout: $(inputs.output_name)
label: maf-convert
