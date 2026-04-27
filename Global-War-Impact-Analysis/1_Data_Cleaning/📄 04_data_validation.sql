--------------------------------------------------
-- FILE: 04_data_validation.sql
-- PURPOSE: Validate joins and detect mismatches
--------------------------------------------------

-- Step 1: War vs GDP mismatch

select distinct w.country
from wars_final w
where w.country not in (
    select distinct country from gdp
);


-- Step 2: War vs Population mismatch

select distinct w.country
from wars_final w
where w.country not in (
    select distinct country from population
);


-- Step 3: Apply mapping (preview)

select 
    coalesce(m.standardized_name, w.country) as country,
    w.start_year,
    w.clean_deaths
from wars_final w
left join country_mapping m
on ltrim(rtrim(lower(w.country))) = ltrim(rtrim(lower(m.original_name)));


-- Step 4: Validate JOIN (GDP + Population)

select 
    coalesce(m.standardized_name, w.country) as country,
    w.start_year,
    g.gdp,
    p.population

from wars_final w

left join country_mapping m
on ltrim(rtrim(lower(w.country))) = ltrim(rtrim(lower(m.original_name)))

inner join gdp g
on coalesce(m.standardized_name, w.country) = g.country
and w.start_year = g.year

inner join population p
on coalesce(m.standardized_name, w.country) = p.country
and w.start_year = p.year;


-- Step 5: Check NULLs after join

select *
from (
    select 
        coalesce(m.standardized_name, w.country) as country,
        w.start_year,
        g.gdp,
        p.population
    from wars_final w
    left join country_mapping m
    on ltrim(rtrim(lower(w.country))) = ltrim(rtrim(lower(m.original_name)))

    inner join gdp g
    on coalesce(m.standardized_name, w.country) = g.country
    and w.start_year = g.year

    inner join population p
    on coalesce(m.standardized_name, w.country) = p.country
    and w.start_year = p.year
) t
where gdp is null or population is null;


-- Step 6: Compare GDP matches before vs after mapping

select count(*) as matched_rows_before_mapping
from wars_final w
inner join gdp g
on w.country = g.country
and w.start_year = g.year;

select count(*) as matched_rows_after_mapping
from wars_final w
left join country_mapping m
on ltrim(rtrim(lower(w.country))) = ltrim(rtrim(lower(m.original_name)))
inner join gdp g
on coalesce(m.standardized_name, w.country) = g.country
and w.start_year = g.year;


-- Step 7: Compare Population matches before vs after mapping

select count(*) as matched_rows_before_mapping
from wars_final w
inner join population p
on w.country = p.country
and w.start_year = p.year;

select count(*) as matched_rows_after_mapping
from wars_final w
left join country_mapping m
on ltrim(rtrim(lower(w.country))) = ltrim(rtrim(lower(m.original_name)))
inner join population p
on coalesce(m.standardized_name, w.country) = p.country
and w.start_year = p.year;
