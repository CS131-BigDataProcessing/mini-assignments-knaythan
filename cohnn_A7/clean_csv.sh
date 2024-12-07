#!/bin/bash

# Use awk to remove rows with missing values from the CSV file
awk -F, '
{
    # Initialize a flag to indicate if the row has missing values
    has_missing = 0

    # Check each field in the row
    for (i = 1; i <= NF; i++) {
        if ($i == "") {
            has_missing = 1
            break
        }
    }

    # If the row does not have missing values, print it
    if (has_missing == 0) {
        print $0
    }
}
' airline_stats.csv > cleaned_airline_stats.csv
