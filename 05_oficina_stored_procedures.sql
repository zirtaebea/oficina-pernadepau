-- 1) ordenamento de tabelas
DELIMITER //
CREATE PROCEDURE `ordem_tabela` (t_nome VARCHAR(30), col_campo VARCHAR(30), ordem VARCHAR(5))
BEGIN
    IF ordem = 'ASC' OR ordem = 'asc' THEN
        SET @ordenamento = CONCAT('SELECT * FROM ', t_nome, ' ORDER BY ', col_campo, ' ASC;');
    ELSE
        SET @ordenamento = CONCAT('SELECT * FROM ', t_nome, ' ORDER BY ', col_campo, ' DESC;');
    END IF;

    PREPARE stmt FROM @ordenamento;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//

-- 2) inserir novo aluno no db
DELIMITER // 
CREATE PROCEDURE `novo_aluno` (a_nome VARCHAR(50), a_dnasc DATE, turma INT, contato VARCHAR(20), insc DATE, exper BIT, expec VARCHAR(200))
BEGIN
    INSERT INTO alunos (id_turma, nome, data_nascimento, contato, data_insc, experiencia, expectativas) VALUES
    (turma, a_nome, a_dnasc, contato, insc, exper, expec);
END;
//

