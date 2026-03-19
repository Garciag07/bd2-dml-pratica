INSERT INTO matriculas (aluno_id, turma_id)  -- Passo 1
VALUES (1, 7),
(2, 7),
(3, 12),
(4, 10),
(5, 12),
(6, 9),
(7, 9),
(8, 12),
(9, 10);

BEGIN;
UPDATE notas            -- Passo 2
SET nota = nota * 10;