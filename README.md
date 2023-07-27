<h1>Banco de dados para a Oficina de Perna-de-Pau</h1>
O projeto contempla o desenvolvimento de um banco de dados relacionais para a Oficina Perna-de-Pau.

<h2>Sobre</h2>
A Oficina Perna de Pau é a atual maior escola, que oferece aulas de perna de pau no Rio de Janeiro.
<br><br>
Com o crescimento de seu número de alunos, intensificou-se a necessidade de uma preparação mais adequada dos dados gerados a partir dessas aulas para um crescimento mais saudável utilizando inteligência de negócio para melhorar a gestão do negócio.
<br><br>
O grande volume de informações descentralizadas foi se tornando um obstáculo no crescimento do negócio. Uma vez que o tempo utilizado na organização do próprio negócio poderia ser melhor administrado para questões relacionadas a negociação e fechamento das vendas. 

<h2>Scripts</h2>

1) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/00_oficina_create.sql">Criação de tabelas</a><br>
2) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/01_oficina_dados.sql">Inserção de dados</a><br>
3) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/02_oficina_views.sql">Views</a><br>
4) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/03_oficina_functions.sql">Funções</a><br>
5) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/04_oficina_stored_procedures.sql">Stored Procedures</a><br>
6) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/05_oficina_triggers.sql">Triggers</a><br>
7) <a href="https://github.com/zirtaebea/oficina-pernadepau/blob/main/06_oficina_users.sql">Usuários</a><br>

<br>
Observação: É importante que os scripts sejam rodados na ordem indicada pela numeração.
<br>

<h2>Entidades, atributos e relacionamentos</h2>
Para a composição do banco de dados, foram definidas <b>cinco</b> entidades <br>
- Turmas;<br>
- Alunos;<br>
- Financeiro;<br>
- Pedidos e<br>
- Histórico de alunos.
<br>
<br>
Os atributos e relacionamentos entre as entidades definidas podem ser vistos no diagrama a seguir: 
<br><br>
<img src="https://imgtr.ee/images/2023/07/27/36bff173c183f77a31f18b49ecb94d19.png" alt="36bff173c183f77a31f18b49ecb94d19.png" border="0">
<br>

<h2>Tabelas</h2>
Seguindo a lógica das entidades definidas anteriormente, foram estabelecidas cinco tabelas, sendo elas respectivamente turmas, alunos, financeiro, pedidos e historico_alunos.
<br>

<h3>turmas</h3>
A tabela turmas possui informações de turma, quantidade de aulas e horários.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_turma  | INT  |  PK  | PRIMARY  | ID da turma  |
| horario_turma  | VARCHAR(10)  | - | - | Horário da aula da turma |
| qt_aulas | INT  | - | -  | Quantidade de aulas por turma |

<br>

<h3>alunos</h3>
A tabela alunos contém os dados pessoais dos alunos, como nome e data de nascimento, além da turma que frequenta.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_aluno | INT  |  PK  | PRIMARY  | ID do aluno  |
| id_turma | INT  | FK | FK_ALUNOS_ID_TURMA  | ID da turma |
| nome  | VARCHAR(50)  | - | - | Nome do aluno |
| data_nascimento | DATE  | - | -  | Data de nascimento |
| contato | VARCHAR(20) | -| - | Contato do aluno |
| data_insc | DATE | -| - | Data de inscrição |
| experiencia | BIT(1) | - | -  | Experiência com perna-de-pau |
| expectativas | VARCHAR(200) | - | -  | Expectativas com a oficina |

<br>

<h3>financeiro</h3>
A tabela financeiro contém dados financeiros alunos matriculados. É a partir dela que é gerado o id_transação que identifica as informações financeiras dos alunos. A tabela contém dados sobre o método de pagamento, tabela e valor total pago.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_transacao  | INT  |  PK  | PRIMARY  | ID da transacao  |
| metodo_pagamento  | VARCHAR(20)  | - | - | Método de pagamento |
| total_pago | INT  | - | -  | Valor total pago |
| vt_estornaveis | INT  | - | -  | Valor de taxas estornáveis |
| vt_n_estornaveis | INT  | - | -  | Valor de taxas não estornáveis |
| estornado | INT  | - | -  | Valor estornado |

<br>

<h3>pedidos</h3>
A tabela pedidos possui o registro dos pedidos realizados por cada aluno, o id da transação e o status de pagamento da oficina. 
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_pedido | INT  |  PK  | PRIMARY  | ID do pedido  |
| id_aluno | INT  | FK | FK_PEDIDOS_ID_ALUNO | ID do aluno |
| id_transacao  | INT  | FK | FK_PEDIDOS_ID_TRANSACAO | ID da transação |
| status_pagamento | VARCHAR(20)  | - | -  | Status de pagamento |

<br>

<h3>historico_alunos</h3>
A tabela historico_alunos possui dados dos alunos matriculados na oficina perna-de-pau. São dados gerados inicialmente no ato da matrícula a partir de um formulário, juntamente com os ids de pedido, turma e aluno.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| n_matricula  | INT  |  PK  | PRIMARY  | Número de matricula |
| id_pedido  |  INT | FK | FK_HISTORICO_ALUNOS_ID_PEDIDO | ID do pedido |
| id_turma | INT  | FK | FK_HISTORICO_ALUNOS_ID_TURMA | ID da turma |
| frequencia | INT  | - | -  | Frequência nas aulas |
| aluno_ativo | INT  | - | -  | Aluno ativo ou se já finalizou a oficina. |

<br><br>

<h2>Tabelas de auditoria</h2>
<h3>LOG_ALUNOS</h3>
A tabela LOG_ALUNOS apresenta o histórico de inserção de dados na tabela alunos.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_aluno  | INT  |  PK  | PRIMARY  | ID do aluno |
| nome  | VARCHAR(50)  |  -  | - | Nome do aluno |
| user  | VARCHAR(100)  |  -  | - | Usuário que inseriu no banco de dados |
| data_alteracao  | DATETIME  |  -  | - | Data de inserção|

<br>

<h3>LOG_HISTORICO_ALUNOS</h3>
A tabela LOG_HISTORICO_ALUNOS apresenta o histórico de tentativas de inserção de dados (sucedidas ou não) na tabela historico_aluno.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_pedido  | INT  |  - | - | ID do pedido |
| user |  VARCHAR(100)  | -  | - | Usuário que inseriu/tentou inserir no banco de dados |
| data_hora | DATETIME  |  -  | -  | Data de inserção e/ou tentativa|

<br>

<br><br>
<h2>Views</h2>
Para otimizar consultas na tabela, foram criadas 5 views, sendo elas pagamento_alunos, alunos_turma, expectativas_experiencia, contatos e alunos_por_turma. 

<h3>pagamento_alunos</h3>
A view pagamento_alunos possui os dados pessoais de cada aluno juntamente com as informações financeiras, para verificar se algum aluno pagou ou não a mensalidade e quanto falta para ser pago.
<br><br>
<img src="https://imgtr.ee/images/2023/07/27/20e3cccc61e422b9fcd2affa0fa931a2.png" alt="20e3cccc61e422b9fcd2affa0fa931a2.png" border="0">
<br>

<h3>alunos_turma</h3>
A view alunos_turma é composta pela matricula e nome dos alunos, a turma em que estão matriculados e a frequência nas aulas, sendo este último o principal objetivo da view.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/e7aed33c7658ea14853edc2f0651b9c8.png" alt="e7aed33c7658ea14853edc2f0651b9c8.png" border="0">
<br>

<h3>expectativas_experiencia</h3>
A view de expectativas_experiencia tem como objetivo mostrar os dados de expectativas do curso e experiência de cada aluno.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/a9e03311f40e74a2507ab5aed2c35470.png" alt="a9e03311f40e74a2507ab5aed2c35470.png" border="0">
<br>

<h3>contatos</h3>
A view contatos tem como objetivo mostrar o contato de cada aluno, juntamente com a data de ingresso.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/41c8e85fd586349f9ae1e2921a1c6ed7.png" alt="41c8e85fd586349f9ae1e2921a1c6ed7.png" border="0">
<br>

<h3>alunos_por_turma</h3>
A view alunos_por_turma possui a quantidade de alunos por turma, horário das aulas e a quantidade de aulas.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/2b4792f13847353cc4c3888088c19a3e.png" alt="2b4792f13847353cc4c3888088c19a3e.png" border="0">
<br>

<h2>Funções</h2>
As funções criadas para esse banco de dados foram a receita_total e a total_taxas, com o objetivo de calcular valores da tabela financeiro e facilitar a análise da receita gerada pelo curso.

<h3>receita_total</h3>
É a diferença entre o valor líquido (parâmetro 1) e o valor das taxas estornáveis (parâmetro 2).
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/12e3e97ec90af5191b0294edb9e9b665.png" alt="12e3e97ec90af5191b0294edb9e9b665.png" border="0">
<br>

<h3>total_taxas</h3>
É o somatório de todas as taxas, estornáveis (parâmetro 1) e não estornáveis (parâmetro 2).
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/f53601f049e7c4f2fab58899d8fcb973.png" alt="f53601f049e7c4f2fab58899d8fcb973.png" border="0">
<br>

 <h2>Stored Procedures</h2>
 Foram elaborados dois stored procedures, um de ordenamento de tabelas e outro para inserção de novos alunos na tabela alunos.

 <h3>ordem_tabela</h3>
 Ordena qualquer tabela do banco de dados a partir de três parâmetros: t_nome (nome da tabela), col_campo (campo de referência para o ordenamento) e ordem (ascendente ou descendente).
 <br><br>
<img src="https://imgtr.ee/images/2023/07/22/f4c0fa76a829fa91743571f62347162c.png" alt="f4c0fa76a829fa91743571f62347162c.png" border="0">
 <br>

<h3>novo_aluno</h3>
Insere um novo aluno na tabela alunos, recebendo como parâmetro: a_nome (nome do aluno), a_dnasc (data de nascimento) e turma (número da turma).
<br><br>
<img src="https://imgtr.ee/images/2023/07/27/530fc375423c52a0f9d35f5d741a4f71.png" alt="530fc375423c52a0f9d35f5d741a4f71.png" border="0">
<br>


<h2>Triggers</h2>
Os triggers foram elaborados juntamente com as tabelas de log/auditoria (LOG_ALUNOS e LOG_HISTORICO_ALUNOS), e tem a funcionalidade de registrar e verificar dados no banco antes de inseri-los.

<h3>TR_LOG_ALUNOS</h3>
É acionado depois que um novo aluno é inserido no banco de dados. O registro de inserção é salvo na tabela LOG_ALUNOS e conta com os dados do aluno inserido, o usuário que fez o procedimento e o momento (data e hora).
<br><br>
<img src="https://imgtr.ee/images/2023/07/27/2fd093529e3f8bff36c9a29217fdafdd.png" alt="2fd093529e3f8bff36c9a29217fdafdd.png" border="0">
<br>

<h3>TR_LOG_HISTORICO_ALUNOS</h3>
É feita a verificação do status de pagamento do pedido do aluno antes de inserir os dados dele na tabela historico_alunos. Caso o pagamento não tenha sido realizado, aparecerá uma mensagem de erro. O acompanhamento da inserção desses dados é feita na tabela LOG_HISTORICO_ALUNOS, que conta com o número do pedido, usuário e a data e hora do procedimento.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/e9df40c650169533ad3b1773a8f0f47a.png" alt="e9df40c650169533ad3b1773a8f0f47a.png" border="0">
<br>

<h2>Usuários e permissões</h2>
Foram criados três perfis de usuários diferentes para manipulação dos dados do banco, são eles:<br>
- RH; <br>
- Financeiro;<br>
- Administrativo;<br>
<br>
<h3>RH</h3>
O perfil RH é destinado para o setor de Recursos Humanos e só está permitido a acessar os dados de todas as tabelas pelo modo de leitura (SELECT). 
<br><br>

| Descrição  | DML | Grants | Tabelas
| ---- | ------ |-----------| ------- |
| Leitura | SELECT |  Sim |  turmas, alunos, financeiro, pedidos e historico_alunos |
| Inserção | INSERT |  Não |  -  |
| Atualização | UPDATE |  Não | -  |  
| Remoção | DELETE | Não |   -  |

<br>

<h3>Financeiro</h3>
O perfil Financeiro é destinado para o setor de contabilidade. O usuário poderá ler os dados de todas as tabelas (SELECT) mas apenas pode inserir ou modificar (INSERT, UPDATE) os dados das tabelas pedidos e financeiro. 
<br><br>

| Descrição  | DML | Grants | Tabelas
| ---- | ------ |-----------| ------- |
| Leitura | SELECT |  Sim | turmas, alunos, financeiro, pedidos e historico_alunos  |
| Inserção | INSERT |  Sim |  financeiro e pedidos |
| Atualização | UPDATE |  Sim | financeiro e pedidos |  
| Remoção | DELETE | Não |  -   |

<br>

<h3>Administrativo</h3>
O perfil Administrativo está destinado ao setor de administração e poderá ler os dados de todas as tabelas (SELECT) mas apenas inserir ou modificar (INSERT, UPDATE) os dados das tabelas turmas, alunos e historico_alunos.
<br><br>

| Descrição  | DML | Grants | Tabelas
| ---- | ------ |-----------| ------- |
| Leitura | SELECT |  Sim |  turmas, alunos, financeiro, pedidos e historico_alunos |
| Inserção | INSERT |  Sim |  turmas, alunos e historico_alunos |
| Atualização | UPDATE | Sim | turmas, alunos e historico_alunos |  
| Remoção | DELETE | Não |  -   |

<h3>Exemplos de utilização</h3>
<h4>Inserindo um novo aluno na tabela alunos</h4>

Podemos tentar inserir novos dados com o seguinte código: 
```
INSERT INTO alunos (id_turma, nome, data_nascimento, contato, data_insc, experiencia, expectativas)
VALUES (2, 'Lucas Santos', '1992-03-20', '(31) 12345-6789', '2023-07-26', 1, 'Espero aprender muito sobre o assunto.');

```
Caso preferir, poderá usar também o stored procedure `novo_aluno`:

```
CALL novo_aluno('Joana Silva', '1998-08-25', 3, '(41) 98765-4321', '2023-07-26', 1, 'Tenho interesse em aprender novas técnicas.');

```
O resultado dos exemplos consultando na tabela `alunos` será o seguinte: 
```
SELECT * FROM alunos;
+----------+----------+------------------+-----------------+-----------------+------------+--------------------------+-------------------------------------------------------------------------+
| id_aluno | id_turma | nome             | data_nascimento | contato         | data_insc  | experiencia              | expectativas                                                            |
+----------+----------+------------------+-----------------+-----------------+------------+--------------------------+-------------------------------------------------------------------------+
|        1 |        1 | João Silva       | 1995-05-15      | (11) 98765-4321 | 2023-07-25 | 0x01                     | Espero aprender muito nesta turma.                                      |
|        2 |        2 | Maria Souza      | 1998-12-10      | (21) 99876-5432 | 2023-07-26 | 0x01                     | Estou ansiosa para começar.                                             |
|        3 |        3 | Pedro Santos     | 1990-09-22      | (31) 87654-3210 | 2023-07-25 | 0x00                     | Gostaria de aprimorar minhas habilidades.                               |
|        4 |        1 | Ana Oliveira     | 2000-03-05      | (51) 91234-5678 | 2023-07-27 | 0x01                     | Mal posso esperar para aprender mais.                                   |
|        5 |        2 | Carlos Mendes    | 1997-11-18      | (11) 93245-6789 | 2023-07-30 | 0x01                     | Tenho interesse em desenvolver novas habilidades.                       |
|        6 |        2 | Larissa Oliveira | 1997-06-30      | (11) 91234-5678 | 2023-07-27 | 0x01                     | Estou animada para participar.                                          |
|        7 |        3 | Fernando Mendes  | 1993-11-18      | (21) 93245-6789 | 2023-07-30 | 0x00                     | Espero melhorar minhas habilidades.                                     |
|        8 |        1 | Camila Rodrigues | 1998-03-05      | (31) 91234-5678 | 2023-07-27 | 0x01                     | Ansiosa para aprender mais.                                             |
|        9 |        2 | Lucas Sousa      | 1994-09-15      | (51) 99876-5432 | 2023-07-26 | 0x01                     | Quero aprimorar minhas técnicas.                                        |
|       10 |        3 | Amanda Lima      | 2002-07-12      | (11) 93245-6789 | 2023-07-30 | 0x00                     | Dedicada em aprender tudo que puder.                                    |
|       11 |        1 | Rafaela Santos   | 1996-04-22      | (21) 98765-4321 | 2023-07-25 | 0x01                     | Estou empolgada para aprender novas técnicas.                           |
|       12 |        2 | Gustavo Silva    | 1999-12-05      | (31) 99876-5432 | 2023-07-26 | 0x01                     | Quero me especializar na área.                                          |
|       13 |        3 | Fernanda Souza   | 1991-08-17      | (51) 91234-5678 | 2023-07-27 | 0x01                     | Espero que seja uma experiência enriquecedora.                          |
|       14 |        1 | Marcelo Oliveira | 1997-11-28      | (11) 99876-5432 | 2023-07-28 | 0x00                     | Estou começando agora e tenho muito a aprender.                         |
|       15 |        2 | Carolina Mendes  | 1995-03-10      | (21) 98765-4321 | 2023-07-30 | 0x00                     | Ansiosa para desenvolver minhas habilidades.                            |
|       16 |        1 | Julia Ferreira   | 1992-12-05      | (11) 98765-1111 | 2023-08-01 | 0x01                     | Tenho interesse em programação e quero aprofundar meus conhecimentos.   |
|       17 |        2 | Lucas Santos     | 1992-03-20      | (31) 12345-6789 | 2023-07-26 | 0x01                     | Espero aprender muito sobre o assunto.                                  |
|       18 |        3 | Joana Silva      | 1998-08-25      | (41) 98765-4321 | 2023-07-26 | 0x01                     | Tenho interesse em aprender novas técnicas.                             |
+----------+----------+------------------+-----------------+-----------------+------------+--------------------------+-------------------------------------------------------------------------+

```
Poderá consultar posteriormente as inserções realizadas na tabela por meio da tabela de auditoria `LOG_ALUNOS`.
<br><br><br>

<h4>Inserindo registros na tabela financeiro</h4>

```
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES ('Boleto', 400, 50, 0, 350, 0);
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES ('Dinheiro', 300, 0, 0, 300, 0);
```
Ao consultar a tabela `financeiro` podemos verificar a seguinte tabela:

```
SELECT * FROM financeiro;
+--------------+---------------------+------------+----------------+------------------+-----------+-----------+
| id_transacao | metodo_pagamento    | total_pago | vt_estornaveis | vt_n_estornaveis | v_liquido | estornado |
+--------------+---------------------+------------+----------------+------------------+-----------+-----------+
|            1 | Cartão de Crédito   |        500 |             50 |                0 |       450 |         0 |
|            2 | Boleto              |        300 |              0 |                0 |       300 |         0 |
|            3 | Transferência       |        200 |              0 |                0 |       200 |         0 |
|            4 | Pix                 |        500 |              0 |                0 |       500 |         0 |
|            5 | Dinheiro            |        150 |              0 |                0 |       150 |         0 |
|            6 | Cartão de Débito    |        500 |             50 |                0 |       450 |         0 |
|            7 | Boleto              |        350 |              0 |                0 |       350 |         0 |
|            8 | Transferência       |        500 |              0 |                0 |       500 |         0 |
|            9 | Pix                 |        500 |              0 |                0 |       500 |         0 |
|           10 | Dinheiro            |        150 |              0 |                0 |       150 |         0 |
|           11 | Cartão de Crédito   |        500 |             50 |                0 |       450 |         0 |
|           12 | Pix                 |        350 |              0 |                0 |       350 |         0 |
|           13 | Transferência       |        250 |              0 |                0 |       250 |         0 |
|           14 | Pix                 |        500 |              0 |                0 |       500 |         0 |
|           15 | Dinheiro            |        500 |              0 |                0 |       500 |         0 |
|           16 | Cartão de Crédito   |        250 |             20 |                5 |       225 |         0 |
|           17 | Boleto              |        400 |             50 |                0 |       350 |         0 |
|           18 | Dinheiro            |        300 |              0 |                0 |       300 |         0 |
+--------------+---------------------+------------+----------------+------------------+-----------+-----------+

```
<br><br><br>

<h4>Inserindo registros na tabela pedidos</h4>

```
INSERT INTO pedidos (id_aluno, id_transacao, status_pagamento) VALUES (17, 17, 'Pendente');
INSERT INTO pedidos (id_aluno, id_transacao, status_pagamento) VALUES (18, 18, 'Pago');
```
Podemos verificar os dados inseridos na tabela `pedidos`:

```
SELECT * FROM pedidos;
+-----------+----------+--------------+------------------+
| id_pedido | id_aluno | id_transacao | status_pagamento |
+-----------+----------+--------------+------------------+
|         1 |        1 |            1 | Pago             |
|         2 |        2 |            2 | Pendente         |
|         3 |        3 |            3 | Pago             |
|         4 |        4 |            4 | Pendente         |
|         5 |        5 |            5 | Pago             |
|         6 |        6 |            6 | Recusado         |
|         7 |        7 |            7 | Pendente         |
|         8 |        8 |            8 | Pago             |
|         9 |        9 |            9 | Pendente         |
|        10 |       10 |           10 | Pago             |
|        11 |       11 |           11 | Recusado         |
|        12 |       12 |           12 | Pendente         |
|        13 |       13 |           13 | Pago             |
|        14 |       14 |           14 | Pendente         |
|        15 |       15 |           15 | Pago             |
|        18 |       16 |           16 | Pago             |
|        19 |       17 |           17 | Pendente         |
|        20 |       18 |           18 | Pago             |
+-----------+----------+--------------+------------------+

```

<h4>Inserindo registros na tabela historico_alunos </h4>
Antes é preciso saber que, para inserir um aluno na tabela de histórico de alunos, o aluno deverá ter pago a mensalidade ou o valor integral da oficina. Caso não aconteça, sua matricula não será efetivada. Portanto, tente executar: 

```


```


<h4>Logs de auditoria</h4>

