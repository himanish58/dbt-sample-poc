

  create view "demo"."demo"."filter_countries_data_by_date__dbt_tmp" as (
    SELECT * FROM "demo"."demo"."get_relevant_details_for_countries"
WHERE __hevo__ingested_at > extract(epoch from 

    dateadd(
        day,
        2,
        '2022-06-27'
        )

)
  ) ;
