# MCP Notes

## Purpose
For this project, MCP was used as a validation and database-access layer to support the SQL analysis workflow.

## How It Was Used
A local MCP server was connected to the SQL Server database `war_project`. This allowed the AI workflow to interact with the database through controlled tools instead of manually checking schema and query behavior each time inside SQL Server.

## Tools Exposed
The MCP setup exposed three main tools:

1. `run_query(query)`
   Used to execute SQL queries and inspect outputs.

2. `get_tables()`
   Used to list available base tables in the database.

3. `describe_table(table_name)`
   Used to inspect schema details such as column names and data types.

## Role In The Project
MCP was used to validate the SQL workflow by:

- checking which tables were available
- verifying schema before writing joins
- testing SQL queries on sample outputs
- validating joins between war, GDP, and population data
- identifying issues such as inconsistent country names and incomplete overlap across datasets

## Why It Was Useful
This helped reduce errors during analysis and made it easier to confirm whether the integration logic was correct before using it in the final outputs.

## Project Context
In this project, MCP was used as a support tool for validation and inspection. The SQL analysis, country normalization logic, and final conclusions were still driven by the project workflow itself.

## Note
The MCP setup was configured with guidance and then used to support the analysis process.
