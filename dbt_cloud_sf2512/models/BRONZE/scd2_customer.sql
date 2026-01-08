{{ config(
    materialized='incremental',
    unique_key='scd_id',
    incremental_strategy='merge',
    schema='BRONZE'
) }}

with 
{% if is_incremental() %}
-- Step 1: Calculate the high-water mark separately to avoid correlation errors
last_run as (
    select max(updated_at) as max_at from {{ this }}
),
{% endif %}

source_data as (
    -- Step 2: Get new records
    select 
        id, name, age, updated_at,
        {{ dbt_utils.generate_surrogate_key(['id', 'updated_at']) }} as scd_id
    from {{ ref('raw_customers') }}
    {% if is_incremental() %}
    where updated_at > (select max_at from last_run)
    {% endif %}
),

{% if is_incremental() %}
records_to_update as (
    -- Step 3: Find existing active rows that need to be closed
    select 
        t.scd_id, 
        t.id, 
        t.name, 
        t.age, 
        t.updated_at, -- original updated_at
        t.valid_from,
        s.updated_at as valid_to, -- the new timestamp becomes the end date
        false as is_current
    from {{ this }} t
    inner join source_data s on t.id = s.id
    where t.is_current = true
),
{% endif %}

final_set as (
    -- Combine new inserts and historical updates
    select 
        scd_id, id, name, age, updated_at,
        updated_at as valid_from, 
        null::timestamp_ntz as valid_to, 
        true as is_current
    from source_data

    {% if is_incremental() %}
    union all
    select * from records_to_update
    {% endif %}
)

select * from final_set

-- SELECT * FROM final


