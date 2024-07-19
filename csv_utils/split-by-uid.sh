#!/bin/bash

# Input CSV file
input_file="CSV_localizaciones/conjuntos/loc_test_aggregated.csv"

# Column number (0-based index) to split by
split_column=1

# Create a directory to store the split files
output_dir="CSV_localizaciones/conjuntos/loc_test_aggregated_parts"
mkdir -p "$output_dir"

# Get first line
first=$(head -n 1 "$input_file")

# Get unique values from the specified column
unique_values=$(cut -d ',' -f "$((split_column + 1))" "$input_file" | tail -n +2 | sort -u)

# Loop through unique values and create split files
for value in $unique_values
do
	output_file="$output_dir/$value.csv"
	echo "$first" > "$output_file"
	grep -w "$value" "$input_file" >> "$output_file"
	echo "Split file created: $output_file"
done
