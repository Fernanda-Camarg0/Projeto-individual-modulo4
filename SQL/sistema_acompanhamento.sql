-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Mar-2023 às 22:45
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_acompanhamento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `matricula` int(11) NOT NULL,
  `nome_aluno` varchar(60) NOT NULL,
  `telefone` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`matricula`, `nome_aluno`, `telefone`, `id_curso`, `id_turma`) VALUES
(22679865, 'José alcantara', 219834666, 249845, 48824),
(84604685, 'Morgana Medeiros', 219174386, 286269, 66482);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nome_curso` varchar(60) NOT NULL,
  `preco` float NOT NULL,
  `carga_horaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nome_curso`, `preco`, `carga_horaria`) VALUES
(249845, 'Desenvolvedor web', 2000, 600),
(286269, 'Web Designer', 1800, 400);

-- --------------------------------------------------------

--
-- Estrutura da tabela `facilitadores`
--

CREATE TABLE `facilitadores` (
  `id_facilitador` int(11) NOT NULL,
  `nome_facilitador` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `facilitadores`
--

INSERT INTO `facilitadores` (`id_facilitador`, `nome_facilitador`, `email`, `id_curso`, `id_turma`) VALUES
(2386905, 'Renato Santana', 'rena28@gmail.com', 249845, 48824),
(4597638, 'Liliana Santos', 'liliteach@gmail.com', 286269, 66482);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `id_turma` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `matricula` int(11) NOT NULL,
  `id_facilitador` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `turno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`id_turma`, `data_inicio`, `data_termino`, `matricula`, `id_facilitador`, `id_curso`, `turno`) VALUES
(48824, '2018-02-01', '2018-04-02', 22679865, 2386905, 249845, 'Vespertino'),
(66482, '2019-03-05', '2019-05-02', 84604685, 4597638, 286269, 'Matutino');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `cursi` (`id_curso`),
  ADD KEY `turmi` (`id_turma`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Índices para tabela `facilitadores`
--
ALTER TABLE `facilitadores`
  ADD PRIMARY KEY (`id_facilitador`),
  ADD KEY `cur` (`id_curso`),
  ADD KEY `tur` (`id_turma`);

--
-- Índices para tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `matri` (`matricula`),
  ADD KEY `curs` (`id_curso`),
  ADD KEY `faci` (`id_facilitador`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84604686;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286270;

--
-- AUTO_INCREMENT de tabela `facilitadores`
--
ALTER TABLE `facilitadores`
  MODIFY `id_facilitador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4597639;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66483;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `cursi` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `turmi` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`);

--
-- Limitadores para a tabela `facilitadores`
--
ALTER TABLE `facilitadores`
  ADD CONSTRAINT `cur` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `tur` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`);

--
-- Limitadores para a tabela `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `curs` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `faci` FOREIGN KEY (`id_facilitador`) REFERENCES `facilitadores` (`id_facilitador`),
  ADD CONSTRAINT `matri` FOREIGN KEY (`matricula`) REFERENCES `alunos` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
