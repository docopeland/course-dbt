# Week 1 Project Questions. 

## Part One - Models
### Prompt
What is our user repeat rate?
Repeat Rate = Users who purchased 2 or more times / users who purchased
### Answer
80%
### Query
```SQL
WITH user_orders AS (
    SELECT user_id,
        count(order_id) as num_orders
    FROM dev_db.dbt_doc22.stg_orders
    GROUP BY user_id
)

select sum(case when num_orders > 1 then 1 else 0 end) as repeat_orderers,
    count(user_id) as total_orderers,
    repeat_orderers/total_orderers as repeat_rate
from user_orders
```

### Prompt
Mart Orders
DAG GOES HERE

## Question Two
### Prompt

### Answer

### Query


## Question Three
### Prompt

### Answer

### Query
