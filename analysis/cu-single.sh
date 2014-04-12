#!/bin/bash

# Outputs codon usage of FASTA file provided in argument
# Executed by cu-batch.sh

codons=codons.txt

echo
echo -n $1,

while read line
do
	cat $1 | tail -n +2 | tr -d '\n' | sed "s/.\{3\}/&\n/g" | grep $line | wc -l | awk '{print $1","}' | tr -d '\n'
done < $codons
