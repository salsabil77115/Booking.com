-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 08:27 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Email` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Email`, `Name`, `Password`, `Admin_id`) VALUES
('zezoamen0@gmail.com', 'zyad', '12345', 21);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_id` int(11) NOT NULL,
  `arrival_date` date NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `client_Id` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `number_of_children` int(11) NOT NULL,
  `number_of_adult` int(11) NOT NULL,
  `booking_date` date NOT NULL DEFAULT current_timestamp(),
  `room_id` int(11) NOT NULL,
  `statues` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_Id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone_number` int(11) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_Id`, `email`, `Name`, `Phone_number`, `password`) VALUES
(27, 'szzz123t0@gmail.com', 'salsabil mohamed', 1027219930, '90280'),
(62, 'ahmedkeno.222@gmail.com', 'ahmedkeno', 1123204831, '1700'),
(191, 'zezoamen0@gmail.com', 'zyad', 1027219930, '5059');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_Name` varchar(45) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `hotel_stars` varchar(45) NOT NULL,
  `meals` varchar(45) NOT NULL,
  `contact_information_mobile` int(11) NOT NULL,
  `contact_information_email` varchar(45) NOT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `lng` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_Name`, `Address`, `hotel_stars`, `meals`, `contact_information_mobile`, `contact_information_email`, `lat`, `lng`) VALUES
(10, 'Plaza Hotel Alexandria', '394 El Geish Road, San Stefano, Department of Raml, Alexandria', '4', 'Breakfast, lunch, dinner and dessert', 35838715, 'PlazaHotelAlexandria@gmail.com', '31.245173462587623\r\n', '29.964928700515202'),
(20, ' Marriott Hotel', '16 Saray El, Gezira, Zamalek', '2', 'Breakfast, lunch, dinner and dessert', 11211, ' MarriottHotel@gmail.com', '30.057436017563635', '31.224977990582335'),
(30, 'Four Seasons Hotels', 'Corniche El Nile, El Nil, Cairo governorate', '5', 'Breakfast, lunch, dinner and dessert', 227917000, 'FourSeasonsHotels@gmail.com', '30.03654770914276', '31.229447573256326'),
(40, 'CairoPyramids', 'Cairo-Alexandria Desert Road, Kafr Nassar', '3', 'Breakfast, lunch, dinner and dessert', 233772555, 'CairoPyramids@gmail.com', '29.99290467818507', '31.125855411149832'),
(100, 'Holiday Inn ', 'Cornish El Nil, Maadi, Cairo Governorate ', '5', 'Breakfast, lunch, dinner and dessert', 114310, 'marot100@gamil.com', '29.961012337039335', '31.247959366288853'),
(1002, 'Intercontinental Cairo Semiramis', 'Corniche El Nil, Qasr Ad Dobarah, Qasr El Nil, Cairo Governorate 11511\r\n', '5 ', 'Breakfast, lunch, dinner and dessert', 227988000, 'forseason1002@gamil.com', '30.043008956546988', '31.232489388403053');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_image`
--

CREATE TABLE `hotel_image` (
  `dir` varchar(45) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel_image`
--

INSERT INTO `hotel_image` (`dir`, `hotel_id`, `id`) VALUES
('1.jpg', 1002, 1),
('11.jpg', 30, 2),
('12.jpg', 100, 3),
('background.jpg', 20, 4),
('15.jpg', 100, 5),
('150.jpeg', 40, 6),
('18.jpg', 10, 7),
('2.jpg', 30, 8),
('20.jpg', 40, 9),
('background.jpg', 20, 10),
('25.jpg', 10, 11),
('3.jpg', 1002, 12),
('300.jpeg', 20, 13),
('32.jpg', 40, 14),
('34.jpg', 10, 15),
('7.jpg', 1002, 16),
('8.jpg', 30, 17),
('9.jpg', 100, 18);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `firstname`, `lastname`, `path`) VALUES
(5, 'salsabil', 'mohamed', 'F:\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Booking\\\\images\\c.PNG'),
(5, 'salsabil', 'mohamed', 'F:\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Booking\\\\images\\c.PNG'),
(5, 'salsabil', 'mohamed', 'F:\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Booking\\\\images\\c.PNG'),
(5, 'salsabil', 'mohamed', 'F:\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Booking\\\\images\\c.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_transaction` varchar(200) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `pay_date` date NOT NULL DEFAULT current_timestamp(),
  `pay_statues` varchar(45) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `client_Rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`id`, `hotel_id`, `client_Rate`) VALUES
(1, 1002, 1),
(2, 1002, 1),
(3, 1002, 1),
(5, 1002, 1),
(6, 1002, 1),
(11, 1002, 2),
(13, 1002, 2),
(15, 1002, 2),
(16, 1002, 2),
(17, 1002, 3),
(18, 1002, 4),
(19, 1002, 3),
(20, 1002, 3),
(21, 1002, 3),
(22, 1002, 4),
(23, 10, 3),
(24, 10, 3),
(25, 10, 3),
(26, 10, 3),
(27, 10, 4),
(28, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_type` varchar(45) NOT NULL,
  `room_facilities` varchar(200) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `room_rate` varchar(45) NOT NULL,
  `room_number` int(11) NOT NULL,
  `room_numberPhone` int(11) NOT NULL,
  `number_of_children` int(11) NOT NULL,
  `number_of_adult` int(11) NOT NULL,
  `statue` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_type`, `room_facilities`, `hotel_id`, `price`, `room_rate`, `room_number`, `room_numberPhone`, `number_of_children`, `number_of_adult`, `statue`) VALUES
(8, 'Superior Double Room\r\n', 'One bathroom, reception and Balcony and a sin', 100, 80, 'fantastic', 9, 2967, 2, 1, 'available'),
(19, 'Superior Double Room', ' air-conditioning, free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 10, 100, 'good', 8, 29600, 2, 1, 'available'),
(27, 'Superior Double Room', ' in-room safety, laundry, minibar, telephone', 20, 100, 'very good', 100, 29671, 2, 1, 'available'),
(54, 'Comfort Triple Room', ' air-conditioning, free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 40, 400, 'excellent', 6, 864, 2, 3, 'available'),
(65, 'Standard Single Room', ' air-conditioning,in-room safety, laundry, minibar, telephone', 40, 220, 'very good', 32, 296, 2, 1, 'available'),
(70, 'Comfort Triple Room', ' air-conditioning,hairdryer, in-room safety, laundry, minibar, telephone', 10, 180, 'very good', 90, 296799, 3, 2, 'available'),
(87, 'Standard Single Room', ' air-conditioning,  in-room safety, laundry, minibar, telephone', 30, 109, 'very good', 49, 296009, 1, 1, 'available'),
(90, 'Comfort Triple Room', ' air-conditioning, free wi-fi, hairdryer, minibar, telephone', 20, 190, 'very good', 170, 2967100, 3, 2, 'available'),
(103, 'Comfort Triple Room', 'air-conditioning, free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 100, 220, 'excellent', 10, 29600, 3, 2, 'available'),
(120, 'Standard Single Room', 'air-conditioning, free wi-fi, hairdryer', 10, 120, 'good', 16, 2967, 1, 1, 'available'),
(200, 'Classic Double Room\r\n', 'One bathroom, reception and Balcony and a sin', 1002, 100, 'very good', 9, 2967, 2, 1, 'available'),
(204, 'Standard Single Room', 'One bathroom, reception and Balcony and a sin', 1002, 220, 'good', 2, 2967, 2, 1, ' available'),
(205, 'Comfort Triple Room', ' air-conditioning, free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 1002, 200, 'excellent', 30, 2967990, 2, 3, 'available'),
(299, 'single', 'One bathroom, reception and Balcony and a sin', 30, 210, 'fantastic', 100, 98650, 0, 1, 'available'),
(300, 'Standard Single Room', '', 100, 110, 'good', 50, 296799, 1, 1, 'available'),
(310, 'Standard Single Room', 'hairdryer, in-room safety, laundry, minibar, telephone', 20, 80, 'good', 7, 2960099, 1, 1, 'available'),
(342, 'Superior Double Room', ' air-conditioning, free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 40, 340, 'very good', 8, 214, 1, 2, 'available'),
(650, 'Superior Double Room', ' air-conditioning, free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 30, 139, 'very good', 78, 2967187, 1, 2, 'available'),
(2046, 'Comfort Triple Room', '  free wi-fi, hairdryer, in-room safety, laundry, minibar, telephone', 30, 301, 'excellent', 76, 8987, 2, 3, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `room_image`
--

CREATE TABLE `room_image` (
  `dir` varchar(45) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_image`
--

INSERT INTO `room_image` (`dir`, `room_id`) VALUES
('21.jpg', 8),
('23.jpg', 19),
('31.jpg', 27),
('42.jpeg', 54),
('67.jpeg', 65),
('17.jpg', 70),
('19.jpg', 87),
('26.jpg', 90),
('2009.jpeg', 103),
('27.jpg', 120),
('10.jpg', 200),
('211.jpg', 204),
('30.jpg', 205),
('for.jpg', 299),
('1211.jpeg', 300),
('22.jpg', 310),
('29.jpeg', 342),
('16.jpg', 650),
('4.jpeg', 2046);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `client_Id` (`client_Id`),
  ADD KEY `room_id` (`room_id`) USING BTREE;

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_Id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_ibfk_1` (`client_id`),
  ADD KEY `comments_ibfk_2` (`hotel_id`) USING BTREE;

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `hotel_image`
--
ALTER TABLE `hotel_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`) USING BTREE;

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_ibfk_1` (`hotel_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `room_image`
--
ALTER TABLE `room_image`
  ADD PRIMARY KEY (`dir`),
  ADD KEY `room_id` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotel_image`
--
ALTER TABLE `hotel_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`client_Id`) REFERENCES `client` (`client_Id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `hotel_image`
--
ALTER TABLE `hotel_image`
  ADD CONSTRAINT `hotel_image_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`Booking_id`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `room_image`
--
ALTER TABLE `room_image`
  ADD CONSTRAINT `room_image_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
