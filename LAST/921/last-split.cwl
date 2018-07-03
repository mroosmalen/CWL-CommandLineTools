class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: last_split
baseCommand:
  - last-split
inputs:
  - id: input_file
    type: File
    streamable: true

  - id: output_name
    type: string?
outputs:
  - id: output
    type: stdout
    streamable: true
label: last-split
stdout: $(inputs.output_name)
stdin: $(inputs.input_file)
requirements:
  - class: InlineJavascriptRequirement
