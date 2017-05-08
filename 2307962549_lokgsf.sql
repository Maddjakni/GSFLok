-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 05, 2017 at 01:22 PM
-- Server version: 5.7.14-log
-- PHP Version: 5.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `2307962549_lokgsf`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailrental`
--

CREATE TABLE IF NOT EXISTS `detailrental` (
  `Rent_ID` int(11) NOT NULL,
  `Vid_ID` int(11) NOT NULL,
  `FEE` double NOT NULL,
  `DueDate` date NOT NULL,
  `ReturnDate` date NOT NULL,
  `DailyLateFee` double NOT NULL,
  PRIMARY KEY (`Rent_ID`,`Vid_ID`),
  KEY `Vid_ID` (`Vid_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detailrental`
--

INSERT INTO `detailrental` (`Rent_ID`, `Vid_ID`, `FEE`, `DueDate`, `ReturnDate`, `DailyLateFee`) 
VALUES
(1001, 34342, 2, '2009-03-04', '2009-03-02', 1),
(1001, 34366, 3.5, '2009-03-04', '2009-03-02', 3),
(1001, 61353, 2, '2009-03-04', '2009-03-03', 1),
(1002, 59237, 3.5, '2009-03-04', '2009-03-04', 3),
(1003, 54325, 3.5, '2009-03-04', '2009-03-09', 3),
(1003, 61369, 2, '2009-03-06', '2009-03-09', 1),
(1003, 61388, 0, '2009-03-06', '2009-03-09', 1),
(1004, 34341, 2, '2009-03-07', '2009-03-07', 1),
(1004, 34367, 3.5, '2009-03-05', '2009-03-07', 3),
(1004, 44392, 3.5, '2009-03-05', '2009-03-07', 3),
(1005, 34342, 2, '2009-03-07', '2009-03-05', 1),
(1005, 44397, 3.5, '2009-03-05', '2009-03-05', 3),
(1006, 34355, 3.5, '2009-03-05', '2009-03-04', 3),
(1006, 61367, 2, '2009-03-07', NULL, 1),
(1007, 34368, 3.5, '2009-03-05', NULL, 3),
(1008, 34369, 3.5, '2009-03-05', '2009-03-05', 3),
(1009, 54324, 3.5, '2009-03-05', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `ID` int(11) NOT NULL,
  `First Name` varchar(75) NOT NULL,
  `Last Name` varchar(75) NOT NULL,
  `Street` varchar(75) NOT NULL,
  `City` varchar(75) NOT NULL,
  `State` varchar(75) NOT NULL,
  `Zip` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`ID`, `First Name`, `Last Name`, `Street`, `City`, `State`, `Zip`, `Balance`) VALUES
(102, 'Tami', 'Dawson', '2632 Takli Circle', 'Norene', 'TN', 37136, 11),
(103, 'Curt', 'Knight', '4025 Cornell Court', 'Flatgap', 'KY', 41219, 6),
(104, 'Jamal', 'Melendez', '788 East 145th Avenue', 'Quebeck', 'TN', 38579, 0),
(105, 'Iva', 'Mcclain', '6045 Musket Ball Circle', 'Summit', 'KY', 42783, 15),
(106, 'Miranda', 'Parks', '4469 Maxwell Place', 'Germantown', 'TN', 38183, 0),
(107, 'Rosario', 'Elliot', '7578 Danner Avenue', 'Columbia', 'TN', 38402, 5),
(108, 'Mattie', 'Guy', '4390 Evergreen Street', 'Lily', 'KY', 40740, 0),
(109, 'Clint', 'Ochoa', '1711 Elm Street', 'Greeneville', 'TN', 37745, 10),
(110, 'Lewis', 'Rosales', '4524 Southwind Circle', 'Counce', 'TN', 38326, 0),
(111, 'Stacy', 'Mann', '2789 East Cook Avenue', 'Murfreesboro', 'TN', 37132, 8),
(112, 'Luis', 'Trujillo', '7267 Melvin Avenue', 'Heiskell', 'TN', 37754, 3),
(113, 'Minnie', 'Gonzales', '6430 Vasili Drive', 'Williston', 'TN', 38076, 0);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `ID` int(11) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `Year` year(4) NOT NULL,
  `Cost` double NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `PriceCode` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PriceCode` (`PriceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE IF NOT EXISTS `price` (
  `Code` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Fee` double NOT NULL,
  `DailyLateFee` double NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE IF NOT EXISTS `rental` (
  `ID` int(11) NOT NULL,
  `Rent_Date` date NOT NULL,
  `Mem_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Mem_ID` (`Mem_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`ID`, `Rent_Date`, `Mem_ID`) VALUES
(1001, '2009-03-01', 103),
(1002, '2009-03-01', 105),
(1003, '2009-03-02', 102),
(1004, '2009-03-02', 110),
(1005, '2009-03-02', 111),
(1006, '2009-03-02', 107),
(1007, '2009-03-02', 104),
(1008, '2009-03-03', 105),
(1009, '2009-03-03', 111);



-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `ID` int(11) NOT NULL,
  `INDATE` date NOT NULL,
  `Movie_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Movie_ID` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailrental`
--
ALTER TABLE `detailrental`
  ADD CONSTRAINT `detailrental_ibfk_1` FOREIGN KEY (`Rent_ID`) REFERENCES `rental` (`ID`),
  ADD CONSTRAINT `detailrental_ibfk_2` FOREIGN KEY (`Vid_ID`) REFERENCES `video` (`ID`);

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`PriceCode`) REFERENCES `price` (`Code`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`Mem_ID`) REFERENCES `members` (`ID`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
