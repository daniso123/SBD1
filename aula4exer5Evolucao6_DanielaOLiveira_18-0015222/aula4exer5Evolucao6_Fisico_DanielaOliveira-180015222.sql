-- --------Aula 4 Exercicio 5 Evolucao 4 - Clinica Medica --------
--
--                  SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 25/08/2021
-- Autor(es) ..............: Daniela Soares de OLiveira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao4
--
-- Ultimas Alteracoes
--   25/08/2021 => Criação das tabelas
--   01/09/2021 => Adição das restricoes UNIQUE
-- -------------------------------------------------------------
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao4;
USE aula4exer5Evolucao4;

CREATE TABLE IF NOT EXISTS MEDICO (
    idMedico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCompleto VARCHAR(50) NOT NULL,
    crm BIGINT NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE IF NOT EXISTS PACIENTE (
    idPaciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCompleto VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    complemento VARCHAR(100),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep BIGINT NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE IF NOT EXISTS CONSULTA (
    idConsulta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataHora TIMESTAMP NOT NULL,
    idMedico INT NOT NULL,
    idPaciente INT NOT NULL,

    CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (idMedico)
        REFERENCES MEDICO (idMedico),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (idPaciente)
        REFERENCES PACIENTE (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE IF NOT EXISTS RECEITA (
    idReceita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    posologia VARCHAR(100) NOT NULL,
    idConsulta INT NOT NULL,

    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (idConsulta)
        REFERENCES CONSULTA (idConsulta)
) ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE IF NOT EXISTS MEDICAMENTO (
    idMedicamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    principioAtivo VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE IF NOT EXISTS ESPECIALIDADE (
    idEspecialidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE IF NOT EXISTS telefone (
    idPaciente INT NOT NULL,
    telefone BIGINT NOT NULL,

    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente)
        REFERENCES PACIENTE (idPaciente)
);

CREATE TABLE IF NOT EXISTS contem (
    idReceita INT NOT NULL,
    idMedicamento INT NOT NULL,

    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita),
    CONSTRAINT contem_MEDICAMENTO_PK FOREIGN KEY (idMedicamento)
        REFERENCES MEDICAMENTO (idMedicamento)    
);

CREATE TABLE IF NOT EXISTS possui (
    idMedico INT NOT NULL,
    idEspecialidade INT NOT NULL,

    CONSTRAINT possui_MEDICO_FK FOREIGN KEY (idMedico)
        REFERENCES MEDICO (idMedico),
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade)
        REFERENCES ESPECIALIDADE (idEspecialidade)
);
