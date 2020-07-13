-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Jul 2020 um 10:54
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
-- Datenbank: `cr09_gloria_p_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_gloria_p_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_gloria_p_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `address_ID` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`address_ID`, `country`, `city`, `address`) VALUES
(1, 'Puerto Rico', 'Nazilli', '520-9363 Vulputate Road'),
(2, 'Rwanda', 'Portico e San Benedetto', 'Ap #369-1505 Odio. Street'),
(3, 'Estonia', 'Solre-sur-Sambre', '3328 Euismod Ave'),
(4, 'Zimbabwe', 'Davenport', 'Ap #235-6281 Amet, St.'),
(5, 'Palestine, State of', 'Minturno', '948-9990 Nec, Avenue'),
(6, 'Chile', 'Bhind', 'P.O. Box 828, 2971 Tristique Ave'),
(7, 'Tajikistan', 'Wha Ti', 'Ap #394-3274 Amet, Street'),
(8, 'French Guiana', 'Saint-Lô', '1229 Dis St.'),
(9, 'Hungary', 'Dewas', 'P.O. Box 142, 868 Gravida Rd.'),
(10, 'Palau', 'Gistel', '4724 Porttitor St.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_ID`, `f_name`, `l_name`, `phone_number`, `fk_address_ID`) VALUES
(1, 'Sylvester', 'Byrd', '(057) 15666129', 1),
(2, 'Rudyard', 'Bolton', '(039502) 043994', 2),
(3, 'Dillon', 'Frederick', '(035077) 763808', 3),
(4, 'Harper', 'Palmer', '(0076) 35729772', 4),
(5, 'Timon', 'Frost', '(062) 92523870', 5),
(6, 'Dillon', 'Bauer', '(0378) 52475586', 6),
(7, 'Evan', 'Harvey', '(037083) 163110', 7),
(8, 'Henry', 'Solomon', '(0435) 72398787', 8),
(9, 'Ivor', 'Chase', '(037207) 684075', 9),
(10, 'Salvador', 'Stone', '(0934) 48521405', 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deliver`
--

CREATE TABLE `deliver` (
  `deliver_ID` int(11) NOT NULL,
  `delivery_time` time NOT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL,
  `fk_processing_system_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `deliver`
--

INSERT INTO `deliver` (`deliver_ID`, `delivery_time`, `fk_employee_ID`, `fk_processing_system_ID`) VALUES
(1, '00:00:07', 1, 1),
(2, '00:00:03', 2, 2),
(3, '00:00:08', 3, 3),
(4, '00:00:01', 4, 4),
(5, '00:00:12', 5, 5),
(6, '00:00:09', 6, 6),
(7, '00:00:12', 7, 7),
(8, '00:00:10', 8, 8),
(9, '00:00:01', 9, 9),
(10, '00:00:10', 10, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposit_location`
--

CREATE TABLE `deposit_location` (
  `deposit_ID` int(11) NOT NULL,
  `country` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `ZIP` smallint(6) NOT NULL,
  `address` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `deposit_location`
--

INSERT INTO `deposit_location` (`deposit_ID`, `country`, `city`, `ZIP`, `address`) VALUES
(1, 'Ukraine', 'Avise', 15981, '6770 Quis St.'),
(2, 'Mauritius', 'Columbus', 14955, '990-9235 Lorem Rd.'),
(3, 'Argentina', 'Frankston', 8746, '843 Duis Road'),
(4, 'Mali', 'Monacilioni', 32767, '582-9135 Justo St.'),
(5, 'Greenland', 'Ethe', 32767, 'P.O. Box 172, 5114 Sit Road'),
(6, 'Korea, North', 'Ereğli', 15250, '516-2050 Quisque Ave'),
(7, 'Rwanda', 'Cirencester', 32767, '416-6776 Lacus. Ave'),
(8, 'Oman', 'Slijpe', 8556, 'P.O. Box 803, 3913 Aptent Rd.'),
(9, 'Morocco', 'Montignies-Saint-Christophe', 1153, '6611 Non Street'),
(10, 'Georgia', 'Timkur', 32767, '5442 Consectetuer Road');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `destination`
--

CREATE TABLE `destination` (
  `destination_ID` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `destination`
--

INSERT INTO `destination` (`destination_ID`, `f_name`, `l_name`, `fk_address_ID`) VALUES
(1, 'Quyn', 'Christian', 6),
(2, 'Heather', 'Talley', 4),
(3, 'Elmo', 'Slater', 9),
(4, 'Meredith', 'Watson', 10),
(5, 'Wendy', 'Faulkner', 8),
(6, 'Rebekah', 'Mays', 1),
(7, 'Brent', 'Chen', 2),
(8, 'Ima', 'Fowler', 8),
(9, 'Mohammad', 'Jacobs', 6),
(10, 'Cally', 'Bradley', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `gender` enum('F','M','X') NOT NULL,
  `fk_working_location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_ID`, `f_name`, `l_name`, `gender`, `fk_working_location_ID`) VALUES
(1, 'Faith', 'Giles', 'F', 1),
(2, 'Bo', 'Grant', 'M', 2),
(3, 'Shaeleigh', 'Cannon', 'X', 3),
(4, 'Rae', 'Craft', 'M', 4),
(5, 'Zane', 'Obrien', 'M', 5),
(6, 'Susan', 'Woodward', 'F', 6),
(7, 'Nerea', 'Hess', 'F', 7),
(8, 'Urielle', 'Bonner', 'F', 8),
(9, 'Carlos', 'Eaton', 'M', 9),
(10, 'Malachi', 'Padilla', 'M', 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE `mail` (
  `mail_ID` int(11) NOT NULL,
  `type` enum('package','letter','registered','ad') NOT NULL,
  `received_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `weight` tinyint(4) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL,
  `fk_deposit_location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mail`
--

INSERT INTO `mail` (`mail_ID`, `type`, `received_time`, `weight`, `fk_customer_ID`, `fk_deposit_location_ID`) VALUES
(1, 'package', '2020-07-12 23:59:06', 6, 1, 1),
(2, 'letter', '2020-07-12 23:59:06', 2, 2, 2),
(3, 'package', '2020-07-12 23:59:06', 9, 3, 3),
(4, 'package', '2020-07-12 23:59:06', 8, 4, 4),
(5, 'letter', '2020-07-12 23:59:06', 4, 5, 5),
(6, 'letter', '2020-07-12 23:59:06', 6, 6, 6),
(7, 'ad', '2020-07-12 23:59:06', 5, 7, 7),
(8, 'letter', '2020-07-12 23:59:06', 5, 8, 8),
(9, 'letter', '2020-07-12 23:59:06', 7, 9, 9),
(10, 'package', '2020-07-12 23:59:06', 7, 10, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processed`
--

CREATE TABLE `processed` (
  `processed_ID` int(11) NOT NULL,
  `type` enum('package','letter','ad') DEFAULT NULL,
  `fk_mail_ID` int(11) DEFAULT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL,
  `fk_status_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `processed`
--

INSERT INTO `processed` (`processed_ID`, `type`, `fk_mail_ID`, `fk_employee_ID`, `fk_status_ID`) VALUES
(1, 'package', 1, 1, 0),
(2, 'letter', 2, 2, 0),
(3, 'letter', 3, 3, 1),
(4, 'package', 4, 4, 1),
(5, 'letter', 5, 5, 0),
(6, 'package', 6, 6, 0),
(7, 'letter', 7, 7, 1),
(8, 'package', 8, 8, 1),
(9, 'letter', 9, 9, 0),
(10, 'ad', 10, 10, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing_system`
--

CREATE TABLE `processing_system` (
  `processing_system_ID` int(11) NOT NULL,
  `process_complete` varchar(1) NOT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL,
  `fk_processed_ID` int(11) DEFAULT NULL,
  `fk_status_ID` int(11) DEFAULT NULL,
  `fk_destination_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `processing_system`
--

INSERT INTO `processing_system` (`processing_system_ID`, `process_complete`, `fk_employee_ID`, `fk_processed_ID`, `fk_status_ID`, `fk_destination_ID`) VALUES
(1, '1', 1, 1, 1, 1),
(2, '0', 2, 2, 2, 2),
(3, '1', 3, 3, 3, 3),
(4, '1', 4, 4, 4, 4),
(5, '0', 5, 5, 5, 5),
(6, '0', 6, 6, 6, 6),
(7, '0', 7, 7, 7, 7),
(8, '0', 8, 8, 8, 8),
(9, '1', 9, 9, 9, 9),
(10, '1', 10, 10, 10, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `process_status`
--

CREATE TABLE `process_status` (
  `process_ID` int(11) NOT NULL,
  `status` enum('received','processed','delivered') DEFAULT NULL,
  `process_start` time NOT NULL DEFAULT current_timestamp(),
  `process_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `process_status`
--

INSERT INTO `process_status` (`process_ID`, `status`, `process_start`, `process_end`) VALUES
(1, '', '05:06:35', '09:35:05'),
(2, '', '01:48:22', '14:04:06'),
(3, 'received', '08:06:33', '12:46:01'),
(4, 'received', '02:48:09', '17:04:55'),
(5, 'received', '14:08:36', '01:08:19'),
(6, '', '10:26:19', '00:49:03'),
(7, '', '19:14:05', '23:09:11'),
(8, '', '01:50:17', '02:26:12'),
(9, 'received', '10:51:03', '14:45:08'),
(10, '', '21:10:07', '11:28:50');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indizes für die Tabelle `deliver`
--
ALTER TABLE `deliver`
  ADD PRIMARY KEY (`deliver_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_processing_system_ID` (`fk_processing_system_ID`);

--
-- Indizes für die Tabelle `deposit_location`
--
ALTER TABLE `deposit_location`
  ADD PRIMARY KEY (`deposit_ID`);

--
-- Indizes für die Tabelle `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`),
  ADD KEY `fk_working_location_ID` (`fk_working_location_ID`);

--
-- Indizes für die Tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_deposit_location_ID` (`fk_deposit_location_ID`);

--
-- Indizes für die Tabelle `processed`
--
ALTER TABLE `processed`
  ADD PRIMARY KEY (`processed_ID`),
  ADD KEY `fk_mail_ID` (`fk_mail_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_status_ID` (`fk_status_ID`);

--
-- Indizes für die Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`processing_system_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_processed_ID` (`fk_processed_ID`),
  ADD KEY `fk_status_ID` (`fk_status_ID`),
  ADD KEY `fk_destination_ID` (`fk_destination_ID`);

--
-- Indizes für die Tabelle `process_status`
--
ALTER TABLE `process_status`
  ADD PRIMARY KEY (`process_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints der Tabelle `deliver`
--
ALTER TABLE `deliver`
  ADD CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`employee_ID`),
  ADD CONSTRAINT `deliver_ibfk_2` FOREIGN KEY (`fk_processing_system_ID`) REFERENCES `processing_system` (`processing_system_ID`);

--
-- Constraints der Tabelle `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_working_location_ID`) REFERENCES `deposit_location` (`deposit_ID`);

--
-- Constraints der Tabelle `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`fk_deposit_location_ID`) REFERENCES `deposit_location` (`deposit_ID`);

--
-- Constraints der Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`employee_ID`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`fk_processed_ID`) REFERENCES `processed` (`processed_ID`),
  ADD CONSTRAINT `processing_system_ibfk_3` FOREIGN KEY (`fk_status_ID`) REFERENCES `process_status` (`process_ID`),
  ADD CONSTRAINT `processing_system_ibfk_4` FOREIGN KEY (`fk_destination_ID`) REFERENCES `destination` (`destination_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
