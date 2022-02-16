#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/esga
========================================================================================
    Github : https://github.com/nf-core/esga
    Website: https://nf-co.re/esga
    Slack  : https://nfcore.slack.com/channels/esga
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

//params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { ESGA } from './workflows/esga'

//
// WORKFLOW: Run main nf-core/esga analysis pipeline
//
workflow NFCORE_ESGA {
    ESGA ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_ESGA ()
}

/*
========================================================================================
    THE END
========================================================================================
*/