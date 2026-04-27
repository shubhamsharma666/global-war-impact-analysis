--------------------------------------------------
-- FILE: 02_gdp_population_preparation.sql
-- PURPOSE: Validate GDP & Population datasets
--------------------------------------------------

-- Step 1: Check sample GDP data

select top 10 * from gdp;


-- Step 2: Check sample population data

select top 10 * from population;


-- Step 3: Check duplicates in GDP

select country, year, count(*) as cnt
from gdp
group by country, year
having count(*) > 1;


-- Step 4: Check duplicates in Population

select country, year, count(*) as cnt
from population
group by country, year
having count(*) > 1;


-- Step 5: Check NULL values

select count(*) as null_gdp
from gdp
where gdp is null;

select count(*) as null_population
from population
where population is null;