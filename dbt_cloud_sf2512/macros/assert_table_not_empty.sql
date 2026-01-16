{% test  assert_table_not_empty(model) %}
<<<<<<< HEAD
    select 1 from {{model}} having count(*) = 0
=======
    select count(*) from {{model}} having count(*) = 0
>>>>>>> b24104e0c27e46f51027ecdb016addf9875ce03f
{% endtest %}