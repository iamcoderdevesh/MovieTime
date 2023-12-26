-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2023 at 09:02 AM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20121598_movietime`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `AdminId` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingId` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `UserId` int(11) NOT NULL,
  `ShowId` int(11) NOT NULL,
  `NoOfTickets` int(11) NOT NULL,
  `SeatNo` text NOT NULL,
  `SeatType` text NOT NULL,
  `Status` text NOT NULL DEFAULT 'Active',
  `UniqueId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cast_details`
--

CREATE TABLE `cast_details` (
  `castid` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `cast_name` varchar(100) NOT NULL,
  `cast_role` varchar(100) NOT NULL,
  `cast_img` longblob NOT NULL,
  `imagePath` varchar(1000) NOT NULL DEFAULT 'Image not available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crew_details`
--

CREATE TABLE `crew_details` (
  `crewid` int(11) NOT NULL,
  `movieid` varchar(100) NOT NULL,
  `crew_name` varchar(100) NOT NULL,
  `crew_role` varchar(100) NOT NULL,
  `crew_img` longblob NOT NULL,
  `imagePath` varchar(1000) NOT NULL DEFAULT 'Image not available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomCart`
--

CREATE TABLE `ecomCart` (
  `uId` varchar(1000) NOT NULL,
  `pId` varchar(100) NOT NULL,
  `pImg` varchar(1000) NOT NULL DEFAULT 'null',
  `pTitle` varchar(100) NOT NULL,
  `pPrice` varchar(100) NOT NULL,
  `pQuantity` varchar(100) NOT NULL,
  `pCategory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomUser`
--

CREATE TABLE `ecomUser` (
  `uId` int(100) NOT NULL,
  `uName` varchar(100) NOT NULL,
  `uPhoneNo` varchar(100) NOT NULL,
  `uEmail` varchar(100) NOT NULL,
  `uPassword` varchar(100) NOT NULL,
  `otpCode` varchar(100) NOT NULL,
  `otpStatus` varchar(100) NOT NULL DEFAULT 'Not Verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `giftcard`
--

CREATE TABLE `giftcard` (
  `GiftCardId` int(11) NOT NULL,
  `GiftName` text NOT NULL,
  `GiftImage` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `MovieId` int(50) NOT NULL,
  `MovieName` text NOT NULL,
  `MovieGenre` text NOT NULL,
  `MovieLength` varchar(50) NOT NULL,
  `DirectorName` text NOT NULL,
  `YoutubeLink` text NOT NULL,
  `ReleaseDate` date NOT NULL,
  `MovieLanguages` varchar(150) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `MovieImage` longblob NOT NULL,
  `MoviePoster` longblob NOT NULL,
  `MovieVerticalImage` longblob NOT NULL,
  `Quality` varchar(100) DEFAULT NULL,
  `About` text DEFAULT NULL,
  `VerticalimagePath` varchar(1000) NOT NULL DEFAULT 'Image Path not available',
  `SmallimagePath` varchar(1000) NOT NULL DEFAULT 'Image Path not available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentId` int(11) NOT NULL,
  `BookingId` int(11) NOT NULL,
  `PaymentMethod` text NOT NULL,
  `Amount` int(11) NOT NULL,
  `Time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Review` text NOT NULL,
  `Date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `ShowId` int(11) NOT NULL,
  `TheaterId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  `Language` text NOT NULL,
  `ScreenNo` text NOT NULL,
  `ScreenType` text NOT NULL,
  `Time` text NOT NULL,
  `Date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theaterCredentials`
--

CREATE TABLE `theaterCredentials` (
  `TheaterID` int(11) NOT NULL,
  `Theatername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `TheaterId` int(11) NOT NULL,
  `TheaterName` text NOT NULL,
  `TheaterAddress` text NOT NULL,
  `City` text NOT NULL,
  `Email` text NOT NULL,
  `PhoneNo` text NOT NULL,
  `NoOfScreens` int(11) NOT NULL,
  `ScreenTypes` text NOT NULL,
  `WebsiteCommission` int(11) NOT NULL,
  `SeatTypes` text NOT NULL,
  `Revenue` int(11) NOT NULL,
  `Status` text NOT NULL DEFAULT '\'Yes\'',
  `TheaterImages` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uLogin`
--

CREATE TABLE `uLogin` (
  `UserId` int(50) NOT NULL,
  `Name` text NOT NULL DEFAULT 'N/A',
  `Phone` varchar(10) NOT NULL DEFAULT 'N/A',
  `Email` varchar(50) NOT NULL DEFAULT 'N/A',
  `Password` text NOT NULL,
  `Code` text NOT NULL DEFAULT '\'1111\'',
  `FacebookId` text NOT NULL DEFAULT 'N/A',
  `GoogleId` text NOT NULL DEFAULT 'N/A',
  `OtpVerified` text NOT NULL DEFAULT 'NO',
  `JoinedOn` varchar(50) NOT NULL,
  `Block` varchar(10) NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`AdminId`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ShowId` (`ShowId`);

--
-- Indexes for table `cast_details`
--
ALTER TABLE `cast_details`
  ADD PRIMARY KEY (`castid`);

--
-- Indexes for table `crew_details`
--
ALTER TABLE `crew_details`
  ADD PRIMARY KEY (`crewid`);

--
-- Indexes for table `ecomUser`
--
ALTER TABLE `ecomUser`
  ADD PRIMARY KEY (`uId`);

--
-- Indexes for table `giftcard`
--
ALTER TABLE `giftcard`
  ADD PRIMARY KEY (`GiftCardId`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`MovieId`) USING BTREE;

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `BookingId` (`BookingId`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `MovieId` (`MovieId`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`ShowId`),
  ADD KEY `TheaterId` (`TheaterId`),
  ADD KEY `MovieId` (`MovieId`);

--
-- Indexes for table `theaterCredentials`
--
ALTER TABLE `theaterCredentials`
  ADD PRIMARY KEY (`TheaterID`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`TheaterId`);

--
-- Indexes for table `uLogin`
--
ALTER TABLE `uLogin`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `AdminId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cast_details`
--
ALTER TABLE `cast_details`
  MODIFY `castid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crew_details`
--
ALTER TABLE `crew_details`
  MODIFY `crewid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecomUser`
--
ALTER TABLE `ecomUser`
  MODIFY `uId` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `giftcard`
--
ALTER TABLE `giftcard`
  MODIFY `GiftCardId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `MovieId` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `ShowId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theaterCredentials`
--
ALTER TABLE `theaterCredentials`
  MODIFY `TheaterID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `TheaterId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uLogin`
--
ALTER TABLE `uLogin`
  MODIFY `UserId` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `uLogin` (`UserId`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `uLogin` (`UserId`);

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`TheaterId`) REFERENCES `theaters` (`TheaterId`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`MovieId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
