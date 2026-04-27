--------------------------------------------------
-- FILE: 02_region_analysis.sql
-- PURPOSE: Analyze how wars are distributed geographically
--------------------------------------------------

-- 02.1. TOTAL WARS BY REGION
-- Identifies regions with highest war frequency

select 
    region_name,
    count(distinct war_id) as total_wars
from wars_final
where region_name is not null   -- exclude invalid/unmapped regions
group by region_name
order by total_wars desc;


-- 02.2. TOTAL DEATHS BY REGION
-- Measures which regions experience highest war impact

select 
    region_name,
    sum(clean_deaths) as total_deaths
from wars_final
where region_name is not null
group by region_name
order by total_deaths desc;