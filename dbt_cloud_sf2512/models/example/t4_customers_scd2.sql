-- SCD2: only update these columns when MATCHED
-- SCD2: never update valid_from
{{ config(
    materialized = 'incremental',
    unique_key = 'id',
    incremental_strategy = 'merge',
    merge_update_columns = ['valid_to', 'is_current'],
    merge_exclude_columns = ['valid_from']
) }}

select *
from public.dq_customers
