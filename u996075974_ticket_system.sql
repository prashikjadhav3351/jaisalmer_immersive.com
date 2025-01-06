-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 06, 2025 at 06:28 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u996075974_ticket_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `show_number` varchar(50) DEFAULT NULL,
  `show_time` varchar(50) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `tickets` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'pending',
  `payment_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `email`, `contact`, `nationality`, `show_number`, `show_time`, `show_date`, `tickets`, `total_price`, `payment_status`, `payment_id`, `order_id`, `created_at`) VALUES
(88, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', '2024-12-20', 5, 3000.00, 'pending', NULL, 'order_PXl5tjlDsANgE2', '2024-12-16 07:03:58'),
(89, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', '2024-12-20', 5, 3000.00, 'pending', NULL, 'order_PXl87MtstHDZc6', '2024-12-16 07:06:03'),
(90, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKEAj2AP6RZf', '2024-12-16 07:17:31'),
(91, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKEUDZPdXiso', '2024-12-16 07:17:32'),
(92, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKFU5oGYCopF', '2024-12-16 07:17:33'),
(93, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKG5uYXZKroV', '2024-12-16 07:17:33'),
(94, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKHTk90lr2QS', '2024-12-16 07:17:34'),
(95, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKIRvBNvTVyj', '2024-12-16 07:17:35'),
(96, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKJLcUFJZjf6', '2024-12-16 07:17:36'),
(97, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKWQ0aPRZOHo', '2024-12-16 07:17:48'),
(98, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKXDd66Y3uRX', '2024-12-16 07:17:49'),
(99, 'ashish', 'bhqaui@mail.com', '1325469780`', 'British', '2', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXlKbPJ39fP2jM', '2024-12-16 07:17:53'),
(100, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwT6dWAXabPE', '2024-12-16 08:52:25'),
(101, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTCo13gmkf3', '2024-12-16 08:52:25'),
(102, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTI0W8wf0Pv', '2024-12-16 08:52:25'),
(103, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTNdhU66pxV', '2024-12-16 08:52:25'),
(104, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTU2XNaflUn', '2024-12-16 08:52:26'),
(105, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTZsQhsJYA6', '2024-12-16 08:52:26'),
(106, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTfV9CBy8w0', '2024-12-16 08:52:26'),
(107, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTn72wKxNcu', '2024-12-16 08:52:26'),
(108, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwTsnfqPSzi5', '2024-12-16 08:52:26'),
(109, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwU03SCMHgFC', '2024-12-16 08:52:26'),
(110, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwU94GsO9QmQ', '2024-12-16 08:52:26'),
(111, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwUEblVk3qth', '2024-12-16 08:52:26'),
(112, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:52:26'),
(113, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmwmegsSJWwMC', '2024-12-16 08:52:43'),
(114, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXmx2wPzbnUBpQ', '2024-12-16 08:52:58'),
(115, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:09'),
(116, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:09'),
(117, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(118, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(119, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(120, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(121, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(122, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(123, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(124, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(125, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(126, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(127, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(128, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(129, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(130, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(131, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(132, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(133, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(134, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, NULL, '2024-12-16 08:55:10'),
(135, 'TEST', 'TEAST@HMAIL.COM', '1325469780', 'British', '3', '09:00 AM to 09:30 AM', NULL, 5, 3000.00, 'pending', NULL, 'order_PXn6dlm7gM4vLa', '2024-12-16 09:02:03'),
(136, 'krushnan', 'iyer@gmail.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 3, 600.00, 'pending', NULL, 'order_PXndRBPslXBLd2', '2024-12-16 09:33:05'),
(137, 'rdhesh', 'rajidhesh@gmail.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 5, 1000.00, 'pending', NULL, 'order_PXntmZWAPCQpBH', '2024-12-16 09:48:34'),
(138, 'rdhesh', 'rajidhesh@gmail.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 5, 1000.00, 'pending', NULL, 'order_PXnx7Rll5jeMIL', '2024-12-16 09:51:44'),
(139, 'late kavya', 'kavya@late.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 4, 800.00, 'pending', NULL, 'order_PXnyRQIskKXqbN', '2024-12-16 09:52:59'),
(140, 'asdf', 'asdf@gmail.com', '4567891230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 8, 1600.00, 'pending', NULL, 'order_PXp8ExgpZuxV2z', '2024-12-16 11:00:57'),
(141, 'asdf65', 'asdf@gmail.com', '4567891230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 6, 1200.00, 'pending', NULL, 'order_PXpa1Xh6S9JiyJ', '2024-12-16 11:27:15'),
(142, 'PRASHOK', 'PRASHIK@MAIL.COM', '7039758267', 'American', '3', '09:00 AM to 09:30 AM', NULL, 4, 2400.00, 'pending', NULL, 'order_PXphO0EHX6UzXz', '2024-12-16 11:34:13'),
(143, 'prashik', 'prashikjadhav90031@gmail.com', '7039758268', 'Indian', '1', '08:30 AM to 09:00 AM', NULL, 3, 600.00, 'pending', NULL, 'order_PY7MtmTTeKOFIc', '2024-12-17 04:51:18'),
(144, 'prashik', 'prashikjadhav90031@gmail.com', '7039758268', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 2, 400.00, 'pending', NULL, 'order_PY7YHGS9hnUeEh', '2024-12-17 05:02:05'),
(145, 'prashik', 'prashikjadhav90031@gmail.com', '7039758268', 'British', '1', '08:00 AM to 08:30 AM', NULL, 2, 1200.00, 'pending', NULL, 'order_PY7YRItS7hCpfG', '2024-12-17 05:02:14'),
(146, 'shivam', 'shivamagarwal7.12@gmail.com', '8383940078', 'Indian', '1', '10:00 AM to 10:30 AM', NULL, 7, 1400.00, 'pending', NULL, 'order_PY7zmDd2Q6d6xK', '2024-12-17 05:28:06'),
(147, 'prashik', 'prashikjadhav90031@gmail.com', '703975828', 'British', '1', '08:30 AM to 09:00 AM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYBi5ethBKORMB', '2024-12-17 09:06:08'),
(148, 'prashik', 'prashikjadhav90031@gmail.com', '703975828', 'British', '1', '08:30 AM to 09:00 AM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYCOA1122UzZpz', '2024-12-17 09:45:58'),
(149, 'prashik', 'prashikjadhav90031@gmail.com', '703975828', 'British', '1', '08:30 AM to 09:00 AM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYCOzU2vsxTjAi', '2024-12-17 09:46:46'),
(150, 'prashik', 'prashikjadhav90031@gmail.com', '703975828', 'British', '1', '08:30 AM to 09:00 AM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYCOzbxdGQQDJx', '2024-12-17 09:46:46'),
(151, 'rohan', 'rohan@neuraltechsoft.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 17, 3400.00, 'pending', NULL, 'order_PYCPvkpdNDaaB3', '2024-12-17 09:47:39'),
(152, 'rohan', 'rohan@neuraltechsoft.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 17, 3400.00, 'pending', NULL, 'order_PYCSKrJxzxhCid', '2024-12-17 09:49:56'),
(153, 'rohan', 'ashishshukla4101@gmail.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 17, 3400.00, 'pending', NULL, 'order_PYCSWgsXI6N8Lt', '2024-12-17 09:50:06'),
(154, 'rohan', 'ashishshukla4101@gmail.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 17, 3400.00, 'pending', NULL, 'order_PYCTfKLSlCv3PD', '2024-12-17 09:51:11'),
(155, 'rohan', 'prashikjadhav90031@gmail.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', NULL, 17, 3400.00, 'pending', NULL, 'order_PYCTuvDvSyDJSE', '2024-12-17 09:51:25'),
(156, 'prashik', 'prashikjadhav90031@gmail.com', '7039758268', 'American', '2', '08:30 AM to 09:00 AM', NULL, 3, 1800.00, 'pending', NULL, 'order_PYD8VKQqa7qYDS', '2024-12-17 10:29:50'),
(157, 'prashik', 'prashikjadhav90031@gmail.com', '7039758268', 'American', '2', '08:30 AM to 09:00 AM', NULL, 3, 1800.00, 'pending', NULL, 'order_PYD9S5LdM6RFtU', '2024-12-17 10:30:45'),
(158, 'ashsih', 'ashishshukla4101@gmail.com', '132546780', 'Indian', '1', '09:00 AM to 09:30 AM', NULL, 4, 800.00, 'pending', NULL, 'order_PYDAOKhtVO0ERe', '2024-12-17 10:31:38'),
(159, 'Prashik jadhav', 'prashikjadhav90031@gmail.com', '7039758268', 'Indian', '2', '08:00 AM to 08:30 AM', NULL, 2, 400.00, 'pending', NULL, 'order_PYEv9SM2n4728v', '2024-12-17 12:14:35'),
(160, 'Prashik jadhav', 'prashikjadhav90031@gmail.com', '7039758268', 'Indian', '2', '08:00 AM to 08:30 AM', NULL, 2, 400.00, 'pending', NULL, 'order_PYEw26c5A5vW9P', '2024-12-17 12:15:26'),
(161, 'peashik', 'prashikjadhav90031@gmail.com', '7039758268', 'Indian', '1', '08:30 AM to 09:00 AM', NULL, 3, 600.00, 'pending', NULL, 'order_PYWg6idkPL8W3l', '2024-12-18 05:36:50'),
(162, 'peashik', 'prashikjadhav90031@gmail.com', '7039758268', 'Indian', '1', '08:30 AM to 09:00 AM', NULL, 3, 600.00, 'pending', NULL, 'order_PYWieEL4Nfck1b', '2024-12-18 05:39:14'),
(163, '5', 'abc@mail.com', '7039758265', 'British', '2', '02:00 PM to 02:30 PM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYWukEYub0SmIA', '2024-12-18 05:50:42'),
(164, '5', 'abc@mail.com', '7039758265', 'British', '2', '02:00 PM to 02:30 PM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYX0ELTuBcl821', '2024-12-18 05:55:53'),
(165, '5', 'abc@mail.com', '7039758265', 'British', '2', '02:00 PM to 02:30 PM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYX1qu29Tuw3iI', '2024-12-18 05:57:25'),
(166, '5', 'abc@mail.com', '7039758265', 'British', '2', '02:00 PM to 02:30 PM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYX1tDlCNvihI7', '2024-12-18 05:57:27'),
(167, '5', 'abc@mail.com', '7039758265', 'British', '2', '02:00 PM to 02:30 PM', NULL, 2, 1200.00, 'pending', NULL, 'order_PYX1u1V5uVsOce', '2024-12-18 05:57:28'),
(168, 'hewllo', 'TEST@MAIL.COM', '1235469780', 'Indian', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 200.00, 'pending', NULL, 'order_PYX2HPFppfmNUP', '2024-12-18 05:57:50'),
(169, 'hewllo', 'TEST@MAIL.COM', '1235469780', 'Indian', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 200.00, 'pending', NULL, 'order_PYX2d4ZZVKS1PT', '2024-12-18 05:58:09'),
(170, 'hewllo', 'TEST@MAIL.COM', '1235469780', 'Indian', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 200.00, 'pending', NULL, 'order_PYX2efAZ2y3BeU', '2024-12-18 05:58:11'),
(171, 'hewllo', 'TEST@MAIL.COM', '1235469780', 'Indian', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 200.00, 'pending', NULL, 'order_PYX2f3u8sez4kG', '2024-12-18 05:58:11'),
(172, 'TEST', 'ABC@MAIL.COM', '1325469780', 'American', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 600.00, 'pending', NULL, 'order_PYX2zxYI0sJDmd', '2024-12-18 05:58:30'),
(173, 'TEST', 'ABC@MAIL.COM', '1325469780', 'American', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 600.00, 'pending', NULL, 'order_PYX3TlxFNxA5YS', '2024-12-18 05:58:58'),
(174, 'TEST', 'ABC@MAIL.COM', '1325469780', 'American', '2', '08:30 AM to 09:00 AM', '0000-00-00', 1, 600.00, 'pending', NULL, 'order_PYXDNXoKa5pJ22', '2024-12-18 06:08:20'),
(175, 'asghish', 'abc@mail.com', '1235469780', 'Indian', '2', '08:30 AM to 09:00 AM', '0000-00-00', 2, 400.00, 'pending', NULL, 'order_PYXEGvP5ZdDJ68', '2024-12-18 06:09:11'),
(176, 'asghish', 'abc@mail.com', '1235469780', 'Indian', '2', '08:30 AM to 09:00 AM', '0000-00-00', 2, 400.00, 'pending', NULL, 'order_PYXEanf9KEw0yn', '2024-12-18 06:09:29'),
(177, 'PRASHI', 'ABC@MAIL.CON', 'H129780', 'American', '2', '09:00 AM to 09:30 AM', '0000-00-00', 3, 1800.00, 'pending', NULL, 'order_PYXHUZ6VM7bnat', '2024-12-18 06:12:14'),
(178, 'PRASHI', 'ABC@MAIL.CON', 'H129780', 'American', '2', '09:00 AM to 09:30 AM', '0000-00-00', 3, 1800.00, 'pending', NULL, 'order_PYXIH2E0ceCmiP', '2024-12-18 06:12:57'),
(179, 'ashsish', 'ahgadsf@mail.com', '13254689780', 'Indian', '1', '09:00 AM to 09:30 AM', NULL, 5, 1000.00, 'pending', NULL, 'order_PYXecUschhDEEZ', '2024-12-18 06:34:07'),
(180, 'ashsish', 'ahgadsf@mail.com', '13254689780', 'Indian', '1', '09:00 AM to 09:30 AM', NULL, 5, 1000.00, 'pending', NULL, 'order_PYXh4WczCzuruL', '2024-12-18 06:36:27'),
(181, 'test', 'asdgf@mail.cmj', '132546780', 'Indian', '1', '08:30 AM to 09:00 AM', '0000-00-00', 1, 200.00, 'pending', NULL, 'order_PYXhRUCljvv5HI', '2024-12-18 06:36:48'),
(182, 'ntestq', 'ntest@gmsil.com', '7894561230', 'Indian', '1', '08:00 AM to 08:30 AM', '2024-12-31', 2, 400.00, 'pending', 'pay_PYZvLeEDq4etV9', 'order_PYZvBWSV137LvK', '2024-12-18 08:59:45'),
(183, 'riddhes dada', 'riddhesh@gela.com', '1234567890', 'American', '3', '08:30 AM to 09:00 AM', '2028-03-31', 1, 600.00, 'pending', 'pay_PYaAVQjv17FPTD', 'order_PYaAMQA6U3t232', '2024-12-18 09:01:56'),
(184, 'ashish', 'ashish@test.com', '1234567890', 'American', '2', '08:30 AM to 09:00 AM', '2023-11-30', 3, 1800.00, 'pending', 'pay_PYcZIUfwE4TSC6', 'order_PYcZ5u1PRQLdGz', '2024-12-18 11:22:49'),
(185, 'riddhesh bahi', 'riddhesh@neuraltechsoft.com', '213548790', 'Australian', '1', '08:00 AM to 08:30 AM', '2027-05-04', 2, 1200.00, 'pending', 'pay_PYzcxAIOVbrHYA', 'order_PYzcR3lLUOXhft', '2024-12-19 09:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `ticket_code` varchar(255) NOT NULL,
  `generated_at` datetime DEFAULT current_timestamp(),
  `scanned` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `group_id`, `order_id`, `payment_id`, `ticket_code`, `generated_at`, `scanned`) VALUES
(121, 1, 'order_PXl87MtstHDZc6', 'pay_PXl8MhWJJyQhUW', 'TICKET-675FD17AEA193-1', '2024-12-16 07:06:34', 0),
(122, 1, 'order_PXl87MtstHDZc6', 'pay_PXl8MhWJJyQhUW', 'TICKET-675FD17AF16FB-2', '2024-12-16 07:06:34', 0),
(123, 1, 'order_PXl87MtstHDZc6', 'pay_PXl8MhWJJyQhUW', 'TICKET-675FD17B0065F-3', '2024-12-16 07:06:35', 0),
(124, 1, 'order_PXl87MtstHDZc6', 'pay_PXl8MhWJJyQhUW', 'TICKET-675FD17B03681-4', '2024-12-16 07:06:35', 0),
(125, 1, 'order_PXl87MtstHDZc6', 'pay_PXl8MhWJJyQhUW', 'TICKET-675FD17B067D3-5', '2024-12-16 07:06:35', 0),
(126, 2, 'order_PXpa1Xh6S9JiyJ', 'pay_PXpaHg5tnnZ4Kz', 'TICKET-67600EB2C6AA5-1', '2024-12-16 11:27:46', 0),
(127, 2, 'order_PXpa1Xh6S9JiyJ', 'pay_PXpaHg5tnnZ4Kz', 'TICKET-67600EB2CDBC8-2', '2024-12-16 11:27:46', 0),
(128, 2, 'order_PXpa1Xh6S9JiyJ', 'pay_PXpaHg5tnnZ4Kz', 'TICKET-67600EB2D0E35-3', '2024-12-16 11:27:46', 0),
(129, 2, 'order_PXpa1Xh6S9JiyJ', 'pay_PXpaHg5tnnZ4Kz', 'TICKET-67600EB2D40AE-4', '2024-12-16 11:27:46', 0),
(130, 2, 'order_PXpa1Xh6S9JiyJ', 'pay_PXpaHg5tnnZ4Kz', 'TICKET-67600EB2D6EE5-5', '2024-12-16 11:27:46', 0),
(131, 2, 'order_PXpa1Xh6S9JiyJ', 'pay_PXpaHg5tnnZ4Kz', 'TICKET-67600EB2DA002-6', '2024-12-16 11:27:46', 0),
(132, 3, 'order_PXphO0EHX6UzXz', 'pay_PXphw3Mu271xhc', 'TICKET-67601065EEE9B-1', '2024-12-16 11:35:01', 0),
(133, 3, 'order_PXphO0EHX6UzXz', 'pay_PXphw3Mu271xhc', 'TICKET-676010660193E-2', '2024-12-16 11:35:02', 0),
(134, 3, 'order_PXphO0EHX6UzXz', 'pay_PXphw3Mu271xhc', 'TICKET-6760106604F78-3', '2024-12-16 11:35:02', 0),
(135, 3, 'order_PXphO0EHX6UzXz', 'pay_PXphw3Mu271xhc', 'TICKET-6760106608276-4', '2024-12-16 11:35:02', 0),
(136, 4, 'order_PY7YRItS7hCpfG', 'pay_PY7Z8QvDenZBgs', 'TICKET-6761061410A62-1', '2024-12-17 05:03:16', 1),
(137, 4, 'order_PY7YRItS7hCpfG', 'pay_PY7Z8QvDenZBgs', 'TICKET-67610614161E6-2', '2024-12-17 05:03:16', 0),
(138, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4C92DE4-1', '2024-12-17 05:29:48', 1),
(139, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4C98601-2', '2024-12-17 05:29:48', 1),
(140, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4C9B59D-3', '2024-12-17 05:29:48', 0),
(141, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4C9E40C-4', '2024-12-17 05:29:48', 0),
(142, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4CA127B-5', '2024-12-17 05:29:48', 0),
(143, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4CA40B2-6', '2024-12-17 05:29:48', 0),
(144, 5, 'order_PY7zmDd2Q6d6xK', 'pay_PY81FbQJ8hNe0L', 'TICKET-67610C4CA6EBB-7', '2024-12-17 05:29:48', 0),
(145, 6, 'order_PYBi5ethBKORMB', 'pay_PYBiapKBtZGiqL', 'TICKET-67613F2CC7962-1', '2024-12-17 09:06:52', 0),
(146, 6, 'order_PYBi5ethBKORMB', 'pay_PYBiapKBtZGiqL', 'TICKET-67613F2CCD2AB-2', '2024-12-17 09:06:52', 0),
(147, 7, 'order_PYCOA1122UzZpz', 'pay_PYCOONjzNY1Mfv', 'TICKET-67614873280C7-1', '2024-12-17 09:46:27', 0),
(148, 7, 'order_PYCOA1122UzZpz', 'pay_PYCOONjzNY1Mfv', 'TICKET-676148732D944-2', '2024-12-17 09:46:27', 0),
(149, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D606610-1', '2024-12-17 09:48:06', 0),
(150, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D609D7B-2', '2024-12-17 09:48:06', 0),
(151, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D60D082-3', '2024-12-17 09:48:06', 0),
(152, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D610038-4', '2024-12-17 09:48:06', 0),
(153, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D612F72-5', '2024-12-17 09:48:06', 0),
(154, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D615F15-6', '2024-12-17 09:48:06', 0),
(155, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D618F41-7', '2024-12-17 09:48:06', 0),
(156, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D61BE82-8', '2024-12-17 09:48:06', 0),
(157, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D61EE7A-9', '2024-12-17 09:48:06', 0),
(158, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D621E5E-10', '2024-12-17 09:48:06', 0),
(159, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D624E92-11', '2024-12-17 09:48:06', 0),
(160, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D627E1F-12', '2024-12-17 09:48:06', 0),
(161, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D62AE7B-13', '2024-12-17 09:48:06', 0),
(162, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D62E69D-14', '2024-12-17 09:48:06', 0),
(163, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D6316E3-15', '2024-12-17 09:48:06', 0),
(164, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D634C3B-16', '2024-12-17 09:48:06', 0),
(165, 8, 'order_PYCPvkpdNDaaB3', 'pay_PYCQ4OrABqeuBW', 'TICKET-676148D637D4D-17', '2024-12-17 09:48:06', 0),
(166, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149671BBC9-1', '2024-12-17 09:50:31', 0),
(167, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149671FA1C-2', '2024-12-17 09:50:31', 0),
(168, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496723101-3', '2024-12-17 09:50:31', 0),
(169, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496726380-4', '2024-12-17 09:50:31', 0),
(170, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496729477-5', '2024-12-17 09:50:31', 0),
(171, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149672C5A3-6', '2024-12-17 09:50:31', 0),
(172, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149672F595-7', '2024-12-17 09:50:31', 0),
(173, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149673349D-8', '2024-12-17 09:50:31', 0),
(174, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496737F30-9', '2024-12-17 09:50:31', 0),
(175, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149673B4D6-10', '2024-12-17 09:50:31', 0),
(176, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149673E843-11', '2024-12-17 09:50:31', 0),
(177, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496741D94-12', '2024-12-17 09:50:31', 0),
(178, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149674523A-13', '2024-12-17 09:50:31', 0),
(179, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496748328-14', '2024-12-17 09:50:31', 0),
(180, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149674B49A-15', '2024-12-17 09:50:31', 0),
(181, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-676149674E5FD-16', '2024-12-17 09:50:31', 0),
(182, 9, 'order_PYCSWgsXI6N8Lt', 'pay_PYCShB2j3Glyra', 'TICKET-6761496751858-17', '2024-12-17 09:50:31', 0),
(183, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B351A4A-1', '2024-12-17 09:51:47', 0),
(184, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B355251-2', '2024-12-17 09:51:47', 0),
(185, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B358DEE-3', '2024-12-17 09:51:47', 0),
(186, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B35CBA1-4', '2024-12-17 09:51:47', 0),
(187, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B35FA93-5', '2024-12-17 09:51:47', 0),
(188, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B3629DD-6', '2024-12-17 09:51:47', 0),
(189, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B36592A-7', '2024-12-17 09:51:47', 0),
(190, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B3688D7-8', '2024-12-17 09:51:47', 0),
(191, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B36C195-9', '2024-12-17 09:51:47', 0),
(192, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B36F13B-10', '2024-12-17 09:51:47', 0),
(193, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B372169-11', '2024-12-17 09:51:47', 0),
(194, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B3750DE-12', '2024-12-17 09:51:47', 0),
(195, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B377F8D-13', '2024-12-17 09:51:47', 0),
(196, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B37AEA8-14', '2024-12-17 09:51:47', 0),
(197, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B37DE2E-15', '2024-12-17 09:51:47', 0),
(198, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B380E4C-16', '2024-12-17 09:51:47', 0),
(199, 10, 'order_PYCTuvDvSyDJSE', 'pay_PYCU1El0R2u8qV', 'TICKET-676149B383DC3-17', '2024-12-17 09:51:47', 0),
(200, 11, 'order_PYD8VKQqa7qYDS', 'pay_PYD8ijWa4MG1r2', 'TICKET-676152BA2F824-1', '2024-12-17 10:30:18', 0),
(201, 11, 'order_PYD8VKQqa7qYDS', 'pay_PYD8ijWa4MG1r2', 'TICKET-676152BA35545-2', '2024-12-17 10:30:18', 0),
(202, 11, 'order_PYD8VKQqa7qYDS', 'pay_PYD8ijWa4MG1r2', 'TICKET-676152BA3893F-3', '2024-12-17 10:30:18', 0),
(203, 12, 'order_PYDAOKhtVO0ERe', 'pay_PYDAdXXGceScKc', 'TICKET-6761532B95212-1', '2024-12-17 10:32:11', 0),
(204, 12, 'order_PYDAOKhtVO0ERe', 'pay_PYDAdXXGceScKc', 'TICKET-6761532B98A94-2', '2024-12-17 10:32:11', 0),
(205, 12, 'order_PYDAOKhtVO0ERe', 'pay_PYDAdXXGceScKc', 'TICKET-6761532B9B9FF-3', '2024-12-17 10:32:11', 0),
(206, 12, 'order_PYDAOKhtVO0ERe', 'pay_PYDAdXXGceScKc', 'TICKET-6761532B9EA0D-4', '2024-12-17 10:32:11', 0),
(207, 13, 'order_PYEv9SM2n4728v', 'pay_PYEvU6mXOL6PgL', 'TICKET-67616B4E0ED42-1', '2024-12-17 12:15:10', 0),
(208, 13, 'order_PYEv9SM2n4728v', 'pay_PYEvU6mXOL6PgL', 'TICKET-67616B4E14431-2', '2024-12-17 12:15:10', 0),
(209, 14, 'order_PYWieEL4Nfck1b', 'pay_PYWiofjYZuPhaq', 'TICKET-6762601B1E77F-1', '2024-12-18 05:39:39', 0),
(210, 14, 'order_PYWieEL4Nfck1b', 'pay_PYWiofjYZuPhaq', 'TICKET-6762601B24F60-2', '2024-12-18 05:39:39', 0),
(211, 14, 'order_PYWieEL4Nfck1b', 'pay_PYWiofjYZuPhaq', 'TICKET-6762601B27E22-3', '2024-12-18 05:39:39', 0),
(212, 15, 'order_PYX3TlxFNxA5YS', 'pay_PYX3csOwElFVad', 'TICKET-676264B941546-1', '2024-12-18 05:59:21', 0),
(213, 16, 'order_PYXEanf9KEw0yn', 'pay_PYXEhguusrzvnS', 'TICKET-6762672E7B2AA-1', '2024-12-18 06:09:50', 0),
(214, 16, 'order_PYXEanf9KEw0yn', 'pay_PYXEhguusrzvnS', 'TICKET-6762672E80A34-2', '2024-12-18 06:09:50', 0),
(215, 17, 'order_PYZvBWSV137LvK', 'pay_PYZvLeEDq4etV9', 'TICKET-67628F010AD56-1', '2024-12-18 08:59:45', 0),
(216, 17, 'order_PYZvBWSV137LvK', 'pay_PYZvLeEDq4etV9', 'TICKET-67628F011053E-2', '2024-12-18 08:59:45', 0),
(217, 18, 'order_PYaAMQA6U3t232', 'pay_PYaAVQjv17FPTD', 'TICKET-67628F84E1053-1', '2024-12-18 09:01:56', 0),
(218, 19, 'order_PYcZ5u1PRQLdGz', 'pay_PYcZIUfwE4TSC6', 'TICKET-6762B08951B1A-1', '2024-12-18 11:22:49', 0),
(219, 19, 'order_PYcZ5u1PRQLdGz', 'pay_PYcZIUfwE4TSC6', 'TICKET-6762B089575DE-2', '2024-12-18 11:22:49', 0),
(220, 19, 'order_PYcZ5u1PRQLdGz', 'pay_PYcZIUfwE4TSC6', 'TICKET-6762B0895A56A-3', '2024-12-18 11:22:49', 0),
(221, 20, 'order_PYzcR3lLUOXhft', 'pay_PYzcxAIOVbrHYA', 'TICKET-6763EDBEEBF62-1', '2024-12-19 09:56:14', 1),
(222, 20, 'order_PYzcR3lLUOXhft', 'pay_PYzcxAIOVbrHYA', 'TICKET-6763EDBEF3C2F-2', '2024-12-19 09:56:14', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
