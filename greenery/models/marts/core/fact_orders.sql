{{
    config(
        materialized='table'
    )
}}

select orders.order_id,
    orders.promo_id,
    orders.user_id,
    orders.created_at,
    orders.order_cost,
    orders.shipping_cost,
    orders.order_total,
    datediff('hour', orders.created_at, orders.delivered_at) as hourly_delivery_length,
    count(order_items.product_id) as total_products,
    sum(order_items.quantity) as total_quantity,
    count(promos.promo_id) as total_promos,
    sum(case when promos.discount is not null then promos.discount else 0 end) as total_discount,
    count(events.event_id) as total_events
from {{ref('stg_orders')}} orders
left join {{ref('stg_order_items')}} order_items on orders.order_id = order_items.order_id
left join {{ref('stg_promos')}} promos on orders.promo_id = promos.promo_id
left join {{ref('stg_events')}} events on orders.order_id = events.order_id
group by orders.order_id,
    orders.promo_id,
    orders.user_id,
    orders.created_at,
    orders.order_cost,
    orders.shipping_cost,
    orders.order_total,
    orders.delivered_at

