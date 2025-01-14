# Week 1 Project Questions. 

## Question One
### Prompt
How many users do we have?
### Answer
130 users
### Query
```SQL
SELECT COUNT(DISTINCT user_id) 
FROM dev_db.dbt_doc22.stg_users
```

## Question Two
### Prompt
On average, how many orders do we receive per hour?
### Answer
7.5 orders per hour
### Query
```SQL
WITH orders_per_hour AS(
    SELECT date_trunc('hour', CREATED_AT) as hourly,
        COUNT(order_id) AS orders
    FROM dev_db.dbt_doc22.stg_orders
    GROUP BY hourly
)

SELECT AVG(orders) 
FROM orders_per_hour
```

## Question Three
### Prompt
On average, how long does an order take from being placed to being delivered?
### Answer
3.9 days or 93.4 hours
### Query
```SQL
WITH time_for_delivery AS(
    SELECT datediff('hour', created_at, delivered_at) as hourly_length,
        datediff('day', created_at, delivered_at) as daily_length
    FROM dev_db.dbt_doc22.stg_orders
)

SELECT avg(daily_length) as avg_delivery_days,
    avg(hourly_length) as avg_delivery_hours
FROM time_for_delivery
```

# Question Four
### Prompt
How many users have only made one purchase? Two purchases? Three+ purchases?
### Answer
One purchase - 25 users  
Two purchases - 28 users  
Three+ purchases - 71 users  
### Query
```SQL
WITH user_orders AS (
    SELECT user_id,
        case
            when count(order_id) = 1 then 'One order'
            when count(order_id) = 2 then 'Two orders'
            when count(order_id) >= 3 then 'Three+ orders'
            end as num_orders
    FROM dev_db.dbt_doc22.stg_orders
    GROUP BY user_id
)

SELECT num_orders,
    COUNT(user_id)
FROM user_orders
GROUP BY num_orders`
```

# Question Five
### Prompt
On average, how many unique sessions do we have per hour?
### Answer
16.3 sessions per hour
### Query
```SQL
WITH sessions AS (
    SELECT
        COUNT(DISTINCT session_id) as num_sessions,
        date_trunc('hour', CREATED_AT) as hourly
    FROM dev_db.dbt_doc22.stg_events
    GROUP BY hourly
)


SELECT avg(num_sessions)
FROM sessions
```
