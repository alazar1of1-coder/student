-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2026 at 07:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_result_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_name`, `credit_hours`, `teacher_id`, `created_at`) VALUES
(1, 'ITEC202', 'ip', 3, 1, '2026-01-11 12:32:17'),
(2, 'IPE123', 'internet', 3, 1, '2026-01-11 14:06:15'),
(3, 'NET123', 'network', 3, 5, '2026-01-11 17:00:23'),
(4, 'CS122', 'Computer Science Course 122', 4, 6, '2026-01-11 17:30:13'),
(5, 'IT123', 'information', 4, 6, '2026-01-12 05:14:31'),
(6, 'n', 'Physics', 2, 8, '2026-01-12 05:17:54'),
(7, 'AC124', 'ip', 3, 1, '2026-01-12 05:44:12'),
(8, 'CB123', 'computer eng', 3, 6, '2026-01-12 06:22:16'),
(9, 'HB123', 'health', 1, 9, '2026-01-12 06:24:52'),
(10, 'ITEC123', 'Internet Programming', 4, 10, '2026-01-16 06:59:57'),
(11, 'IT308', 'network', 3, 11, '2026-01-24 12:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `marks_obtained` decimal(5,2) DEFAULT NULL,
  `total_marks` decimal(5,2) DEFAULT 100.00,
  `grade` char(2) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `student_id`, `course_id`, `marks_obtained`, `total_marks`, `grade`, `teacher_id`, `submitted_at`) VALUES
(1, 2, 4, 80.00, 100.00, 'A', 6, '2026-01-11 17:34:12'),
(2, 4, 3, 70.00, 100.00, 'B', 5, '2026-01-12 05:11:53'),
(3, 4, 6, 70.00, 100.00, 'B', 8, '2026-01-12 05:18:18'),
(4, 2, 9, 100.00, 100.00, 'A+', 9, '2026-01-12 06:27:05'),
(5, 4, 3, 85.00, 100.00, 'A+', 5, '2026-01-12 06:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `roll_number` varchar(20) NOT NULL,
  `class` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `roll_number`, `class`, `date_of_birth`, `address`) VALUES
(1, 4, 'ST123456', 'other', '2015-12-28', 'addis ababa'),
(2, 8, 'mel12', '10th', NULL, NULL),
(3, 9, 'beke12', '12', NULL, NULL),
(4, 12, 'alex12', '10th', NULL, NULL),
(5, 16, '32', 'u', NULL, NULL),
(6, 18, 'At123', '12thA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `qualifications` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `department`, `qualifications`) VALUES
(1, 2, 'IT', NULL),
(3, 5, 'IT', NULL),
(5, 7, 'IT', NULL),
(6, 10, 'cs', NULL),
(8, 13, 'phy', NULL),
(9, 14, 'IT', NULL),
(10, 15, 'IT', NULL),
(11, 17, 'cs', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `full_name`, `created_at`) VALUES
(1, 'admin', '$2y$10$DW4pUe.u6DZhqtg4hEcl9OuKTyc6aBm/x4YcwTkaaxcfhQEgwLn/2', 'admin', NULL, 'System Administrator', '2026-01-11 09:20:02'),
(2, 'teacher1', '$2y$10$JjolaIYSNQ6ZtNrmjTM.mOT/4AacTacTIjJRFkVl3Ix821OkxVYwy', 'teacher', 'alazar1of1@gmail.com', 'alazar abebe', '2026-01-11 10:08:30'),
(4, 'alemu', '$2y$10$Sei1xSMiLpeJiTtKmFr9teMuDfN3P9ngoRQyI235KvuRPkNL9d4ji', 'student', 'alemu@gmail.com', 'alemu bekele', '2026-01-11 13:18:51'),
(5, 'mut', '$2y$10$8zZVTrv3jStnQukjSzGPr.zWuZ./EH8J0b1SsV9U68PWtkecEKB8O', 'teacher', 'mut@gmail.com', 'mr mut', '2026-01-11 14:07:27'),
(7, 'teacher', '$2y$10$a7C98/tXyQYieLQdUObmuuO4KNMxi/ZtVP9RVWcZIkWEKLhD65llO', 'teacher', 'mut@gmail.com', 'mr mut', '2026-01-11 14:25:31'),
(8, 'mele', '$2y$10$jJcmMsuPDeJe/VxU4NGHmeofSyHvGvsh2qhmh4Vi/xOHkLEbufAri', 'student', NULL, 'almaz abebe', '2026-01-11 16:46:06'),
(9, 'beke', '$2y$10$cFyj.WAkmmE4mdFZvInTXuAg7eQfqpI5idF9y6XE3zrWAfRAnchcS', 'student', NULL, 'bekele tolosa', '2026-01-11 17:15:03'),
(10, 'abebe', '$2y$10$wj.sT/svE7ALPYzwYMJKV.jxBZFfdkJR7jRglnTIT6TcspUR13s2C', 'teacher', 'abebe@gmail.com', 'mr abebe', '2026-01-11 17:28:32'),
(12, 'alex', '$2y$10$r3ehslBRG1L.kijAX1JVbelkLYhKPk/FRYXBNxE0jbdUkPVW/iR2C', 'student', NULL, 'alex tadele', '2026-01-12 05:10:11'),
(13, 'mr', '$2y$10$hCOWJxJsUpscmoNUyE1JNeKmghAnhCFMY.kRiS.GbwfkXbCg5FB4e', 'teacher', 'mr@gmail.com', 'mr ab', '2026-01-12 05:16:44'),
(14, 'mr mar', '$2y$10$iEnGb4k6pgtTqkBlr3oDb.ThPbDyh0YzkAF4lO0EUo1U9pElde4N2', 'teacher', 'mr@gmail.co', 'mr markos', '2026-01-12 06:24:12'),
(15, 'Gatluk', '$2y$10$Q6gmjGED1rUfkN7WgJxYu.YfuEin/K2f.D7qFJUXx7rKjA2j4V2DS', 'teacher', 'alazar1of2@gmail.com', 'Gatluk Wat Riek', '2026-01-16 06:58:13'),
(16, 'esubalewu', '$2y$10$nN.zS2r77AaKoXdQVB4MIuuXGwiBhveKz01RSmNSjS2UYS8Sl43Aq', 'student', NULL, 'kebede abe', '2026-01-20 18:14:58'),
(17, 'sol', '$2y$10$OkMIblu5qSeEZoUgywcwcO45YeQMNh4LIK0BgCV3lG93yBNL1pKcu', 'teacher', 'sol@gmail.com', 'mr solomon', '2026-01-24 12:14:38'),
(18, 'gech', '$2y$10$StlIEdgbYDWJxxDthjgMeOIk2M9H5ibHo89BnfIOy0AGhCgoKv4mu', 'student', NULL, 'getachew yeneneh', '2026-02-24 17:28:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll_number` (`roll_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
