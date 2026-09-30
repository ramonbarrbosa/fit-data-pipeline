-- ============================================================
-- SCRIPT 1: CRIAÇÃO DAS TABELAS (PostgreSQL)
-- Domínio: Academia Fictícia (FitLife Studio)
-- ============================================================

-- Remover tabelas existentes para garantir execução limpa
DROP TABLE IF EXISTS pagamentos CASCADE;
DROP TABLE IF EXISTS matriculas CASCADE;
DROP TABLE IF EXISTS planos CASCADE;
DROP TABLE IF EXISTS alunos CASCADE;

-- 1. Tabela de Alunos
CREATE TABLE alunos (
    aluno_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela de Planos de Academia
CREATE TABLE planos (
    plano_id SERIAL PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    valor_mensal NUMERIC(10, 2) NOT NULL,
    duracao_meses INT NOT NULL,
    descricao TEXT
);

-- 3. Tabela de Matrículas
CREATE TABLE matriculas (
    matricula_id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL REFERENCES alunos(aluno_id) ON DELETE CASCADE,
    plano_id INT NOT NULL REFERENCES planos(plano_id),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Ativa' CHECK (status IN ('Ativa', 'Cancelada', 'Expirada')),
    CONSTRAINT chk_datas CHECK (data_fim > data_inicio)
);

-- 4. Tabela de Pagamentos
CREATE TABLE pagamentos (
    pagamento_id SERIAL PRIMARY KEY,
    matricula_id INT NOT NULL REFERENCES matriculas(matricula_id) ON DELETE CASCADE,
    valor_pago NUMERIC(10, 2) NOT NULL,
    data_pagamento TIMESTAMP NOT NULL,
    forma_pagamento VARCHAR(30) CHECK (forma_pagamento IN ('Cartao_Credito', 'PIX', 'Boleto', 'Dinheiro'))
);