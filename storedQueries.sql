--
-- 1. FUNCIONÁRIOS POR CARGO
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `detFuncCargo`(IN car enum('secretaria','contabilista','armazenista','condutor'))
BEGIN
	SELECT * FROM funcionario WHERE cargo = car
    ORDER BY nome ASC;
END$$
DELIMITER ;

CALL detFuncCargo('secretaria');

--
-- 2. VEÍCULOS POR TIPO
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `detVeicTipo`(IN ti enum('normal','refrigerado','perigosos'))
BEGIN
	SELECT * FROM veiculo WHERE tipo = ti
    ORDER BY capacidadeCarga ASC;
END$$
DELIMITER ;

CALL detVeicTipo('normal');

--
-- 3. CLIENTES POR LETRA INICIAL
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `detCliIni`(IN nom VARCHAR(45))
BEGIN
	SELECT * FROM cliente WHERE LEFT(nome, 1) = LEFT(nom, 1)
    ORDER BY nome ASC;
END$$
DELIMITER ;

CALL detCliIni('manuel');

--
-- 4. ENCOMENDA POR FORNECEDOR
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `encFornecedor`(IN fornecedor INT)
BEGIN
	SELECT * from encomenda WHERE Fornecedor_idFornecedor = fornecedor
    ORDER BY data ASC;
END$$
DELIMITER ;

CALL encFornecedor(1);

--
-- 5. VEÍCULOS POR TIPO + TIPO PRODUTO + CAPACIDADE CARGA
--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `veiculoTipoProduto`(IN tipoProd ENUM('construcao','perigosos','alimentares'),
IN tipoVeiculo ENUM('normal','refrigerado','perigosos'),
IN capacidade FLOAT)
BEGIN
	SELECT distinct(idFuncionario) , idVeiculo, matricula,nome, produto.tipo, capacidadeCarga, veiculo.tipo
    FROM veiculo, funcionario, produto 
    WHERE produto.tipo = tipoProd AND funcionario.Veiculo_idVeiculo = idVeiculo
    AND capacidadeCarga >= capacidade AND veiculo.tipo = tipoVeiculo;
    
END$$
DELIMITER ;

CALL veiculoTipoProduto('construcao','normal',4);

