{% snapshot mock_orders_snapshot %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      unique_key='order_id',
      strategy='timestamp',
      updated_at='updated_at',
      target_schema=new_schema,
    )
}}

select 
    order_id,
    status,
    CAST(created_at AS timestamp without time zone) as created_at,
    CAST(updated_at AS timestamp without time zone) as updated_at
from {{ ref('mock_orders') }}

{% endsnapshot %}