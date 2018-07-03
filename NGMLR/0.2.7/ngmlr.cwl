class: CommandLineTool
cwlVersion: v1.0
id: ngmlr
baseCommand:
  - /Users/vanRoosmalen/Desktop/UMC/github/ngmlr/bin/ngmlr-0.2.7/ngmlr
inputs:
  - 'sbg:altPrefix': '--reference'
    id: reference
    type: File
    inputBinding:
      position: 0
      prefix: '-r'
    doc: |-
      -r <file>,  --reference <file>
              (required)  Path to the reference genome (FASTA/Q, can be gzipped)
    'sbg:fileTypes': '.fasta, .fastq'
  - 'sbg:altPrefix': '--query'
    id: query
    type: File
    inputBinding:
      position: 0
      prefix: '-q'
    doc: |-
      -q <file>,  --query <file>
              Path to the read file (FASTA/Q) [/dev/stdin]
    'sbg:fileTypes': '.fasta, .fastq'
  - 'sbg:altPrefix': '--output'
    id: output
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
    doc: |-
      -o <file>,  --output <file>
              Path to output file
  - id: skip_write
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--skip_write'
    doc: |-
      --skip-write
              Don't write reference index to disk [false]
  - id: bam_fix
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--bam_fix'
    doc: |-
      --bam-fix
              Report reads with > 64k CIGAR operations as unmapped. Required to be compatibel to BAM format [false]
  - 'sbg:altPrefix': '--presets'
    'sbg:toolDefaultValue': pacbio
    id: presets
    type:
      - 'null'
      - type: enum
        symbols:
          - pacbio
          - ont
        name: presets
    inputBinding:
      position: 0
      prefix: '-x'
    doc: |-
      -x <pacbio, ont>,  --presets <pacbio, ont>
              Parameter presets for different sequencing technologies [pacbio]
  - 'sbg:altPrefix': '--min-identity'
    'sbg:toolDefaultValue': '0.65'
    id: min-identity
    type: float?
    inputBinding:
      position: 0
      prefix: '-i'
    doc: |-
      -i <0-1>,  --min-identity <0-1>
              Alignments with an identity lower than this threshold will be discarded [0.65]
  - 'sbg:altPrefix': '--min-residues'
    'sbg:toolDefaultValue': '0.25'
    id: min-residues
    type: float?
    inputBinding:
      position: 0
      prefix: '-R'
    doc: |-
      -R <int/float>,  --min-residues <int/float>
              Alignments containing less than <int> or (<float> * read length) residues will be discarded [0.25]
  - id: no-smallinv
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--no-smallinv'
    doc: |-
      --no-smallinv
              Don't detect small inversions [false]
  - id: no-lowqualitysplit
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--no-lowqualitysplit'
    doc: |-
      --no-lowqualitysplit
              Split alignments with poor quality [false]
  - id: verbose
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--verbose'
    doc: |-
      --verbose
              Debug output [false]
  - id: no-progress
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--no-progress'
    doc: |-
      --no-progress
              Don't print progress info while mapping [false]
  - 'sbg:toolDefaultValue': '2'
    id: match
    type: float?
    inputBinding:
      position: 0
      prefix: '--match'
    doc: |-
      --match <float>
              Match score [2]
  - 'sbg:toolDefaultValue': '-5'
    id: mismatch
    type: float?
    inputBinding:
      position: 0
      prefix: '--mismatch'
    doc: |-
      --mismatch <float>
              Mismatch score [-5]
  - 'sbg:toolDefaultValue': '-5'
    id: gap-open
    type: float?
    inputBinding:
      position: 0
      prefix: '--gap-open'
    doc: |-
      --gap-open <float>
              Gap open score [-5]
  - 'sbg:toolDefaultValue': '-5'
    id: gap-extend-max
    type: float?
    inputBinding:
      position: 0
      prefix: '--gap-extend-max'
    doc: |-
      --gap-extend-max <float>
              Gap open extend max [-5]
  - 'sbg:toolDefaultValue': '-1'
    id: gap-extend-min
    type: float?
    inputBinding:
      position: 0
      prefix: '--gap-extend-min'
    doc: |-
      --gap-extend-min <float>
              Gap open extend min [-1]
  - 'sbg:toolDefaultValue': '0.15'
    id: gap-decay
    type: float?
    inputBinding:
      position: 0
      prefix: '--gap-decay'
    doc: |-
      --gap-decay <float>
              Gap extend decay [0.15]
  - 'sbg:altPrefix': '--kmer-length'
    'sbg:toolDefaultValue': '13'
    id: kmer-length
    type: int?
    inputBinding:
      position: 0
      prefix: '-k'
    doc: |-
      -k <10-15>,  --kmer-length <10-15>
              K-mer length in bases [13]
  - 'sbg:toolDefaultValue': '2'
    id: kmer-skip
    type: int?
    inputBinding:
      position: 0
      prefix: '--kmer-skip'
    doc: |-
      --kmer-skip <int>
              Number of k-mers to skip when building the lookup table from the reference [2]
  - 'sbg:toolDefaultValue': '4'
    id: bin-size
    type: int?
    inputBinding:
      position: 0
      prefix: '--bin-size'
    doc: |-
      --bin-size <int>
              Sets the size of the grid used during candidate search [4]
  - 'sbg:toolDefaultValue': '1'
    id: max-segments
    type: int?
    inputBinding:
      position: 0
      prefix: '--max-segments'
    doc: |-
      --max-segments <int>
              Max number of segments allowed for a read per kb [1]
  - 'sbg:toolDefaultValue': '256'
    id: subread-length
    type: int?
    inputBinding:
      position: 0
      prefix: '--subread-length'
    doc: |-
      --subread-length <int>
              Length of fragments reads are split into [256]
  - 'sbg:toolDefaultValue': '40'
    id: subread-corridor
    type: int?
    inputBinding:
      position: 0
      prefix: '--subread-corridor'
    doc: |-
      --subread-corridor <int>
              Length of corridor sub-reads are aligned with [40]
  - 'sbg:toolDefaultValue': none
    id: rg-id
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-id'
    doc: |-
      --rg-id <string>
              Adds RG:Z:<string> to all alignments in SAM/BAM [none]
  - 'sbg:toolDefaultValue': none
    id: rg-sm
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-sm'
    doc: |-
      --rg-sm <string>
              RG header: Sample [none]
  - 'sbg:toolDefaultValue': none
    id: rg-lb
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-lb'
    doc: |-
      --rg-lb <string>
              RG header: Library [none]
  - 'sbg:toolDefaultValue': none
    id: rg-pl
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-pl'
    doc: |-
      --rg-pl <string>
              RG header: Platform [none]
  - 'sbg:toolDefaultValue': none
    id: rg-ds
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-ds'
    doc: |-
      --rg-ds <string>
              RG header: Description [none]
  - 'sbg:toolDefaultValue': none
    id: rg-dt
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-dt'
    doc: |-
      --rg-dt <string>
              RG header: Date (format: YYYY-MM-DD) [none]
  - 'sbg:toolDefaultValue': none
    id: rg-pu
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-pu'
    doc: |-
      --rg-pu <string>
              RG header: Platform unit [none]
  - 'sbg:toolDefaultValue': none
    id: rg-pi
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-pi'
    doc: |-
      --rg-pi <string>
              RG header: Median insert size [none]
  - 'sbg:toolDefaultValue': none
    id: rg-pg
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-pg'
    doc: |-
      --rg-pg <string>
              RG header: Programs [none]
  - 'sbg:toolDefaultValue': none
    id: rg-cn
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-cn'
    doc: |-
      --rg-cn <string>
              RG header: sequencing center [none]
  - 'sbg:toolDefaultValue': none
    id: rg-fo
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-fo'
    doc: |-
      --rg-fo <string>
              RG header: Flow order [none]
  - 'sbg:toolDefaultValue': none
    id: rg-ks
    type: string?
    inputBinding:
      position: 0
      prefix: '--rg-ks'
    doc: |-
      --rg-ks <string>
              RG header: Key sequence [none]
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: $(inputs.output)
    'sbg:fileTypes': .sam
    streamable: true
label: ngmlr
arguments:
  - position: 0
    prefix: '-t'
    valueFrom: $(runtime.cores)
requirements:
  ResourceRequirement:
    coresMin: 2
