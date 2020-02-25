-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2020 at 09:47 AM
-- Server version: 8.0.19-0ubuntu0.19.10.3
-- PHP Version: 7.2.19-0ubuntu0.19.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meet`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `location` varchar(255) NOT NULL,
  `picid` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `fee` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `current_number` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `gender`, `location`, `picid`, `specialization`, `fee`, `address`, `current_number`) VALUES
(1, 'Dr. Cherian Mamen', 'M', 'kochi', '1.jpg', 'General Physicians', '400', '', 0),
(2, 'Dr. Rajkumar', 'M', 'kochi', '2.jpg', 'Dentist', '600', '', 0),
(3, 'Dr. Savita Bhat', 'F', 'kochi', '3.jpg', 'Cardiologists', '430', '', 0),
(4, 'Dr. Siju C. Cheeran', 'M', 'kochi', '4.jpg', 'Dentist', '550', '', 0),
(5, 'Dr. Rose V. Pulikkal ', 'F', 'kochi', '5.jpg', 'General Physicians', '800', '', 0),
(6, 'Dr. Deepa Paulose', 'F', 'kochi', '6.jpg', 'Cardiologists', '464', '', 0),
(7, 'Dr. Aditya K. B.', 'M', 'Palakkad', '7.jpg', 'Dentist', '4000', '', 0),
(8, 'Dr. Revati S. Ramesh', 'M', 'Palakkad', '8.jpg', 'Psychiatrist', '8000', '', 0),
(9, 'Dr. Leena Pillai', 'F', 'Palakkad', '9.jpg', 'Cardiologists', '650', '', 0),
(10, 'Dr.  Puthuran Varghese', 'F', 'Palakkad', '10.jpg', 'General Physicians', '500', '', 0),
(11, 'Dr. Apoorva S.', 'M', 'Palakkad', '11.jpg', 'Psychiatrist', '750', '', 0),
(12, 'Dr. Narayanan Kutty', 'M', 'Palakkad', '12.jpg', 'Dentist', '800', '', 0),
(13, 'Dr.  Kocha Varma', 'M', 'Trivandrum', '13.jpg', 'General Physicians', '665', '', 0),
(14, 'Dr. Vijay Kumar M', 'F', 'Trivandrum', '14.jpg', 'Nephrologist', '800', '', 0),
(15, ' Dr. Anil S.R', 'F', 'Trivandrum', '15.jpg', 'Orthopedist', '650', '', 0),
(16, 'Dr. Apurv Shukla', 'M', 'Trivandrum', '16.jpg', 'General Physicians', '750', '', 0),
(17, 'Dr. K. U Natarajan', 'F', 'Trivandrum', '17.jpg', 'Nephrologist', '250', '', 0),
(18, 'Dr. C. V. Droupathy', 'M', 'Trivandrum', '18.jpg', 'Cardiologists', '850', '', 0),
(19, 'Dr. Ravi Kuruvilla', 'F', 'Thrissur', '19.jpg', 'Dentist', '1100', '', 0),
(20, 'Dr. Abhishek Mathew', 'F', 'Thrissur', '20.jpg', 'Orthopedist', '865', '', 0),
(21, 'Dr. Alexander T. A.', 'M', 'Thrissur', '21.jpg', 'Psychiatrist', '900', '', 0),
(22, 'Dr. Jacob Joseph', 'M', 'Thrissur', '22.jpg', 'Surgeon', '240', '', 0),
(23, 'Dr. Dr. K. K Haridas', 'F', 'Kasargod', '23.jpg', 'General Physicians', '550', '', 0),
(24, 'Dr. Anant Vats', 'F', 'Kasargod', '24.jpg', 'Orthopedist', '650', '', 0),
(25, 'Dr.  Tixon Thomas', 'M', 'Kasargod', '25.jpg', 'Cardiologists', '780', '', 0),
(26, 'Dr. Suma Job', 'F', 'Kasargod', '26.jpg', 'Nephrologist', '900', '', 0),
(27, 'Dr. Akhil Kashyap', 'M', 'Kasargod', '27.jpg', 'Dentist', '650', '', 0),
(28, 'Dr.  Sri Kanth Mothy', 'M', 'Wayand', '28.jpg', 'Surgeon', '647', '', 0),
(29, 'Dr. Cherian Mamen', 'F', 'Wayand', '29.jpg', 'General Physicians', '1400', '', 0),
(30, 'Dr. Antony Clement', 'F', 'Wayand', '30.jpg', 'Dentist', '900', '', 0),
(31, 'Dr. Alexander K. S.', 'M', 'Wayand', '31.jpg', 'Psychiatrist', '450', '', 0),
(32, 'Dr. Shrish George', 'F', 'Wayand', '32.jpg', 'Surgeon', '690', '', 0),
(33, 'Dr. Warrier K. K. R.', 'F', 'Kozhikode', '33.jpg', 'Cardiologists', '750', '', 0),
(34, 'Dr. Sreelatha V. K.', 'M', 'Kozhikode', '34.jpg', 'Orthopedist', '250', '', 0),
(35, 'Dr. Mohit Suri', 'F', 'Kozhikode', '35.jpg', 'Surgeon', '365', '', 0),
(36, 'Dr. Neelkamal', 'F', 'Kozhikode', '36.jpg', 'General Physicians', '145', '', 0),
(37, 'Dr. Aparna K. A.', 'M', 'Kozhikode', '37.jpg', 'Dentist', '689', '', 0),
(38, 'Dr. Radhalakshmy A.', 'M', 'Kozhikode', '38.jpg', 'Cardiologists', '478', '', 0),
(39, 'Dr. Shaheer T. B.', 'M', 'Kottayam', '39.jpg', 'Surgeon', '500', '', 0),
(40, 'Dr. Shanta Kurup', 'F', 'Kottayam', '40.jpg', 'Psychiatrist', '690', '', 0),
(41, 'Dr. Hritick Ambuj', 'F', 'Kottayam', '41.jpg', 'Orthopedist', '480', '', 0),
(42, 'Dr. Amiy K. M.', 'M', 'Kottayam', '42.jpg', 'Dentist', '980', '', 0),
(43, 'Dr. Varma Kocha', 'M', 'Kottayam', '43.jpg', 'Surgeon', '650', '', 0),
(44, 'Dr. Spravin Dass', 'F', 'Kottayam', '44.jpg', 'Dr. Spravin Dass', '750', '', 0),
(45, 'Dr. Alok Thakur', 'M', 'Kannur', '45.jpg', 'Surgeon', '450', '', 0),
(46, 'Dr. Gerogie Thomas', 'M', 'Kannur', '46.jpg', 'Dentist', '682', '', 0),
(47, 'Dr.  Sony BabY', 'F', 'Kannur', '47.jpg', 'Nephrologist', '1400', '', 0),
(48, 'Dr. Apoorva Ranjan', 'F', 'Kannur', '48.jpg', 'Orthopedist', '1500', '', 0),
(49, 'Dr. Aman Hisariya', 'M', 'Kannur', '49.jpg', 'General Physicians', '1600', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
