with
    
    source as (
        select *
        from {{ source('stripe', 'payments') }} 
    ),

    payments as(
        select 
            id as payment_id,
            orderid as order_id,
            paymentmethod as payment_method,
            status as payment_status,
            {{ cents_to_dollars('amount') }} as amount,
            round(amount/10.0, 2) as payment_amount,
            created as created_at
        from source
    )

select * from payments