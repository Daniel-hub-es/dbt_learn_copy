{%- macro limit_data_in_dev(column, days) -%}

    {%- if target.name == 'dev' -%}

        where {{ column }} >= dateadd('day', -{{ days }}, current_timestamp)

    {%- else -%}

        -- Macro skipped in env: {{ target.name }}

    {%- endif -%}

{%- endmacro -%}