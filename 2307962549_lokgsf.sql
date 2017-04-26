
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";




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
  `Zip` tinyint(3) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Rent_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Mem_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Mem_ID` (`Mem_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
