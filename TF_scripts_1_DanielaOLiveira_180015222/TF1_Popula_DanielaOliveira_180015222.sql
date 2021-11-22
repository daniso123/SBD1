-- -------- 	Projeto Final - Cadastro de Apicultores    ----------
--
--                    SCRIPT DE POPULACAO (DML)
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

USE DanielaSoares;

-- Insercao das tuplas nas tabelas

INSERT INTO APICULTOR 
	(cpfApicultor, nome, ddd, numeroTelefone) 
VALUES
	(36063051171, 'Marcos Eduardo Nina', 61, 989347875),
	(81453682198, 'Gabriel Oliveira', 11, 992313213),
	(02998265111, 'Ana Carolina Gomes', 82, 984256632),
	(14377797000, 'Cleber Nascimento', 60, 991107032),
	(13245611064, 'Samanta Clara', 17, 992980532);
    
    
INSERT INTO PRODUTOR
	(cnpjProdutor, nome, ddd, numeroTelefone) 
VALUES
	(75366412000149, 'Fernando Macedo', 17, 991107032),
	(70572844000192, 'Walter Lima', 82, 985316406),
	(09791358000154, 'Letícia Carvalho Souza', 61, 984256632),
	(24155464000135, 'Vagner Franco Marian', 60, 992980532),
	(57805759000169, 'Isadora Pereira Ramos', 17, 992313213);

INSERT INTO ENDERECO
	(logradouro, cep, numero, cidade, uf, complemento)
VALUES
	('Quadra QN5 Conjunto 29', 71823989, 12, 'Brasília', 'DF', NULL),
	('Quadra QN3 Conjunto 07', 71948957, 46, 'Brasília', 'DF', 'Lote 505'),
	('Quadra QR 517 Conjunto D', 72547804, 14, 'Brasília', 'DF', NULL),
	('Conjunto SMT Chácara 30', 72023545, 30, 'Brasília', 'DF', NULL),
	('Condomínio Bela Vista Serrana Módulo 2', 73270625, 21, 'Brasília', 'DF', NULL);

INSERT INTO FAZENDA
	(tamanho, tipoFazenda)
VALUES
	(1005, 'Plantação de Laranjas'),
	(2000, 'Plantação de Soja'),
	(5000, 'Plantação de Uvas'),
	(10000, 'Plantação de Soja'),
	(2000, 'Plantação de ');
 
INSERT INTO COLMEIA
	(especie, idadeRainha, qtAbelhas, latitude, longitude, disponivel)
VALUES
	('Apis Melifera', 3, 20000, -15.855635, -48.343918, TRUE),
	('Apis Melifera', 4, 30000, -15.863207, -15.863207, FALSE),
	('Apis Melifera', 5, 40000, -15.863207, -48.305871, FALSE),
	('Apis Melifera', 7, 42000, NULL, NULL, TRUE),
	('Apis Melifera', 8, 50000, NULL, NULL, TRUE);


INSERT INTO ALUGUEL
	(dtInicio, dtFim, qtColmeia, idFazenda, idColmeia)
VALUES
	('2020-07-15', '2020-07-30', 3, 2, 3),
	('2020-05-18', '2020-06-18', 1, 4, 1),
	('2020-02-23', '2020-04-15', 15, 5, 2),
	('2020-02-02', '2020-07-25', 5, 3, 4),
	('2020-04-17', '2020-06-12', 4, 5, 1);
  
INSERT INTO PRODUCAO
	(inicioPolinizar, fimPolinizar, inicioAgrotox, fimAgrotox)
VALUES
	('2020-05-07', '2020-07-15', '2020-05-25', '2020-05-26'),
	('2020-03-15', '2020-03-30', '2020-03-25', '2020-03-27'),
	('2020-07-22', '2020-08-15', '2020-08-02', '2020-08-04'),
	('2020-12-03', '2020-12-25', '2020-12-17', '2020-12-19'),
	('2020-10-04', '2020-10-22', '2020-10-18', '2020-10-19');
	
INSERT INTO apresenta
	(idEndereco, cpfApicultor) 
VALUES
	(1, 81453682198),
	(4, 13245611064),
	(3, 36063051171),
	(5, 02998265111),
	(2, 14377797000);

INSERT INTO tem
	(idEndereco, cnpjProdutor)
VALUES
	(4, 75366412000149),
	(2, 70572844000192),
	(3, 09791358000154),
	(5, 24155464000135),
	(1, 57805759000169);
    

INSERT INTO possui
	(idFazenda, idEndereco)
VALUES
	(1, 4),
	(5, 2),
	(3, 1),
	(2, 4),
	(3, 5);
    

INSERT INTO dispoe
	(cpfApicultor, idColmeia)
VALUES
	(81453682198, 5),
	(81453682198, 2),
	(13245611064, 1),
	(36063051171, 4),
	(14377797000, 3);


INSERT INTO contem
	(idFazenda, idProducao)
VALUES
	(1, 4),
	(4, 2),
	(5, 3),
	(3, 2),
	(4, 5);


INSERT INTO mantem
	(cnpjProdutor, idFazenda)
VALUES
	(24155464000135, 1),
	(57805759000169, 2),
	(09791358000154, 3),
	(24155464000135, 5),
	(70572844000192, 4);
