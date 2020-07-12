-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Jul 2020 um 20:35
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_gloria_prantner_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_gloria_prantner_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_gloria_prantner_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `fk_address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deliver`
--

CREATE TABLE `deliver` (
  `ID` int(11) NOT NULL,
  `delivery_time` int(11) NOT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL,
  `fk_processing_system_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposit_location`
--

CREATE TABLE `deposit_location` (
  `ID` int(11) NOT NULL,
  `country` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `ZIP` smallint(6) NOT NULL,
  `adress` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `destination`
--

CREATE TABLE `destination` (
  `ID` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `fk_address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `gender` enum('F','M','X') NOT NULL,
  `fk_working_location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE `mail` (
  `ID` int(11) NOT NULL,
  `type` enum('package','letter','registered','ad') NOT NULL,
  `received_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `weight` tinyint(4) DEFAULT NULL,
  `fk_customer_ID` int(11) NOT NULL,
  `fk_deposit_location_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processed`
--

CREATE TABLE `processed` (
  `ID` int(11) NOT NULL,
  `weight` tinyint(4) NOT NULL,
  `type` enum('package','letter','ad') DEFAULT NULL,
  `fk_mail_ID` int(11) DEFAULT NULL,
  `fk_employee_ID` int(11) NOT NULL,
  `fk_status_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing_system`
--

CREATE TABLE `processing_system` (
  `ID` int(11) NOT NULL,
  `process_complete` varchar(1) NOT NULL,
  `fk_employee_ID` int(11) NOT NULL,
  `fk_processed_ID` int(11) NOT NULL,
  `fk_status_ID` int(11) NOT NULL,
  `fk_destination_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `process_status`
--

CREATE TABLE `process_status` (
  `ID` int(11) NOT NULL,
  `status` enum('received','processed','delivered') DEFAULT NULL,
  `process_start` time NOT NULL DEFAULT current_timestamp(),
  `process_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indizes für die Tabelle `deliver`
--
ALTER TABLE `deliver`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_processing_system_ID` (`fk_processing_system_ID`);

--
-- Indizes für die Tabelle `deposit_location`
--
ALTER TABLE `deposit_location`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_working_location_ID` (`fk_working_location_ID`);

--
-- Indizes für die Tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_deposit_location_ID` (`fk_deposit_location_ID`);

--
-- Indizes für die Tabelle `processed`
--
ALTER TABLE `processed`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_mail_ID` (`fk_mail_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_status_ID` (`fk_status_ID`);

--
-- Indizes für die Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_processed_ID` (`fk_processed_ID`),
  ADD KEY `fk_status_ID` (`fk_status_ID`),
  ADD KEY `fk_destination_ID` (`fk_destination_ID`);

--
-- Indizes für die Tabelle `process_status`
--
ALTER TABLE `process_status`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`ID`);

--
-- Constraints der Tabelle `deliver`
--
ALTER TABLE `deliver`
  ADD CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `deliver_ibfk_2` FOREIGN KEY (`fk_processing_system_ID`) REFERENCES `processing_system` (`ID`);

--
-- Constraints der Tabelle `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`ID`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_working_location_ID`) REFERENCES `deposit_location` (`ID`);

--
-- Constraints der Tabelle `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `mail_ibfk_3` FOREIGN KEY (`fk_deposit_location_ID`) REFERENCES `deposit_location` (`ID`);

--
-- Constraints der Tabelle `processed`
--
ALTER TABLE `processed`
  ADD CONSTRAINT `processed_ibfk_1` FOREIGN KEY (`fk_mail_ID`) REFERENCES `mail` (`ID`),
  ADD CONSTRAINT `processed_ibfk_2` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `processed_ibfk_3` FOREIGN KEY (`fk_status_ID`) REFERENCES `process_status` (`ID`);

--
-- Constraints der Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`fk_processed_ID`) REFERENCES `processed` (`ID`),
  ADD CONSTRAINT `processing_system_ibfk_3` FOREIGN KEY (`fk_status_ID`) REFERENCES `process_status` (`ID`),
  ADD CONSTRAINT `processing_system_ibfk_4` FOREIGN KEY (`fk_destination_ID`) REFERENCES `destination` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
