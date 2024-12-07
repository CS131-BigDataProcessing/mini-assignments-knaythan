#!/bin/bash

# Use awk to calculate the average carrier delay per airline
awk -F, '
BEGIN {
    # Initialize arrays to store sums and counts
    OFS = ","
}
{
    # Skip the header line
    if (NR > 1) {
        airline = $4
        carrier_delay = $1
        sum[airline] += carrier_delay
        count[airline]++
    }
}
END {
    print "Airline", "Average_Carrier_Delay"
    for (airline in sum) {
        avg = sum[airline] / count[airline]
        print airline, avg
    }
}
' airline_stats.csv > average_carrier_delay.csv
