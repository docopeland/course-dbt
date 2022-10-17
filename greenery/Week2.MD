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
Mart Orders<br>
<img width="611" alt="Screenshot 2022-10-16 at 22 48 26" src="https://user-images.githubusercontent.com/75538982/196089361-8f4a7ea3-61ac-45f5-9847-bafa30bb8af7.png">


## Question Two - Tests
### Prompt
What assumptions are you making about each model? Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
### Answer
I started with the assumption that there would be no null data, that all values that I aggregated (with sum, average, or count) would have positive values, and that all inventory, price, costs, etc. would have positive values. The null data assumption caused a lot of my tests to fail. In some cases, it made sense that there would be null values (if an order had no promo code the promo id would be null). In other cases, the nulls were because when I aggregated using sum and/or average, I did not account for the fact some of the values coming in would null. In those cases, I added cases statements that if the value was null to add 0. It would make sense to run all of the tests on a daily basis. If possible, I would schedule daily tests that would let us know if the tests fail. 

## Question Three - dbt Snapshots
### Prompt
Which orders changed from week 1 to week 2? 
### Answer
There was three orders created:
- 939767ac-357a-4bec-91f8-a7b25edd46c9
- 914b8929-e04a-40f8-86ee-357f2be3a2a2
- 05202733-0e17-4726-97c2-0520c024ab85
### Query
```SQL
select *
from dev_db.dbt_doc22.orders_snapshot
having dbt_updated_at > cast('2022-10-09' as datetime)
```
