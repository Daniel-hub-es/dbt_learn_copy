-- deteting orders where the total amount isn't positive 

with

    payments as (
        select *
        from {{ ref('stg_stripe__payments') }}
    )

select
    order_id,
    sum(amount) as total_amount
from payments
group by order_id, amount
having amount < 0