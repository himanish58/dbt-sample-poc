{{ config(materialized='table') }}

SELECT payment_id, customer_id, amount FROM {{ source('dvdrental','payment') }} a WHERE a.staff_id=1