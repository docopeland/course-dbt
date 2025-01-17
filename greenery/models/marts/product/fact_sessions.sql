{{
    config(
        materialized='table'
    )
}}

select
    events.session_id,
    count(events.event_id) as total_events,
    sum(case when events.event_type = 'checkout' then 1 else 0 end) as completed_orders,
    sum(case when events.event_type = 'package_shipped' then 1 else 0 end) as shipped_orders,
    sum(case when events.event_type = 'add_to_cart' then 1 else 0 end) as products_ordered
from {{ref('stg_events')}} events
left join {{ref('stg_users')}} users on events.user_id = users.user_id
group by session_id