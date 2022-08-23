
/*
    ------- DVD Rentals -------
    What are the top and least rented (in-demand) genres and what are what are their total sales?
*/

{{ config(materialized='table') }}

select country, count(distinct customer_id) as customer_base, sum(amount) as total_sales
        from {{ source('dvdrental','country') }}
        JOIN {{ source('dvdrental','city') }}
        using(country_id)
        join {{ source('dvdrental','address') }}
        using(city_id)
        join {{ source('dvdrental','customer') }}
        using(address_id)
        join {{ source('dvdrental','payment') }}
        using(customer_id)
        group by 1
        order by 2 desc