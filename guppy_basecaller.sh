#!/bin/bash
#PBS -l nodes=1:ppn=36
#PBS -l mem=64GB
#PBS -l ngpus=2
#PBS -l walltime=500:00:00

base=/home2/ssyamoako/Edem_Raw/20221014_1953_MN25545_FAT64681_2b24c46e
run=${base}/ont-guppy-cpu/bin/
fast5_dir=/home/ekamoako1/Edem/20221014_1953_MN25545_FAT64681_2b24c46e/fast5
output=${base}/Edem

# Barcoding during basecalling
${run}./guppy_basecaller \
--input_path $fast5_dir \
--save_path $output \
--cpu_threads_per_caller 16 \
--config dna_r10.3_450bps_fast.cfg \
--barcode_kits SQK-NBD112-24

# Guppylex to merge all files
mkdir quality
cd ${base}/pass/
for f in $(ls -d *); do
artic guppyplex --min-length 400 --max-length 700 \
--directory ${f} --prefix ${prefix} \
--output ${base}/quality/${f}_merged.fastq
done