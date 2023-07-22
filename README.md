<h1>Banco de dados para a Oficina de Perna-de-Pau.</h1>
O projeto contempla o desenvolvimento de um banco de dados relacionais para a Oficina Perna-de-Pau.

<h2>Sobre</h2>
xx

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
<img src="https://imgtr.ee/images/2023/07/22/d278e061200ff4c27f068cc99c9d2f69.png" alt="d278e061200ff4c27f068cc99c9d2f69.png" border="0">
<br>

<h2>Tabelas</h2>
Seguindo a lógica das entidades definidas anteriormente, foram estabelecidas cinco tabelas, sendo elas respectivamente historico_alunos, alunos, pedidos, financeiro e turmas.
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
| nome  | VARCHAR(50)  | - | - | Nome do aluno |
| data_nascimento | DATE  | - | -  | Data de nascimento |
| id_turma | INT  | FK | FK_ALUNOS_ID_TURMA  | ID da turma |

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
| id_aluno | INT  | FK | FK_HISTORICO_ALUNOS_ID_ALUNO | ID do aluno |
| data_insc | DATE | - | -  | Data da inscrição |
| contato | VARCHAR(20) | - | -  | Número de contato |
| experiencia | BIT | - | -  | Experiência com perna-de-pau |
| expectativas | VARCHAR(20) | - | -  | Expectativas com a oficina |
| frequencia | INT  | - | -  | Frequência nas aulas |

<br><br>
<h2>Views</h2>
Para otimizar consultas na tabela, foram criadas 5 views, sendo elas pagamento_alunos, alunos_turma, expectativas_experiencia, contatos e alunos_por_turma. 

<h3>pagamento_alunos</h3>
A view pagamento_alunos possui os dados pessoais de cada aluno juntamente com as informações financeiras, para verificar se algum aluno pagou ou não a mensalidade.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/a51799760a2bc1a398c97a9bd7f7293d.png" alt="a51799760a2bc1a398c97a9bd7f7293d.png" border="0">
<br>

<h3>alunos_turma</h3>
A view alunos_turma é composta pela matricula e nome dos alunos, a turma em que estão matriculados e a frequência nas aulas, sendo este último o principal objetivo da view.
<br><br>

<h3>expectativas_experiencia</h3>
A view de expectativas_experiencia tem como objetivo mostrar os dados de expectativas do curso e experiência de cada aluno.
<br><br>

<h3>contatos</h3>
A view contatos tem como objetivo mostrar o contato de cada aluno, juntamente com a data de ingresso.
<br><br>

<h3>alunos_por_turma</h3>
A view alunos_por_turma possui a quantidade de alunos por turma, horário das aulas e a quantidade de aulas.
<br><br>
