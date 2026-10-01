{{ config(materialized='table', schema='bronze') }}

select * from {{source('public_raw', 'pagamentos')}}