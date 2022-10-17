{{
    config(
        materialized='table'
    )
}}

select 
    products.product_id,
    products.name as name,
    products.price,
    products.inventory,
    sum(order_items.quantity) as total_quantity,
    sum(order_items.quantity)/count(distinct order_items.order_id) as avg_quantity,
    count(distinct orders.order_id) as total_orders,
    count(distinct orders.order_id)/count(distinct orders.user_id) as avg_orders,
    count(distinct promos.promo_id) as total_promos,
    sum(promos.discount) as total_discounts,
    sum(promos.discount)/count(distinct promos.promo_id) as avg_discount,
    events.page_url,
    min(events.created_at) as created_at,
    count(distinct events.session_id) as total_sessions,
    count(distinct events.session_id)/count(distinct events.user_id) as avg_sessions_per_user
from {{ref('stg_products')}} products 
left join {{ref('stg_order_items')}} order_items on products.product_id = order_items.product_id
left join {{ref('stg_events')}} events on products.product_id = events.product_id
left join {{ref('stg_orders')}} orders on order_items.order_id = orders.order_id
left join {{ref('stg_promos')}} promos on orders.promo_id = promos.promo_id
group by products.product_id,
    products.name,
    products.price,
    products.inventory,
    events.page_url