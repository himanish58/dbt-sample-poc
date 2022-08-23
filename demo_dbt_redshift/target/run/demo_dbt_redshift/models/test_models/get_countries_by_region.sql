

  create view "demo"."demo"."get_countries_by_region__dbt_tmp" as (
    with source_data as (
   select * from countries
)

select * from source_data WHERE region = 'EU'
  ) ;
