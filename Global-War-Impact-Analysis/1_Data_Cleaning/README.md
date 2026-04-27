# Data Cleaning & Preparation

This folder contains all SQL scripts used to clean, transform, and validate the datasets before analysis.

## Steps Performed:

1. Cleaned war dataset by handling invalid death values (-8, -9, 0)
2. Validated GDP and population datasets (duplicates, null values)
3. Standardized country names using a mapping table
4. Identified mismatches across datasets
5. Ensured accurate joins using country and year
6. Verified data consistency after integration
7. Validated country mapping by comparing join success before and after standardization
8. Confirmed improved integration with GDP matches increasing from 76 to 91 and population matches increasing from 69 to 82

## Objective:

To prepare a clean and reliable dataset for multi-dimensional analysis combining war, economic, and demographic data.

## Outcome:

Created a structured dataset at country-year level, ready for advanced analysis such as:

* War frequency
* Total deaths
* GDP comparison
* Population-normalized impact (deaths per million)
