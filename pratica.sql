-- Active: 1773880605165@@127.0.0.1@3306@escola
INSERT INTO alunos (nome) VALUES
('Carlos Pereira'),
('Fernanda Santos'),
('Roberto Lima'),
('Juliana Costa'),
('André Oliveira'),
('Camila Rodrigues'),
('Lucas Ferreira'),
('Amanda Silva'),
('Gabriel Martins'),
('Isabela Almeida');

INSERT INTO matriculas (aluno_id, turma_id) VALUES
(21, 12), 
(22, 7), 
(23, 8), 
(24, 8), 
(25, 9), 
(26, 9), 
(27, 10),
(28, 10),
(29, 11),
(30, 12);


--Passo 2
BEGIN;
UPDATE notas
SET nota = nota * 10;

--Passo 3
SELECT 
    c.nome AS nome_curso,
    t.ano AS ano_turma,
    p.nome AS nome_professor
FROM turmas t
JOIN cursos c ON t.curso_id = c.id
JOIN professores p ON t.professor_id = p.id
ORDER BY t.ano, c.nome;

SELECT 
    c.nome AS nome_curso,
    t.ano AS ano_turma,
    p.nome AS nome_professor,
    a.nome AS nome_aluno
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN turmas t ON m.turma_id = t.id
JOIN cursos c ON t.curso_id = c.id
JOIN professores p ON t.professor_id = p.id
WHERE t.ano = 2025
ORDER BY p.nome, c.nome, a.nome;