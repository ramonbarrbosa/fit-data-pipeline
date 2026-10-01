{{ config(materialized='view', schema='silver') }}

with source as (
    select * from {{ref('bronze_alunos')}}
)

select  
    aluno_id,
    nome,
    replace(email, 'email', 'fac') as email, --provedor modificado
    translate(telefone, '( | )', '') as telefone, -- Removido os caracteres do número
    case
        when substring(translate(telefone, '( | )', '') from 3 for 1) = '9' and 
        length(translate(telefone, '( | )', '')) = '11' then 'celular'
        else 'fixo' -- Campo criado para determinar o tipo de dispositivo
    end as tipo,
   	data_nascimento,
    extract(year from age(current_date, data_nascimento)) as idade
from source