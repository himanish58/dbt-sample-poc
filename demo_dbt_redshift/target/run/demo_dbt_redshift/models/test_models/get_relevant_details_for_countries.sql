

  create view "demo"."demo"."get_relevant_details_for_countries__dbt_tmp" as (
    SELECT name, subregion, phone_code, capital, currency, __hevo__ingested_at/1000 as
__hevo__ingested_at FROM "demo"."demo"."get_countries_by_region"
  ) ;
