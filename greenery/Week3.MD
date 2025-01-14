# Week 3 Questions

## Question 1
### Prompt
What is our overall conversion rate?
### Answer
62.46%
### Query
```SQL
select sum(completed_orders)/count(session_id) * 100 as converstion_rate
from dev_db.dbt_doc22.fact_sessions
```
### Prompt
What is our conversion rate by product?
### Query
```SQL
select product_id, 
    name, 
    total_orders as purchases,
    total_sessions as sessions,
    total_orders/total_sessions * 100 as product_conversion
from dev_db.dbt_doc22.dim_products
```

## Question 2
### Prompt
Create a macro to simplify part of a model(s). 
### Answer
I created two macros: sum_non_null and count_non_null

## Question 3
### Prompt
Add a post hook to your project to apply grants to the role “reporting”. 
### Answer
Added a post hook to my dbt_project.yml file. 

## Question 4
### Prompt
Install a package and apply one or more of the macros to your project
### Answer
I installed calogica/dbt_expectations. I used the expect_column_values_to_be_unique as a test for some of my columns.

## Question 5
### Prompt
Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.
### Answer
My DAG has not changed

## Question 6
### Prompt
Which orders changed from week 2 to week 3? 
### Answer
There are five orders that have changed: 
e24985f3-2fb3-456e-a1aa-aaf88f490d70
38c516e8-b23a-493a-8a5c-bf7b2b9ea995
aafb9fbd-56e1-4dcc-b6b2-a3fd91381bb6
8385cfcd-2b3f-443a-a676-9756f7eb5404
d1020671-7cdf-493c-b008-c48535415611
5741e351-3124-4de7-9dff-01a448e7dfd4
### Query
```SQL
select *
from dev_db.dbt_doc22.orders_snapshot
having dbt_updated_at > cast('2022-10-18' as datetime)
```