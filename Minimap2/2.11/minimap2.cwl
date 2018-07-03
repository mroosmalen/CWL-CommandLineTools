class: CommandLineTool
cwlVersion: v1.0
id: minimap2
baseCommand:
  - minimap2
inputs:
  - id: reference
    type: File?
    inputBinding:
      position: 1
  - id: query
    type: File?
    inputBinding:
      position: 2
  - id: a
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-a'
    doc: >-
      Generate CIGAR and output alignments in the SAM format. Minimap2 outputs
      in PAF by default.
  - 'sbg:toolDefaultValue': map-ont
    id: x
    type:
      - 'null'
      - type: enum
        symbols:
          - map-pb
          - map-ont
          - asm5
          - asm10
          - asm20
          - ava-pb
          - ava-ont
          - splice
          - sr
        name: x
    inputBinding:
      position: 0
      prefix: '-x'
    doc: "Preset []. This option applies multiple options at the same time. It should be applied before other options because options applied later will overwrite the values set by -x. Available STR are:\nmap-pb \tPacBio/Oxford Nanopore read to reference mapping (-Hk19)\nmap-ont \tSlightly more sensitive for Oxford Nanopore to reference mapping (-k15). For PacBio reads, HPC minimizers consistently leads to faster performance and more sensitive results in comparison to normal minimizers. For Oxford Nanopore data, normal minimizers are better, though not much. The effectiveness of HPC is determined by the sequencing error mode.\nasm5 \tLong assembly to reference mapping (-k19 -w19 -A1 -B19 -O39,81 -E3,1 -s200 -z200 --min-occ-floor=100). Typically, the alignment will not extend to regions with 5% or higher sequence divergence. Only use this preset if the average divergence is far below 5%.\nasm10 \tLong assembly to reference mapping (-k19 -w19 -A1 -B9 -O16,41 -E2,1 -s200 -z200 --min-occ-floor=100). Up to 10% sequence divergence.\nasm20 \tLong assembly to reference mapping (-k19 -w10 -A1 -B6 -O6,26 -E2,1 -s200 -z200 --min-occ-floor=100). Up to 20% sequence divergence.\nava-pb \tPacBio all-vs-all overlap mapping (-Hk19 -Xw5 -m100 -g10000 --max-chain-skip 25).\nava-ont \tOxford Nanopore all-vs-all overlap mapping (-k15 -Xw5 -m100 -g10000 -r2000 --max-chain-skip 25). Similarly, the major difference from ava-pb is that this preset is not using HPC minimizers.\nsplice \tLong-read spliced alignment (-k15 -w5 --splice -g2000 -G200k -A1 -B2 -O2,32 -E1,0 -C9 -z200 -ub --splice-flank=yes). In the splice mode, 1) long deletions are taken as introns and represented as the ‘N’ CIGAR operator; 2) long insertions are disabled; 3) deletion and insertion gap costs are different during chaining; 4) the computation of the ‘ms’ tag ignores introns to demote hits to pseudogenes.\nsr \tShort single-end reads without splicing (-k21 -w11 --sr --frag=yes -A2 -B8 -O12,32 -E2,1 -r50 -p.5 -N20 -f1000,5000 -n2 -m20 -s40 -g200 -2K50m --heap-sort=yes --secondary=no)."
  - id: no-long-join
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--no-long-join'
    doc: >-
      Disable the long gap patching heuristic. When this option is applied, the
      maximum alignment gap is mostly controlled by -r.
  - 'sbg:toolDefaultValue': '500'
    id: r
    type: int?
    inputBinding:
      position: 0
      prefix: '-r'
    doc: >-
      Bandwidth used in chaining and DP-based alignment [500]. This option
      approximately controls the maximum gap size.
  - id: output_name
    type: string?
outputs:
  - id: output
    type: stdout
    streamable: true
label: minimap2
arguments:
  - position: 0
    prefix: '-t'
    valueFrom: $(runtime.cores)
stdout: $(inputs.output_name)
requirements:
  - class: ResourceRequirement
    coresMin: 2
  - class: InlineJavascriptRequirement
