/* criando a base com configuração para caracteres latinos*/
CREATE DATABASE NORTURAL
DEFAULT CHARACTER SET UTF8
DEFAULT COLLATE utf8_general_ci;

USE NORTURAL;

/*criação das tabelas*/
CREATE TABLE QUIZ(
	ID_QUIZ INT(5) NOT NULL auto_increment,
    NOME VARCHAR(100) NOT NULL,
    IMAGEM BLOB,
    PRIMARY KEY(ID_QUIZ)
);

CREATE TABLE PERGUNTA(
	ID_PERGUNTA INT(5) NOT NULL auto_increment, 
    ENUNCIADO TEXT NOT NULL,
    PRIMARY KEY(ID_PERGUNTA)
);

CREATE TABLE QUIZ_PERGUNTA(
	IDQUIZ INT(5) NOT NULL,
    IDPERGUNTA INT(5) NOT NULL,
    FOREIGN KEY(IDQUIZ) REFERENCES QUIZ(ID_QUIZ),
    FOREIGN KEY(IDPERGUNTA) REFERENCES PERGUNTA(ID_PERGUNTA)
);

CREATE TABLE USUARIO(
	ID_USUARIO INT(11) NOT NULL auto_increment,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL, 
    IMAGEM BLOB,
    ADMINISTRADOR BOOLEAN,
    PRIMARY KEY(ID_USUARIO)
);

CREATE TABLE HISTORICO_QUIZ( /* USUARIO - QUIZ*/
	IDUSUARIO INT(11) NOT NULL,
    IDQUIZ INT(5) NOT NULL,
    DATA DATETIME NOT NULL, 
    ACERTOS INT(5) NOT NULL, 
    FOREIGN KEY(IDUSUARIO) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY(IDQUIZ) REFERENCES QUIZ(ID_QUIZ)
);

CREATE TABLE JOGO(
	ID_JOGO INT(5) NOT NULL auto_increment,
    NOME VARCHAR(255) NOT NULL,
    PRIMARY KEY(ID_JOGO)
);

CREATE TABLE ALTERNATIVA(
	ID_ALTERNATIVA INT(5) NOT NULL,
    TEXTO TEXT NOT NULL,
    CORRETA BOOLEAN NOT NULL,
    COMENTARIO TEXT,
    IDPERGUNTA INT(5) NOT NULL,
    PRIMARY KEY(ID_ALTERNATIVA),
    FOREIGN KEY(IDPERGUNTA) REFERENCES PERGUNTA(ID_PERGUNTA)
);

CREATE TABLE ESTADO(
	ID_ESTADO INT(5) NOT NULL auto_increment,
    NOME VARCHAR(20) NOT NULL,
    CAPITAL VARCHAR(20) NOT NULL,
    TAMANHO INT(11),
    POPULACAO INT(11),
    DATA_FUNDACAO DATE,
    PRIMARY KEY(ID_ESTADO)
);

CREATE TABLE COMENTARIO(
	ID_COMENTARIO INT(5) NOT NULL auto_increment,
    TEXTO TEXT NOT NULL,
    DATA_PUBLICACAO DATETIME NOT NULL, 
    IDUSUARIO INT(11) NOT NULL,
    IDESTADO INT(5) NOT NULL,
    PRIMARY KEY(ID_COMENTARIO),
    FOREIGN KEY(IDUSUARIO) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY(IDESTADO) REFERENCES ESTADO(ID_ESTADO)
);


CREATE TABLE CATEGORIA(
	ID_CATEGORIA INT(5) NOT NULL auto_increment,
    TITULO VARCHAR(255) NOT NULL,
    DESCRICAO TEXT NOT NULL,
    IMAGEM BLOB,
    PRIMARY KEY(ID_CATEGORIA)
);

CREATE TABLE ESTADO_CATEGORIA(
	IDESTADO INT(5) NOT NULL,
    IDCATEGORIA INT(5) NOT NULL, 
    FOREIGN KEY(IDESTADO) REFERENCES ESTADO(ID_ESTADO),
    FOREIGN KEY(IDCATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE MUSICA(
	ID_MUSICA INT(5) NOT NULL auto_increment,
    DATA_COMPOSICAO DATE,
    ARTISTA VARCHAR(255),
    IDCATEGORIA INT(5) NOT NULL,
    PRIMARY KEY(ID_MUSICA),
    FOREIGN KEY(IDCATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE CULINARIA(
	ID_CULINARIA INT(5) NOT NULL auto_increment,
    MODO_PREPARO TEXT,
    INGREDIENTES TEXT,
    IDCATEGORIA INT(5) NOT NULL,
    PRIMARY KEY(ID_CULINARIA),
    FOREIGN KEY(IDCATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE FESTA(
	ID_FESTA INT(5) NOT NULL auto_increment,
    DATA_COMEMORATIVA DATE, 
    IDCATEGORIA INT(5) NOT NULL,
    PRIMARY KEY(ID_FESTA),
    FOREIGN KEY(IDCATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE BIODIVERSIDADE(
	ID_BIODIVERSIDADE INT(5) NOT NULL auto_increment,
    NOME_CIENTIFICO VARCHAR(50),
    AMBIENTE VARCHAR(150),
    EXPECTATIVA_VIDA INT(4),
    ALTURA DOUBLE(5,2),
    IDCATEGORIA INT(5) NOT NULL,
    PRIMARY KEY(ID_BIODIVERSIDADE),
    FOREIGN KEY(IDCATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);