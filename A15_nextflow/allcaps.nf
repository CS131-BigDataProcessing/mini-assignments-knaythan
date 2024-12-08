#!/bin/env nextflow

nextflow.enable.dsl=2

process toUpperCase {
    input:
    val inputString from params.inputString

    output:
    path 'output.txt'

    script:
    """
    echo \${inputString^^} > output.txt
    """
}

workflow {
    toUpperCase()
    println "Output written to 'output.txt'."
}
