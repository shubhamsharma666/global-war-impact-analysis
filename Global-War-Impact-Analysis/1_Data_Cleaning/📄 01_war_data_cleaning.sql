--------------------------------------------------
-- FILE: 01_war_data_cleaning.sql
-- PURPOSE: Clean war dataset
--------------------------------------------------

-- Step 1: Clean death values
-- Replace invalid values (-8, -9, 0) with NULL

update wars_final
set clean_deaths = case 
    when clean_deaths in (-8, -9, 0) then null
    else clean_deaths
end;


-- Step 2: Verify cleaned data

select top 20 
    war_id,
    country,
    start_year,
    clean_deaths
from wars_final;


-- Step 3: Check NULL deaths

select count(*) as null_deaths
from wars_final
where clean_deaths is null;