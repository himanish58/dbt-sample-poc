
/*
    ------- DVD Rentals -------
    What are the top and least rented (in-demand) genres and what are what are their total sales?
*/

{{ config(materialized='table') }}

select c.name as Genre, count(distinct cu.customer_id) as total_rent_demand
        from category c
        JOIN film_category fc
        using(category_id)
        join film f
        using(film_id)
        join inventory i
        using(film_id)
        join rental r
        using(inventory_id)
        join customer cu
        using(customer_id)
        group by 1
        order by 2 desc