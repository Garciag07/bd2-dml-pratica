# Banco de Dados 2 - DML - Prática
Prática com instruções SQL DML (Data Manipulation Language). Disciplina Banco de Dados 2

### Iniciar o ambiente
    docker compose up -d

### Acessar o banco de dados
    docker exec -it mysql_bd2 mysql -u dev -p'minhasenha' --database universidade

Os parâmetros desse comando são definidos no docker-compose.yml

### Encerrar o ambiente
    exit
    docker compose down

[! IMPORTANTE] O comando docker compose down irá apagar todas as alterações realizadas

## Prática
Praticar operações `INSERT`, `SELECT`, `UPDATE` e `DELETE` em um banco já com dados iniciais de alunos, professores e turmas.

## Cenário
O banco já contém:
- Alunos
- Professores
- Turmas (algumas com ano 2026 ainda não iniciadas)

### Requisito principal
Você deve cadastrar novas matrículas nas turmas de 2026 e inserir notas para essas matrículas.
Crie um arquivo `pratica.sql` para registrar suas atividades.

---
## Passo 1: INSERT
1. Insira pelo menos **10 matrículas novas** para alunos em **no mínimo 3 turmas diferentes** de 2026.
2. Para cada matrícula criada, insira a **nota** correspondente

---
## Passo 2: UPDATE

1. Atualize a nota de todos alunos, multiplicando por 10, exemplos: (9.2 => 92.0), (6.5 => 65.0), (8.0 => 80.0)

---
## Passo 2: SELECT
Crie consultas SQL para responder às perguntas abaixo:

1. Nome do professor de cada curso para cada turma/ano.
   - Exibir `nome do curso`, `ano da turma`, `nome do professor`.

2. Lista com nome dos alunos de cada professor para as turmas do ano de 2025.
   - Exibir `nome do curso`, `ano da turma`, `nome do professor`.

3. Lista de alunos matriculados por turma (deve trazer):
   - nome do aluno
   - nome do curso
   - ano da turma
   - nota

   Use `JOIN` entre as tabelas de alunos, turmas, cursos, matrículas e notas para produzir essa lista.

4. Para a consulta anterior, com o uso do CASE, acrescente uma coluna para exibir se o aluno foi aprovado ou reprovado, considerando 60.0 o mínimo para ser aprovado.

> As queries devem mostrar claramente o relacionamento entre turmas e professores.

---
## Passo 3: DELETE
Delete o **aluno com id 5** da base, considerando integridade referencial (caso haja FK, remova primeiro as dependências ou ajuste conforme o esquema).


---
## Entrega
- Copie o script SQL usado (inserts, selects, delete) em um arquivo `pratica.sql`.
- Comente as queries se quiser.

---
## Observações
- O comando `docker compose down` apaga as alterações do volume de dados.
- Valide os resultados com `SELECT` após cada `INSERT`/`DELETE`.
- Visualize o <a href='./eer.png'>diagrama EER</a> para entender os relacionamentos entre as tabelas.

Boa prática e foco nas consultas!
