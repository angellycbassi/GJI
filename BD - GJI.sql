CREATE DATABASE trabalho;
USE  Sakila;

CREATE TABLE turma (
    IDturma INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE categoria (
	IDcategoria INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE participante (
    IDparticipante INT PRIMARY KEY,
    IDturma INT,
    IDcategoria INT,
    matricula INT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100),
        FOREIGN KEY (IDturma) REFERENCES turma (IDturma),
		FOREIGN KEY (IDcategoria) REFERENCES categoria (IDcategoria)
);

CREATE TABLE jogos (
    IDjogos INT PRIMARY KEY,
);

CREATE TABLE classificacao (
    IDclassificacao INT PRIMARY KEY,
);

