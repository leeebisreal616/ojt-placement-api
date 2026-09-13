-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2026 at 01:25 PM
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
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `placements`
--

INSERT INTO `placements` (`id`, `studentId`, `companyName`, `position`, `status`, `startDate`, `endDate`) VALUES
(1, 4, 'Acme Corp', 'IT Intern', 'approved', '2026-09-01', NULL),
(2, 4, 'Acme Corp', 'IT Intern', 'pending', '2026-09-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student',
  `fullName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `fullName`) VALUES
(3, 'coordinator@cvsu.edu.ph', '$2b$10$i/GEhLb6G4lQFgT54/1mbusT7Qd53z8/tyyMYQnF9SUQnMI/sk1/y', 'coordinator', 'Jervin Quicho'),
(4, 'student@cvsu.edu.ph', '$2b$10$XZErRf7LYTtKwpl63S3Wr.VZ0Le17ITi.3f2MnXg6tKANHe/pSSZS', 'student', 'Updated Name'),
(5, 'newuser@cvsu.edu.ph', '$2b$10$otW9.Rh0CebNjGDdx.j8SOHO/wQPyDUH1B5hZvPHWRBhWL/Pz38Vm', 'student', 'New Test User');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `placements`
--
ALTER TABLE `placements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
