-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2019 at 08:36 PM
-- Server version: 8.0.17-0ubuntu2
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
  `doctorid` int(11) NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `location` varchar(255) NOT NULL,
  `picid` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `fee` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `gender`, `location`, `picid`, `specialization`, `fee`) VALUES
(1, 'Dr. Cherian Mamen', 'M', 'kochi', '1.jpg', 'General Physicians', '400'),
(2, 'Dr. Rajkumar', 'M', 'kochi', '2.jpg', 'Dentist', '600'),
(3, 'Dr. Savita Bhat', 'F', 'kochi', '3.jpg', 'Cardiologists', '430'),
(4, 'Dr. Siju C. Cheeran', 'M', 'kochi', '4.jpg', 'Dentist', '550'),
(5, 'Dr. Rose V. Pulikkal ', 'F', 'kochi', '5.jpg', 'General Physicians', '800'),
(6, 'Dr. Deepa Paulose', 'F', 'kochi', '6.jpg', 'Cardiologists', '464'),
(7, 'Dr. Aditya K. B.', 'M', 'Palakkad', '7.jpg', 'Dentist', '4000'),
(8, 'Dr. Revati S. Ramesh', 'M', 'Palakkad', '8.jpg', 'Psychiatrist', '8000'),
(9, 'Dr. Leena Pillai', 'F', 'Palakkad', '9.jpg', 'Cardiologists', '650'),
(10, 'Dr.  Puthuran Varghese', 'F', 'Palakkad', '10.jpg', 'General Physicians', '500'),
(11, 'Dr. Apoorva S.', 'M', 'Palakkad', '11.jpg', 'Psychiatrist', '750'),
(12, 'Dr. Narayanan Kutty', 'M', 'Palakkad', '12.jpg', 'Dentist', '800'),
(13, 'Dr.  Kocha Varma', 'M', 'Trivandrum', '13.jpg', 'General Physicians', '665'),
(14, 'Dr. Vijay Kumar M', 'F', 'Trivandrum', '14.jpg', 'Nephrologist', '800'),
(15, ' Dr. Anil S.R', 'F', 'Trivandrum', '15.jpg', 'Orthopedist', '650'),
(16, 'Dr. Apurv Shukla', 'M', 'Trivandrum', '16.jpg', 'General Physicians', '750'),
(17, 'Dr. K. U Natarajan', 'F', 'Trivandrum', '17.jpg', 'Nephrologist', '250'),
(18, 'Dr. C. V. Droupathy', 'M', 'Trivandrum', '18.jpg', 'Cardiologists', '850'),
(19, 'Dr. Ravi Kuruvilla', 'F', 'Thrissur', '19.jpg', 'Dentist', '1100'),
(20, 'Dr. Abhishek Mathew', 'F', 'Thrissur', '20.jpg', 'Orthopedist', '865'),
(21, 'Dr. Alexander T. A.', 'M', 'Thrissur', '21.jpg', 'Psychiatrist', '900'),
(22, 'Dr. Jacob Joseph', 'M', 'Thrissur', '22.jpg', 'Surgeon', '240'),
(23, 'Dr. Dr. K. K Haridas', 'F', 'Kasargod', '23.jpg', 'General Physicians', '550'),
(24, 'Dr. Anant Vats', 'F', 'Kasargod', '24.jpg', 'Orthopedist', '650'),
(25, 'Dr.  Tixon Thomas', 'M', 'Kasargod', '25.jpg', 'Cardiologists', '780'),
(26, 'Dr. Suma Job', 'F', 'Kasargod', '26.jpg', 'Nephrologist', '900'),
(27, 'Dr. Akhil Kashyap', 'M', 'Kasargod', '27.jpg', 'Dentist', '650'),
(28, 'Dr.  Sri Kanth Mothy', 'M', 'Wayand', '28.jpg', 'Surgeon', '647'),
(29, 'Dr. Cherian Mamen', 'F', 'Wayand', '29.jpg', 'General Physicians', '1400'),
(30, 'Dr. Antony Clement', 'F', 'Wayand', '30.jpg', 'Dentist', '900'),
(31, 'Dr. Alexander K. S.', 'M', 'Wayand', '31.jpg', 'Psychiatrist', '450'),
(32, 'Dr. Shrish George', 'F', 'Wayand', '32.jpg', 'Surgeon', '690'),
(33, 'Dr. Warrier K. K. R.', 'F', 'Kozhikode', '33.jpg', 'Cardiologists', '750'),
(34, 'Dr. Sreelatha V. K.', 'M', 'Kozhikode', '34.jpg', 'Orthopedist', '250'),
(35, 'Dr. Mohit Suri', 'F', 'Kozhikode', '35.jpg', 'Surgeon', '365'),
(36, 'Dr. Neelkamal', 'F', 'Kozhikode', '36.jpg', 'General Physicians', '145'),
(37, 'Dr. Aparna K. A.', 'M', 'Kozhikode', '37.jpg', 'Dentist', '689'),
(38, 'Dr. Radhalakshmy A.', 'M', 'Kozhikode', '38.jpg', 'Cardiologists', '478'),
(39, 'Dr. Shaheer T. B.', 'M', 'Kottayam', '39.jpg', 'Surgeon', '500'),
(40, 'Dr. Shanta Kurup', 'F', 'Kottayam', '40.jpg', 'Psychiatrist', '690'),
(41, 'Dr. Hritick Ambuj', 'F', 'Kottayam', '41.jpg', 'Orthopedist', '480'),
(42, 'Dr. Amiy K. M.', 'M', 'Kottayam', '42.jpg', 'Dentist', '980'),
(43, 'Dr. Varma Kocha', 'M', 'Kottayam', '43.jpg', 'Surgeon', '650'),
(44, 'Dr. Spravin Dass', 'F', 'Kottayam', '44.jpg', 'Dr. Spravin Dass', '750'),
(45, 'Dr. Alok Thakur', 'M', 'Kannur', '45.jpg', 'Surgeon', '450'),
(46, 'Dr. Gerogie Thomas', 'M', 'Kannur', '46.jpg', 'Dentist', '682'),
(47, 'Dr.  Sony BabY', 'F', 'Kannur', '47.jpg', 'Nephrologist', '1400'),
(48, 'Dr. Apoorva Ranjan', 'F', 'Kannur', '48.jpg', 'Orthopedist', '1500'),
(49, 'Dr. Aman Hisariya', 'M', 'Kannur', '49.jpg', 'General Physicians', '1600');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `password`) VALUES
(1, 'afsan@gmail.com', '$2a$10$eagHcEz3/EtTimXglvyc4OLHfBZWUoqrTSq6ONnPIZOVdHlFAMulO');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(11) NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `mstatus` varchar(250) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `date` varchar(250) NOT NULL,
  `loginid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `lastname`, `firstname`, `gender`, `age`, `mstatus`, `address`, `date`, `loginid`) VALUES
(1, 'dhgd', 'xyz', 'male', 23, 'Unmarried', 'hbrtj', '2019-11-10', 1),
(2, 'rgwe', 'rewtgwe', 'male', 3245, 'Unmarried', 'rwegwe', '2019-11-17', 1),
(3, 'ergrwe', 'ertgerw', 'male', 3465, 'Unmarried', 'gfhrth', '2019-11-21', 1),
(4, 'gwe', 'fdgerg', 'male', 34, 'Unmarried', 'ergeh', '2019-11-24', 1),
(5, 'wsegfwe', 'sdwsdeg', 'male', 345, 'Unmarried', 'dfbeber', '2019-11-05', 1),
(6, 'dfhd', 'fsdbgdfh', 'male', 5643, 'Unmarried', 'herh', '2019-11-17', 1),
(7, 'dfher', 'dfherh', 'male', 4564, 'Unmarried', 'deherhr', '2019-11-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ptdoctor`
--

CREATE TABLE `ptdoctor` (
  `id` int(11) NOT NULL,
  `patientid` int(11) NOT NULL,
  `doctorid` int(11) NOT NULL,
  `bookdate` varchar(100) NOT NULL,
  `loginid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ptdoctor`
--

INSERT INTO `ptdoctor` (`id`, `patientid`, `doctorid`, `bookdate`, `loginid`) VALUES
(1, 3, 3, '2019-11-21', 1),
(2, 4, 30, '2019-11-24', 1),
(3, 5, 27, '2019-11-05', 1),
(4, 6, 48, '2019-11-17', 1),
(5, 7, 21, '2019-11-16', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`);

--
-- Indexes for table `ptdoctor`
--
ALTER TABLE `ptdoctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `doctorid` (`doctorid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ptdoctor`
--
ALTER TABLE `ptdoctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ptdoctor`
--
ALTER TABLE `ptdoctor`
  ADD CONSTRAINT `ptdoctor_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`),
  ADD CONSTRAINT `ptdoctor_ibfk_2` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
