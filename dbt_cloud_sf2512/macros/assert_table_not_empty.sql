{% test  assert_table_not_empty(model) %}
    select 1 from {{model}} having count(*) = 0
{% endtest %}