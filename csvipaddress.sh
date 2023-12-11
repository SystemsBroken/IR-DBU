#!/bin/bash

# Check that input argument is provided 
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_csv_file>"
    exit 1
fi

# Get input csv file  
input_csv=$1

# Extract IP addresses from input CSV
# Use grep to find IP patterns, cut to extract just the IP, sort/uniq to get unique IPs
ips=$(grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $input_csv | cut -d']' -f1 | sort -u)  

# Write unique IPs to output csv file
echo "$ips" > ipaddresses.csv

echo "Unique IP addresses written to ipaddresses.csv"
