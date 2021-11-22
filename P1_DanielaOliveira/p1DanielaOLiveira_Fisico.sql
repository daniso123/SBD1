-- ---------------------     << Prova 01 >>     ---------------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 23/09/2021
-- Autor(es) ..............: Daniela Soares de OLiveira
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: P1
-- 
-- Data Ultima Alteracao ..: 23/09/2021
--
-- PROJETO => 07 Base de Dados
--         => 11 Tabelas
--
-- -----------------------------------------------------------------

CREATE TABLE PLANTONISTA (
    cpf BIGINT PRIMARY KEY,
    nome VARCHAR,
    matricula INT,
    sexo ENUM,
    dtNascimento DATE,
    ddi INT,
    numTelefone BIGINT,
    ddd INT
);

CREATE TABLE HABILIDADE (
    idHabilidade INT PRIMARY KEY,
    tipoHabilidade VARCHAR
);

CREATE TABLE PLANTAO (
    idPlantao INT PRIMARY KEY,
    dtPlantao DATE
);

CREATE TABLE supervisiona (
    fk_PLANTONISTA_cpf BIGINT,
    fk_PLANTONISTAcpf BIGINT
);

CREATE TABLE faz (
    fk_PLANTONISTA_cpf BIGINT,
    fk_PLANTAO_idPlantao INT
);

CREATE TABLE possui (
    fk_PLANTONISTA_cpf BIGINT,
    fk_HABILIDADE_idHabilidade INT
);
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_1
    FOREIGN KEY (fk_PLANTONISTA_cpf)
    REFERENCES PLANTONISTA (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_2
    FOREIGN KEY (fk_PLANTONISTAcpf)
    REFERENCES PLANTONISTA (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_1
    FOREIGN KEY (fk_PLANTONISTA_cpf)
    REFERENCES PLANTONISTA (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_2
    FOREIGN KEY (fk_PLANTAO_idPlantao)
    REFERENCES PLANTAO (idPlantao)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_PLANTONISTA_cpf)
    REFERENCES PLANTONISTA (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_HABILIDADE_idHabilidade)
    REFERENCES HABILIDADE (idHabilidade)
    ON DELETE SET NULL;
    
