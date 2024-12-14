
DROP DATABASE IF EXISTS trabalho1;
CREATE DATABASE trabalho1;
USE trabalho1;


DROP TABLE IF EXISTS classificacao;
DROP TABLE IF EXISTS jogo;
DROP TABLE IF EXISTS times;
DROP TABLE IF EXISTS participante;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS turma;


CREATE TABLE turma (
    IDturma INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE categoria (
    IDcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE participante (
    IDparticipante INT AUTO_INCREMENT PRIMARY KEY,
    IDturma INT,
    IDcategoria INT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11),
    data_nascimento DATE,
    email VARCHAR(100),
    esporte VARCHAR(100),
    FOREIGN KEY (IDturma) REFERENCES turma(IDturma),
    FOREIGN KEY (IDcategoria) REFERENCES categoria(IDcategoria)
);


CREATE TABLE times (
    IDtime INT AUTO_INCREMENT PRIMARY KEY,
    IDturma INT,
    FOREIGN KEY (IDturma) REFERENCES turma(IDturma)
);


CREATE TABLE jogo (
    IDjogo INT AUTO_INCREMENT PRIMARY KEY,
    IDtime1 INT NOT NULL,
    IDtime2 INT NOT NULL,
    horario DATETIME NOT NULL,
    placar_time1 INT DEFAULT 0,
    placar_time2 INT DEFAULT 0,
    FOREIGN KEY (IDtime1) REFERENCES times(IDtime),
    FOREIGN KEY (IDtime2) REFERENCES times(IDtime)
);


CREATE TABLE classificacao (
    IDclassificacao INT AUTO_INCREMENT PRIMARY KEY,
    IDtime INT NOT NULL,
    pontos INT DEFAULT 0,
    FOREIGN KEY (IDtime) REFERENCES times(IDtime)
);