{#

Commented out as billing in BigQuery is not allowed and free trial not support MERGE, INSERT OR UPDATE


{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='dbt-fundamentals-448412',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from {{target.database}}.{{target.schema}}.mock_orders

{% endsnapshot %}

#}