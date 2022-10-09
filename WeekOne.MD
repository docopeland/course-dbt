# Week 1 Project Questions. 

## Question One
### Prompt
How many users do we have?
### Answer
130 users
### Query
```
SELECT COUNT(DISTINCT user_id) 
FROM dev_db.dbt_doc22.stg_users
```

## Question Two
### Prompt
On average, how many orders do we receive per hour?
### Answer
### Query

## Question Three
### Prompt
On average, how long does an order take from being placed to being delivered?
### Answer
### Query

# Question Four
### Prompt
How many users have only made one purchase? Two purchases? Three+ purchases?
### Answer
One purchase - 25 users.  
Two purchases - 28 users.  
Three+ purchases - 71 users.  
### Query
```
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
### Query
