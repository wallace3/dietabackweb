-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2025 a las 01:43:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `auction_bids`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `idAddress` int(11) NOT NULL,
  `idUser` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `street` varchar(100) NOT NULL,
  `suburb` varchar(100) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(70) NOT NULL,
  `cp` int(10) NOT NULL,
  `country` varchar(80) NOT NULL,
  `reference` text NOT NULL,
  `defaultAddress` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`idAddress`, `idUser`, `name`, `street`, `suburb`, `city`, `state`, `cp`, `country`, `reference`, `defaultAddress`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, '', 'Ciencias politicas', 'villas universidad', '', 'Zacatecas', 98160, 'Mexico', 'casa cerca de tiendita', 1, 1, '2025-03-24 16:39:28', '2025-03-24 16:41:17'),
(3, 1, '', 'Ciencias politicas', 'villas universidad', '', 'Zacatecas', 98160, 'Mexico', 'casa cerca de tiendita', 0, 1, '2025-03-24 17:06:11', '2025-03-24 17:06:11'),
(4, 9, 'Casa propia', 'Ciencias politicas', 'Villas Universidad', 'Zacatecas', 'Zacatecas', 98160, 'México', '', 0, 1, '2025-05-21 17:59:01', '2025-05-21 17:59:01'),
(5, 9, 'Trabajo', 'Monte Athos 165', 'Lomas de Chapultepec', 'CDMX', 'Miguel Hidalgo', 11000, 'México', 'Morton Subastas empresa', 1, 1, '2025-05-21 18:03:22', '2025-05-21 18:03:22'),
(6, 9, 'Casa de mi papá', 'Villa flores', 'Villas del carmen', 'Zacatecas', 'Zacatecas', 98608, 'México', 'Casa de Zacatecas, anterior', 0, 1, '2025-05-21 22:19:02', '2025-05-21 22:22:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auction`
--

CREATE TABLE `auction` (
  `idAuction` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image_url` text NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `amount` int(50) NOT NULL,
  `idUser` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auction`
--

INSERT INTO `auction` (`idAuction`, `name`, `description`, `image_url`, `startTime`, `endTime`, `amount`, `idUser`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Subasta de Libros', 'Subasta de Libros', 'uploads/images/auctions/1747244123_0bd7fcec23b05600fe5f.jpg', '2025-05-16 11:58:00', '2025-05-13 11:58:00', 100, 1, 0, '2025-05-09 17:58:18', '2025-05-14 17:35:23'),
(7, 'Subasta de Joyería', 'Subasta de joyería', 'uploads/images/auctions/1747239870_992ec67332505ed153fb.jpg', '2025-05-09 00:36:00', '2025-05-16 13:37:00', 500, 0, 0, '2025-05-14 16:24:30', '2025-05-14 16:24:30'),
(8, 'Subasta de Musica', 'Subasta de Vinyles', 'uploads/images/auctions/1747771247_96ba3a83c674739bab10.jpg', '2025-05-20 13:59:00', '2025-05-22 13:59:00', 100, 1, 0, '2025-05-20 20:00:47', '2025-05-20 20:00:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auction_details`
--

CREATE TABLE `auction_details` (
  `idAuctionDetail` int(11) NOT NULL,
  `idAuction` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auction_details`
--

INSERT INTO `auction_details` (`idAuctionDetail`, `idAuction`, `idProduct`, `idUser`, `status`, `created_at`, `updated_at`) VALUES
(7, 5, 1, 1, 1, '2025-05-12 19:43:57', '2025-05-12 19:43:57'),
(8, 5, 2, 1, 1, '2025-05-12 19:46:48', '2025-05-12 19:46:48'),
(9, 6, 2, 1, 1, '2025-05-12 22:00:35', '2025-05-12 22:00:35'),
(10, 6, 3, 1, 1, '2025-05-12 22:05:17', '2025-05-12 22:05:17'),
(11, 7, 2, 1, 1, '2025-05-14 19:21:03', '2025-05-14 19:21:03'),
(12, 7, 4, 1, 1, '2025-05-14 19:21:08', '2025-05-14 19:21:08'),
(13, 8, 12, 1, 1, '2025-05-20 20:01:18', '2025-05-20 20:01:18'),
(14, 8, 7, 1, 1, '2025-05-20 20:01:22', '2025-05-20 20:01:22'),
(15, 8, 10, 1, 1, '2025-05-22 22:04:53', '2025-05-22 22:04:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `idBanner` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `url` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`idBanner`, `name`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, '1745351346_e3f676b457d0ef73e8b0.jpg', 'uploads/images/banners/1745351346_e3f676b457d0ef73e8b0.jpg', 1, '2025-04-22 19:49:06', '2025-04-22 19:49:06'),
(3, '1745360198_a063f9271a9554c4641b.jpg', 'uploads/images/banners/1745360198_a063f9271a9554c4641b.jpg', 1, '2025-04-22 22:16:38', '2025-04-22 22:16:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bids`
--

CREATE TABLE `bids` (
  `idBid` int(10) NOT NULL,
  `idAuction` int(11) NOT NULL,
  `idProduct` int(10) NOT NULL,
  `idUser` int(10) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bids`
--

INSERT INTO `bids` (`idBid`, `idAuction`, `idProduct`, `idUser`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(9, 8, 12, 9, '1000', 1, '2025-05-20 22:43:08', '2025-05-20 22:43:08'),
(10, 8, 12, 9, '1100', 1, '2025-05-20 22:52:52', '2025-05-20 22:52:52'),
(11, 8, 12, 7, '1200', 1, '2025-05-20 22:55:44', '2025-05-20 22:55:44'),
(12, 8, 7, 9, '12100', 1, '2025-05-20 22:57:07', '2025-05-20 22:57:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `idCart` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `url` text NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`idCategory`, `name`, `image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(23, 'Cuadros y Pinturas', '1746814076_0628a9b7bba6b63a86de.jpg', 'uploads/images/categories/1746814076_0628a9b7bba6b63a86de.jpg', 1, '2025-05-09 18:07:56', '2025-05-27 19:50:36'),
(24, 'Joyería', '1746815689_4a5beb2341714d29dc1a.jpg', 'uploads/images/categories/1746815689_4a5beb2341714d29dc1a.jpg', 1, '2025-05-09 18:34:49', '2025-05-09 18:34:49'),
(26, 'Vinos y Destilados', '1746815974_72c2005ba4124108ab79.jpg', 'uploads/images/categories/1746815974_72c2005ba4124108ab79.jpg', 1, '2025-05-09 18:39:34', '2025-05-27 19:48:47'),
(27, 'Arte', '1746816162_7e2029529ee2a133ace8.jpg', 'uploads/images/categories/1746816162_7e2029529ee2a133ace8.jpg', 1, '2025-05-09 18:42:42', '2025-05-27 19:49:40'),
(28, 'Antigüedades', '1746816306_f330e384f204b95a4c15.jpg', 'uploads/images/categories/1746816306_f330e384f204b95a4c15.jpg', 1, '2025-05-09 18:45:06', '2025-05-09 18:45:06'),
(29, 'Muebles', '1746816463_f617987e08c5fcceb749.jpg', 'uploads/images/categories/1746816463_f617987e08c5fcceb749.jpg', 1, '2025-05-09 18:47:43', '2025-05-09 18:47:43'),
(30, 'Deportes', '1746816687_94f227fd0994e6025538.jpg', 'uploads/images/categories/1746816687_94f227fd0994e6025538.jpg', 1, '2025-05-09 18:51:27', '2025-05-09 18:51:27'),
(32, 'Oportunidades', '1746816980_2e84d2d7eb7064b17dd2.jpg', 'uploads/images/categories/1746816980_2e84d2d7eb7064b17dd2.jpg', 1, '2025-05-09 18:56:20', '2025-05-09 18:56:20'),
(33, 'Videojuegos', '1746817398_67facad83d53d7482edf.jpg', 'uploads/images/categories/1746817398_67facad83d53d7482edf.jpg', 1, '2025-05-09 19:03:18', '2025-05-09 19:03:18'),
(34, 'Revistas & Cómic\'s', '1746818205_a47cc9509e8e86b5c88a.jpg', 'uploads/images/categories/1746818205_a47cc9509e8e86b5c88a.jpg', 1, '2025-05-09 19:16:45', '2025-05-27 19:49:53'),
(35, 'Coleccionables', '1747416209_99076a9c0d5845a4ae75.png', 'uploads/images/categories/1747416209_99076a9c0d5845a4ae75.png', 1, '2025-05-16 17:00:37', '2025-05-16 17:23:29'),
(36, 'Bolsos', '1747675946_b2e50cb700f3d54b314d.jpeg', 'uploads/images/categories/1747675946_b2e50cb700f3d54b314d.jpeg', 1, '2025-05-19 17:16:28', '2025-05-27 19:49:03'),
(37, 'Libros', '1747676237_5018469f2e8e48969176.png', 'uploads/images/categories/1747676237_5018469f2e8e48969176.png', 1, '2025-05-19 17:37:05', '2025-05-19 17:37:17'),
(38, 'Ropa', '1747676896_2d1d6a4b613e148f3c1a.png', 'uploads/images/categories/1747676896_2d1d6a4b613e148f3c1a.png', 1, '2025-05-19 17:48:03', '2025-05-19 17:48:16'),
(39, 'Zapatos', '1747677024_df9ad9c5c65ac387f86f.png', 'uploads/images/categories/1747677024_df9ad9c5c65ac387f86f.png', 1, '2025-05-19 17:50:14', '2025-05-19 17:50:24'),
(40, 'Artículos Religiosos', '1747677248_9802f23b17a5c39a5bef.jpg', 'uploads/images/categories/1747677248_9802f23b17a5c39a5bef.jpg', 1, '2025-05-19 17:54:08', '2025-05-19 17:54:08'),
(41, 'Música', '1747677322_9193e34fe753f6add9ad.jpg', 'uploads/images/categories/1747677322_9193e34fe753f6add9ad.jpg', 1, '2025-05-19 17:55:13', '2025-05-27 19:49:19'),
(43, 'Únicos y de Colección', '1747677836_397fce99f9a2da9f39f8.png', 'uploads/images/categories/1747677836_397fce99f9a2da9f39f8.png', 1, '2025-05-19 18:03:56', '2025-05-19 18:03:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contracts`
--

CREATE TABLE `contracts` (
  `idContract` int(10) NOT NULL,
  `idUser` int(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contract_details`
--

CREATE TABLE `contract_details` (
  `idDetail` int(10) NOT NULL,
  `idContract` int(10) NOT NULL,
  `idProduct` int(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `idImage` int(10) NOT NULL,
  `idProduct` int(10) NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`idImage`, `idProduct`, `name`, `url`, `status`, `created_at`, `updated_at`) VALUES
(9, 1, '1745950230_b2d315c11c470fb54fe0.jpg', 'uploads/images/1745950230_b2d315c11c470fb54fe0.jpg', 1, '2025-04-29 18:10:30', '2025-04-29 18:10:30'),
(11, 2, '1745950455_9a1d657a33b32ebf1597.jpg', 'uploads/images/1745950455_9a1d657a33b32ebf1597.jpg', 1, '2025-04-29 18:14:16', '2025-04-29 18:14:16'),
(12, 4, '1745950777_af49b53fdb6d118e67d4.png', 'uploads/images/1745950777_af49b53fdb6d118e67d4.png', 1, '2025-04-29 18:19:37', '2025-04-29 18:19:37'),
(13, 3, '1745951387_8eceaab2cb645201840f.jpg', 'uploads/images/1745951387_8eceaab2cb645201840f.jpg', 1, '2025-04-29 18:29:47', '2025-04-29 18:29:47'),
(14, 1, '1745956453_15d6dfb1baa817338183.png', 'uploads/images/1745956453_15d6dfb1baa817338183.png', 1, '2025-04-29 19:54:13', '2025-04-29 19:54:13'),
(15, 1, '1745956453_13bc4cea9abad56b6976.jpg', 'uploads/images/1745956453_13bc4cea9abad56b6976.jpg', 1, '2025-04-29 19:54:13', '2025-04-29 19:54:13'),
(16, 5, '1747419597_a58ce3cec5119522d72b.jpg', 'uploads/images/1747419597_a58ce3cec5119522d72b.jpg', 1, '2025-05-16 18:19:57', '2025-05-16 18:19:57'),
(17, 6, '1747419787_5d96d23dcf3d389114fd.jpg', 'uploads/images/1747419787_5d96d23dcf3d389114fd.jpg', 1, '2025-05-16 18:23:07', '2025-05-16 18:23:07'),
(18, 9, '1747421023_2fb093b2d3ffc27454c4.jpg', 'uploads/images/1747421023_2fb093b2d3ffc27454c4.jpg', 1, '2025-05-16 18:43:43', '2025-05-16 18:43:43'),
(19, 10, '1747421303_316a9d097ca568d9d792.jpg', 'uploads/images/1747421303_316a9d097ca568d9d792.jpg', 1, '2025-05-16 18:48:23', '2025-05-16 18:48:23'),
(20, 11, '1747425875_2df150aa346de2dd9f98.png', 'uploads/images/1747425875_2df150aa346de2dd9f98.png', 1, '2025-05-16 20:04:35', '2025-05-16 20:04:35'),
(21, 12, '1747426003_dd3269bc12a2c3be0a01.jpg', 'uploads/images/1747426003_dd3269bc12a2c3be0a01.jpg', 1, '2025-05-16 20:06:43', '2025-05-16 20:06:43'),
(22, 13, '1747426177_2ac1e2cd14c1f3295ac5.jpg', 'uploads/images/1747426177_2ac1e2cd14c1f3295ac5.jpg', 1, '2025-05-16 20:09:37', '2025-05-16 20:09:37'),
(23, 7, '1747433625_680a14031941701416d1.jpg', 'uploads/images/1747433625_680a14031941701416d1.jpg', 1, '2025-05-16 22:13:45', '2025-05-16 22:13:45'),
(24, 8, '1747433661_75c1a005054c27d8b8c7.jpg', 'uploads/images/1747433661_75c1a005054c27d8b8c7.jpg', 1, '2025-05-16 22:14:21', '2025-05-16 22:14:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idSale` int(11) NOT NULL,
  `pdf` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `idOrder` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `idUser` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` int(50) NOT NULL,
  `stripeId` text NOT NULL,
  `paymentStatus` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`idOrder`, `orderDate`, `idUser`, `status`, `total`, `stripeId`, `paymentStatus`, `created_at`, `updated_at`) VALUES
(12, '2025-05-27 18:10:09', 9, 'pi_3RTS4WEEk2wvGozK15r7KKmQ', 30000, 'cs_test_a14arkUJlUT4wCchF1VrGYAdZ9mB6fGwH7BqOuorDaa98CWMlIReWfFMoH', 'unpaid', '2025-05-27 18:10:09', '2025-05-27 18:41:40'),
(15, '2025-05-27 19:23:12', 9, 'pi_3RTT5oEEk2wvGozK18MY4ISk', 92000, 'cs_test_b1zkzO03m69BFG6fu4AEttAOUPWcs0JsT5pmMaReX8r1rSienotLSjI6xC', 'paid', '2025-05-27 19:23:12', '2025-05-27 19:23:25'),
(16, '2025-05-27 19:26:45', 9, 'pi_3RTT9EEEk2wvGozK1eJfyLOj', 92000, 'cs_test_b1IHAf0c2Fnjl4aiztnGRkazDunmqFTIPrCyfafPRAALfmaXz3Oqrwk0bD', 'paid', '2025-05-27 19:26:45', '2025-05-27 19:26:56'),
(17, '2025-05-27 19:32:36', 9, 'pi_3RTTEsEEk2wvGozK0fIiosxu', 12000, 'cs_test_a1nqCk6OYxXp926wGv1kwQZMf9bXxOnsw3Zp7vefJrjMRWrPDzhwJjWrZw', 'paid', '2025-05-27 19:32:36', '2025-05-27 19:32:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE `order_details` (
  `idOrderDetail` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `price` float NOT NULL,
  `id_stripe` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_details`
--

INSERT INTO `order_details` (`idOrderDetail`, `idOrder`, `idProduct`, `price`, `id_stripe`, `created_at`, `updated_at`) VALUES
(10, 12, 5, 30000, '', '2025-05-27 18:10:09', '2025-05-27 18:10:09'),
(13, 15, 6, 17000, '', '2025-05-27 19:23:12', '2025-05-27 19:23:12'),
(14, 15, 8, 75000, '', '2025-05-27 19:23:12', '2025-05-27 19:23:12'),
(15, 16, 6, 17000, '', '2025-05-27 19:26:45', '2025-05-27 19:26:45'),
(16, 16, 8, 75000, '', '2025-05-27 19:26:45', '2025-05-27 19:26:45'),
(17, 17, 7, 12000, '', '2025-05-27 19:32:36', '2025-05-27 19:32:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `idCategory` int(10) NOT NULL,
  `idSubcategory` int(11) NOT NULL,
  `idUser` int(10) NOT NULL,
  `price` varchar(20) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`idProduct`, `name`, `description`, `idCategory`, `idSubcategory`, `idUser`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Gorra Beisbol 2', 'Gorra de beisbol de babe ruth color amarillo', 10, 1, 1, '4000.00', 0, '2025-03-24 19:38:51', '2025-05-16 20:19:36'),
(2, 'Cuadro Van Hogh', 'Cuadro Van Gogh, 19x20 cm, oleo sobre tela, firmado.', 7, 0, 1, '3000.00', 0, '2025-04-01 17:56:24', '2025-05-16 20:20:59'),
(3, 'Reloj Casio', 'Reloj casio, clásico, usado, funcional con correa de oro', 10, 2, 1, '2000', 0, '2025-04-05 01:06:49', '2025-05-16 20:21:17'),
(4, 'Playera de messi autografiada', 'Playera de messi, barcelona, campeonato uefa champions league 2004', 10, 0, 1, '1500', 0, '2025-04-05 01:19:23', '2025-05-16 20:21:19'),
(5, 'Cuadro da vinci', 'Cuadro de da vinci, obra amarilla, oleo sobre tela 45cm * 150cm', 23, 10, 1, '30000', 0, '2025-05-16 18:19:20', '2025-05-27 18:54:28'),
(6, 'Reloj Rolex', 'Reloj Rolex en casa, corre de piel.', 24, 11, 1, '17000', 0, '2025-05-16 18:22:47', '2025-05-27 19:26:56'),
(7, 'Champagne Moet', 'Champagne moet 3 piezas', 26, 20, 1, '12000', 0, '2025-05-16 18:28:10', '2025-05-27 19:32:45'),
(8, 'Cuadro modreno, arte contemporaneo', 'Cuadro renancesista', 27, 10, 1, '75000', 0, '2025-05-16 18:31:17', '2025-05-27 19:26:56'),
(9, 'Mesa victoriana', 'Mesa victoriana del siglo XIX', 29, 10, 1, '10000', 1, '2025-05-16 18:43:28', '2025-05-16 18:43:28'),
(10, 'Reloj del siglo X!X', 'Reloj de italia, siglo XIX', 28, 10, 1, '2400', 1, '2025-05-16 18:48:11', '2025-05-16 18:48:11'),
(11, 'Jersey Michael Jordan', 'Jersey firmado michael jordan temporada 2000', 30, 2, 1, '2300', 1, '2025-05-16 20:04:17', '2025-05-16 20:04:17'),
(12, 'Control xbox VR', 'Control original XBOX', 33, 10, 1, '900', 1, '2025-05-16 20:06:29', '2025-05-16 20:06:29'),
(13, 'Cafetera 2000', 'Cafetera usada ', 32, 10, 1, '500', 1, '2025-05-16 20:09:00', '2025-05-16 20:09:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `idSale` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `total` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`idSale`, `idUser`, `total`, `payment`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, '12000', 'COMPLETED', 1, '2025-05-21 01:42:09', '2025-05-21 01:42:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_detail`
--

CREATE TABLE `sales_detail` (
  `idDetail` int(11) NOT NULL,
  `idSale` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales_detail`
--

INSERT INTO `sales_detail` (`idDetail`, `idSale`, `idProduct`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 12000, 1, '2025-05-21 01:43:48', '2025-05-21 01:43:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE `subcategories` (
  `idSubcategory` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategories`
--

INSERT INTO `subcategories` (`idSubcategory`, `idCategory`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 30, 'Futbol', 1, '2025-04-03 19:36:44', '2025-05-16 18:31:30'),
(2, 30, 'Basquetbol', 1, '2025-04-07 16:20:40', '2025-05-16 18:31:38'),
(3, 30, 'Tenis', 1, '2025-05-09 19:17:53', '2025-05-16 18:32:03'),
(4, 30, 'Futbol Americano', 1, '2025-05-09 19:18:18', '2025-05-16 18:32:09'),
(5, 30, 'Volleyball', 1, '2025-05-09 19:18:27', '2025-05-16 18:32:16'),
(6, 30, 'Atletismo', 1, '2025-05-09 19:18:39', '2025-05-16 18:32:23'),
(7, 30, 'Natación', 1, '2025-05-09 19:18:45', '2025-05-16 18:32:29'),
(8, 33, 'Videojuegos', 1, '2025-05-09 19:19:26', '2025-05-16 18:32:37'),
(9, 33, 'Consolas', 1, '2025-05-09 19:19:33', '2025-05-16 18:32:42'),
(10, 33, 'Accesorios', 1, '2025-05-09 19:19:38', '2025-05-09 19:19:58'),
(11, 24, 'Relojes', 1, '2025-05-09 19:23:57', '2025-05-16 18:32:48'),
(12, 24, 'Anillos', 1, '2025-05-09 19:24:08', '2025-05-16 18:32:55'),
(13, 24, 'Collares', 1, '2025-05-09 19:24:14', '2025-05-16 18:33:00'),
(14, 24, 'Pulseras', 1, '2025-05-09 19:24:23', '2025-05-16 18:33:06'),
(15, 24, 'Perlas', 1, '2025-05-09 19:24:48', '2025-05-16 18:33:12'),
(16, 26, 'Vinos', 1, '2025-05-09 19:25:51', '2025-05-16 18:33:18'),
(17, 26, 'Tequilas', 1, '2025-05-09 19:26:00', '2025-05-16 18:33:24'),
(18, 26, 'Whiskey', 1, '2025-05-09 19:26:05', '2025-05-16 18:33:28'),
(19, 26, 'Brandy', 1, '2025-05-09 19:26:12', '2025-05-16 18:33:34'),
(20, 26, 'Champagnes', 1, '2025-05-09 19:26:19', '2025-05-16 18:33:41'),
(21, 34, 'Revista de Comics', 1, '2025-05-09 19:28:23', '2025-05-09 19:28:23'),
(22, 34, 'Historietas', 1, '2025-05-09 19:28:33', '2025-05-09 19:28:33'),
(23, 34, 'Cocina', 1, '2025-05-09 19:28:38', '2025-05-09 19:28:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `idType` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `name`, `lastName`, `email`, `phone`, `password`, `idType`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Azael', 'Hernandez', 'pedro@gmail.com', '', '$2y$10$AFRhdylJCtZZgDBH.BeRHeaE2bsp5P9B07V4cM87m8.TPKtYco0.a', 1, 0, '2025-03-21 23:28:24', '2025-04-09 02:12:44'),
(4, 'Alejandra', 'Quiñones', 'ale@zapata.com', '', '$2y$10$n9D2UY8E0lFFKSneKGIVZOrcgayrIfWQBbzvZl1ytB6XlDvMYd9Ia', 4, 0, '2025-04-08 20:25:50', '2025-04-09 02:13:51'),
(8, 'Edgar', 'Hernandez', 'edhernandezw@gmail.com', '', '$2y$10$wQ/QtObIDZAp0RoG6p2uMeIyZ/s8ULIQLMtTu6ALs.nwsWQlxsoSO', 8, 1, '2025-05-19 20:01:17', '2025-05-19 20:01:17'),
(9, 'Miguel', 'Peralta', 'mpe@gmail.com', '', '$2y$10$PNSeWrRyEkGLzuuLFP87H.b3g1vaCcWvrFGSpLTQ..3bvfBa32wA2', 8, 1, '2025-05-19 20:20:12', '2025-05-19 20:20:12'),
(10, 'rodriguez', 'martinez', 'r@gmail.com', '', '$2y$10$Kzx5Y5qL8rQp9ZmpNgAWw.IgjtCI95Oo5e/9KxctdZGMy0U.vsWzG', 8, 1, '2025-05-19 20:20:39', '2025-05-19 20:20:39'),
(11, 'Maria', 'magdalena', 'maqa@gmail.com', '', '$2y$10$h.MVYXljklZtrNSiGIBJXeR5in8vDg1YOzuI.lWrWnxbo34I4Mp6m', 8, 1, '2025-05-19 20:24:09', '2025-05-19 20:24:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_types`
--

CREATE TABLE `user_types` (
  `idType` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_types`
--

INSERT INTO `user_types` (`idType`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '2025-03-24 18:48:05', '2025-03-24 18:48:05'),
(2, 'Gerente', 1, '2025-04-08 19:24:51', '2025-04-08 19:24:51'),
(3, 'Consignante', 1, '2025-04-08 19:25:00', '2025-04-08 19:25:00'),
(4, 'Comprador', 1, '2025-04-08 19:25:14', '2025-04-08 19:25:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `idWishList` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wishlist`
--

INSERT INTO `wishlist` (`idWishList`, `idProduct`, `idUser`, `created_at`, `updated_at`) VALUES
(6, 7, 9, '2025-05-20 19:21:23', '2025-05-20 19:21:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`idAuction`);

--
-- Indices de la tabla `auction_details`
--
ALTER TABLE `auction_details`
  ADD PRIMARY KEY (`idAuctionDetail`);

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`idBanner`);

--
-- Indices de la tabla `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`idBid`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idCart`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`idContract`);

--
-- Indices de la tabla `contract_details`
--
ALTER TABLE `contract_details`
  ADD PRIMARY KEY (`idDetail`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`idImage`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`idInvoice`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idOrder`);

--
-- Indices de la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`idOrderDetail`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idProduct`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`idSale`);

--
-- Indices de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`idDetail`);

--
-- Indices de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`idSubcategory`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`idType`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`idWishList`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `auction`
--
ALTER TABLE `auction`
  MODIFY `idAuction` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `auction_details`
--
ALTER TABLE `auction_details`
  MODIFY `idAuctionDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bids`
--
ALTER TABLE `bids`
  MODIFY `idBid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `idCart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `contracts`
--
ALTER TABLE `contracts`
  MODIFY `idContract` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contract_details`
--
ALTER TABLE `contract_details`
  MODIFY `idDetail` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `idImage` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `idInvoice` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `order_details`
--
ALTER TABLE `order_details`
  MODIFY `idOrderDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `idSale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `idDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `idSubcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user_types`
--
ALTER TABLE `user_types`
  MODIFY `idType` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `idWishList` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
