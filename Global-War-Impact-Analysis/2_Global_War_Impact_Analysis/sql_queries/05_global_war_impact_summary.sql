--------------------------------------------------
-- FILE: 05_final_analysis.sql
-- PURPOSE: Final integrated analysis combining war, GDP, and population
--------------------------------------------------

-- This query answers:
-- Which countries are most affected by war when considering:
-- frequency, total deaths, economic strength, and population size

select 
    coalesce(m.standardized_name, w.country) as country,  
    -- Use standardized country name if mapping exists

    -- 1. WAR FREQUENCY
    count(distinct w.war_id) as total_wars,

    -- 2. TOTAL IMPACT
    sum(w.clean_deaths) as total_deaths,

    -- 3. ECONOMIC CONTEXT
    avg(g.gdp) as avg_gdp,

    -- 4. POPULATION CONTEXT
    avg(p.population) as avg_population,

    -- 5. NORMALIZED IMPACT (MOST IMPORTANT METRIC)
    sum(w.clean_deaths) * 1000000.0 / avg(p.population) as deaths_per_million

from wars_final w

-- Apply country mapping to resolve naming inconsistencies
left join country_mapping m
on ltrim(rtrim(lower(w.country))) = ltrim(rtrim(lower(m.original_name)))

-- Join GDP using standardized country + year
inner join gdp g
on coalesce(m.standardized_name, w.country) = g.country
and w.start_year = g.year

-- Join population using same logic
inner join population p
on coalesce(m.standardized_name, w.country) = p.country
and w.start_year = p.year

-- Restrict to modern period for better data availability
where w.start_year >= 1960

-- Aggregate at country level
group by coalesce(m.standardized_name, w.country)

-- Ensure statistical relevance (avoid countries with very few wars)
having count(distinct w.war_id) >= 3

-- Rank by normalized impact
order by deaths_per_million desc;