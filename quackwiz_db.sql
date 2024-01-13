-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2024 at 08:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quackwiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `domande`
--

CREATE TABLE `domande` (
  `ID` int(11) NOT NULL,
  `Domanda` varchar(200) NOT NULL,
  `Risposta1` varchar(200) NOT NULL,
  `Risposta2` varchar(200) NOT NULL,
  `Risposta3` varchar(200) NOT NULL,
  `Risposta4` varchar(200) NOT NULL,
  `Risp_corretta` varchar(200) NOT NULL,
  `Quiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `domande`
--

INSERT INTO `domande` (`ID`, `Domanda`, `Risposta1`, `Risposta2`, `Risposta3`, `Risposta4`, `Risp_corretta`, `Quiz`) VALUES
(0, 'Chi è Dean?', 'Un Winchester', 'Un angelo', 'Un lupo mannaro', 'Un Djinn', 'Un Winchester', 1),
(1, 'Chi è Sam?', 'Un Winchester', 'Un vampiro', 'Un leviatano', 'Un agente di polizia', 'Un Winchester', 1),
(2, 'Chi è Castiel?', 'Un angelo', 'Un vampiro', 'Un cacciatore', 'Un mutaforma', 'Un angelo', 1),
(3, 'Quante stagioni ha la serie?', '12', '13', '14', '15', '15', 1),
(4, 'Qual è la stagione più corta?', '7', '15', '3', '12', '3', 1),
(5, 'Come si chiama la macchina dei fratelli Winchester?', 'Jessica', 'Baby', 'Amara', 'Meg', 'Baby', 1),
(6, 'Chi non è mai stato Satana?', 'Sam', 'Castiel', 'Dean', 'Nick', 'Dean', 1),
(7, 'Quante volte è morto Dean?', '111', '5', '73', '14', '111', 1),
(8, 'Chi non è un demone?', 'Crowley', 'Rowena', 'Meg', 'Azazel', 'Rowena', 1),
(9, 'In quale stagione appaiono per la prima volta gli angeli?', '4', '2', '6', '7', '4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `Descrizione` varchar(500) NOT NULL,
  `Categoria` varchar(20) NOT NULL,
  `Tempo` int(11) NOT NULL,
  `Num_Like` int(11) NOT NULL,
  `Num_Giocate` int(11) NOT NULL,
  `Url_Immagine` varchar(200) NOT NULL,
  `Num_Domande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`ID`, `Nome`, `Descrizione`, `Categoria`, `Tempo`, `Num_Like`, `Num_Giocate`, `Url_Immagine`, `Num_Domande`) VALUES
(1, 'Quante ne sai su Supernatural?', 'Metti alla prova la tua conoscenza sulla serie TV Supernatural rispondendo a queste domande.', 'Intrattenimento', 60, 0, 4, 'img/spn.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `salvati`
--

CREATE TABLE `salvati` (
  `Utente` int(11) DEFAULT NULL,
  `Quiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`ID`, `Username`, `Email`, `Password`) VALUES
(0, 'user', 'user@user.it', 'user'),
(1, 'f_idiometri', 'filippo.idiometri@studenti.unipd.it', '1234'),
(2, 'j_carretta', 'jessica.carretta@studenti.unipd.it', '1234'),
(3, 'l_pieripolli', 'laura.pieripolli@studenti.unipd.it', '1234'),
(4, 'v_schivo', 'valentina.schivo@studenti.unipd.it', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `domande`
--
ALTER TABLE `domande`
  ADD PRIMARY KEY (`ID`,`Quiz`),
  ADD KEY `dom_quiz_id_fk` (`Quiz`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salvati`
--
ALTER TABLE `salvati`
  ADD KEY `sav_quiz_id_fk` (`Quiz`),
  ADD KEY `sav_user_id_fk` (`Utente`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `domande`
--
ALTER TABLE `domande`
  ADD CONSTRAINT `dom_quiz_id_fk` FOREIGN KEY (`Quiz`) REFERENCES `quiz` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salvati`
--
ALTER TABLE `salvati`
  ADD CONSTRAINT `sav_quiz_id_fk` FOREIGN KEY (`Quiz`) REFERENCES `quiz` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `sav_user_id_fk` FOREIGN KEY (`Utente`) REFERENCES `utenti` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
