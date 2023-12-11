import csv
import re

def find_ips(text):
    ip_pattern = re.compile(
        r'\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b'
    )
    return ip_pattern.findall(text)

def parse_csv(input_filename, output_filename):
    with open(input_filename, 'r') as in_file, open(output_filename, 'w', newline='') as out_file:
        reader = csv.reader(in_file)
        writer = csv.writer(out_file)

        for row in reader:
            for field in row:
                ips = find_ips(field)
                for ip in ips:
                    writer.writerow([ip])

def main():
    input_filename = input("Please enter the name of the CSV file to parse: ")
    output_filename = input("Please enter the name of the new CSV file: ")
    parse_csv(input_filename, output_filename)

if __name__ == "__main__":
    main()
