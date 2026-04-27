--------------------------------------------------
-- FILE: 03_gdp_analysis.sql
-- PURPOSE: Understand relationship between economic strength and war
--------------------------------------------------

-- 03.1. JOIN WAR DATA WITH GDP
-- Combines war events with economic data using country + year

select 
    w.country,
    w.start_year,
    w.clean_deaths,
    g.gdp
from wars_final w
inner join gdp g
on w.country = g.country
and w.start_year = g.year;


-- 03.2. GDP VS WAR FREQUENCY
-- Helps understand if economically stronger countries are more/less involved in wars

select 
    w.country,
    avg(g.gdp) as avg_gdp,
    count(distinct w.war_id) as total_wars
from wars_final w
inner join gdp g
on w.country = g.country
and w.start_year = g.year
group by w.country
order by avg_gdp desc;