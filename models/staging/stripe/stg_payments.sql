with payments as (

  select 
    id as payment_id
    , orderid as order_id
    , paymentmethod as payment_method
    , status

    -- convert amount to dollars, currently in cents
    , (amount / 100) as amount
    , created as created_at
  from {{ source('stripe','payment') }}

)

select *
from payments