#!/bin/bash

if [[ $# != 2 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   merge_csv <directorio de entrada> <fichero de salida>"
	exit
fi

# Temporary directory containing CSV parts
in_dir="$1"

# Input files
in_files_list=$(ls "$in_dir")
in_files_array=($in_files_list)

# Output merged CSV file
output_file="$2"

# Get the header (labels line) from the first part
header=$(head -n 1 "$in_dir/${in_files_array[0]}")

# Create the output file and write the header
echo "$header" > "$output_file"

# Iterate through the parts and append their contents to the output file skipping the header line of each part
for part_file in "$in_dir"/*
do
	tail -n +2 "$part_file" >> "$output_file"
done

echo "CSV parts merged into $output_file."
