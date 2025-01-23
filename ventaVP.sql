-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-01-2025 a las 23:53:34
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventaVP`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_venta_completa` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `producto_id`, `cantidad`, `total`, `fecha`, `id_venta_completa`) VALUES
(17, 24, 2, '2.00', '2024-12-18 05:44:15', '2024121806441559522A44'),
(18, 12, 1, '1.00', '2024-12-18 05:44:15', '2024121806441559522A44'),
(19, 16, 3, '3.00', '2024-12-18 05:46:49', '2024121806464963BE510D'),
(20, 32, 4, '4.00', '2024-12-18 05:46:49', '2024121806464963BE510D'),
(21, 10, 5, '5.00', '2024-12-18 05:46:49', '2024121806464963BE510D'),
(22, 6, 7, '7.00', '2024-12-18 05:46:49', '2024121806464963BE510D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(75) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`) VALUES
(1, 'Categoría 1'),
(2, 'IPLAY BIG MAX'),
(3, 'IPLAY XBOX'),
(4, 'IPLAY XBOX PRO'),
(5, 'MASSKING ULTRA'),
(6, 'NASTY 8.5'),
(7, 'VHILL 3000'),
(8, 'VHILL 6000'),
(9, 'VHILL 12000'),
(10, 'WONDER G4'),
(11, 'WONDER G20'),
(12, 'WONDER RACE'),
(13, 'WAKA SMASH'),
(14, 'WAKA 16000'),
(15, 'WAKA 18000'),
(16, 'WAKA 36000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `existencia` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ruta` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `oferta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `codigo`, `descripcion`, `existencia`, `precio`, `categoria`, `ruta`, `oferta`) VALUES
(1, '0001', 'IPLAY MAX', 1, '1', 'Categoría 1', 'Iplay Max.JPG', 0),
(2, '0002', 'Producto', 1, '1', 'IPLAY BIG MAX', 'producto_03.jpg', 0),
(3, '0003', 'IPLAY XBOX', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(4, '0004', 'IPLAY XBOX PRO', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(5, '0001', 'MASSKING ULTRA', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(6, '0002', 'NASTY 8.5', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 1),
(7, '0003', 'VHILL 3000', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(8, '0004', 'VHILL 6000', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(9, '0001', 'VHILL 12000', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(10, '0002', 'WONDER G4', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(11, '0003', 'WONDER G20', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(12, '0004', 'WONDER RACE', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(13, '0001', 'WAKA SMASH', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(14, '0002', 'WAKA 16000', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(15, '0003', 'WAKA 18000', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(16, '0004', 'WAKA 36000', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(17, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(18, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(19, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(20, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(21, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(22, '0003', 'Producto 3', 1, '1', 'Categoría 3', 'producto_03.jpg', 1),
(23, '0004', 'Producto 4', 1, '1', 'IPLAY BIG MAX', 'producto_04.jpg', 0),
(24, '0001', 'Producto 1', 1, '1', 'IPLAY BIG MAX', 'producto_01.jpg', 0),
(25, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 1),
(26, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(27, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(28, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(29, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(30, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(31, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(32, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(33, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(34, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(35, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(36, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(37, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE `usr` (
  `id` int(11) NOT NULL,
  `usr` int(11) NOT NULL,
  `pwd` int(11) NOT NULL,
  `perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_completa`
--

CREATE TABLE `venta_completa` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `card_last` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `identificador` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `venta_completa`
--

INSERT INTO `venta_completa` (`id`, `nombre_completo`, `direccion`, `telefono`, `email`, `card_last`, `identificador`) VALUES
(2, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '202412180618148C85CAD2'),
(3, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '20241218062236DEB677EF'),
(4, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '202412180625366F46B839'),
(5, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '2024121806264925B24C71'),
(6, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '202412180631493C8B0E92'),
(7, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '2024121806364087885759'),
(8, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '20241218064127685F1374'),
(9, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '20241218064248C858A85B'),
(10, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '20241218064353FD457428'),
(11, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '2024121806441559522A44'),
(12, 'Jesús Rodolfo Leaños Villegas', 'Calle camino del pinar 111', '4915000', 'jesusrlv@gmail.com', '98762343', '2024121806464963BE510D');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_completa`
--
ALTER TABLE `venta_completa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usr`
--
ALTER TABLE `usr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_completa`
--
ALTER TABLE `venta_completa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
