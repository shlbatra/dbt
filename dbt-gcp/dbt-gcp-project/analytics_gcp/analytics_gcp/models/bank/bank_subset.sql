{{ config(materialized='table') }}

select *
from 
{{source("test123","bank_subset")}}