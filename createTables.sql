create schema mydb;
use mydb;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb2
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `morada` varchar(45) DEFAULT NULL,
  `nif` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `encomenda`
--

DROP TABLE IF EXISTS `encomenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `encomenda` (
  `idEncomenda` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Veiculo_idVeiculo` int(11) NOT NULL,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  PRIMARY KEY (`idEncomenda`,`Cliente_idCliente`,`Veiculo_idVeiculo`,`Fornecedor_idFornecedor`),
  KEY `fk_Encomenda_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Encomenda_Veiculo1_idx` (`Veiculo_idVeiculo`),
  KEY `fk_Encomenda_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Encomenda_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_Encomenda_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Encomenda_Veiculo1` FOREIGN KEY (`Veiculo_idVeiculo`) REFERENCES `veiculo` (`idVeiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `morada` varchar(45) DEFAULT NULL,
  `nif` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cargo` enum('secretaria','contabilista','armazenista','condutor') DEFAULT NULL,
  `Veiculo_idVeiculo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`),
  KEY `fk_Funcionario_Veiculo1_idx` (`Veiculo_idVeiculo`),
  CONSTRAINT `fk_Funcionario_Veiculo1` FOREIGN KEY (`Veiculo_idVeiculo`) REFERENCES `veiculo` (`idVeiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `tipo` enum('construcao','perigosos','alimentares') DEFAULT NULL,
  `refrigerado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto_has_encomenda`
--

DROP TABLE IF EXISTS `produto_has_encomenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto_has_encomenda` (
  `Produto_idProduto` int(11) NOT NULL,
  `Encomenda_idEncomenda` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Encomenda_idEncomenda`),
  KEY `fk_Produto_has_Encomenda_Encomenda1_idx` (`Encomenda_idEncomenda`),
  KEY `fk_Produto_has_Encomenda_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Encomenda_Encomenda1` FOREIGN KEY (`Encomenda_idEncomenda`) REFERENCES `encomenda` (`idEncomenda`),
  CONSTRAINT `fk_Produto_has_Encomenda_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto_has_fornecedor`
--

DROP TABLE IF EXISTS `produto_has_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto_has_fornecedor` (
  `Produto_idProduto` int(11) NOT NULL,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Fornecedor_idFornecedor`),
  KEY `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  KEY `fk_Produto_has_Fornecedor_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `veiculo` (
  `idVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(45) DEFAULT NULL,
  `capacidadeCarga` float DEFAULT NULL COMMENT 'Toneladas',
  `tipo` enum('normal','refrigerado','perigosos') DEFAULT NULL,
  PRIMARY KEY (`idVeiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-01 15:47:41
