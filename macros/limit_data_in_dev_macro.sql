{%- macro limit_data_in_dev(column, days) -%}

    {%- if target.name == 'dev' -%}
        where {{ column }} >= current_timestamp - interval '{{ days }} days'
    {%- else -%}
        -- Macro skipped in env: {{ target.name }}
    {%- endif -%}

{%- endmacro -%}