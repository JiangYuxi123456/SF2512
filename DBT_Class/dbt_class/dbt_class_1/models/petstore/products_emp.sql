{{ config(materialized='ephemeral') }}

select * from {{ref('products')}}


/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
