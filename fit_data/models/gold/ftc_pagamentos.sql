{{ config(materialized='view', schema='gold') }}

with source as (
    select * from {{ref('bronze_pagamentos')}}
    )

select 
    pagamento_id,
    matricula_id,
    valor_pago,
    cast(data_pagamento as date) as data_pagamento,
    forma_pagamento
from source