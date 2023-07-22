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

<h3>turmas</h3>
A tabela turmas possui informações de turma, quantidade de aulas e horários.
<br><br>

| Nome do atributo  | Tipo do dado | Chave | Índice | Descrição |
| ----------------- | ------------- |------------- | ------------- | ------------- |
| id_turma  | INT  |  PK  | PRIMARY  | ID da turma  |
| horario_turma  | VARCHAR(10)  | - | - | Horário da aula da turma |
| qt_aulas | INT  | - | -  | Quantidade de aulas por turma |

<h3>alunos</h3>
A tabela alunos contém os dados pessoais dos alunos, como nome e data de nascimento, além da turma que frequenta.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/b1c3fa71b3dddf0abe75bdba72edfb1b.png" alt="b1c3fa71b3dddf0abe75bdba72edfb1b.png" border="0">

<h3>financeiro</h3>
A tabela financeiro contém dados financeiros alunos matriculados. É a partir dela que é gerado o id_transação que identifica as informações financeiras dos alunos. A tabela contém dados sobre o método de pagamento, tabela e valor total pago.
<br><br>


<h3>historico_alunos</h3>
A tabela historico_alunos possui dados dos alunos matriculados na oficina perna-de-pau. São dados gerados inicialmente no ato da matrícula a partir de um formulário, juntamente com os ids de pedido, turma e aluno.
<br><br>
<img src="https://imgtr.ee/images/2023/07/22/f9f77c51f7d5574b306bf1253143faf1.png" alt="f9f77c51f7d5574b306bf1253143faf1.png" border="0">
