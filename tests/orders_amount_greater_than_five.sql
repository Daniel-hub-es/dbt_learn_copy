{{ config(severity='warn') }} --adding war config the test will not fail and only shows a warning

select 
    count(order_id) as amount, 
    customer_id
from {{ ref('stg_jaffle_shop__orders') }}
group by customer_id
having count(order_id) <= 5