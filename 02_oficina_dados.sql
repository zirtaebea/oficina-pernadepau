-- Inserindo dados na tabela turmas
INSERT INTO turmas (horario_turma, qt_aulas) VALUES
    ('08:00', 20),
    ('10:30', 15),
    ('14:00', 25);

-- Inserindo dados na tabela financeiro
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES
    ('Cartão de Crédito', 500, 50, 0, 450, 0),
    ('Boleto', 300, 0, 0, 300, 0),
    ('Transferência', 200, 0, 0, 200, 0),
    ('Pix', 500, 0, 0, 500, 0),
    ('Dinheiro', 150, 0, 0, 150, 0),
    ('Cartão de Débito', 500, 50, 0, 450, 0),
    ('Boleto', 350, 0, 0, 350, 0),
    ('Transferência', 500, 0, 0, 500, 0),
    ('Pix', 500, 0, 0, 500, 0),
    ('Dinheiro', 150, 0, 0, 150, 0),
    ('Cartão de Crédito', 500, 50, 0, 450, 0),
    ('Pix', 350, 0, 0, 350, 0),
    ('Transferência', 250, 0, 0, 250, 0),
    ('Pix', 500, 0, 0, 500, 0),
    ('Dinheiro', 500, 0, 0, 500, 0);

-- Inserindo dados na tabela alunos
INSERT INTO alunos (id_turma, nome, data_nascimento, contato, data_insc, experiencia, expectativas) VALUES
    (1, 'João Silva', '1995-05-15', '(11) 98765-4321', '2023-07-25', 1, 'Espero aprender muito nesta turma.'),
    (2, 'Maria Souza', '1998-12-10', '(21) 99876-5432', '2023-07-26', 1, 'Estou ansiosa para começar.'),
    (3, 'Pedro Santos', '1990-09-22', '(31) 87654-3210', '2023-07-25', 0, 'Gostaria de aprimorar minhas habilidades.'),
    (1, 'Ana Oliveira', '2000-03-05', '(51) 91234-5678', '2023-07-27', 1, 'Mal posso esperar para aprender mais.'),
    (2, 'Carlos Mendes', '1997-11-18', '(11) 93245-6789', '2023-07-30', 1, 'Tenho interesse em desenvolver novas habilidades.'),
    (2, 'Larissa Oliveira', '1997-06-30', '(11) 91234-5678', '2023-07-27', 1, 'Estou animada para participar.'),
    (3, 'Fernando Mendes', '1993-11-18', '(21) 93245-6789', '2023-07-30', 0, 'Espero melhorar minhas habilidades.'),
    (1, 'Camila Rodrigues', '1998-03-05', '(31) 91234-5678', '2023-07-27', 1, 'Ansiosa para aprender mais.'),
    (2, 'Lucas Sousa', '1994-09-15', '(51) 99876-5432', '2023-07-26', 1, 'Quero aprimorar minhas técnicas.'),
    (3, 'Amanda Lima', '2002-07-12', '(11) 93245-6789', '2023-07-30', 0, 'Dedicada em aprender tudo que puder.'),
    (1, 'Rafaela Santos', '1996-04-22', '(21) 98765-4321', '2023-07-25', 1, 'Estou empolgada para aprender novas técnicas.'),
    (2, 'Gustavo Silva', '1999-12-05', '(31) 99876-5432', '2023-07-26', 1, 'Quero me especializar na área.'),
    (3, 'Fernanda Souza', '1991-08-17', '(51) 91234-5678', '2023-07-27', 1, 'Espero que seja uma experiência enriquecedora.'),
    (1, 'Marcelo Oliveira', '1997-11-28', '(11) 99876-5432', '2023-07-28', 0, 'Estou começando agora e tenho muito a aprender.'),
    (2, 'Carolina Mendes', '1995-03-10', '(21) 98765-4321', '2023-07-30', 0, 'Ansiosa para desenvolver minhas habilidades.');

-- Inserindo dados na tabela pedidos
INSERT INTO pedidos (id_aluno, id_transacao, status_pagamento) VALUES
    (1, 1, 'Pago'),
    (2, 2, 'Pendente'),
    (3, 3, 'Pago'),
    (4, 4, 'Pendente'),
    (5, 5, 'Pago'),
    (6, 6, 'Recusado'),
    (7, 7, 'Pendente'),
    (8, 8, 'Pago'),
    (9, 9, 'Pendente'),
    (10, 10, 'Pago'),
    (11, 11, 'Recusado'),
    (12, 12, 'Pendente'),
    (13, 13, 'Pago'),
    (14, 14, 'Pendente'),
    (15, 15, 'Pago');

-- Inserindo dados na tabela historico_alunos
INSERT INTO historico_alunos (id_pedido, id_turma, frequencia, aluno_ativo) VALUES
    (1, 1, 90, 1),
    (3, 3, 75, 1),
    (5, 2, 80, 1),
    (8, 1, 95, 1),
    (10, 3, 85, 1),
    (13, 3, 70, 0),
    (15, 2, 100, 1);

