class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: samtools_view
baseCommand:
  - /Users/vanRoosmalen/Desktop/UMC/Tools/samtools-1.8/samtools
  - view
inputs:
  - id: input_sam
    type: File
    inputBinding:
      position: 1
  - id: b
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-b'
  - id: output_name
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: ${inputs.output_name}
label: samtools-view
requirements:
  - class: InlineJavascriptRequirement
