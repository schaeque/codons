#!/bin/bash

# execute with ./cu-batch.sh ../data/orfs/

for F in $1/*
do
	echo 'Processing' $F
	./cu-single.sh $F >> ../data/codon-usage-raw.csv
done

