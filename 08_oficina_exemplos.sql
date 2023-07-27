SET SQL_SAFE_UPDATES = 0;
USE oficina_db;

-- 	Exemplos:
-- Inserir dois novos alunos no DB, um usando o INSERT e outro usando o CALL SP, no usuário Administrativo
-- Inserir dados financeiros no usuario Financeiro
-- Na tabela pedidos especificar que o aluno 1 não finalizou o pagamento
-- Na tabela pedidos especificar que aluno 2 realizou o pagamento 
-- De volta ao root, entar inserir ambos na tabela de histórico de alunos 
-- Modificar pagamento para Pago e tentar inserir novamente no histórico de alunos


-- 1) Inserindo novos registros na tabela alunos
-- ALUNO 1
INSERT INTO alunos (id_turma, nome, data_nascimento, contato, data_insc, experiencia, expectativas)
VALUES (3, 'Jonata Pereira', '1990-05-15', '(11) 98765-4321', '2023-07-26', 1, 'Espero aprender muito nesta oficina.');
-- ALUNO 2
CALL novo_aluno('Maria Souza', '1995-09-10', 1, '(21) 98765-4321', '2023-07-26', 0, 'Não tenho experiência anterior.');
-- Testando Trigger TR_LOG_ALUNOS
SELECT * FROM LOG_ALUNOS;


-- 2) Inserindo novos registros na tabela financeiro
-- ALUNO 1
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES ('Pix', 500, 0, 0, 500, 0);
-- ALUNO 2
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES ('Cartão de crédito', 250, 50, 0, 200, 0);

SELECT * FROM pedidos;
SELECT * FROM financeiro;
SELECT * FROM alunos;
SELECT * FROM historico_alunos;
-- 3) Inserindo um novo registro na tabela pedidos
-- ALUNO 1
INSERT INTO pedidos (id_aluno, id_transacao, status_pagamento) VALUES (19, 19, 'Pago');
-- ALUNO 2
INSERT INTO pedidos (id_aluno, id_transacao, status_pagamento) VALUES (20, 20, 'Pendente');


-- 4) Inserindo um novo registro na tabela historico_alunos
-- ALUNO 1
INSERT INTO historico_alunos (id_pedido, id_turma, frequencia, aluno_ativo) VALUES (21, 3, 90, 1);
-- ALUNO 2
INSERT INTO historico_alunos (id_pedido, id_turma, frequencia, aluno_ativo) VALUES (22, 1, 75, 0);
-- Verificar trigger TR_LOG_HISTORICO
SELECT * FROM LOG_HISTORICO_ALUNOS;


-- 5) Modificar status_pagamento ALUNO 2 para pago 
UPDATE pedidos SET status_pagamento = 'Pago' WHERE id_pedido = 22;
-- Verificar status do pagamento com a view pagamento_alunos 
SELECT * FROM pagamento_alunos;
-- Inserir aluno no histórico de alunos
INSERT INTO historico_alunos (id_pedido, id_turma, frequencia, aluno_ativo)
VALUES (22, 1, 75, 0);
-- Verificar trigger TR_LOG_HISTORICO
SELECT * FROM LOG_HISTORICO_ALUNOS;


SET SQL_SAFE_UPDATES = 1;