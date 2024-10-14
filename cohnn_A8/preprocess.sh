#!/bin/bash

# Check if the user provided an argument
if [ "$1" != "replace" ] && [ "$1" != "remove" ]; then
    echo "Usage: $0 <handle_missing> <input_file>"
    echo "<handle_missing> should be 'replace' to replace missing values with 'NA' or 'remove' to remove rows with missing values"
    exit 1
fi
handle_missing=$1

# Define the input and output file names
input_file=$2
cleaned_file="cleaned_data.csv"

# Step 1: Remove missing values, newlines, and trailing spaces
# Remove newlines that aren't used to separate rows
# Count the number of commas in the header and ensure only the last comma has a newline after it
header=$(head -n 1 $input_file)
comma_count=$(echo "$header" | awk -F, '{print NF-1}')

# Remove newlines at the end of a line until the line contains the same number of commas as the header
awk -v comma_count="$comma_count" '
BEGIN { OFS = FS = "," }
{
    line = $0
    while (gsub(/,/, ",", line) < comma_count) {
        getline next_line
        line = line next_line
    }
    print line
}
' $input_file > $cleaned_file

# Remove trailing spaces/new lines and replace missing values with "NA"
awk -F, -v handle_missing="$handle_missing" '
BEGIN { OFS = FS }
{
    for (i = 1; i <= NF; i++) {
        gsub(/^[ \t]+|[ \t]+$/, "", $i) # Remove leading/trailing spaces
        if ($i == "") $i = "NA"         # Replace missing values with "NA"
    }
    if (handle_missing == "remove" && $0 ~ /NA/) {
        next
    }
    print $0
}
' $cleaned_file > temp && mv temp $cleaned_file

# Step 3: Remove duplicate entries
awk '!seen[$0]++' $cleaned_file > temp && mv temp $cleaned_file

# Step 4: Identify and handle outliers
# Assuming we are handling outliers for the "price" column (column 10)
mean=$(awk -F, 'NR > 1 { sum += $10; count++ } END { print sum / count }' $cleaned_file)

# Remove outliers based on a threshold (e.g., 3 times the mean price)
awk -F, -v mean="$mean" '
BEGIN {
    OFS = FS
    threshold = 3 * mean
}
NR == 1 {
    print $0
}
NR > 1 {
    if ($10 <= threshold) {
        print $0
    }
}
' $cleaned_file > temp && mv temp $cleaned_file

echo "Preprocessing complete. Cleaned data saved to $cleaned_file."
