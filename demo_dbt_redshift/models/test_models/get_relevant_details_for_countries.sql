
SELECT name, region, __hevo_ingested_at as __hevo_ingested_at
 FROM {{ref("get_countries_by_region")}}

