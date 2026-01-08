{{ config(materialized='table') }}
select *, 
    CURRENT_TIMESTAMP as updated_at 
from 
{{ source("SEED_CUSTOMERS", "CUSTOMERS") }}