-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 01:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppie`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `add_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `street` varchar(200) NOT NULL,
  `locality` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `pincode` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `landmark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`add_id`, `name`, `contact`, `street`, `locality`, `district`, `state`, `pincode`, `user_id`, `landmark`) VALUES
(4, 'golu jha', '7759007248', 'gghhf', 'fhgr', 'gggd', 'jhhd', 854334, 4, 'jjfh'),
(5, 'gulshan', '6207002686', 'ghyyttrr', 'kjuiyy', 'bhyyt', '', 547788, 4, 'vfggt');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_title`) VALUES
(1, 'shampoo'),
(2, 'mobile'),
(3, 'furniture'),
(4, 'computer'),
(5, 'bicycle'),
(7, 'electrical'),
(8, 'grocery'),
(9, 'clothes'),
(10, 'mechanical'),
(11, 'accessories');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(200) NOT NULL,
  `coupon_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_code`, `coupon_amount`) VALUES
(1, 'START50', 50);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `date_of_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `coupon_id` int(200) NOT NULL,
  `address_id` int(200) NOT NULL,
  `dateofpurchase` date NOT NULL,
  `delivery_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `ordered`, `date_of_add`, `coupon_id`, `address_id`, `dateofpurchase`, `delivery_date`) VALUES
(7, 2, 0, '2022-04-21 14:44:16', 0, 0, '0000-00-00', '0000-00-00'),
(8, 1, 0, '2022-04-26 07:14:12', 1, 0, '0000-00-00', '0000-00-00'),
(10, 3, 0, '2022-05-05 09:43:58', 1, 0, '0000-00-00', '0000-00-00'),
(11, 0, 0, '2022-12-28 12:19:42', 0, 0, '0000-00-00', '0000-00-00'),
(12, 4, 0, '2022-12-28 12:20:42', 0, 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `orderitem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ordered` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`orderitem_id`, `user_id`, `product_id`, `qty`, `order_id`, `ordered`) VALUES
(22, 2, 27, 1, 7, 0),
(23, 2, 23, 29, 7, 0),
(24, 0, 19, 1, 9, 0),
(28, 1, 19, 6, 8, 0),
(29, 1, 20, 9, 8, 0),
(30, 3, 19, 3, 10, 0),
(31, 0, 18, 1, 11, 0),
(32, 0, 20, 1, 11, 0),
(33, 4, 19, 2, 12, 0),
(34, 4, 42, 1, 12, 0),
(35, 4, 20, 1, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `brand` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `discount_price` float NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `category`, `image`, `brand`, `price`, `discount_price`, `description`) VALUES
(18, 'cycle', '5', 'bicycle-1280x720.jpg', 'phton', 5678, 678, 'good cycle'),
(19, 'Bulb', '7', 'bulb.jfif', 'Syska Led', 460, 40, 'good product'),
(20, 'Shampoo', '1', 'shampoo.jfif', 'Head & Shoulder', 186, 32, 'anti-dendruff'),
(21, 'Podium', '3', 'podium.jfif', 'Godrej', 6540, 1560, 'Anti-fat'),
(22, 'Tech', '11', 'tech.jfif', 'chintu pvt lmt', 124567, 3456, 'good product'),
(23, 'Laptop', '4', 'wp4810861.jpg', 'apple', 245684, 178057, 'good product'),
(27, 'Mobile Phones', '2', 'applee.jfif', 'I Phone', 154678, 139764, 'good product'),
(28, 'Groceries', '8', 'grow.jfif', 'chintu pvt lmt', 456, 54, 'oil is good'),
(30, 'Watch Machine', '10', 'wa.jfif', 'Sonata', 2124, 980, 'good product'),
(31, 'Back cover', '11', 'back.jfif', 'samsung', 457, 260, 'good product'),
(33, 'Shampoo', '1', 'clinic.jfif', 'Clinic Plus', 145, 110, 'good product'),
(34, 'Phones', '2', 'mob.jfif', 'Samsung', 87054, 79845, 'good product'),
(35, 'Old Manshion Chair', '3', 'cha.jfif', 'Seesam', 8465, 7549, 'good product'),
(36, 'Laptop', '4', 'lg.jfif', 'LG', 54043, 52700, 'good product'),
(37, 'Racing Cycle', '5', 'cyc.jfif', 'BMW', 45678, 37654, 'good product'),
(38, 'AC', '7', 'ac.jfif', 'LG', 45367, 36743, 'good product'),
(39, 'Groceries', '8', 'gro.jfif', 'walmart', 654, 543, 'oil is good'),
(40, 'joggers', '9', 'gger.jfif', 'dixcy scott', 985, 823, 'loose pants for summer '),
(41, 'Gun Accessories', '11', 'gun.jfif', 'Mungeri', 9856, 4598, 'good product'),
(42, 'FLOWER', '5', 'car.jfif', 'sony', 800000, 1000, 'hhf');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `email`, `contact`, `password`) VALUES
(1, 'sadique', 'sadiq@gmail.com', '9546334560', '81dc9bdb52d04dc20036dbd8313ed055'),
(4, 'golu jha', 'golu@g.c', '7759007248', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`add_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`orderitem_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `orderitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
