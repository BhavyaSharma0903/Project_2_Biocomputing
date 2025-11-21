#!/bin/bash

INPUT_DIR="../data/ten_sequences"
OUTPUT="../data/combined_10_sequences.fasta"

cat $INPUT_DIR/*.fasta > $OUTPUT
echo "Combined FASTA created at: $OUTPUT"

