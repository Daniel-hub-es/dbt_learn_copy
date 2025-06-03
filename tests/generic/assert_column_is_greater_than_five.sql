{% test assert_column_is_greater_than_five(model, column_name) %}

{{ config(severity = 'warn') }}

select 
    {{ column_name }}
from {{ model }}
group by {{ column_name }}
having {{ column_name }} > 5

{% endtest %}