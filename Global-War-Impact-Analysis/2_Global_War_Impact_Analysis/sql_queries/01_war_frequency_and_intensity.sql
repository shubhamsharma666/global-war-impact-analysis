--------------------------------------------------
-- FILE: 01_war_analysis.sql
-- PURPOSE: Analyze war participation and impact by country
--------------------------------------------------

-- 01.1. TOTAL WARS PER COUNTRY
-- This shows which countries are most frequently involved in wars

select 
    country,
    count(distinct war_id) as total_wars   -- count unique wars to avoid duplicates
from wars_final
group by country
order by total_wars desc;


-- 01.2. TOTAL DEATHS PER COUNTRY
-- Measures absolute war impact (raw casualties)

select 
    country,
    sum(clean_deaths) as total_deaths   -- sum of cleaned deaths (invalid values removed earlier)
from wars_final
group by country
order by total_deaths desc;


-- 01.3. AVERAGE DEATHS PER WAR (WAR INTENSITY)
-- Helps identify how destructive wars are for each country

select 
    country,
    sum(clean_deaths) * 1.0 / count(distinct war_id) as avg_deaths_per_war
from wars_final
group by country
having count(distinct war_id) > 1   -- filter to avoid division bias from single war
order by avg_deaths_per_war desc;