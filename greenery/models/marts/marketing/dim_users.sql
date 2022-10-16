{{
    config(
        materialized='table'
    )
}}

select 
    users.user_id,
    users.email,
    users.created_at,
    users.updated_at,
    addresses.address,
    addresses.zipcode,
    addresses.state,
    addresses.country
from {{ref('stg_users')}} users
left join {{ref('stg_addresses')}} addresses on users.address_id = addresses.address_id