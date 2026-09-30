-- ============================================================
-- SCRIPT 2: INSERTS ALEATÓRIOS (Período de 2 anos)
-- Intervalo de Datas: 01/10/2024 a 30/09/2026
-- ============================================================

-- 1. Inserção de Planos Fixos
INSERT INTO planos (nome_plano, valor_mensal, duracao_meses, descricao) VALUES
('Plano Mensal Bronze', 119.90, 1, 'Acesso ilimitado à musculação em horário livre.'),
('Plano Trimestral Prata', 99.90, 3, 'Acesso à musculação e aulas coletivas.'),
('Plano Anual Ouro', 79.90, 12, 'Acesso total, musculação, aulas e direito a 1 acompanhante no mês.'),
('Plano VIP Black', 149.90, 12, 'Acesso a todas as unidades, armário exclusivo e avaliação física mensal.');

-- 2. Inserção de 50 Alunos Fictícios (com datas de cadastro distribuídas nos últimos 2 anos)
INSERT INTO alunos (nome, email, telefone, data_nascimento, data_cadastro)
SELECT 
    (ARRAY[
        'Lucas', 'Gabriel', 'Mateus', 'Pedro', 'Guilherme', 'Gustavo', 'Felipe', 'Rafael', 'João', 'Thiago',
        'Ana', 'Beatriz', 'Camila', 'Larissa', 'Mariana', 'Gabriela', 'Juliana', 'Fernanda', 'Amanda', 'Letícia'
    ])[1 + floor(random() * 20)::int] || ' ' || 
    (ARRAY[
        'Silva', 'Santos', 'Oliveira', 'Souza', 'Rodrigues', 'Ferreira', 'Alves', 'Pereira', 'Lima', 'Gomes',
        'Ribeiro', 'Carvalho', 'Melo', 'Barbosa', 'Martins', 'Araújo', 'Moraes', 'Costa', 'Rocha', 'Dias'
    ])[1 + floor(random() * 20)::int] AS nome,
    
    'aluno_' || i || '_' || floor(random() * 1000) || '@email.com' AS email,
    '(85) 9' || floor(random() * (99999999 - 80000000 + 1) + 80000000)::text AS telefone,
    
    -- Data de nascimento aleatória entre 18 e 55 anos atrás
    CURRENT_DATE - (INTERVAL '18 years' + (random() * (37 * 365) || ' days')::interval) AS data_nascimento,
    
    -- Data de cadastro distribuída aleatoriamente nos últimos 2 anos
    TIMESTAMP '2024-10-01 08:00:00' + (random() * (INTERVAL '730 days')) AS data_cadastro
FROM generate_series(1, 50) AS i;

-- 3. Inserção de Matrículas para os Alunos Criados
INSERT INTO matriculas (aluno_id, plano_id, data_inicio, data_fim, status)
SELECT 
    a.aluno_id,
    p.plano_id,
    a.data_cadastro::date AS data_inicio,
    (a.data_cadastro::date + (p.duracao_meses || ' months')::interval)::date AS data_fim,
    (ARRAY['Ativa', 'Ativa', 'Ativa', 'Expirada', 'Cancelada'])[1 + floor(random() * 5)::int] AS status
FROM alunos a
JOIN planos p ON p.plano_id = (1 + floor(random() * 4)::int);

-- 4. Inserção de Pagamentos Aleatórios Associados às Matrículas
INSERT INTO pagamentos (matricula_id, valor_pago, data_pagamento, forma_pagamento)
SELECT 
    m.matricula_id,
    p.valor_mensal AS valor_pago,
    
    -- Data do pagamento próxima ao início da matrícula (até 5 dias depois)
    m.data_inicio + (random() * 5 || ' days')::interval + (random() * 12 || ' hours')::interval AS data_pagamento,
    
    (ARRAY['Cartao_Credito', 'PIX', 'Boleto', 'Dinheiro'])[1 + floor(random() * 4)::int] AS forma_pagamento
FROM matriculas m
JOIN planos p ON m.plano_id = p.plano_id;