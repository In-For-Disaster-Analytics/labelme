#!/usr/bin/env python3

import pandas as pd
from typing import List


def average_of_each_row(csv_file: str, numeric_columns: List[str], output_file: str):
    df = pd.read_csv(csv_file, usecols=numeric_columns)
    with open(output_file, "w") as f:
        for index, row in df.iterrows():
            row = row.dropna()  # Drop any NaN values
            if not row.empty:
                average = row.mean()
                f.write("Average of row {} : {}\n".format(row.values, average))


def parse_args():
    import argparse

    parser = argparse.ArgumentParser(
        description="Calculate the average of each row in a CSV file"
    )
    parser.add_argument("csv_file", help="The CSV file to read")
    parser.add_argument(
        "output_file", help="The file to write the average of each row to"
    )
    return parser.parse_args()


args = parse_args()
csv_file = args.csv_file
output_file = args.output_file

# Specify the columns that contain numeric data
numeric_columns = ["total_bill", "tip", "size"]
average_of_each_row(csv_file, numeric_columns, output_file)
