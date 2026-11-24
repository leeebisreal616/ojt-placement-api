-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 09:22 AM
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
-- Database: `ojt_placement_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `logbook_entries`
--

CREATE TABLE `logbook_entries` (
  `id` int(11) NOT NULL,
  `placementId` int(11) NOT NULL,
  `entryDate` date NOT NULL,
  `taskDescription` text NOT NULL,
  `hoursRendered` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logbook_entries`
--

INSERT INTO `logbook_entries` (`id`, `placementId`, `entryDate`, `taskDescription`, `hoursRendered`) VALUES
(1, 1, '2026-11-24', 'Fixed backend bugs and tested API endpoints', 8);

-- --------------------------------------------------------

--
-- Table structure for table `placements`
--

CREATE TABLE `placements` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `requiredHours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `placements`
--

INSERT INTO `placements` (`id`, `studentId`, `companyName`, `position`, `status`, `startDate`, `endDate`, `requiredHours`) VALUES
(1, 1, 'Test Company Inc.', 'IT Intern', 'approved', '2026-11-24', '2027-02-24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student',
  `fullName` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `fullName`, `phoneNumber`) VALUES
(1, 'student.test@cvsu.edu.ph', '$2b$10$jTr6MB1xOv91iyezQj27seR2OltT4puyJovr9s/0kCCtZtF09xJTi', 'student', 'Test Student', '09123456789'),
(2, 'coordinator.test@cvsu.edu.ph', '$2b$10$phdwsK40t9siP0fXGHBHceqOmnKB9Uiiy1jQt.afWIOVPZ3vbEa.y', 'coordinator', 'Test Coordinator', '09000000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logbook_entries`
--
ALTER TABLE `logbook_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3d24e39cd917be7e790e8eab3d5` (`placementId`);

--
-- Indexes for table `placements`
--
ALTER TABLE `placements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_4c8a7c91f605d62d79ede8d92f5` (`studentId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logbook_entries`
--
ALTER TABLE `logbook_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `placements`
--
ALTER TABLE `placements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logbook_entries`
--
ALTER TABLE `logbook_entries`
  ADD CONSTRAINT `FK_3d24e39cd917be7e790e8eab3d5` FOREIGN KEY (`placementId`) REFERENCES `placements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `placements`
--
ALTER TABLE `placements`
  ADD CONSTRAINT `FK_4c8a7c91f605d62d79ede8d92f5` FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
