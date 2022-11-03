
SELECT name, region, __hevo_ingested_at/1000 as __hevo_ingested_at
 FROM {{ref("get_countries_by_region")}}

