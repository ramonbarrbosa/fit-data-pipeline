# Questionamentos #

1. Financeiro & Faturamento
Qual é o Faturamento Mensal Recorrente (MRR)?

Objetivo: Acompanhar a receita de pagamentos mês a mês ao longo dos últimos 2 anos para identificar sazonalidade (ex: pico de matrículas no início do ano/verão).

Qual é o Ticket Médio por Aluno e por Plano?

Objetivo: Entender quanto cada aluno gasta em média e qual modalidade de plano traz o maior retorno financeiro unitário.

Qual a distribuição das Formas de Pagamento?

Objetivo: Avaliar a dependência de métodos como PIX, Cartão, Boleto ou Dinheiro. (Ex: Boleto pode indicar maior risco de inadimplência em relação ao Cartão de Crédito).

2. Comportamento & Distribuição de Alunos
Qual é o perfil demográfico dos alunos (Faixa Etária)?

Objetivo: Identificar a idade média dos alunos (calculada a partir da data_nascimento) para direcionar campanhas de marketing e aulas coletivas específicas.

Qual é o volume de novos cadastros mês a mês?

Objetivo: Analisar a taxa de aquisição de novos alunos (data_cadastro) ao longo do período de 2 anos.

3. Planos & Desempenho de Vendas
Qual é o plano mais vendido em volume e o mais rentável em receita?

Objetivo: Descobrir se a maior parte da base prefere a flexibilidade do Plano Mensal Bronze ou o compromisso/desconto dos planos de longa duração (Anual Ouro / VIP Black).

Qual é a taxa de conversão para planos de longa duração (3 e 12 meses)?

Objetivo: Medir quantos % da base optam por fidelidade em comparação com os planos mensais de menor duração.

4. Retenção, Churn & Saúde do Negócio
Qual é a Taxa de Churn (Cancelamento e Expiração)?

Objetivo: Quantificar quantos alunos estão com status Cancelada ou Expirada em relação ao total de matrículas ativas.

Qual é o tempo médio de permanência (LTV / Vida Útil) do aluno na academia?

Objetivo: Calcular a diferença entre data_inicio e data_fim ou a recorrência de renovações para projetar o valor do tempo de vida do cliente.

Quais planos registram maior índice de cancelamento prematuro?

Objetivo: Investigar se algum plano específico (ex: Plano Mensal) possui uma taxa desproporcional de cancelamento.

5. Eficiência Operacional & Adimplência
Qual é o tempo médio entre a data de matrícula e o primeiro pagamento?

Objetivo: Avaliar o intervalo entre data_inicio e data_pagamento para identificar gargalos ou atrasos na cobrança.

Existem alunos com matrículas ativas sem registro de pagamento confirmado?

Objetivo: Auditar a integridade entre as tabelas matriculas e pagamentos para detectar possível inadimplência.