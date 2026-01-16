{{ config(materialized = 'incremental', incremental_strategy = 'merge', unique_key = 'user_id') }}

select 
    user_id,
    TRY_CONVERT(datetime, [timestamp], 0) AS created_at,
    [group] AS user_group, 
    landing_page,
    converted
from 
(select *, row_number() over (partition by user_id order by TRY_CONVERT(datetime, [timestamp], 0) desc) as rn 
from test.ab_data_1) x
where rn = 1

