#!/bin/bash

input="../data/cytochrome_p450_sequences.fasta"
output="../data/cytochrome_p450_sequences_filtered.fasta"

> "$output" 

header=""
sequence=""

while read line; do
    if [[ $line == ">"* ]]; then
        if [[ -n "$sequence" ]]; then
            if (( ${#sequence} >= 100 )); then
                echo "$header" >> "$output"
                echo "$sequence" >> "$output"
            fi
        fi
        header="$line"
        sequence=""
    else
        sequence="$sequence$line"
    fi
done < "$input"


if (( ${#sequence} >= 100 )); then
    echo "$header" >> "$output"
    echo "$sequence" >> "$output"
fi

echo "Done. Filtered file saved to: $output"

