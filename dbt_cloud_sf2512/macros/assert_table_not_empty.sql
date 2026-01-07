{% test  assert_table_not_empty(model) %}
    select count(*) from {{model}} having count(*) = 0
{% endtest %}