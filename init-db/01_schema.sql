USE escola;

-- =========================
-- Tabela: alunos
-- =========================
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- =========================
-- Tabela: cursos
-- =========================
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- =========================
-- Tabela: professores
-- =========================
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- =========================
-- Tabela: turmas
-- =========================
CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT NOT NULL,
    professor_id INT NOT NULL,
    ano INT NOT NULL,

    CONSTRAINT fk_turma_curso
        FOREIGN KEY (curso_id) REFERENCES cursos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_turma_professor
        FOREIGN KEY (professor_id) REFERENCES professores(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- evita turmas duplicadas
    CONSTRAINT unique_turma UNIQUE (curso_id, professor_id, ano)
) ENGINE=InnoDB;

-- =========================
-- Tabela: matriculas (N:N)
-- =========================
CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    turma_id INT NOT NULL,

    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (aluno_id) REFERENCES alunos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (turma_id) REFERENCES turmas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- evita aluno duplicado na mesma turma
    CONSTRAINT unique_matricula UNIQUE (aluno_id, turma_id)
) ENGINE=InnoDB;

-- =========================
-- Tabela: notas
-- =========================
CREATE TABLE notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula_id INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,

    CONSTRAINT fk_nota_matricula
        FOREIGN KEY (matricula_id) REFERENCES matriculas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =========================
-- Seed: alunos (20)
-- =========================
INSERT INTO alunos (nome) VALUES
('Joao Silva'),
('Maria Oliveira'),
('Pedro Santos'),
('Ana Souza'),
('Lucas Ferreira'),
('Carla Mendes'),
('Bruno Rocha'),
('Juliana Alves'),
('Rafael Ribeiro'),
('Patricia Gomes'),
('Felipe Martins'),
('Camila Barbosa'),
('Gustavo Lima'),
('Larissa Fernandes'),
('Thiago Carvalho'),
('Aline Teixeira'),
('Diego Correia'),
('Renata Dias'),
('Marcelo Castro'),
('Beatriz Nunes');

-- =========================
-- Seed: cursos (6)
-- =========================
INSERT INTO cursos (nome) VALUES
('Sistemas de Informacao'),
('Engenharia de Software'),
('Ciencia da Computacao'),
('Analise e Desenvolvimento de Sistemas'),
('Banco de Dados'),
('Redes de Computadores');

-- =========================
-- Seed: professores (4)
-- =========================
INSERT INTO professores (nome) VALUES
('Carlos Almeida'),
('Fernanda Costa'),
('Ricardo Souza'),
('Juliana Martins');

-- =========================
-- Seed: turmas (12)
-- =========================
INSERT INTO turmas (curso_id, professor_id, ano) VALUES
(1, 1, 2025),
(2, 2, 2025),
(3, 3, 2025),
(4, 4, 2025),
(5, 1, 2025),
(6, 2, 2025),
(1, 2, 2026),
(2, 3, 2026),
(3, 4, 2026),
(4, 1, 2026),
(5, 2, 2026),
(6, 3, 2026);

-- =========================
-- Seed: matriculas (20 alunos distribuídos)
-- =========================
INSERT INTO matriculas (aluno_id, turma_id) VALUES
(1,1),(2,1),(3,1),(4,1),
(5,2),(6,2),(7,2),(8,2),
(9,3),(10,3),(11,3),(12,3),
(13,4),(14,4),(15,4),
(16,5),(17,5),(18,5),
(19,6),(20,6);

-- =========================
-- seed: notas (20 alunos com notas variadas)
-- =========================
INSERT INTO notas (matricula_id, nota) VALUES
(1,8.5),(2,7.0),(3,6.5),(4,9.0),
(5,5.5),(6,7.8),(7,8.2),(8,6.9),
(9,9.5),(10,8.0),(11,7.2),(12,6.8),
(13,7.5),(14,8.3),(15,5.9),
(16,9.1),(17,6.7),(18,7.4),
(19,8.8),(20,6.0);