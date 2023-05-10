-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2023 at 01:19 PM
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
-- Database: `d1`
--

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

CREATE TABLE `contests` (
  `id` int(11) NOT NULL,
  `spots` int(11) NOT NULL DEFAULT 2,
  `entry` int(11) NOT NULL,
  `prize` int(11) NOT NULL,
  `winner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contests`
--

INSERT INTO `contests` (`id`, `spots`, `entry`, `prize`, `winner`) VALUES
(4, 5, 99, 500, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fantasyteams`
--

CREATE TABLE `fantasyteams` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fantasyteams_contests`
--

CREATE TABLE `fantasyteams_contests` (
  `contest_id` int(11) NOT NULL,
  `fantasyteam_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fantasyteams_players`
--

CREATE TABLE `fantasyteams_players` (
  `fantasyteam_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  `result` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `date`, `team1_id`, `team2_id`, `result`) VALUES
(2, '2023-05-15 10:30:00', 1, 3, ''),
(3, '2023-05-15 10:30:00', 1, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `matches_scorecards`
--

CREATE TABLE `matches_scorecards` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `total_runs` int(11) NOT NULL DEFAULT 0,
  `total_wickets` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches_teams_players`
--

CREATE TABLE `matches_teams_players` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches_venues`
--

CREATE TABLE `matches_venues` (
  `match_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `batting_style` varchar(255) NOT NULL,
  `bowling_style` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `role`, `batting_style`, `bowling_style`) VALUES
(1, 'sfsdf', 'wk', '', 'spin'),
(2, 'aaa', 'bat', 'left handed', 'off spin'),
(3, 'aaa', 'aaa', 'aaa', '');

-- --------------------------------------------------------

--
-- Table structure for table `players_teams`
--

CREATE TABLE `players_teams` (
  `player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`) VALUES
(1, 'DC'),
(2, 'MI'),
(3, 'CSK'),
(4, 'RCB'),
(5, 'SRH'),
(6, 'KKR'),
(7, 'PBKS');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `name`) VALUES
(1, 'BBL');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments_teams`
--

CREATE TABLE `tournaments_teams` (
  `tournament_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` int(11) NOT NULL,
  `stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`stats`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `stats`) VALUES
(1, '{\"location\":\"melbourne\", \"name\":\"MCG\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fantasyteams`
--
ALTER TABLE `fantasyteams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `match_id` (`match_id`);

--
-- Indexes for table `fantasyteams_contests`
--
ALTER TABLE `fantasyteams_contests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contest_id_2` (`contest_id`,`fantasyteam_id`),
  ADD KEY `contest_id` (`contest_id`),
  ADD KEY `f_id` (`fantasyteam_id`);

--
-- Indexes for table `fantasyteams_players`
--
ALTER TABLE `fantasyteams_players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `f_id` (`fantasyteam_id`,`player_id`),
  ADD KEY `f_id_2` (`fantasyteam_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team1_id` (`team1_id`),
  ADD KEY `team2_id` (`team2_id`);

--
-- Indexes for table `matches_scorecards`
--
ALTER TABLE `matches_scorecards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `match_id` (`match_id`,`team_id`),
  ADD KEY `match_id_2` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `matches_teams_players`
--
ALTER TABLE `matches_teams_players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `match_id` (`match_id`,`team_id`,`player_id`),
  ADD KEY `match_id_2` (`match_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `matches_venues`
--
ALTER TABLE `matches_venues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `match_id_2` (`match_id`,`venue_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players_teams`
--
ALTER TABLE `players_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `player_id` (`player_id`,`team_id`),
  ADD KEY `player_id_2` (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournaments_teams`
--
ALTER TABLE `tournaments_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tournament_id` (`tournament_id`,`team_id`),
  ADD KEY `tournament_id_2` (`tournament_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fantasyteams_contests`
--
ALTER TABLE `fantasyteams_contests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fantasyteams_players`
--
ALTER TABLE `fantasyteams_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matches_scorecards`
--
ALTER TABLE `matches_scorecards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches_teams_players`
--
ALTER TABLE `matches_teams_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches_venues`
--
ALTER TABLE `matches_venues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `players_teams`
--
ALTER TABLE `players_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tournaments_teams`
--
ALTER TABLE `tournaments_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fantasyteams`
--
ALTER TABLE `fantasyteams`
  ADD CONSTRAINT `fantasyteams_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fantasyteams_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`);

--
-- Constraints for table `fantasyteams_contests`
--
ALTER TABLE `fantasyteams_contests`
  ADD CONSTRAINT `fantasyteams_contests_ibfk_1` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`id`),
  ADD CONSTRAINT `fantasyteams_contests_ibfk_2` FOREIGN KEY (`fantasyteam_id`) REFERENCES `fantasyteams` (`id`);

--
-- Constraints for table `fantasyteams_players`
--
ALTER TABLE `fantasyteams_players`
  ADD CONSTRAINT `fantasyteams_players_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `fantasyteams_players_ibfk_2` FOREIGN KEY (`fantasyteam_id`) REFERENCES `fantasyteams` (`id`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`team1_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team2_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `matches_scorecards`
--
ALTER TABLE `matches_scorecards`
  ADD CONSTRAINT `matches_scorecards_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `matches_scorecards_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`);

--
-- Constraints for table `matches_teams_players`
--
ALTER TABLE `matches_teams_players`
  ADD CONSTRAINT `matches_teams_players_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `matches_teams_players_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `matches_teams_players_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Constraints for table `matches_venues`
--
ALTER TABLE `matches_venues`
  ADD CONSTRAINT `matches_venues_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`),
  ADD CONSTRAINT `matches_venues_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`);

--
-- Constraints for table `players_teams`
--
ALTER TABLE `players_teams`
  ADD CONSTRAINT `players_teams_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `players_teams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `tournaments_teams`
--
ALTER TABLE `tournaments_teams`
  ADD CONSTRAINT `tournaments_teams_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`),
  ADD CONSTRAINT `tournaments_teams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
