# 🌍 Global War Impact Analysis (SQL Project)

## 📌 Project Overview

This project analyzes global war data to understand not just where wars occur, but **which countries suffer the most and why**.

Instead of relying on raw counts, the project integrates **war, GDP, and population datasets** to measure **true impact using normalized metrics such as deaths per million**.

---

## 🎯 Objective

To answer key analytical questions:

* Which countries are most frequently involved in wars
* Where the highest war impact (deaths) is concentrated
* Whether war frequency reflects actual impact
* How economic strength (GDP) relates to war severity
* Which countries suffer the most after adjusting for population

---

## 📂 Datasets Used

### 1. War Dataset (`wars_final`)

* war_id
* country
* start_year
* clean_deaths
* region_name

### 2. GDP Dataset (`gdp`)

* country
* year
* gdp

### 3. Population Dataset (`population`)

* country
* year
* population

---

## 🛠️ Data Preparation

* Cleaned war data by handling invalid values (-8, -9, 0)
* Converted GDP & population data from wide to long format
* Removed non-country entities (regions, income groups)
* Standardized country names using a mapping table
* Ensured consistent joins using **country + year**
* Validated joins before analysis to avoid incorrect results
* Filtered unreliable data where necessary

---

## 🤖 AI-Assisted Validation (MCP Integration)

To improve reliability, an AI-assisted workflow using MCP (Model Context Protocol) was incorporated.

### How it was used:

* All SQL queries were written manually
* MCP was used as a **validation layer** to:

  * Check query logic and correctness
  * Identify missing conditions or edge cases
  * Validate joins across multiple datasets

### Why this matters:

* Reduced risk of logical errors
* Improved confidence in results
* Demonstrates practical use of **AI in data workflows**

### Key Insight:

> AI was used to **validate and strengthen analysis**, not to replace SQL logic.

---

## 📊 Key Metrics

* **Total Wars** → Number of wars per country
* **Total Deaths** → Total casualties
* **Avg Deaths per War** → War intensity
* **Deaths per Million (Key Metric)** →
  (total_deaths * 1,000,000) / population

---

## 🔍 Analysis Performed

1. War frequency analysis
2. Total deaths analysis
3. War intensity comparison
4. Regional analysis
5. GDP integration
6. GDP vs war impact
7. Population-normalized impact
8. Frequency vs impact comparison
9. Final multi-dataset analysis

---

## 📈 Key Insights

* War participation is concentrated among a few countries
* Total deaths are driven by high-intensity conflicts
* **War frequency does not equal impact**
* Some countries experience fewer but more destructive wars
* Lower-GDP countries face higher casualties
* Higher-GDP countries participate but with lower human loss
* Smaller countries suffer disproportionately when normalized

---

## 🧠 Final Conclusion

War impact is shaped more by **economic strength and population resilience** than by frequency of participation.

After normalization:

> Economically weaker and smaller countries experience disproportionately higher impact, while stronger economies limit human loss.

---

## ⚠️ Limitations

* Missing GDP data for older conflicts
* Multi-country wars may cause overlap in deaths
* Population is averaged across years
* INNER JOIN filtering excludes incomplete data
* Analysis limited to post-1960 period

---

## 📁 Project Structure

```
Global-War-Impact-Analysis/
├── README.md
├── 1_Data_Cleaning/
├── 2_SQL_Analysis/
├── 3_Datasets/
├── 4_Outputs/
```

---

## 🛠️ Tools Used

* SQL (SQL Server)
* Data Cleaning & Transformation
* Analytical Querying
* AI-assisted validation (MCP)

---

## 💡 Key Learning

* Importance of data cleaning and standardization
* Why normalization is critical for meaningful insights
* How combining datasets improves analysis
* Role of AI in validating analytical workflows

---

## 📬 Contact

**Shubham Sharma**
📧 [shubhamssharma666@gmail.com](mailto:shubhamssharma666@gmail.com)
