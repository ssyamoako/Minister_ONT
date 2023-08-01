#!/bin/bash

BASECALLS=/home/waccbip/Desktop/Training_Workshops/Edem/quality/
ref=/home/waccbip/Desktop/Training_Workshops/Edem/Pf3D7.fasta
out=/home/waccbip/Desktop/Training_Workshops/Edem/

# Get the number of processors
NPROC=8

# Loop through the BASECALLS folder
for file in $(find $BASECALLS -name "*.fastq")
do
  # Get the base name of the file
  base_name=$(basename $file)
  # Run Medaka
  medaka_consensus -i $file -d $ref -o $out/${base_name%_merged.fastq} -t $NPROC -m r941_min_high_g303
done
