with src as (
    select
        {{ dbt_utils.star(
                from=ref('t2_id_payments'),
                except=['id']
            ) }}
        from {{ ref('t2_id_payments') }}
)

select
    {{
        dbt_utils.pivot(
            column='payment_method',
            values=['bank_transfer', 'credit_card', 'gift_card'],
            agg='count',
            then_value=1
        )
    }}
from src

