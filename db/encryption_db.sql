-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2022 at 08:14 AM
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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `street1` varchar(100) NOT NULL,
  `street2` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `street1`, `street2`, `number`, `district`, `city`, `country`) VALUES
(30, 0, '', '', 0, '', '', ''),
(2, 0, 'Saturnino Segurola', '', 1254, 'Cordoba', 'Cordoba', 'Argentina'),
(3, 1, 'Wexler Court', '', 8, 'Garnerville', 'Mt Ivy', 'United States'),
(4, 2, 'Test Street', 'Testing', -9999, '12th District', 'I am city with plenty of spaces and long for visual aid', 'Uganda'),
(5, 3, 'Jose Otero', 'Av.', 333, 'Urca', 'Cordoba', 'Argentina'),
(6, 4, 'Marcelo T de Alvear', '', 806, 'Guemes', 'Cordoba', 'Argentina'),
(17, 5, 'asdasd', '', 123, 'dsad', 'sdasd', 'dsad'),
(31, 5, 'Paramount', '', 2147483647, 'VeryBigber', 'City', 'Chile'),
(7, 5, 'Paramount', '', 2147483647, 'VeryBigNumber', 'City', 'Chile'),
(16, 5, 'Street', '', 123, 'Cordoba', 'Cordoba', 'Argentina'),
(8, 6, 'Mexico', 'Apt', 125, 'Condor Alto', 'Mendiolaza', 'Argentina'),
(9, 7, 'Armada Argentina', 'Uni', 3300, 'Alta Gracia', 'Cordoba', 'Argentina'),
(10, 8, 'Street 1', '', 0, 'District', 'City', 'Country'),
(11, 9, 'Rouge St', '', 333, 'Rebel', 'Paris', 'France'),
(12, 10, 'Baker Street', '', 221, 'Bakery', 'London', 'England'),
(13, 11, '3th', '', 66, 'Wall Street', 'New York City', 'United States'),
(19, 11, 'Street', '', 123, 'Cordoba', 'Cordoba', 'Argentina');

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
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `currency_id` varchar(10) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `total`, `currency_id`, `address_id`) VALUES
(12, 5, '2022-06-09', '7414', 'ARS', 0),
(13, 1, '2022-06-14', '8400', 'ARS', 0),
(14, 1, '2022-06-14', '14100', 'ARS', 0),
(15, 5, '2022-06-15', '1200', 'ARS', 0),
(16, 5, '2022-06-15', '1200', 'ARS', 0),
(17, 5, '2022-06-15', '1200', 'ARS', 0),
(18, 5, '2022-06-15', '2400', 'ARS', 17),
(19, 5, '2022-06-19', '600', 'ARS', 18),
(20, 5, '2022-06-19', '600', 'ARS', 0),
(21, 5, '2022-06-19', '600', 'ARS', 0),
(22, 5, '2022-06-19', '600', 'ARS', 0),
(23, 5, '2022-06-19', '600', 'ARS', 0),
(24, 5, '2022-06-19', '600', 'ARS', 0),
(25, 5, '2022-06-19', '600', 'ARS', 7),
(26, 5, '2022-06-26', '900', 'ARS', 0),
(27, 5, '2022-06-26', '1200', 'ARS', 0),
(28, 5, '2022-06-26', '300', 'ARS', 7),
(29, 5, '2022-06-26', '600', 'ARS', 0),
(30, 5, '2022-06-26', '1200', 'ARS', 0),
(31, 5, '2022-06-26', '300', 'ARS', 30),
(32, 5, '2022-06-26', '1200', 'ARS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(11,0) NOT NULL,
  `currency_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`, `currency_id`, `name`) VALUES
(23, 12, 3, 1, '0', 'ARS', 'Super Mario Maker'),
(24, 12, 514, 2, '0', 'ARS', 'Rustic Cotton Bike'),
(25, 13, 2, 2, '600', 'ARS', '5 Core Processor'),
(26, 13, 3, 1, '7200', 'ARS', 'Super Mario Maker'),
(27, 14, 2, 3, '600', 'ARS', '5 Core Processor'),
(28, 14, 3, 1, '7200', 'ARS', 'Super Mario Maker'),
(29, 14, 4, 2, '1230', 'ARS', 'Sonic Adventure 2: Battle'),
(30, 14, 5, 4, '660', 'ARS', 'T-Shirt'),
(31, 15, 2, 2, '600', 'ARS', '5 Core Processor'),
(32, 16, 2, 2, '600', 'ARS', '5 Core Processor'),
(33, 17, 2, 2, '600', 'ARS', '5 Core Processor'),
(34, 18, 2, 4, '600', 'ARS', '5 Core Processor'),
(35, 19, 2, 1, '600', 'ARS', '5 Core Processor'),
(36, 20, 2, 1, '600', 'ARS', '5 Core Processor'),
(37, 21, 2, 1, '600', 'ARS', '5 Core Processor'),
(38, 22, 2, 1, '600', 'ARS', '5 Core Processor'),
(39, 23, 2, 1, '600', 'ARS', '5 Core Processor'),
(40, 24, 2, 1, '600', 'ARS', '5 Core Processor'),
(41, 25, 2, 1, '600', 'ARS', '5 Core Processor'),
(42, 26, 1, 1, '300', 'ARS', 'Drill'),
(43, 26, 2, 1, '600', 'ARS', '5 Core Processor'),
(44, 27, 2, 2, '600', 'ARS', '5 Core Processor'),
(45, 28, 1, 1, '300', 'ARS', 'Drill'),
(46, 29, 1, 2, '300', 'ARS', 'Drill'),
(47, 30, 2, 2, '600', 'ARS', '5 Core Processor'),
(48, 31, 1, 1, '300', 'ARS', 'Drill'),
(49, 32, 2, 2, '600', 'ARS', '5 Core Processor');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `currency_id` varchar(10) NOT NULL,
  `stock` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `price`, `currency_id`, `stock`, `picture`) VALUES
(1, 1, 'Drill', 'Electric Drill that goes BRRRRRRRRRRRRRRRR and then goes Brrrrrrsssss and then a hole appears in your wall and suddenly your wall falls and you\'re left with an open space bathroom because you tried to hang a lovely picture of your cat. ', '300.00', 'ARS', 7, 'electricdrill.jpg'),
(2, 1, '5 Core Processor', 'You heard of 4 core processors. You heard of 8 core processors. But have you heard of 5 core processors? This is the future. This is when computers go from fast, to slightly faster', '600.00', 'ARS', 671, '5coreprocessor.jpg'),
(3, 2, 'Super Mario Maker', 'This game will make you wanna cry, and not out of sadness or frustration or laughter, it\'ll just make you wanna cry out of the fact that you suck at it. Deal with it', '7200.00', 'ARS', 28, 'supermariomaker.jpg'),
(4, 2, 'Sonic Adventure 2: Battle', 'This game has it all. Cutscenes with every character cutting each other off, weird movement, voice lines that make you question reality, and cute animals', '1230.00', 'ARS', 97, 'sa2b.jpg'),
(5, 3, 'T-Shirt', 'Just a plain old t-shirt. Comes in various colors like yellowy white, slightly tainted white, a faded yellow that looks like white, pink that looks like yellow-ish white, and more!', '660.00', 'ARS', 9996, 'tshirt.jpg'),
(6, 3, 'Pants', 'How many pants do you need? 1? 2? 3? I hope not more than 3 cause that\'s all the stock we have as of right this second. Oh what\'s that? Nevermind guys we only got TWO pants. That\'s right, only 2!', '999.00', 'ARS', 2, 'pants.jpg'),
(7, 4, 'The Divine Comedy', 'I have never read this book so I can\'t attest to how good or bad it is. It seems to have some kind of theology talk in it, and it\'s a comedy? Seems disrespectful. Don\'t buy this book. It\'s the devil', '666.00', 'ARS', 666, '666.jpg'),
(8, 4, 'To Kill a Mockingbird', 'Racism if it met a bird', '33.00', 'ARS', 77, 'tokillamockingbird.jpg'),
(9, 5, 'Monopoly', 'This is the most fun board game you will ever find. This thrilling game comes with a VHS tape so you can watch a video of the banker making fun of you for having a horrible strategy', '80.00', 'ARS', 1010, 'monopoly.jpg'),
(10, 5, 'Settlers of Catan', 'Oh my god please stop rolling 7s Carly. This is like the worst day ever. I can\'t. I just can\'t. I quit. I don\'t need this. Anyways see you tomorrow for another round?', '999999999.00', 'ARS', 27, 'settlersofcatan.jpg'),
(11, 3, 'Hat', 'It\'s cozy', '555.33', 'ARS', 30, 'hat.jpg'),
(64, 2, 'Gorgeous Cotton Sausages', 'black Unbranded Concrete Pizza', '968.00', 'ARS', 61, 'GorgeousCottonSausages.jpg'),
(65, 5, 'Small Wooden Gloves', 'fuchsia Rustic Cotton Mouse', '942.00', 'ARS', 11, 'SmallWoodenGloves.jpg'),
(66, 2, 'Refined Metal Hat', 'azure Intelligent Rubber Pants', '824.00', 'ARS', 104, 'RefinedMetalHat.jpg'),
(67, 4, 'Incredible Fresh Chicken', 'yellow Refined Steel Computer', '606.00', 'ARS', 32, 'IncredibleFreshChicken.jpg'),
(68, 5, 'Generic Frozen Hat', 'violet Licensed Fresh Car', '27.00', 'ARS', 116, 'GenericFrozenHat.jpg'),
(69, 4, 'Gorgeous Plastic Bike', 'violet Practical Plastic Salad', '403.00', 'ARS', 32, 'GorgeousPlasticBike.jpg'),
(70, 5, 'Awesome Plastic Sausages', 'blue Fantastic Wooden Cheese', '133.00', 'ARS', 66, 'AwesomePlasticSausages.jpg'),
(71, 5, 'Handcrafted Metal Bacon', 'salmon Handcrafted Wooden Table', '836.00', 'ARS', 75, 'HandcraftedMetalBacon.jpg'),
(72, 3, 'Fantastic Plastic Gloves', 'green Fantastic Cotton Fish', '65.00', 'ARS', 57, 'FantasticPlasticGloves.jpg'),
(73, 5, 'Ergonomic Frozen Hat', 'green Incredible Plastic Ball', '337.00', 'ARS', 122, 'ErgonomicFrozenHat.jpg'),
(74, 4, 'Incredible Frozen Chair', 'salmon Unbranded Granite Bike', '2.00', 'ARS', 39, 'IncredibleFrozenChair.jpg'),
(75, 1, 'Intelligent Concrete Keyboard', 'olive Incredible Steel Shirt', '315.00', 'ARS', 0, 'IntelligentConcreteKeyboard.jpg'),
(76, 5, 'Rustic Frozen Bike', 'indigo Licensed Soft Fish', '286.00', 'ARS', 65, 'RusticFrozenBike.jpg'),
(77, 3, 'Sleek Concrete Fish', 'purple Incredible Concrete Bike', '528.00', 'ARS', 94, 'SleekConcreteFish.jpg'),
(78, 3, 'Practical Cotton Salad', 'pink Handmade Steel Computer', '44.00', 'ARS', 11, 'PracticalCottonSalad.jpg'),
(79, 4, 'Licensed Concrete Shoes', 'violet Generic Steel Car', '185.00', 'ARS', 57, 'LicensedConcreteShoes.jpg'),
(80, 5, 'Practical Frozen Chicken', 'tan Rustic Wooden Soap', '54.00', 'ARS', 33, 'PracticalFrozenChicken.jpg'),
(81, 1, 'Sleek Soft Chicken', 'cyan Fantastic Wooden Shirt', '868.00', 'ARS', 65, 'SleekSoftChicken.jpg'),
(82, 2, 'Generic Plastic Keyboard', 'green Tasty Concrete Chips', '21.00', 'ARS', 111, 'GenericPlasticKeyboard.jpg'),
(83, 4, 'Unbranded Plastic Bike', 'black Fantastic Rubber Chair', '215.00', 'ARS', 50, 'UnbrandedPlasticBike.jpg'),
(84, 4, 'Sleek Plastic Mouse', 'red Practical Frozen Tuna', '484.00', 'ARS', 113, 'SleekPlasticMouse.jpg'),
(85, 1, 'Unbranded Steel Bacon', 'olive Licensed Soft Gloves', '772.00', 'ARS', 62, 'UnbrandedSteelBacon.jpg'),
(86, 5, 'Handmade Cotton Hat', 'yellow Sleek Plastic Bacon', '159.00', 'ARS', 91, 'HandmadeCottonHat.jpg'),
(87, 1, 'Incredible Cotton Sausages', 'white Licensed Metal Pizza', '910.00', 'ARS', 24, 'IncredibleCottonSausages.jpg'),
(88, 5, 'Fantastic Rubber Shirt', 'sky blue Unbranded Steel Sausages', '580.00', 'ARS', 119, 'FantasticRubberShirt.jpg'),
(89, 1, 'Handmade Granite Pizza', 'azure Intelligent Plastic Table', '90.00', 'ARS', 12, 'HandmadeGranitePizza.jpg'),
(90, 2, 'Practical Plastic Car', 'lime Unbranded Soft Tuna', '480.00', 'ARS', 123, 'PracticalPlasticCar.jpg'),
(91, 5, 'Ergonomic Wooden Bike', 'violet Intelligent Granite Cheese', '497.00', 'ARS', 41, 'ErgonomicWoodenBike.jpg'),
(92, 5, 'Sleek Cotton Ball', 'black Awesome Steel Soap', '803.00', 'ARS', 51, 'SleekCottonBall.jpg'),
(93, 4, 'Incredible Plastic Sausages', 'red Awesome Frozen Sausages', '275.00', 'ARS', 72, 'IncrediblePlasticSausages.jpg'),
(94, 5, 'Small Plastic Sausages', 'fuchsia Unbranded Plastic Tuna', '479.00', 'ARS', 71, 'SmallPlasticSausages.jpg'),
(95, 2, 'Practical Rubber Bike', 'plum Unbranded Metal Shirt', '279.00', 'ARS', 25, 'PracticalRubberBike.jpg'),
(96, 2, 'Small Steel Hat', 'turquoise Sleek Cotton Shoes', '86.00', 'ARS', 30, 'SmallSteelHat.jpg'),
(97, 4, 'Tasty Soft Car', 'maroon Ergonomic Wooden Car', '737.00', 'ARS', 0, 'TastySoftCar.jpg'),
(98, 3, 'Practical Plastic Towels', 'gold Handmade Metal Cheese', '287.00', 'ARS', 76, 'PracticalPlasticTowels.jpg'),
(99, 1, 'Sleek Frozen Chips', 'fuchsia Refined Fresh Salad', '385.00', 'ARS', 64, 'SleekFrozenChips.jpg'),
(100, 1, 'Licensed Granite Salad', 'indigo Rustic Metal Chair', '460.00', 'ARS', 110, 'LicensedGraniteSalad.jpg'),
(101, 4, 'Tasty Granite Pizza', 'gold Refined Soft Car', '296.00', 'ARS', 13, 'TastyGranitePizza.jpg'),
(102, 2, 'Fantastic Granite Table', 'azure Gorgeous Soft Chicken', '427.00', 'ARS', 55, 'FantasticGraniteTable.jpg'),
(103, 5, 'Practical Cotton Ball', 'mint green Handcrafted Concrete Mouse', '491.00', 'ARS', 41, 'PracticalCottonBall.jpg'),
(104, 3, 'Small Granite Tuna', 'mint green Refined Soft Table', '20.00', 'ARS', 49, 'SmallGraniteTuna.jpg'),
(105, 3, 'Gorgeous Plastic Cheese', 'sky blue Handcrafted Concrete Keyboard', '267.00', 'ARS', 70, 'GorgeousPlasticCheese.jpg'),
(106, 1, 'Handmade Metal Hat', 'yellow Gorgeous Fresh Table', '198.00', 'ARS', 124, 'HandmadeMetalHat.jpg'),
(107, 5, 'Small Fresh Chicken', 'magenta Fantastic Granite Chicken', '40.00', 'ARS', 67, 'SmallFreshChicken.jpg'),
(108, 5, 'Tasty Fresh Towels', 'pink Tasty Wooden Salad', '815.00', 'ARS', 34, 'TastyFreshTowels.jpg'),
(109, 5, 'Gorgeous Cotton Mouse', 'fuchsia Licensed Fresh Ball', '628.00', 'ARS', 94, 'GorgeousCottonMouse.jpg'),
(110, 2, 'Practical Steel Chair', 'olive Ergonomic Cotton Chips', '744.00', 'ARS', 109, 'PracticalSteelChair.jpg'),
(111, 1, 'Licensed Fresh Salad', 'tan Handmade Plastic Table', '273.00', 'ARS', 117, 'LicensedFreshSalad.jpg'),
(112, 3, 'Licensed Fresh Cheese', 'mint green Gorgeous Wooden Gloves', '80.00', 'ARS', 8, 'LicensedFreshCheese.jpg'),
(113, 4, 'Handcrafted Rubber Salad', 'orchid Rustic Metal Keyboard', '491.00', 'ARS', 126, 'HandcraftedRubberSalad.jpg'),
(114, 2, 'Small Plastic Chair', 'lime Tasty Fresh Soap', '242.00', 'ARS', 71, 'SmallPlasticChair.jpg'),
(115, 5, 'Tasty Plastic Pizza', 'azure Unbranded Wooden Keyboard', '687.00', 'ARS', 38, 'TastyPlasticPizza.jpg'),
(116, 1, 'Practical Soft Towels', 'pink Intelligent Frozen Salad', '604.00', 'ARS', 19, 'PracticalSoftTowels.jpg'),
(117, 4, 'Practical Cotton Cheese', 'white Practical Granite Pants', '495.00', 'ARS', 110, 'PracticalCottonCheese.jpg'),
(118, 1, 'Tasty Concrete Ball', 'violet Handmade Granite Chips', '783.00', 'ARS', 79, 'TastyConcreteBall.jpg'),
(119, 3, 'Intelligent Soft Bacon', 'grey Rustic Rubber Sausages', '242.00', 'ARS', 73, 'IntelligentSoftBacon.jpg'),
(120, 5, 'Fantastic Plastic Shirt', 'white Sleek Cotton Chicken', '387.00', 'ARS', 6, 'FantasticPlasticShirt.jpg'),
(121, 5, 'Incredible Fresh Pants', 'red Intelligent Concrete Shoes', '446.00', 'ARS', 98, 'IncredibleFreshPants.jpg'),
(122, 1, 'Handcrafted Concrete Salad', 'orchid Ergonomic Soft Car', '972.00', 'ARS', 91, 'HandcraftedConcreteSalad.jpg'),
(123, 1, 'Handmade Concrete Bike', 'gold Gorgeous Soft Computer', '104.00', 'ARS', 26, 'HandmadeConcreteBike.jpg'),
(124, 4, 'Gorgeous Concrete Shoes', 'magenta Small Granite Pizza', '937.00', 'ARS', 105, 'GorgeousConcreteShoes.jpg'),
(125, 4, 'Generic Concrete Sausages', 'lavender Incredible Frozen Car', '528.00', 'ARS', 107, 'GenericConcreteSausages.jpg'),
(126, 2, 'Practical Metal Chair', 'mint green Gorgeous Granite Mouse', '912.00', 'ARS', 7, 'PracticalMetalChair.jpg'),
(127, 2, 'Small Frozen Ball', 'salmon Rustic Soft Towels', '271.00', 'ARS', 27, 'SmallFrozenBall.jpg'),
(128, 3, 'Small Cotton Shoes', 'mint green Generic Soft Soap', '163.00', 'ARS', 100, 'SmallCottonShoes.jpg'),
(129, 1, 'Rustic Metal Cheese', 'pink Sleek Rubber Bike', '581.00', 'ARS', 4, 'RusticMetalCheese.jpg'),
(130, 5, 'Handcrafted Fresh Bacon', 'fuchsia Refined Wooden Fish', '969.00', 'ARS', 73, 'HandcraftedFreshBacon.jpg'),
(131, 3, 'Licensed Rubber Chips', 'fuchsia Small Concrete Salad', '634.00', 'ARS', 73, 'LicensedRubberChips.jpg'),
(132, 4, 'Handcrafted Cotton Fish', 'fuchsia Handcrafted Metal Table', '959.00', 'ARS', 94, 'HandcraftedCottonFish.jpg'),
(133, 3, 'Refined Wooden Sausages', 'maroon Incredible Concrete Chicken', '233.00', 'ARS', 28, 'RefinedWoodenSausages.jpg'),
(134, 3, 'Awesome Fresh Towels', 'fuchsia Tasty Fresh Cheese', '887.00', 'ARS', 33, 'AwesomeFreshTowels.jpg'),
(135, 1, 'Awesome Granite Bike', 'green Handcrafted Steel Tuna', '235.00', 'ARS', 22, 'AwesomeGraniteBike.jpg'),
(136, 3, 'Ergonomic Plastic Salad', 'lavender Refined Cotton Bacon', '874.00', 'ARS', 33, 'ErgonomicPlasticSalad.jpg'),
(137, 4, 'Incredible Soft Sausages', 'yellow Generic Cotton Table', '420.00', 'ARS', 68, 'IncredibleSoftSausages.jpg'),
(138, 2, 'Awesome Fresh Car', 'purple Rustic Frozen Tuna', '233.00', 'ARS', 99, 'AwesomeFreshCar.jpg'),
(139, 5, 'Sleek Steel Shirt', 'orange Handmade Metal Chicken', '152.00', 'ARS', 65, 'SleekSteelShirt.jpg'),
(140, 4, 'Refined Soft Keyboard', 'pink Handmade Soft Chicken', '354.00', 'ARS', 38, 'RefinedSoftKeyboard.jpg'),
(141, 5, 'Unbranded Plastic Keyboard', 'turquoise Ergonomic Wooden Computer', '767.00', 'ARS', 2, 'UnbrandedPlasticKeyboard.jpg'),
(142, 3, 'Sleek Wooden Bacon', 'olive Awesome Metal Bike', '397.00', 'ARS', 74, 'SleekWoodenBacon.jpg'),
(143, 2, 'Tasty Soft Computer', 'azure Ergonomic Granite Pants', '580.00', 'ARS', 91, 'TastySoftComputer.jpg'),
(144, 2, 'Incredible Wooden Ball', 'cyan Licensed Frozen Gloves', '247.00', 'ARS', 9, 'IncredibleWoodenBall.jpg'),
(145, 4, 'Intelligent Rubber Chicken', 'teal Ergonomic Fresh Chicken', '343.00', 'ARS', 82, 'IntelligentRubberChicken.jpg'),
(146, 1, 'Generic Wooden Shoes', 'turquoise Rustic Metal Car', '422.00', 'ARS', 97, 'GenericWoodenShoes.jpg'),
(147, 5, 'Awesome Concrete Cheese', 'violet Sleek Steel Gloves', '213.00', 'ARS', 58, 'AwesomeConcreteCheese.jpg'),
(148, 3, 'Licensed Wooden Salad', 'black Incredible Steel Salad', '168.00', 'ARS', 77, 'LicensedWoodenSalad.jpg'),
(149, 3, 'Licensed Granite Bacon', 'pink Handmade Fresh Shoes', '204.00', 'ARS', 21, 'LicensedGraniteBacon.jpg'),
(150, 5, 'Incredible Metal Tuna', 'silver Gorgeous Steel Fish', '443.00', 'ARS', 67, 'IncredibleMetalTuna.jpg'),
(151, 4, 'Unbranded Rubber Keyboard', 'silver Handcrafted Frozen Chips', '435.00', 'ARS', 114, 'UnbrandedRubberKeyboard.jpg'),
(152, 2, 'Handcrafted Soft Shirt', 'gold Unbranded Frozen Car', '263.00', 'ARS', 79, 'HandcraftedSoftShirt.jpg'),
(416, 2, 'Gorgeous Cotton Shoes', 'lavender Intelligent Wooden Bacon', '382.00', 'ARS', 74, 'GorgeousCottonShoes.jpg'),
(417, 1, 'Awesome Granite Mouse', 'magenta Sleek Rubber Computer', '727.00', 'ARS', 112, 'AwesomeGraniteMouse.jpg'),
(418, 2, 'Awesome Cotton Table', 'purple Sleek Cotton Computer', '621.00', 'ARS', 18, 'AwesomeCottonTable.jpg'),
(419, 4, 'Generic Frozen Ball', 'ivory Refined Wooden Fish', '211.00', 'ARS', 126, 'GenericFrozenBall.jpg'),
(420, 3, 'Handmade Metal Pizza', 'black Awesome Granite Bacon', '959.00', 'ARS', 21, 'HandmadeMetalPizza.jpg'),
(421, 4, 'Refined Cotton Car', 'yellow Generic Cotton Sausages', '827.00', 'ARS', 77, 'RefinedCottonCar.jpg'),
(422, 3, 'Refined Steel Keyboard', 'olive Small Fresh Keyboard', '395.00', 'ARS', 75, 'RefinedSteelKeyboard.jpg'),
(423, 5, 'Generic Concrete Cheese', 'tan Tasty Soft Keyboard', '213.00', 'ARS', 101, 'GenericConcreteCheese.jpg'),
(424, 4, 'Licensed Cotton Shirt', 'violet Small Fresh Soap', '459.00', 'ARS', 20, 'LicensedCottonShirt.jpg'),
(425, 2, 'Unbranded Frozen Tuna', 'silver Handcrafted Granite Chair', '529.00', 'ARS', 82, 'UnbrandedFrozenTuna.jpg'),
(426, 4, 'Intelligent Wooden Fish', 'pink Unbranded Wooden Chair', '465.00', 'ARS', 4, 'IntelligentWoodenFish.jpg'),
(427, 5, 'Generic Rubber Bacon', 'olive Refined Metal Pizza', '144.00', 'ARS', 60, 'GenericRubberBacon.jpg'),
(428, 1, 'Handmade Wooden Cheese', 'sky blue Gorgeous Plastic Ball', '935.00', 'ARS', 98, 'HandmadeWoodenCheese.jpg'),
(429, 2, 'Refined Cotton Shirt', 'ivory Awesome Plastic Keyboard', '863.00', 'ARS', 13, 'RefinedCottonShirt.jpg'),
(430, 4, 'Rustic Fresh Shirt', 'blue Handcrafted Fresh Computer', '622.00', 'ARS', 56, 'RusticFreshShirt.jpg'),
(431, 2, 'Practical Cotton Computer', 'blue Tasty Frozen Towels', '894.00', 'ARS', 75, 'PracticalCottonComputer.jpg'),
(432, 5, 'Sleek Metal Pants', 'azure Rustic Cotton Chicken', '351.00', 'ARS', 95, 'SleekMetalPants.jpg'),
(433, 5, 'Ergonomic Rubber Hat', 'ivory Sleek Plastic Chair', '882.00', 'ARS', 65, 'ErgonomicRubberHat.jpg'),
(434, 1, 'Rustic Cotton Tuna', 'magenta Unbranded Frozen Soap', '180.00', 'ARS', 14, 'RusticCottonTuna.jpg'),
(435, 1, 'Gorgeous Rubber Sausages', 'turquoise Incredible Concrete Keyboard', '223.00', 'ARS', 109, 'GorgeousRubberSausages.jpg'),
(436, 5, 'Incredible Fresh Gloves', 'olive Sleek Cotton Chips', '59.00', 'ARS', 0, 'IncredibleFreshGloves.jpg'),
(437, 3, 'Small Wooden Hat', 'salmon Handmade Metal Table', '680.00', 'ARS', 63, 'SmallWoodenHat.jpg'),
(438, 4, 'Handcrafted Granite Table', 'azure Tasty Wooden Keyboard', '528.00', 'ARS', 115, 'HandcraftedGraniteTable.jpg'),
(439, 1, 'Handmade Cotton Computer', 'salmon Licensed Metal Ball', '694.00', 'ARS', 26, 'HandmadeCottonComputer.jpg'),
(440, 1, 'Handmade Soft Keyboard', 'grey Practical Cotton Ball', '478.00', 'ARS', 34, 'HandmadeSoftKeyboard.jpg'),
(441, 3, 'Rustic Soft Bike', 'silver Licensed Frozen Computer', '818.00', 'ARS', 61, 'RusticSoftBike.jpg'),
(442, 4, 'Practical Steel Gloves', 'gold Licensed Cotton Computer', '285.00', 'ARS', 97, 'PracticalSteelGloves.jpg'),
(443, 3, 'Sleek Rubber Bacon', 'green Ergonomic Granite Ball', '482.00', 'ARS', 113, 'SleekRubberBacon.jpg'),
(444, 5, 'Tasty Granite Chips', 'indigo Awesome Frozen Hat', '154.00', 'ARS', 60, 'TastyGraniteChips.jpg'),
(445, 4, 'Licensed Frozen Shirt', 'indigo Small Rubber Tuna', '86.00', 'ARS', 94, 'LicensedFrozenShirt.jpg'),
(446, 1, 'Licensed Plastic Cheese', 'green Unbranded Concrete Soap', '844.00', 'ARS', 109, 'LicensedPlasticCheese.jpg'),
(447, 3, 'Licensed Steel Salad', 'turquoise Handmade Steel Car', '318.00', 'ARS', 66, 'LicensedSteelSalad.jpg'),
(448, 1, 'Licensed Granite Table', 'orange Unbranded Wooden Salad', '963.00', 'ARS', 123, 'LicensedGraniteTable.jpg'),
(449, 3, 'Unbranded Soft Cheese', 'plum Small Metal Cheese', '271.00', 'ARS', 17, 'UnbrandedSoftCheese.jpg'),
(450, 5, 'Gorgeous Metal Cheese', 'red Generic Wooden Computer', '286.00', 'ARS', 44, 'GorgeousMetalCheese.jpg'),
(451, 2, 'Licensed Fresh Keyboard', 'ivory Awesome Metal Car', '447.00', 'ARS', 17, 'LicensedFreshKeyboard.jpg'),
(452, 5, 'Ergonomic Cotton Salad', 'maroon Intelligent Wooden Soap', '714.00', 'ARS', 95, 'ErgonomicCottonSalad.jpg'),
(453, 4, 'Licensed Cotton Car', 'black Generic Fresh Shirt', '199.00', 'ARS', 51, 'LicensedCottonCar.jpg'),
(454, 5, 'Rustic Plastic Bacon', 'azure Fantastic Steel Table', '413.00', 'ARS', 76, 'RusticPlasticBacon.jpg'),
(455, 4, 'Small Rubber Ball', 'teal Unbranded Metal Salad', '496.00', 'ARS', 107, 'SmallRubberBall.jpg'),
(456, 1, 'Awesome Plastic Ball', 'silver Practical Steel Tuna', '886.00', 'ARS', 53, 'AwesomePlasticBall.jpg'),
(457, 5, 'Incredible Granite Car', 'tan Intelligent Plastic Fish', '965.00', 'ARS', 20, 'IncredibleGraniteCar.jpg'),
(458, 1, 'Tasty Metal Chicken', 'fuchsia Rustic Metal Bacon', '884.00', 'ARS', 16, 'TastyMetalChicken.jpg'),
(459, 3, 'Handcrafted Cotton Bike', 'ivory Handcrafted Cotton Salad', '428.00', 'ARS', 64, 'HandcraftedCottonBike.jpg'),
(460, 5, 'Incredible Concrete Cheese', 'salmon Gorgeous Metal Soap', '638.00', 'ARS', 92, 'IncredibleConcreteCheese.jpg'),
(461, 4, 'Incredible Soft Shoes', 'turquoise Practical Wooden Bike', '408.00', 'ARS', 20, 'IncredibleSoftShoes.jpg'),
(462, 1, 'Incredible Cotton Car', 'indigo Small Cotton Table', '610.00', 'ARS', 7, 'IncredibleCottonCar.jpg'),
(463, 5, 'Handmade Fresh Computer', 'salmon Incredible Cotton Mouse', '366.00', 'ARS', 104, 'HandmadeFreshComputer.jpg'),
(464, 4, 'Awesome Rubber Shoes', 'green Intelligent Steel Chips', '910.00', 'ARS', 62, 'AwesomeRubberShoes.jpg'),
(465, 5, 'Awesome Wooden Sausages', 'pink Small Steel Sausages', '325.00', 'ARS', 49, 'AwesomeWoodenSausages.jpg'),
(466, 3, 'Small Cotton Hat', 'fuchsia Licensed Steel Soap', '244.00', 'ARS', 24, 'SmallCottonHat.jpg'),
(467, 3, 'Handmade Rubber Sausages', 'violet Refined Rubber Salad', '743.00', 'ARS', 24, 'HandmadeRubberSausages.jpg'),
(468, 5, 'Handcrafted Frozen Car', 'orange Incredible Soft Gloves', '713.00', 'ARS', 88, 'HandcraftedFrozenCar.jpg'),
(469, 2, 'Refined Plastic Car', 'lavender Licensed Wooden Chicken', '346.00', 'ARS', 84, 'RefinedPlasticCar.jpg'),
(470, 3, 'Unbranded Wooden Computer', 'indigo Tasty Granite Shirt', '835.00', 'ARS', 57, 'UnbrandedWoodenComputer.jpg'),
(471, 2, 'Fantastic Steel Hat', 'plum Ergonomic Concrete Bike', '958.00', 'ARS', 22, 'FantasticSteelHat.jpg'),
(472, 2, 'Awesome Steel Salad', 'grey Handcrafted Cotton Car', '488.00', 'ARS', 71, 'AwesomeSteelSalad.jpg'),
(473, 5, 'Rustic Granite Shirt', 'turquoise Refined Soft Bacon', '26.00', 'ARS', 102, 'RusticGraniteShirt.jpg'),
(474, 5, 'Small Concrete Sausages', 'lavender Practical Concrete Shirt', '836.00', 'ARS', 89, 'SmallConcreteSausages.jpg'),
(475, 5, 'Rustic Steel Shoes', 'ivory Tasty Metal Keyboard', '207.00', 'ARS', 35, 'RusticSteelShoes.jpg'),
(476, 2, 'Practical Granite Shoes', 'azure Ergonomic Soft Computer', '945.00', 'ARS', 86, 'PracticalGraniteShoes.jpg'),
(477, 1, 'Fantastic Metal Gloves', 'magenta Incredible Concrete Pants', '160.00', 'ARS', 110, 'FantasticMetalGloves.jpg'),
(478, 3, 'Awesome Wooden Towels', 'grey Small Fresh Towels', '844.00', 'ARS', 16, 'AwesomeWoodenTowels.jpg'),
(479, 3, 'Awesome Cotton Mouse', 'red Gorgeous Steel Hat', '199.00', 'ARS', 88, 'AwesomeCottonMouse.jpg'),
(480, 1, 'Handmade Fresh Shoes', 'sky blue Licensed Concrete Towels', '755.00', 'ARS', 105, 'HandmadeFreshShoes.jpg'),
(481, 4, 'Handmade Metal Shirt', 'indigo Generic Rubber Mouse', '133.00', 'ARS', 30, 'HandmadeMetalShirt.jpg'),
(482, 5, 'Licensed Rubber Salad', 'teal Licensed Rubber Tuna', '200.00', 'ARS', 40, 'LicensedRubberSalad.jpg'),
(483, 1, 'Gorgeous Frozen Chair', 'magenta Fantastic Fresh Bike', '674.00', 'ARS', 47, 'GorgeousFrozenChair.jpg'),
(484, 3, 'Unbranded Plastic Computer', 'ivory Incredible Plastic Salad', '421.00', 'ARS', 86, 'UnbrandedPlasticComputer.jpg'),
(485, 5, 'Generic Cotton Towels', 'turquoise Awesome Frozen Chips', '658.00', 'ARS', 102, 'GenericCottonTowels.jpg'),
(486, 5, 'Rustic Granite Sausages', 'ivory Handcrafted Fresh Cheese', '956.00', 'ARS', 96, 'RusticGraniteSausages.jpg'),
(487, 2, 'Fantastic Plastic Bacon', 'teal Fantastic Frozen Mouse', '96.00', 'ARS', 13, 'FantasticPlasticBacon.jpg'),
(488, 3, 'Rustic Wooden Shoes', 'orange Rustic Rubber Shoes', '783.00', 'ARS', 62, 'RusticWoodenShoes.jpg'),
(489, 5, 'Gorgeous Soft Car', 'ivory Fantastic Fresh Cheese', '206.00', 'ARS', 85, 'GorgeousSoftCar.jpg'),
(490, 2, 'Licensed Frozen Soap', 'ivory Gorgeous Rubber Ball', '368.00', 'ARS', 60, 'LicensedFrozenSoap.jpg'),
(491, 1, 'Sleek Soft Shoes', 'gold Generic Fresh Shirt', '944.00', 'ARS', 105, 'SleekSoftShoes.jpg'),
(492, 1, 'Small Soft Cheese', 'green Gorgeous Rubber Chips', '182.00', 'ARS', 20, 'SmallSoftCheese.jpg'),
(493, 4, 'Handcrafted Granite Pants', 'mint green Rustic Frozen Tuna', '521.00', 'ARS', 9, 'HandcraftedGranitePants.jpg'),
(494, 3, 'Practical Steel Computer', 'cyan Fantastic Metal Chair', '186.00', 'ARS', 56, 'PracticalSteelComputer.jpg'),
(495, 5, 'Gorgeous Wooden Keyboard', 'pink Licensed Steel Chicken', '841.00', 'ARS', 24, 'GorgeousWoodenKeyboard.jpg'),
(496, 5, 'Tasty Steel Cheese', 'white Sleek Wooden Fish', '105.00', 'ARS', 103, 'TastySteelCheese.jpg'),
(497, 1, 'Unbranded Granite Pizza', 'sky blue Ergonomic Frozen Hat', '270.00', 'ARS', 65, 'UnbrandedGranitePizza.jpg'),
(498, 2, 'Small Frozen Towels', 'magenta Small Wooden Chips', '68.00', 'ARS', 0, 'SmallFrozenTowels.jpg'),
(499, 4, 'Gorgeous Soft Bike', 'mint green Licensed Metal Shirt', '397.00', 'ARS', 45, 'GorgeousSoftBike.jpg'),
(500, 2, 'Fantastic Rubber Computer', 'orange Sleek Soft Sausages', '706.00', 'ARS', 72, 'FantasticRubberComputer.jpg'),
(501, 1, 'Refined Wooden Computer', 'plum Ergonomic Cotton Salad', '621.00', 'ARS', 84, 'RefinedWoodenComputer.jpg'),
(502, 3, 'Small Granite Chair', 'purple Unbranded Granite Hat', '479.00', 'ARS', 39, 'SmallGraniteChair.jpg'),
(503, 4, 'Generic Concrete Chicken', 'green Awesome Frozen Shirt', '467.00', 'ARS', 103, 'GenericConcreteChicken.jpg'),
(504, 4, 'Sleek Metal Pizza', 'gold Licensed Concrete Shirt', '762.00', 'ARS', 49, 'SleekMetalPizza.jpg'),
(505, 2, 'Refined Granite Chips', 'orange Small Concrete Cheese', '879.00', 'ARS', 65, 'RefinedGraniteChips.jpg'),
(506, 2, 'Generic Rubber Car', 'blue Small Wooden Computer', '367.00', 'ARS', 18, 'GenericRubberCar.jpg'),
(507, 5, 'Licensed Granite Sausages', 'white Small Cotton Sausages', '400.00', 'ARS', 52, 'LicensedGraniteSausages.jpg'),
(508, 1, 'Sleek Metal Tuna', 'red Refined Metal Towels', '607.00', 'ARS', 91, 'SleekMetalTuna.jpg'),
(509, 4, 'Unbranded Metal Soap', 'turquoise Fantastic Fresh Chips', '352.00', 'ARS', 20, 'UnbrandedMetalSoap.jpg'),
(510, 2, 'Incredible Rubber Chips', 'green Ergonomic Fresh Shoes', '209.00', 'ARS', 14, 'IncredibleRubberChips.jpg'),
(511, 5, 'Gorgeous Plastic Hat', 'gold Intelligent Fresh Computer', '708.00', 'ARS', 33, 'GorgeousPlasticHat.jpg'),
(512, 2, 'Sleek Rubber Fish', 'pink Unbranded Fresh Ball', '495.00', 'ARS', 85, 'SleekRubberFish.jpg'),
(513, 3, 'Handmade Rubber Soap', 'ivory Practical Rubber Chips', '22.00', 'ARS', 105, 'HandmadeRubberSoap.jpg'),
(514, 4, 'Rustic Cotton Bike', 'cyan Unbranded Wooden Hat', '214.00', 'ARS', 55, 'RusticCottonBike.jpg'),
(515, 5, 'Small Wooden Mouse', 'gold Incredible Metal Shoes', '547.00', 'ARS', 119, 'SmallWoodenMouse.jpg');

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
(11, 'AuthTest', '123$#%&fdsa', 'Just Kidding', 'No Auth Used', 'authy@email.com'),
(15, 'juanphlip', 'idk', 'juan', 'phlip', 'email@email.email'),
(16, 'encrypted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzIjoidGVzdCIsInVzZXJuYW1lIjoiZW5jcnlwdGVkIn0.0Bd47UDszBgDIY9jh1q07pattwOYF3zutP27oAoLlRk', 'Encryption', 'HellYeah', 'wedidit@weareencrypted.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`street1`,`street2`,`number`,`district`,`city`,`country`),
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_details_ibfk_1` (`order_id`),
  ADD KEY `order_details_ibfk_2` (`product_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;
