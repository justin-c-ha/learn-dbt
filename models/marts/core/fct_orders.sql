with orders as (
    select *
    from {{ref('stg_orders')}}
)
,

payments as (
    select *
    from {{ref('stg_payments')}}
)
,

orders_payments as (
    select
        order_id
        , sum(amount) as amount
    from payments
    where status = 'success'
    -- multiple payments can be associated with one order
    group by order_id
)
,

final as (
    select
    orders.order_id
    , orders.customer_id
    , orders.order_date
    , orders_payments.amount
    from orders
    left join orders_payments
        on orders.order_id = orders_payments.order_id
)

select *
from final
