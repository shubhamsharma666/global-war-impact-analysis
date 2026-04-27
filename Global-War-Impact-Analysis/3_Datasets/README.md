# Datasets

This folder contains the datasets used in the project.

## Important Notes:

* This folder includes both **raw datasets** and **cleaned sample datasets**
* Raw datasets are included for reference and reproducibility
* Sample datasets contain a subset of cleaned rows for demonstration purposes
* GDP and population datasets were transformed into **country-year format** before SQL analysis
* Country names were standardized during SQL preparation to ensure accurate joins across datasets

## Datasets Included:

1. **Raw datasets**

   * Original war dataset
   * Original GDP dataset
   * Original population dataset
   * These represent the source data before final SQL-based cleaning, mapping, and validation

2. **wars_sample.csv**

   * Contains cleaned war data
   * Columns: `war_id`, `country`, `start_year`, `clean_deaths`, `region_name`

3. **gdp_sample.csv**

   * Contains cleaned GDP data
   * Format: country-year level
   * Columns typically include: `country`, `year`, `gdp`

4. **population_sample.csv**

   * Contains cleaned population data
   * Format: country-year level
   * Columns typically include: `country`, `year`, `population`

## Purpose:

These files are included to demonstrate both:

* the original source datasets used in the project
* the cleaned sample structure used for SQL-based analysis

The main transformations, cleaning steps, country standardization, validation, and final analysis were performed using SQL queries included in the project.
