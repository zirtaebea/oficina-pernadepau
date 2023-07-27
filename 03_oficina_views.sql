-- criando views
-- 1) view de status de pagamento por aluno - aluno nome + contato + metodo pagamento + status do pagamento + total pago
CREATE OR REPLACE VIEW pagamento_alunos AS
	(	SELECT p.id_pedido, a.nome, a.contato, f.metodo_pagamento, 
		p.status_pagamento, f.total_pago, (max(500) - min(f.total_pago)) as falta
		FROM alunos a 
		JOIN pedidos p ON (p.id_aluno = a.id_aluno) 
		JOIN financeiro f ON (f.id_transacao = p.id_transacao)
		WHERE a.id_aluno = p.id_aluno
        GROUP BY p.id_pedido);
        
SELECT * FROM pagamento_alunos;

-- 2) frequencia do aluno nas aulas - aluno nome + matricula + turma + frequencia
CREATE OR REPLACE VIEW alunos_turma AS 
	(	SELECT h.n_matricula, a.nome, a.id_turma, 
		t.horario_turma, h.frequencia FROM alunos a
		JOIN turmas t ON (t.id_turma = a.id_turma)
        JOIN pedidos p ON (p.id_aluno = a.id_aluno)
		JOIN historico_alunos h ON (h.id_pedido = p.id_pedido)
		WHERE a.id_turma = t.id_turma
		ORDER BY n_matricula ASC);

SELECT * FROM alunos_turma;

-- 3) experiencia do aluno - aluno nome + matricula + experiencia
CREATE OR REPLACE VIEW expectativas_experiencia AS 
	(	SELECT h.n_matricula, a.nome, h.aluno_ativo, a.experiencia, 
		a.expectativas 
        FROM alunos a 
        JOIN pedidos p ON (p.id_aluno = a.id_aluno)
		JOIN historico_alunos h ON (h.id_pedido = p.id_pedido)
		ORDER BY h.n_matricula ASC);

SELECT * FROM expectativas_experiencia;

-- 4) contato dos alunos - nome aluno + matricula + data_insc + turma + contato
CREATE OR REPLACE VIEW contatos AS 
	(	SELECT h.n_matricula, a.nome, a.id_turma, a.data_insc, a.contato 
		FROM alunos a 
        JOIN pedidos p ON (p.id_aluno = a.id_aluno)
		JOIN historico_alunos h ON (h.id_pedido = p.id_pedido)
		ORDER BY h.n_matricula ASC);

SELECT * FROM contatos;

-- 5) alunos por turma - turma + count alunos daquela turma
CREATE OR REPLACE VIEW alunos_por_turma AS 
	(	SELECT COUNT(a.id_turma) as n_alunos, t.id_turma, t.horario_turma, t.qt_aulas 
		FROM alunos a
		JOIN turmas t ON (t.id_turma = a.id_turma)
		GROUP BY a.id_turma
		ORDER BY t.id_turma asc);

SELECT * FROM alunos_por_turma;