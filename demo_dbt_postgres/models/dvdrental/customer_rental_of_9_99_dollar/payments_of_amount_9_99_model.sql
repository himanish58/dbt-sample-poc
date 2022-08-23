{{ config(materialized='table') }}

SELECT customer_id FROM {{ source('dvdrental','payment') }} WHERE amount=9.99