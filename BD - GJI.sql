DROP DATABASE IF EXISTS trabalho1;
CREATE DATABASE trabalho1;
USE trabalho1;

DROP TABLE IF EXISTS classificacao;
DROP TABLE IF EXISTS jogo;
DROP TABLE IF EXISTS times;
DROP TABLE IF EXISTS participante;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS turma;
DROP TABLE IF EXISTS esporte;


CREATE TABLE turma (
    IDturma INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE categoria (
    IDcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE esporte (
    IDesporte INT AUTO_INCREMENT PRIMARY KEY,
    nomeesporte VARCHAR(30) NOT NULL
);

CREATE TABLE participante (
    IDparticipante INT AUTO_INCREMENT PRIMARY KEY,
    IDturma INT,
    nome VARCHAR(100) NOT NULL,
    sexo VARCHAR(10),
    email VARCHAR(100),
    telefone VARCHAR(15),
    cpf VARCHAR(14),
    data_nascimento DATE,
    IDcategoria INT,
    IDesporte INT,
    termo BOOLEAN,
    FOREIGN KEY (IDturma) REFERENCES turma(IDturma) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (IDcategoria) REFERENCES categoria(IDcategoria) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (IDesporte) REFERENCES esporte(IDesporte) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE times (
    IDtime INT AUTO_INCREMENT PRIMARY KEY,
    IDturma INT,
    FOREIGN KEY (IDturma) REFERENCES turma(IDturma) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jogo (
    IDjogo INT AUTO_INCREMENT PRIMARY KEY,
    IDtime1 INT NOT NULL,
    IDtime2 INT NOT NULL,
    horario DATETIME NOT NULL,
    placar_time1 INT DEFAULT 0,
    placar_time2 INT DEFAULT 0,
    FOREIGN KEY (IDtime1) REFERENCES times(IDtime) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IDtime2) REFERENCES times(IDtime) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE classificacao (
    IDclassificacao INT AUTO_INCREMENT PRIMARY KEY,
    IDtime INT NOT NULL,
    pontos INT DEFAULT 0,
    FOREIGN KEY (IDtime) REFERENCES times(IDtime) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO categoria(nome) VALUES ('aluno'), ('professor'), ('familiar');

INSERT INTO esporte(nomeesporte) VALUES 
('vôlei'), ('futsal'), ('handebol'), ('basquete'), ('vôlei de areia'), ('ping pong');

INSERT INTO turma(nome) VALUES ('Turma A'), ('Turma B');

INSERT INTO times(IDturma) VALUES (1), (2);

INSERT INTO participante(
    nome, sexo, email, telefone, cpf, data_nascimento, IDcategoria, IDturma, IDesporte, termo
) VALUES
('João Silva', 'Masculino', 'joao@gmail.com', '11987654321', '123.456.789-01', '2000-05-20', 1, 1, 1, TRUE),
('Maria Oliveira', 'Feminino', 'maria@gmail.com', '21987654321', '987.654.321-09', '1995-08-15', 2, 2, 3, TRUE);
