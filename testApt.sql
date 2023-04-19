-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 12:27 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapt`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `addon` varchar(50) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `ApartmentNumber` int(10) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `NumBedrooms` int(10) NOT NULL,
  `NumBathrooms` int(10) NOT NULL,
  `SquareFootage` int(10) NOT NULL,
  `Details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `Description` varchar(100) NOT NULL,
  `Price` double NOT NULL,
  `DueDate` date NOT NULL,
  `LeaseID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `numCars` int(10) NOT NULL,
  `LeaseID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` int(10) NOT NULL,
  `EmpSSN` int(10) NOT NULL,
  `Role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lease`
--

CREATE TABLE `lease` (
  `LeaseID` int(10) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `NumResidents` int(10) NOT NULL,
  `Price` double NOT NULL,
  `ResSSN` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Description` varchar(100) NOT NULL,
  `AmountPaid` double NOT NULL,
  `PaymentDate` date NOT NULL,
  `LeaseID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `SSN` int(15) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL DEFAULT 'newuser',
  `Type` varchar(10) NOT NULL,
  `auth` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `numPets` int(10) NOT NULL,
  `LeaseID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question1`
--

CREATE TABLE `question1` (
  `email` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question2`
--

CREATE TABLE `question2` (
  `email` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question3`
--

CREATE TABLE `question3` (
  `email` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question4`
--

CREATE TABLE `question4` (
  `email` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resident`
--

CREATE TABLE `resident` (
  `ResSSN` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testquestion`
--

CREATE TABLE `testquestion` (
  `email` varchar(50) NOT NULL,
  `question1` tinyint(1) NOT NULL DEFAULT 0,
  `question2` tinyint(1) NOT NULL DEFAULT 0,
  `question3` tinyint(1) NOT NULL DEFAULT 0,
  `question4` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workorder`
--

CREATE TABLE `workorder` (
  `Problem` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Progress` varchar(100) NOT NULL,
  `Rating` varchar(100) NOT NULL,
  `WorkOrderID` int(10) NOT NULL,
  `ApartmentNumber` int(10) NOT NULL,
  `EmpID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`addon`);

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`ApartmentNumber`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD KEY `FK_BillingLeaseID` (`LeaseID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD KEY `FK_CarsLeaseID` (`LeaseID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpSSN`),
  ADD UNIQUE KEY `EmpID` (`EmpID`);

--
-- Indexes for table `lease`
--
ALTER TABLE `lease`
  ADD PRIMARY KEY (`LeaseID`),
  ADD KEY `FK_LeaseSSN` (`ResSSN`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `FK_PaymentLeaseID` (`LeaseID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`SSN`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD KEY `FK_PetsLeaseID` (`LeaseID`);

--
-- Indexes for table `question1`
--
ALTER TABLE `question1`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `question2`
--
ALTER TABLE `question2`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `question3`
--
ALTER TABLE `question3`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `question4`
--
ALTER TABLE `question4`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`ResSSN`);

--
-- Indexes for table `testquestion`
--
ALTER TABLE `testquestion`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `workorder`
--
ALTER TABLE `workorder`
  ADD KEY `FK_WorkOrderEmpID` (`EmpID`),
  ADD KEY `FK_WorkOrderAptNum` (`ApartmentNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `FK_BillingLeaseID` FOREIGN KEY (`LeaseID`) REFERENCES `lease` (`LeaseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `FK_CarsLeaseID` FOREIGN KEY (`LeaseID`) REFERENCES `lease` (`LeaseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_EmpSSN` FOREIGN KEY (`EmpSSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lease`
--
ALTER TABLE `lease`
  ADD CONSTRAINT `FK_LeaseSSN` FOREIGN KEY (`ResSSN`) REFERENCES `resident` (`ResSSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_PaymentLeaseID` FOREIGN KEY (`LeaseID`) REFERENCES `lease` (`LeaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `FK_PetsLeaseID` FOREIGN KEY (`LeaseID`) REFERENCES `lease` (`LeaseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question1`
--
ALTER TABLE `question1`
  ADD CONSTRAINT `FK_Question1Email` FOREIGN KEY (`email`) REFERENCES `person` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question2`
--
ALTER TABLE `question2`
  ADD CONSTRAINT `FK_Question2Email` FOREIGN KEY (`email`) REFERENCES `person` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question3`
--
ALTER TABLE `question3`
  ADD CONSTRAINT `FK_Question3Email` FOREIGN KEY (`email`) REFERENCES `person` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question4`
--
ALTER TABLE `question4`
  ADD CONSTRAINT `FK_Question4Email` FOREIGN KEY (`email`) REFERENCES `person` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resident`
--
ALTER TABLE `resident`
  ADD CONSTRAINT `FK_ResSSN` FOREIGN KEY (`ResSSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `testquestion`
--
ALTER TABLE `testquestion`
  ADD CONSTRAINT `FK_QuestionEmail` FOREIGN KEY (`email`) REFERENCES `person` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workorder`
--
ALTER TABLE `workorder`
  ADD CONSTRAINT `FK_WorkOrderAptNum` FOREIGN KEY (`ApartmentNumber`) REFERENCES `apartment` (`ApartmentNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WorkOrderEmpID` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
