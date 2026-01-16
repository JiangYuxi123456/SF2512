{{ config(materialized='table') }}
select 
    user_id,
    TRY_CONVERT(datetime, [timestamp], 0) AS created_at,
    [group] AS user_group,
    landing_page,
    converted
from test.ab_data_1