{% test validate_datatype(model, column_name, expected_datatype) %}
    with metadata as(
        select UPPER(data_type) as actual_type
        from {{model.database}}.INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = upper('{{model.identifier}}')
        AND TABLE_SCHEMA = upper('{{model.schema}}')
        AND column_name = UPPER('{{column_name}}')
    )
    select * from metadata 
    where UPPER(actual_type) != UPPER('{{expected_datatype}}')
{% endtest %}