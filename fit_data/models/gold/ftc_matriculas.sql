{{ config(materialized='view', schema='gold') }}

with source as (
    select * from {{ref('bronze_matriculas')}}
    )


select 
	matricula_id,
	aluno_id,
	plano_id,
	data_inicio,
	data_fim,
	age(data_fim, data_inicio) as tempo_corrido, -- Determinando o tempo corrido deste o dia da matrícula
	status 
from source