{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('dim_listings_w_hosts', 'calculate dim listings with hosts') %}
  
  {% call dbt_unit_testing.mock_ref ('dim_listings_cleansed') %}
    select 1 as listing_id, 'sahil palace' as listing_name, 'Private room' as room_type, 
    5 as minimum_nights, 1 as host_id, 100.00 as price, to_timestamp('2023-06-07 13:35:04') as created_at
    , to_timestamp('2023-06-07 13:35:04') as updated_at
  {% endcall %}
  
  {% call dbt_unit_testing.mock_ref ('dim_hosts_cleansed') %}
    select 1 as host_id, 'sahil' as host_name, 't' as is_superhost, 
    to_timestamp('2023-06-07 13:35:04') as created_at, to_timestamp('2023-06-07 13:35:04') as updated_at
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select 1 as listing_id, 'Private room' as room_type, 5 as minimum_nights, 100.00 as price,
    1 as host_id,'sahil' as host_name,'t' as host_is_superhost
    ,to_timestamp('2023-06-07 13:35:04') as created_at,to_timestamp('2023-06-07 13:35:04') as updated_at
  {% endcall %}
{% endcall %}