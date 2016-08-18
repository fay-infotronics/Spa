-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2016 at 10:53 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shev_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `boo_ID` int(10) unsigned NOT NULL,
  `boo_StartDate` date NOT NULL,
  `boo_EndDate` date NOT NULL,
  `sui_ID` int(10) unsigned NOT NULL,
  `ppl_ID` int(10) unsigned NOT NULL,
  `ppl_IDAgent` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`boo_ID`, `boo_StartDate`, `boo_EndDate`, `sui_ID`, `ppl_ID`, `ppl_IDAgent`) VALUES
(1, '2016-08-18', '2016-08-19', 1, 1, NULL),
(2, '2016-08-18', '2016-08-19', 1, 1, NULL),
(3, '2016-08-18', '2016-08-20', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_ID` int(10) unsigned NOT NULL,
  `log_StartDate` date NOT NULL,
  `log_EndDate` date NOT NULL,
  `sui_ID` int(10) unsigned NOT NULL,
  `ppl_ID` int(10) unsigned NOT NULL,
  `ppl_IDAgent` int(10) unsigned DEFAULT NULL,
  `log_Cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `log_CheckedOut` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_ID`, `log_StartDate`, `log_EndDate`, `sui_ID`, `ppl_ID`, `ppl_IDAgent`, `log_Cancelled`, `log_CheckedOut`) VALUES
(1, '2016-08-18', '2016-08-19', 1, 1, NULL, 0, NULL),
(2, '2016-08-18', '2016-08-19', 1, 1, NULL, 0, NULL),
(3, '2016-08-18', '2016-08-20', 1, 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `pay_ID` int(10) unsigned NOT NULL,
  `ppl_ID` int(10) unsigned NOT NULL,
  `pay_Amt` decimal(10,0) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `ppl_ID` int(10) unsigned NOT NULL,
  `ppl_LName` varchar(45) NOT NULL,
  `ppl_FName` varchar(45) NOT NULL,
  `ppl_Email` varchar(80) NOT NULL,
  `ppl_Password` varchar(32) NOT NULL,
  `ppl_Type` varchar(20) NOT NULL,
  `ppl_Balance` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`ppl_ID`, `ppl_LName`, `ppl_FName`, `ppl_Email`, `ppl_Password`, `ppl_Type`, `ppl_Balance`) VALUES
(1, 'dotnet', 'fs', 'fsdotnetdev@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'client', 0);

-- --------------------------------------------------------

--
-- Table structure for table `suite`
--

CREATE TABLE IF NOT EXISTS `suite` (
  `sui_ID` int(10) unsigned NOT NULL,
  `sui_Name` varchar(45) NOT NULL,
  `sui_Available` int(11) NOT NULL DEFAULT '10',
  `sui_CPN` decimal(10,0) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suite`
--

INSERT INTO `suite` (`sui_ID`, `sui_Name`, `sui_Available`, `sui_CPN`) VALUES
(1, 'Luxary', 10, '10000'),
(2, 'Standard', 20, '5000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`boo_ID`),
  ADD KEY `sui_IDBook_idx` (`sui_ID`),
  ADD KEY `ppl_IDClient_idx` (`ppl_ID`),
  ADD KEY `ppl_IDBookAgent_idx` (`ppl_IDAgent`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_ID`),
  ADD KEY `sui_ID_idx` (`sui_ID`),
  ADD KEY `ppl_ID_idx` (`ppl_ID`),
  ADD KEY `agentID_idx` (`ppl_IDAgent`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_ID`),
  ADD KEY `clientID_idx` (`ppl_ID`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`ppl_ID`),
  ADD UNIQUE KEY `ppl_Email_UNIQUE` (`ppl_Email`);

--
-- Indexes for table `suite`
--
ALTER TABLE `suite`
  ADD PRIMARY KEY (`sui_ID`),
  ADD UNIQUE KEY `sui_Name_UNIQUE` (`sui_Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `boo_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `ppl_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `suite`
--
ALTER TABLE `suite`
  MODIFY `sui_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `ppl_IDBookAgent` FOREIGN KEY (`ppl_IDAgent`) REFERENCES `people` (`ppl_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ppl_IDClient` FOREIGN KEY (`ppl_ID`) REFERENCES `people` (`ppl_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sui_IDBook` FOREIGN KEY (`sui_ID`) REFERENCES `suite` (`sui_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `agentIDLog` FOREIGN KEY (`ppl_IDAgent`) REFERENCES `people` (`ppl_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ppl_ID` FOREIGN KEY (`ppl_ID`) REFERENCES `people` (`ppl_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sui_ID` FOREIGN KEY (`sui_ID`) REFERENCES `suite` (`sui_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `clientID` FOREIGN KEY (`ppl_ID`) REFERENCES `people` (`ppl_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
