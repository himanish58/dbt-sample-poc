SELECT * FROM "demo"."demo"."get_relevant_details_for_countries"
WHERE __hevo__ingested_at > extract(epoch from 

    dateadd(
        day,
        2,
        '2022-06-27'
        )

)