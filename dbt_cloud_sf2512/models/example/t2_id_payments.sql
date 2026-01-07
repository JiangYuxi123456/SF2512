{% set payment_methods = ["bank_transfer", "credit_card", "gift_card"]%}

{% for payment_method in payment_methods %}
    select 
        {{ loop.index }} as id,
        uuid_string() as uuid,
        sha1('{{payment_method}}') as string_id,
        hash('{{payment_method}}') as num_id,
        '{{payment_method}}' as payment_method
        {% if not loop.last %}
            union
        {% endif %}
{% endfor %}