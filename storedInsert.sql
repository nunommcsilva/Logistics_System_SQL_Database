--
-- CLIENTE
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoCliente`(IN nome VARCHAR(45),IN morada VARCHAR(45),IN nif int(11))
BEGIN
 INSERT INTO cliente(nome,morada,nif)
 VALUES(nome,morada,nif);
END$$DELIMITER ;

CALL novoCliente("Manuel","Rua da Boavista",365479325);
CALL novoCliente("Antonio","Rua das Flores",123456789);
CALL novoCliente("Carla","Rua do Freixo",123456789);
CALL novoCliente("Joana","Rua Alvares Cabral",254896358);

--
-- ENCOMENDA
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoEncomenda`(IN dt DATE,IN cliente INT,IN veiculo INT, IN fornecedor INT)
BEGIN
 INSERT INTO encomenda(data,Cliente_idCliente,Veiculo_idVeiculo,Fornecedor_idFornecedor)
 VALUES(dt,cliente,veiculo,fornecedor);
END$$
DELIMITER ;

CALL novoEncomenda("2019-6-25", 1, 1, 1);
CALL novoEncomenda("2019-5-12", 2, 2, 2);
CALL novoEncomenda("2019-3-18", 3, 3, 3);

--
-- FORNECEDOR
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoFornecedor`(IN nome VARCHAR(45),IN morada VARCHAR(45),IN nif int(11))
BEGIN
 INSERT INTO fornecedor(nome,morada,nif)
 VALUES(nome,morada,nif);
END$$
DELIMITER ;

CALL novoFornecedor("Jose","Rua Fernandes Tomaz",214789658);
CALL novoFornecedor("Francisco","Rua do Bonjardim",123698547);
CALL novoFornecedor("Teresa","Rua Formosa",258741369);
CALL novoFornecedor("Mariana","Rua da Alegria",123654789);

--
-- FUNCIONARIO
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoFuncionario`(IN nome VARCHAR(45),IN dt DATE,IN cargo ENUM('secretaria','contabilista','armazenista','condutor'),IN veiculo INT)
BEGIN
	INSERT INTO funcionario(nome,dataNascimento,cargo,Veiculo_idVeiculo)
    VALUES(nome,dt,cargo,veiculo);

END$$
DELIMITER ;

CALL novoFuncionario("Mariza","1987-6-24","contabilista",1);
CALL novoFuncionario("Helena","1985-8-29","secretaria",2);
CALL novoFuncionario("Horacio","1982-3-17","armazenista",3);
CALL novoFuncionario("Pedro","1987-6-24","armazenista",4);
CALL novoFuncionario("Helder","1985-8-29","condutor",1);
CALL novoFuncionario("Bernardo","1982-3-17","condutor",2);

--
-- PRODUTO
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoProduto`(IN descricao VARCHAR(45),IN tipo ENUM('construcao','perigosos','alimentares'),IN ref TINYINT(1))
BEGIN
 INSERT INTO produto(descricao,tipo,refrigerado)
 VALUES(descricao,tipo,ref);
END$$
DELIMITER ;

CALL novoProduto("Agua","alimentares",1);
CALL novoProduto("Tijolo","construcao",0);
CALL novoProduto("Gasolina","perigosos",0);
CALL novoProduto("Iogurte","alimentares",1);

--
-- VEICULO
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoVeiculo`(IN matricula VARCHAR(45),IN carga FLOAT,IN tipo ENUM('normal','refrigerado','perigosos'))
BEGIN
 INSERT INTO veiculo(matricula,capacidadeCarga,tipo)
 VALUES(matricula,carga,tipo);
END$$
DELIMITER ;

CALL novoVeiculo("24-TS-17",4,"normal");
CALL novoVeiculo("67-BR-18",6,"refrigerado");
CALL novoVeiculo("97-EZ-32",3,"perigosos");
CALL novoVeiculo("46-QF-27",5,"refrigerado");

--
-- PRODUTO A UMA ENCOMENDA
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProdEnc`(IN prod INT,IN enc INT,IN qtd INT)
BEGIN
 INSERT INTO produto_has_encomenda(Produto_idProduto,Encomenda_idEncomenda,quantidade)
 VALUES(prod,enc,qtd);
END$$
DELIMITER ;

CALL addProdEnc(1, 1, 12);
CALL addProdEnc(2, 2, 18);
CALL addProdEnc(3, 3, 25);
