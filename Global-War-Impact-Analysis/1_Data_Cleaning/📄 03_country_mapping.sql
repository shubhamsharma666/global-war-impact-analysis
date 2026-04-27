--------------------------------------------------
-- FILE: 03_country_mapping.sql
-- PURPOSE: Standardize country names across datasets
--------------------------------------------------

-- Step 1: Create mapping table

create table country_mapping (
    original_name varchar(100),
    standardized_name varchar(100)
);


-- Step 2: Insert mappings

insert into country_mapping values
('Turkey', 'Turkiye'),
('Egypt', 'Egypt, Arab Rep.'),
('Syria', 'Syrian Arab Republic'),
('Laos', 'Lao PDR'),
('Somalia', 'Somalia, Fed. Rep.'),
('Democratic Republic of the Congo', 'Congo, Dem. Rep.'),
('Bosnia', 'Bosnia and Herzegovina'),
('Yemen Arab Republic', 'Yemen, Rep.'),
('Vietnam', 'Viet Nam'),
('Iran', 'Iran, Islamic Rep.');


-- Step 3: View mappings

select * from country_mapping;
