
{{ config(materialized='table') }}

select *
from 
{{source("test","iris")}}

