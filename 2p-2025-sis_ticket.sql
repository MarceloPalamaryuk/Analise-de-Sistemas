-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Out-2025 às 11:42
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `2p-2025-sis_ticket`
--
CREATE DATABASE IF NOT EXISTS `2p-2025-sis_ticket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `2p-2025-sis_ticket`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `EmailCliente` varchar(100) NOT NULL,
  `NomeCliente` varchar(100) NOT NULL,
  `PassCliente` varchar(50) NOT NULL,
  `TeleCliente` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `CodDepartamento` int(11) NOT NULL,
  `NomeDepatamento` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `msgs`
--

CREATE TABLE `msgs` (
  `IdMsas` int(11) NOT NULL,
  `DataMsgs` datetime NOT NULL,
  `Mensagem` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `r1`
--

CREATE TABLE `r1` (
  `CodDepartamento` int(11) NOT NULL,
  `NumTecnico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `r2`
--

CREATE TABLE `r2` (
  `CodTipoCliente` int(11) NOT NULL,
  `EmailCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `r3`
--

CREATE TABLE `r3` (
  `EmailCliente` int(11) NOT NULL,
  `IdTicket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `r4`
--

CREATE TABLE `r4` (
  `IdTicket` int(11) NOT NULL,
  `CodTipoUrgencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `r5`
--

CREATE TABLE `r5` (
  `IdTicket` int(11) NOT NULL,
  `CodTipoProblema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `r6`
--

CREATE TABLE `r6` (
  `EmailCliente` int(11) DEFAULT NULL,
  `NumTecnico` int(11) DEFAULT NULL,
  `IdTicket` int(11) NOT NULL,
  `IdMsas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tecnico`
--

CREATE TABLE `tecnico` (
  `NumTecnico` int(11) NOT NULL,
  `NomeTecnico` varchar(100) NOT NULL,
  `EmailTecnico` varchar(100) NOT NULL,
  `PassTecnico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket`
--

CREATE TABLE `ticket` (
  `IdTicket` int(11) NOT NULL,
  `DataTicket` int(11) NOT NULL,
  `Resolvido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocliente`
--

CREATE TABLE `tipocliente` (
  `CodTipoCliente` int(11) NOT NULL,
  `TipoCliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoproblema`
--

CREATE TABLE `tipoproblema` (
  `CodTipoProblema` int(11) NOT NULL,
  `TipoProblema` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipourgencia`
--

CREATE TABLE `tipourgencia` (
  `CodTipoUrgencia` int(11) NOT NULL,
  `TipoUrgencia` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`EmailCliente`);

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`CodDepartamento`);

--
-- Índices para tabela `msgs`
--
ALTER TABLE `msgs`
  ADD PRIMARY KEY (`IdMsas`);

--
-- Índices para tabela `r1`
--
ALTER TABLE `r1`
  ADD PRIMARY KEY (`CodDepartamento`,`NumTecnico`);

--
-- Índices para tabela `r2`
--
ALTER TABLE `r2`
  ADD PRIMARY KEY (`CodTipoCliente`,`EmailCliente`);

--
-- Índices para tabela `r3`
--
ALTER TABLE `r3`
  ADD PRIMARY KEY (`EmailCliente`,`IdTicket`);

--
-- Índices para tabela `r4`
--
ALTER TABLE `r4`
  ADD PRIMARY KEY (`IdTicket`,`CodTipoUrgencia`);

--
-- Índices para tabela `r5`
--
ALTER TABLE `r5`
  ADD PRIMARY KEY (`IdTicket`,`CodTipoProblema`);

--
-- Índices para tabela `r6`
--
ALTER TABLE `r6`
  ADD PRIMARY KEY (`IdTicket`,`IdMsas`),
  ADD KEY `EmailCliente` (`EmailCliente`,`NumTecnico`);

--
-- Índices para tabela `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`NumTecnico`);

--
-- Índices para tabela `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`IdTicket`);

--
-- Índices para tabela `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`CodTipoCliente`);

--
-- Índices para tabela `tipoproblema`
--
ALTER TABLE `tipoproblema`
  ADD PRIMARY KEY (`CodTipoProblema`);

--
-- Índices para tabela `tipourgencia`
--
ALTER TABLE `tipourgencia`
  ADD PRIMARY KEY (`CodTipoUrgencia`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `msgs`
--
ALTER TABLE `msgs`
  MODIFY `IdMsas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ticket`
--
ALTER TABLE `ticket`
  MODIFY `IdTicket` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
