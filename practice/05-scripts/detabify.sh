#!/bin/bash

set -e

# Input file: mock_data.tsv
#
# Command: tr '\t' ',' < file.tsv > file.csv

/usr/bin/tr '\t' ',' < $1 > $2
