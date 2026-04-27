--------------------------------------------------
-- FILE: 04_population_analysis.sql
-- PURPOSE: Normalize war impact using population
--------------------------------------------------

-- 04.1. JOIN WAR DATA WITH POPULATION
-- Aligns deaths with population size (country-year level)

select 
    w.country,
    w.start_year,
    w.clean_deaths,
    p.population
from wars_final w
inner join population p
on w.country = p.country
and w.start_year = p.year;


-- 04.2. DEATHS PER MILLION (KEY NORMALIZED METRIC)
-- This adjusts deaths relative to population size

select 
    w.country,
    sum(w.clean_deaths) as total_deaths,
    avg(p.population) as avg_population,

    -- Normalization formula:
    -- deaths per 1 million people
    sum(w.clean_deaths) * 1000000.0 / avg(p.population) as deaths_per_million

from wars_final w
inner join population p
on w.country = p.country
and w.start_year = p.year
group by w.country
order by deaths_per_million desc;