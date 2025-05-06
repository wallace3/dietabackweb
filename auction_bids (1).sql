-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2025 a las 01:19:15
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
  `street` varchar(100) NOT NULL,
  `suburb` varchar(100) NOT NULL,
  `state` varchar(70) NOT NULL,
  `cp` int(10) NOT NULL,
  `country` varchar(80) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `reference` text NOT NULL,
  `defaultAddress` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`idAddress`, `idUser`, `street`, `suburb`, `state`, `cp`, `country`, `phone`, `reference`, `defaultAddress`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Ciencias politicas', 'villas universidad', 'Zacatecas', 98160, 'Mexico', '4925833489', 'casa cerca de tiendita', 1, 1, '2025-03-24 16:39:28', '2025-03-24 16:41:17'),
(3, 1, 'Ciencias politicas', 'villas universidad', 'Zacatecas', 98160, 'Mexico', '4925833489', 'casa cerca de tiendita', 0, 1, '2025-03-24 17:06:11', '2025-03-24 17:06:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auction`
--

CREATE TABLE `auction` (
  `idAuction` int(10) NOT NULL,
  `idProduct` int(10) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `idUser` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auction`
--

INSERT INTO `auction` (`idAuction`, `idProduct`, `startTime`, `endTime`, `idUser`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, '2025-03-29 11:00:00', '2025-04-01 11:00:00', 1, 1, '2025-03-25 17:29:16', '2025-03-25 17:29:16'),
(3, 1, '2025-03-29 11:00:00', '2025-04-01 11:00:00', 1, 1, '2025-03-25 17:30:04', '2025-03-25 17:30:04'),
(4, 1, '2025-03-29 11:00:00', '2025-04-01 11:00:00', 1, 1, '2025-03-25 17:30:46', '2025-03-25 17:30:46');

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

INSERT INTO `bids` (`idBid`, `idProduct`, `idUser`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '200', 1, '2025-03-25 19:33:03', '2025-03-25 19:33:03'),
(3, 1, 1, '300', 1, '2025-03-25 19:36:14', '2025-03-25 19:36:14');

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
(10, 'Deportes', '1745945681_c88a23bb57a0c33b1614.png', 'uploads/images/categories/1745945681_c88a23bb57a0c33b1614.png', 1, '2025-04-05 01:17:15', '2025-04-29 16:54:41'),
(18, 'Ropa', '1745945919_1eeb45fe9e65f92faaf3.png', 'uploads/images/categories/1745945919_1eeb45fe9e65f92faaf3.png', 1, '2025-04-29 16:58:39', '2025-04-29 16:58:39'),
(22, 'Arte Moderno', '1745970589_02dc43c8bd8c7a9c509e.png', 'uploads/images/categories/1745970589_02dc43c8bd8c7a9c509e.png', 1, '2025-04-29 23:49:49', '2025-04-29 23:49:49');

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
(15, 1, '1745956453_13bc4cea9abad56b6976.jpg', 'uploads/images/1745956453_13bc4cea9abad56b6976.jpg', 1, '2025-04-29 19:54:13', '2025-04-29 19:54:13');

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
(1, 'Gorra Beisbol 2', 'Gorra de beisbol de babe ruth color amarillo', 10, 1, 1, '4000.00', 1, '2025-03-24 19:38:51', '2025-04-07 17:09:50'),
(2, 'Cuadro Van Hogh', 'Cuadro Van Gogh, 19x20 cm, oleo sobre tela, firmado.', 7, 0, 1, '3000.00', 1, '2025-04-01 17:56:24', '2025-04-01 17:56:24'),
(3, 'Reloj Casio', 'Reloj casio, clásico, usado, funcional con correa de oro', 10, 2, 1, '2000', 1, '2025-04-05 01:06:49', '2025-04-29 18:29:30'),
(4, 'Playera de messi autografiada', 'Playera de messi, barcelona, campeonato uefa champions league 2004', 10, 0, 1, '1500', 1, '2025-04-05 01:19:23', '2025-04-05 01:19:23');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_detail`
--

CREATE TABLE `sales_detail` (
  `idDetail` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 10, 'Futbol', 1, '2025-04-03 19:36:44', '2025-04-07 16:53:03'),
(2, 10, 'Basquetbol', 1, '2025-04-07 16:20:40', '2025-04-07 16:53:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `idType` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `username`, `name`, `lastName`, `email`, `password`, `idType`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pedro', 'Azael', 'Hernandez', 'pedro@gmail.com', '$2y$10$AFRhdylJCtZZgDBH.BeRHeaE2bsp5P9B07V4cM87m8.TPKtYco0.a', 1, 0, '2025-03-21 23:28:24', '2025-04-09 02:12:44'),
(4, 'alegq', 'Alejandra', 'Quiñones', 'ale@zapata.com', '$2y$10$n9D2UY8E0lFFKSneKGIVZOrcgayrIfWQBbzvZl1ytB6XlDvMYd9Ia', 4, 0, '2025-04-08 20:25:50', '2025-04-09 02:13:51');

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
  ADD PRIMARY KEY (`idUser`);

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
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auction`
--
ALTER TABLE `auction`
  MODIFY `idAuction` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bids`
--
ALTER TABLE `bids`
  MODIFY `idBid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `idCart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `idImage` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `idSale` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `idDetail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `idSubcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user_types`
--
ALTER TABLE `user_types`
  MODIFY `idType` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `idWishList` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
