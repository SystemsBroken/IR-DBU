#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_csv>"
    exit 1
fi

input_csv="$1"
output_csv="ipaddresses.csv"

# Ensure input file exists
if [ ! -f "$input_csv" ]; then
    echo "Error: Input file '$input_csv' not found."
    exit 1
fi

# Extract unique IP addresses from the second column of the CSV file
awk -F',' '{print $2}' "$input_csv" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort -u > "$output_csv"

echo "Unique IP addresses have been written to $output_csv"
