#!/bin/bash

if [[ $# != 3 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   split_csv <fichero de entrada> <líneas por parte> <directorio de salida>"
	exit
fi

# Input CSV file
input_file="$1"

# Number of lines per part (excluding the header)
lines_per_part="$2"

# Temporary directory to store parts
out_dir="$3"

# Create the temporary directory if it doesn't exist
mkdir -p "$out_dir"

# Split the CSV file into parts
split -a 3 -d -l "$lines_per_part" "$input_file" "$out_dir/part"

# Get the total number of parts
num_parts=$(ls -1 "$out_dir" | wc -l)

# Insert the header into all parts
header=$(head -n 1 "$input_file")
for ((i=1; i<num_parts; i++))
do
	part_file="$out_dir/part$(printf "%03d" $i)"
	sed -i "1i $header" "$part_file"
done

# Rename all files to have ".csv" extension
for ((i=0; i<num_parts; i++))
do
	part_file="$out_dir/part$(printf "%03d" $i)"
	mv "$part_file" "$part_file.csv"
done

echo "CSV file split into $num_parts parts with headers."
