use oficina_db;

-- 1) criando usuarios
-- financeiro
CREATE USER 'financeiro'@'localhost' IDENTIFIED BY 'Financeiro@1234$';

-- rh
CREATE USER 'rh'@'localhost'IDENTIFIED BY 'loginDoRh@1234$';

-- administrativo
CREATE USER 'administrativo'@'localhost'IDENTIFIED BY 'Administra@1234$';



-- 2) permissões do user financeiro
-- apenas modificar a tabela pedido e financeiro, o resto só leitura
GRANT SELECT ON oficina_db.historico_alunos TO 'financeiro'@'localhost';
GRANT SELECT ON oficina_db.alunos TO 'financeiro'@'localhost';
GRANT SELECT ON oficina_db.turmas TO 'financeiro'@'localhost';
-- stored procedure
GRANT EXECUTE ON PROCEDURE oficina_db.ordem_tabela TO 'financeiro'@'localhost';
-- modo leitura
GRANT SELECT, UPDATE, INSERT ON oficina_db.pedidos TO 'financeiro'@'localhost';
GRANT SELECT, UPDATE, INSERT ON oficina_db.financeiro TO 'financeiro'@'localhost';
-- views
GRANT SELECT ON oficina_db.pagamento_alunos TO 'financeiro'@'localhost';
-- mostrando permissões
SHOW GRANTS FOR 'financeiro'@'localhost';



-- 3) permissões user rh
-- apenas leitura
GRANT SELECT ON oficina_db.historico_alunos TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.alunos TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.turma TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.pedidos TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.financeiro TO 'rh'@'localhost';
-- stored procedure
GRANT EXECUTE ON PROCEDURE oficina_db.ordem_tabela TO 'rh'@'localhost';
-- views
GRANT SELECT ON oficina_db.pagamento_alunos TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.alunos_por_turma TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.alunos_turma TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.contatos TO 'rh'@'localhost';
GRANT SELECT ON oficina_db.expectativas_experiencia TO 'rh'@'localhost';
-- mostrando permissões
SHOW GRANTS FOR 'rh'@'localhost';



-- 4) permissões do user administrativo
-- apenas modificar historico_alunos, alunos e turma
GRANT SELECT, UPDATE, INSERT ON oficina_db.historico_alunos TO 'administrativo'@'localhost';
GRANT SELECT, UPDATE, INSERT ON oficina_db.alunos TO 'administrativo'@'localhost';
GRANT SELECT, UPDATE, INSERT ON oficina_db.turmas TO 'administrativo'@'localhost';
GRANT SELECT, UPDATE, INSERT ON oficina_db.LOG_ALUNOS TO 'administrativo'@'localhost';
GRANT SELECT, UPDATE, INSERT ON oficina_db.LOG_HISTORICO_ALUNOS TO 'administrativo'@'localhost';
-- stored procedures
GRANT EXECUTE ON PROCEDURE oficina_db.novo_aluno TO 'administrativo'@'localhost';
GRANT EXECUTE ON PROCEDURE oficina_db.ordem_tabela TO 'administrativo'@'localhost';
-- views
GRANT SELECT ON oficina_db.pagamento_alunos TO 'administrativo'@'localhost';
GRANT SELECT ON oficina_db.alunos_por_turma TO 'administrativo'@'localhost';
GRANT SELECT ON oficina_db.alunos_turma TO 'administrativo'@'localhost';
GRANT SELECT ON oficina_db.contatos TO 'administrativo'@'localhost';
GRANT SELECT ON oficina_db.expectativas_experiencia TO 'administrativo'@'localhost';
-- modo leitura em pedidos e financeiro
GRANT SELECT ON oficina_db.pedidos TO 'administrativo'@'localhost';
GRANT SELECT ON oficina_db.financeiro TO 'administrativo'@'localhost';
-- mostrando permissões
SHOW GRANTS FOR 'administrativo'@'localhost';
