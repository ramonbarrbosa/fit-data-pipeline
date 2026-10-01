{{ config(materialized='view', schema='silver') }}


with source as (
    select * from {{ref('bronze_planos')}}
)

select 
    plano_id,
    nome_plano,
    valor_mensal,
    duracao_meses,
    descricao
from source as s