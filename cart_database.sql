-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2022 at 05:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `user_id`, `street1`, `street2`, `number`, `district`, `city`, `country`) VALUES
(2, 0, 'Saturnino Segurola', NULL, 1254, 'Cordoba', 'Cordoba', 'Argentina'),
(3, 1, 'Wexler Court', NULL, 8, 'Garnerville', 'Mt Ivy', 'United States'),
(4, 2, 'Test Street', 'Testing', -9999, '12th District', 'I am city with plenty of spaces and long for visual aid', 'Uganda'),
(5, 3, 'Jose Otero', 'Av.', 333, 'Urca', 'Cordoba', 'Argentina'),
(6, 4, 'Marcelo T de Alvear', NULL, 806, 'Guemes', 'Cordoba', 'Argentina'),
(7, 5, 'Paramount', NULL, 2147483647, 'VeryBigNumber', 'City', 'Chile'),
(8, 6, 'Mexico', 'Apt', 125, 'Condor Alto', 'Mendiolaza', 'Argentina'),
(9, 7, 'Armada Argentina', 'Uni', 3300, 'Alta Gracia', 'Cordoba', 'Argentina'),
(10, 8, 'Street 1', NULL, 0, 'District', 'City', 'Country'),
(11, 9, 'Rouge St', NULL, 333, 'Rebel', 'Paris', 'France'),
(12, 10, 'Baker Street', NULL, 221, 'Bakery', 'London', 'England'),
(13, 11, '3th', NULL, 66, 'Wall Street', 'New York City', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Electronics', 'Things that go bzzz'),
(2, 'Games', 'Fun things for the whole family :D'),
(3, 'Clothing', 'Things that are wooly'),
(4, 'Books', 'Who reads nowadays'),
(5, 'Videogames', 'You play with friends!');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `total` float NOT NULL,
  `currency_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currency_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `currency_id` varchar(10) NOT NULL,
  `stock` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `price`, `currency_id`, `stock`, `picture`) VALUES
(1, 1, 'Drill', 'Electric Drill that goes BRRRRRRRRRRRRRRRR and then goes Brrrrrrsssss and then a hole appears in your wall and suddenly your wall falls and you\'re left with an open space bathroom because you tried to hang a lovely picture of your cat. ', 300, 'ARS', 12, 'electricdrill.jpg'),
(2, 1, '5 Core Processor', 'You heard of 4 core processors. You heard of 8 core processors. But have you heard of 5 core processors? This is the future. This is when computers go from fast, to slightly faster', 600, 'ARS', 700, '5coreprocessor.jpg'),
(3, 2, 'Super Mario Maker', 'This game will make you wanna cry, and not out of sadness or frustration or laughter, it\'ll just make you wanna cry out of the fact that you suck at it. Deal with it', 7200, 'ARS', 30, 'supermariomaker.jpg'),
(4, 2, 'Sonic Adventure 2: Battle', 'This game has it all. Cutscenes with every character cutting each other off, weird movement, voice lines that make you question reality, and cute animals', 1230, 'ARS', 99, 'sa2b.jpg'),
(5, 3, 'T-Shirt', 'Just a plain old t-shirt. Comes in various colors like yellowy white, slightly tainted white, a faded yellow that looks like white, pink that looks like yellow-ish white, and more!', 660, 'ARS', 10000, 'tshirt.jpg'),
(6, 3, 'Pants', 'How many pants do you need? 1? 2? 3? I hope not more than 3 cause that\'s all the stock we have as of right this second. Oh what\'s that? Nevermind guys we only got TWO pants. That\'s right, only 2!', 999, 'ARS', 2, 'pants.jpg'),
(7, 4, 'The Divine Comedy', 'I have never read this book so I can\'t attest to how good or bad it is. It seems to have some kind of theology talk in it, and it\'s a comedy? Seems disrespectful. Don\'t buy this book. It\'s the devil', 666, 'ARS', 666, '666.jpg'),
(8, 4, 'To Kill a Mockingbird', 'Racism if it met a bird', 33, 'ARS', 77, 'tokillamockingbird.jpg'),
(9, 5, 'Monopoly', 'This is the most fun board game you will ever find. This thrilling game comes with a VHS tape so you can watch a video of the banker making fun of you for having a horrible strategy', 80, 'ARS', 1010, 'monopoly.jpg'),
(10, 5, 'Settlers of Catan', 'Oh my god please stop rolling 7s Carly. This is like the worst day ever. I can\'t. I just can\'t. I quit. I don\'t need this. Anyways see you tomorrow for another round?', 999999999, 'ARS', 27, 'settlersofcatan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`) VALUES
(1, 'juan', 'juan', 'juan', 'juan', 'juan@juan.com'),
(2, 'cukeds', 'password', 'Juan', 'Degiovanni', 'juan@email.com'),
(5, 'brandon', 'test', 'Brandon', 'LeDoxxed', 'brandon@email.com'),
(6, 'test', 'shittypassword', 'City', 'Person', 'city@email.com'),
(7, 'troll123', 'ihearttrolling', 'Maximus', 'Trolling', 'troll@email.com'),
(8, 'SQLInjectionIsARealProblem', 'shortpass', 'Safest', 'Password', 'sql@email.com'),
(9, 'imburnedout', 'pleasemakethisstop', 'Help', 'I Need Somebody', 'help@email.com'),
(10, 'International', 'lOoKaTtHiShArDpAsSwOrD', 'Token', 'User', 'token@email.com'),
(11, 'AuthTest', '123$#%&fdsa', 'Just Kidding', 'No Auth Used', 'authy@email.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;
