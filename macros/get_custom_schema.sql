{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {%- if target.name == 'ci' and custom_schema_name is none -%}

        {{ default_schema }}_{{ env_var('DBT_PR_ID', 'test') }}

    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}