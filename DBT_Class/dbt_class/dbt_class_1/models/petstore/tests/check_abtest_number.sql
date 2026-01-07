-- Fail if the table has fewer than 10 rows
SELECT 'Too few rows' AS error_message
Where (
        select count(*) from test.ab_data_1
) < 10