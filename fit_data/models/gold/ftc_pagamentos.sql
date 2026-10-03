{{ config(materialized='view', schema='gold') }}

with pagamentos as (
    select * from {{ ref('bronze_pagamentos') }}
),

matriculas as (
    select * from {{ ref('bronze_matriculas') }}
)

select 
    p.pagamento_id,
    m.aluno_id,
    m.plano_id,
    p.valor_pago,
    cast(p.data_pagamento as date) as data_pagamento,
    p.forma_pagamento
from pagamentos as p
left join matriculas as m on p.matricula_id = m.matricula_id