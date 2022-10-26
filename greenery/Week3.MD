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

## Question 3
### Prompt
Add a post hook to your project to apply grants to the role “reporting”. 

## Question 4
### Prompt
Install a package and apply one or more of the macros to your project

## Question 5
### Prompt
Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.

## Question 6
### Prompt
Which orders changed from week 2 to week 3? 