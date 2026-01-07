{% set payment_methods = ["bank_transfer", "credit_card", "gift_card"]%}

{% for payment_method in payment_methods %}
    select '{{payment_method}}' as payment_method
        {% if not loop.last %}
            union
        {% endif %}
{% endfor %}