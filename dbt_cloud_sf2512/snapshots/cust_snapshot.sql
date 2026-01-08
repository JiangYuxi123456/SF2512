{% snapshot CUST_SNAPSHOT %}

{{ 
    config(
        target_schema = 'SILVER',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at'
    ) 
}}
with SRC as(
    SELECT * FROM {{ ref('raw_customers') }}
)
select * from SRC

{% endsnapshot %}
