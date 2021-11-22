-- -------- 	Projeto Final - Cadastro de Apicultores    ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/10/2021
-- Autor(es) ..............: Fernando Miranda Calil e Daniela Soares
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: DanielaSoares
--
-- Ultimas Alteracoes
-- 				
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
--
-- --------------------------------------------------------- 

-- Base de dados

CREATE DATABASE 
	IF NOT EXISTS 			DanielaSoares
	DEFAULT CHARACTER SET 	utf8mb4
	DEFAULT COLLATE 		utf8mb4_general_ci;

USE DanielaSoares;

-- Tabelas

CREATE TABLE APICULTOR (
    cpfApicultor 	BIGINT 			NOT NULL,
    ddd 			INTEGER(2)		NOT NULL,
    numeroTelefone 	INTEGER(9)		NOT NULL,
    nome 			VARCHAR(100)	NOT NULL,
    
    CONSTRAINT APICULTOR_PK PRIMARY KEY (cpfApicultor)
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE PRODUTOR (
    cnpjProdutor 	BIGINT 			NOT NULL,
    nome 			VARCHAR(100)	NOT NULL,
    ddd 			INTEGER(2)		NOT NULL,
    numeroTelefone 	INTEGER(9)		NOT NULL,

    CONSTRAINT PRODUTOR_PK PRIMARY KEY (cnpjProdutor)
)ENGINE = InnoDB, AUTO_INCREMENT = 1, DEFAULT CHARSET = utf8mb4;


CREATE TABLE ENDERECO (
    idEndereco 		INTEGER(11) 	NOT NULL	AUTO_INCREMENT,
    cep 			INTEGER(8)		NOT NULL,
    numero 			INTEGER(4)		NOT NULL,
    cidade 			VARCHAR(50)		NOT NULL,
    uf 				CHAR(2)			NOT NULL,
    logradouro 		VARCHAR(100)	NOT NULL,
    complemento 	VARCHAR(100),

    CONSTRAINT ENDERECO_PK PRIMARY KEY (idEndereco)
)ENGINE = InnoDB, AUTO_INCREMENT = 1, DEFAULT CHARSET = utf8mb4;

CREATE TABLE FAZENDA (
    idFazenda 		INTEGER(11) 	NOT NULL	AUTO_INCREMENT,
    tamanho 		INTEGER(11) 	NOT NULL,
    tipoFazenda 	VARCHAR(100)	NOT NULL,
    
    CONSTRAINT FAZENDA_PK PRIMARY KEY (idFazenda)
)ENGINE = InnoDB, AUTO_INCREMENT = 1, DEFAULT CHARSET = utf8mb4;

CREATE TABLE COLMEIA (
    idColmeia 		INTEGER(11) 	NOT NULL 	AUTO_INCREMENT,
    especie 		VARCHAR(100)	NOT NULL,
    idadeRainha 	INTEGER(11)		NOT NULL,
    qtAbelhas 		INTEGER(11)		NOT NULL,
    disponivel 		BOOLEAN			NOT NULL,
    latitude 		FLOAT,
    longitude 		FLOAT,

    CONSTRAINT COLMEIA_PK PRIMARY KEY (idColmeia)
)ENGINE = InnoDB, AUTO_INCREMENT = 1, DEFAULT CHARSET = utf8mb4;

CREATE TABLE ALUGUEL (
    idAluguel 	INTEGER(11) 	NOT NULL	AUTO_INCREMENT,
    dtInicio 	DATE			NOT NULL,
    dtFim 		DATE			NOT NULL,
    qtColmeia 	INTEGER(3)		NOT NULL,
    idFazenda 	INTEGER(11)		NOT NULL,
    idColmeia 	INTEGER(11)		NOT NULL,

    CONSTRAINT ALUGUEL_PK PRIMARY KEY (idAluguel),
    CONSTRAINT ALUGUEL_FAZENDA_FK FOREIGN KEY (idFazenda)
		REFERENCES FAZENDA (idFazenda)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT ALUGUEL_COLMEIA_FK FOREIGN KEY (idColmeia)
		REFERENCES COLMEIA (idColmeia)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)ENGINE = InnoDB, AUTO_INCREMENT = 1, DEFAULT CHARSET = utf8mb4;

CREATE TABLE PRODUCAO (
    idProducao 		INTEGER(11) 	NOT NULL	AUTO_INCREMENT,
    fimPolinizar 	DATE			NOT NULL,
    inicioPolinizar DATE			NOT NULL,
    inicioAgrotox 	DATE,
    fimAgrotox 		DATE,

    CONSTRAINT PRODUCAO_PK PRIMARY KEY (idProducao)
)ENGINE = InnoDB, AUTO_INCREMENT = 1, DEFAULT CHARSET = utf8mb4;


CREATE TABLE apresenta (
    idEndereco 		INTEGER(11),
    cpfApicultor 	BIGINT,
    
    CONSTRAINT apresenta_ENDERECO_FK FOREIGN KEY (idEndereco)
		REFERENCES ENDERECO (idEndereco)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT apresenta_APICULTOR_FK FOREIGN KEY (cpfApicultor)
		REFERENCES APICULTOR (cpfApicultor)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE tem (
    idEndereco 		INTEGER(11),
    cnpjProdutor 	BIGINT,
    
    CONSTRAINT tem_ENDERECO_FK FOREIGN KEY (idEndereco)
		REFERENCES ENDERECO (idEndereco)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT tem_PRODUTOR_FK FOREIGN KEY (cnpjProdutor)
		REFERENCES PRODUTOR (cnpjProdutor)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE possui (
    idFazenda 	INTEGER(11),
    idEndereco 	INTEGER(11),
    
    CONSTRAINT possui_FAZENDA_FK FOREIGN KEY (idFazenda)
		REFERENCES FAZENDA (idFazenda)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT possui_ENDERECO_FK FOREIGN KEY (idEndereco)
		REFERENCES ENDERECO (idEndereco)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE dispoe (
    cpfApicultor 	BIGINT,
    idColmeia 		INTEGER(11),
    
	CONSTRAINT dispoe_APICULTOR_FK FOREIGN KEY (cpfApicultor)
		REFERENCES APICULTOR (cpfApicultor)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT dispoe_COLMEIA_FK FOREIGN KEY (idColmeia)
		REFERENCES COLMEIA (idColmeia)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE contem (
    idFazenda 	INTEGER(11),
    idProducao 	INTEGER(11),
    
    CONSTRAINT contem_FAZENDA_FK FOREIGN KEY (idFazenda)
		REFERENCES FAZENDA (idFazenda)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT contem_PRODUCAO_FK FOREIGN KEY (idProducao)
		REFERENCES PRODUCAO (idProducao)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

CREATE TABLE mantem (
    cnpjProdutor 	BIGINT,
    idFazenda 		INTEGER(11),
    
    CONSTRAINT mantem_PRODUTOR_FK FOREIGN KEY (cnpjProdutor)
		REFERENCES PRODUTOR (cnpjProdutor)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT mantem_FAZENDA_FK FOREIGN KEY (idFazenda)
		REFERENCES FAZENDA (idFazenda)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB, DEFAULT CHARSET = utf8mb4;

 