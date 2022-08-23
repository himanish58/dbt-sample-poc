
/*
    ------- DVD Rentals -------
    What are the top and least rented (in-demand) genres and what are what are their total sales?
*/

{{ config(materialized='table') }}

with t1 as (
    select c.name as Genre, count(cu.customer_id) as total_rent_demand
        from category c
        JOIN {{ source('dvdrental','film_category') }} fc
        using(category_id)
        join {{ source('dvdrental','film') }} f
        using(film_id)
        join {{ source('dvdrental','inventory') }} i
        using(film_id)
        join {{ source('dvdrental','rental') }} r
        using(inventory_id)
        join {{ source('dvdrental','customer') }} cu
        using(customer_id)
        group by 1
        order by 2 desc
),
t2 as (
    select c.name as Genre, sum(p.amount) as total_sales
    from category c
    join {{ source('dvdrental','film_category') }} fc
    using(category_id)
    join {{ source('dvdrental','film') }} f
    using(film_id)
    join {{ source('dvdrental','inventory') }} i
    using(film_id)
    join {{ source('dvdrental','rental') }} r
    using(inventory_id)
    join {{ source('dvdrental','payment') }} p
    using(rental_id)
    group by 1
    order by 2 desc
)

select t1.genre, t1.total_rent_demand, t2.total_sales
from t1
join t2
on t1.genre = t2.genre
