# Airbnb NY Dataset Preprocessing Script

## Overview
This script preprocesses the Airbnb NY dataset by handling missing values, removing trailing spaces/new lines, removing duplicate entries, and identifying and handling outliers.

## Usage
1. Place any file with matching format to the `AB_NYC_2019.csv` file in the same directory as the script.
2. Run the script:
    ```sh
    bash preprocess_airbnb_ny.sh [replace|remove] file_name.csv
    ```
    - `replace`: Replaces missing values with `NA`.
    - `remove`: Removes rows with missing values entirely.
