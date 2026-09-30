import pandas as pd
import random
from datetime import datetime, timedelta

random.seed(42)

first_names = [
    'Lucas', 'Gabriel', 'Mateus', 'Pedro', 'Guilherme', 'Gustavo', 'Felipe', 'Rafael', 'João', 'Thiago',
    'Ana', 'Beatriz', 'Camila', 'Larissa', 'Mariana', 'Gabriela', 'Juliana', 'Fernanda', 'Amanda', 'Letícia'
]
last_names = [
    'Silva', 'Santos', 'Oliveira', 'Souza', 'Rodrigues', 'Ferreira', 'Alves', 'Pereira', 'Lima', 'Gomes',
    'Ribeiro', 'Carvalho', 'Melo', 'Barbosa', 'Martins', 'Araújo', 'Moraes', 'Costa', 'Rocha', 'Dias'
]

planos_data = [
    {'plano_id': 1, 'nome_plano': 'Plano Mensal Bronze', 'valor_mensal': 119.90, 'duracao_meses': 1, 'descricao': 'Acesso ilimitado à musculação em horário livre.'},
    {'plano_id': 2, 'nome_plano': 'Plano Trimestral Prata', 'valor_mensal': 99.90, 'duracao_meses': 3, 'descricao': 'Acesso à musculação e aulas coletivas.'},
    {'plano_id': 3, 'nome_plano': 'Plano Anual Ouro', 'valor_mensal': 79.90, 'duracao_meses': 12, 'descricao': 'Acesso total, musculação, aulas e direito a 1 acompanhante no mês.'},
    {'plano_id': 4, 'nome_plano': 'Plano VIP Black', 'valor_mensal': 149.90, 'duracao_meses': 12, 'descricao': 'Acesso a todas as unidades, armário exclusivo e avaliação física mensal.'}
]
df_planos = pd.DataFrame(planos_data)

start_date = datetime(2024, 10, 1, 8, 0, 0)
days_2_years = 730

alunos_data = []
for i in range(1, 51):
    nome = f"{random.choice(first_names)} {random.choice(last_names)}"
    email = f"aluno_{i}_{random.randint(100, 999)}@email.com"
    telefone = f"(85) 9{random.randint(80000000, 99999999)}"
    
    age_days = random.randint(18 * 365, 55 * 365)
    data_nascimento = (datetime.now() - timedelta(days=age_days)).strftime('%Y-%m-%d')
    
    reg_offset = random.uniform(0, days_2_years)
    data_cadastro = start_date + timedelta(days=reg_offset)
    
    alunos_data.append({
        'aluno_id': i,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'data_nascimento': data_nascimento,
        'data_cadastro': data_cadastro.strftime('%Y-%m-%d %H:%M:%S')
    })
df_alunos = pd.DataFrame(alunos_data)

matriculas_data = []
statuses = ['Ativa', 'Ativa', 'Ativa', 'Expirada', 'Cancelada']

for aluno in alunos_data:
    aluno_id = aluno['aluno_id']
    plano = random.choice(planos_data)
    plano_id = plano['plano_id']
    duracao_meses = plano['duracao_meses']
    
    dt_cadastro = datetime.strptime(aluno['data_cadastro'], '%Y-%m-%d %H:%M:%S')
    data_inicio = dt_cadastro.date()
    data_fim = data_inicio + timedelta(days=duracao_meses * 30)
    status = random.choice(statuses)
    
    matriculas_data.append({
        'matricula_id': aluno_id,
        'aluno_id': aluno_id,
        'plano_id': plano_id,
        'data_inicio': data_inicio.strftime('%Y-%m-%d'),
        'data_fim': data_fim.strftime('%Y-%m-%d'),
        'status': status
    })
df_matriculas = pd.DataFrame(matriculas_data)

pagamentos_data = []
formas_pagamento = ['Cartao_Credito', 'PIX', 'Boleto', 'Dinheiro']

for idx, mat in enumerate(matriculas_data, start=1):
    matricula_id = mat['matricula_id']
    plano_id = mat['plano_id']
    plano = next(p for p in planos_data if p['plano_id'] == plano_id)
    valor_pago = plano['valor_mensal']
    
    dt_inicio = datetime.strptime(mat['data_inicio'], '%Y-%m-%d')
    days_offset = random.uniform(0, 5)
    hours_offset = random.uniform(0, 12)
    data_pagamento = dt_inicio + timedelta(days=days_offset, hours=hours_offset)
    
    forma = random.choice(formas_pagamento)
    
    pagamentos_data.append({
        'pagamento_id': idx,
        'matricula_id': matricula_id,
        'valor_pago': valor_pago,
        'data_pagamento': data_pagamento.strftime('%Y-%m-%d %H:%M:%S'),
        'forma_pagamento': forma
    })
df_pagamentos = pd.DataFrame(pagamentos_data)

df_planos.to_csv('planos.csv', index=False)
df_alunos.to_csv('alunos.csv', index=False)
df_matriculas.to_csv('matriculas.csv', index=False)
df_pagamentos.to_csv('pagamentos.csv', index=False)

print("Planos sample:")
print(df_planos.head(2))