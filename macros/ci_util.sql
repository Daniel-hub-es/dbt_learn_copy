{% macro my_create_schema(schema_name) %}
  {% set sql %}
    CREATE SCHEMA IF NOT EXISTS {{ schema_name }};
  {% endset %}
  {% do run_query(sql) %}
{% endmacro %}

{% macro my_drop_schema(schema_name) %}
  {% set sql %}
    DROP SCHEMA IF EXISTS {{ schema_name }} CASCADE;
  {% endset %}
  {% do run_query(sql) %}
{% endmacro %}