{{
    config(
        materialized = 'table'
    )
}}

select
    orders.user_id,
    count(orders.order_id) as total_orders,
    sum(orders.order_cost) as total_order_cost,
    sum(orders.shipping_cost) as total_shipping_cost,
    sum(orders.order_total) as total_order_total,
    sum(case when orders.promo_id is not null then 1 else 0 end) as total_promos,
    sum(promos.discount) as promo_discounts,
    max(orders.delivered_at) as last_delivery,
    min(orders.created_at) as first_order,
    max(orders.created_at) as last_order
from {{ref('stg_orders')}} as orders
left join {{ref('stg_promos')}} as promos on orders.promo_id = promos.promo_id
group by user_id 