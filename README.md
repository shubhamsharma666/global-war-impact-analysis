# global-war-impact-analysis
SQL project analyzing global war impact by combining GDP and population data. Focused on cleaning messy data, fixing country mismatches, aligning data by year, and validating queries using an MCP-based tool.

## Project Overview
This project focuses on identifying not just where wars occur, but **which countries suffer the most and why**.

It analyzes global war data by combining **war, GDP, and population datasets**, moving beyond simple counts to measure **true impact using normalized metrics like deaths per million**.

---

## Objective
To analyze global war data and determine:

- Which countries are most frequently involved in wars
- Where the highest war impact (deaths) is concentrated
- How destructive wars are across different countries
- Whether war frequency reflects actual impact
- How economic strength (GDP) is associated with war severity
- Which countries suffer the most when impact is normalized by population

---

## Datasets Used

### 1. War Dataset (`wars_final`)
- war_id
- country
- start_year
- clean_deaths
- region_name

### 2. GDP Dataset (`gdp`)
- country
- year
- gdp

### 3. Population Dataset (`population`)
- country
- year
- population

---

## Data Preparation

- Cleaned war data by handling invalid values like `-8`, `-9`, and `0`
- Converted GDP and population data into usable country-year level structure
- Removed non-country rows such as world totals, regions, and income groups
- Standardized country names using a mapping table
- Ensured consistent joins using **country + year**
- Used `INNER JOIN` where required to ensure valid GDP/population comparisons
- Handled `NULL` GDP values as a dataset limitation
- Verified that country mapping improved macro-data joins by increasing matched GDP rows from `76` to `91` and matched population rows from `69` to `82`

---

## Mapping Validation

After creating the `country_mapping` table, validation queries were run to check whether standardized country names were improving joins with the GDP and population datasets.

### Validation Results

- GDP matched rows before mapping: **76**
- GDP matched rows after mapping: **91**
- Population matched rows before mapping: **69**
- Population matched rows after mapping: **82**

### Example Mappings Confirmed

- Bosnia -> Bosnia and Herzegovina
- Democratic Republic of the Congo -> Congo, Dem. Rep.
- Egypt -> Egypt, Arab Rep.
- Iran -> Iran, Islamic Rep.
- Laos -> Lao PDR
- Somalia -> Somalia, Fed. Rep.
- Turkey -> Turkiye
- United States -> United States
- Vietnam -> Viet Nam

This confirmed that the mapping logic was working correctly and improving dataset integration quality before the final analysis.

---

## Key Metrics

- **Total Wars** -> Number of wars per country
- **Total Deaths** -> Total casualties
- **Avg Deaths per War** -> War intensity (severity per conflict)
- **Deaths per Million (Key Metric)** ->
  `(total_deaths * 1,000,000) / population`

---

## Analysis Performed

1. **War Frequency Analysis**
   Identified countries and regions with the highest war participation

2. **Total Deaths Analysis**
   Measured where absolute war impact is concentrated

3. **War Intensity Analysis**
   Evaluated how destructive wars are using average deaths per war

4. **Regional Comparison**
   Compared war distribution and impact across regions

5. **GDP Integration**
   Combined war data with economic data using standardized country mapping

6. **GDP vs War Impact**
   Analyzed how economic strength relates to total deaths

7. **Intensity with GDP**
   Examined how GDP influences war severity per conflict

8. **Population-Normalized Impact**
   Used deaths per million to measure true relative damage

9. **Frequency vs Impact Comparison**
   Tested whether more wars actually lead to higher impact

10. **Final Integrated Analysis**
    Combined GDP, population, and war metrics to identify which countries are most affected and why

---

## Key Insights

- War participation is **highly concentrated** among a few countries
- Total deaths are **skewed**, driven by a few high-intensity conflicts
- **War frequency does not equal impact**
- Some countries experience **fewer but highly destructive wars**
- War impact is geographically concentrated, with Asia and the Middle East showing both high frequency and high intensity
- Lower-GDP countries tend to experience higher casualties and more destructive conflicts
- Higher-GDP countries participate in wars but with **minimal human loss**
- Population normalization reveals that **smaller countries suffer disproportionately higher impact**

---

## Final Conclusion

War impact is not determined by how often a country participates, but by its **economic strength and population resilience**.

After normalizing deaths by population and integrating GDP:

> Economically weaker and smaller countries experience disproportionately higher impact, while stronger economies are able to limit human loss despite participating in conflicts.

This highlights that raw metrics like total deaths or war count can be misleading without normalization.

---

## Limitations

- GDP data is missing for older conflicts, creating bias toward modern data
- Multi-country wars may lead to overlapping death attribution
- Population is averaged across years, which is an approximation
- `INNER JOIN` filtering excludes data-poor countries
- Analysis is limited to the post-1960 period for consistency
- Perfect matching is not possible for all rows because some historical entities, such as South Vietnam or Austria-Hungary, do not have direct GDP/population counterparts

---

## Project Structure

```text
Global-War-Impact-Analysis/
|-- README.md
|-- 1_Data_Cleaning/
|-- 2_Global_War_Impact_Analysis/
|-- 3_Datasets/
|-- 4_MCP_Tool/ (optional/duplicate if root MCP file is used)
|-- 5_Outputs/
```

---

## Tools Used

- SQL Server
- SQL
- Data Cleaning and Transformation
- Analytical Querying
- MCP-assisted validation

---

## Key Learning

This project demonstrates:

- The importance of **data cleaning and standardization**
- Why **raw counts can be misleading without normalization**
- How combining datasets provides **deeper analytical insights**
- That **economic strength and population size influence real-world impact** more than raw participation

---

## Contact

**Shubham Sharma**

shubhamssharma666@gmail.com

---

