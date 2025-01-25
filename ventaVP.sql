-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-01-2025 a las 06:17:51
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

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
(1, 'IPLAY MAX'),
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
(1, '0001', 'Banana ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(2, '0002', 'Berry Watermelon', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(3, '0003', 'Coconut ice', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(4, '0004', 'Banana cherry', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(5, '0001', 'Cranberry Grape *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(6, '0002', 'Blue razz lemon *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 1),
(7, '0003', 'Mango strawberry', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(8, '0004', 'Blueberry rainbow', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(9, '0001', 'Watermelon banana *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(10, '0002', 'Watermelon bubblegum *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(11, '0003', 'Cucumber lemonade *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(12, '0004', 'Peach berries ice', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(13, '0001', 'Sour raspberry *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(14, '0002', 'Lush ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(15, '0003', 'Pineapple Coconut *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(16, '0004', 'Strawberry ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(17, '0001', 'Cool mint', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(18, '0004', 'Grape strawberry *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(19, '0001', 'Black mint *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(20, '0004', 'Low mint *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(21, '0004', 'Peach ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(22, '0003', 'Blueberry cherry *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 1),
(23, '0004', 'Energy watter ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(24, '0001', 'Rainbow candy', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(25, '0004', 'Grape ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 1),
(26, '0001', 'Root beer *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(27, '0004', 'Black dragón fruit', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(28, '0001', 'Kiwi dragón berry', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(29, '0004', 'Passion fruit *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(30, '0001', 'Blueberry ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(31, '0004', 'Coco strawberry', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(32, '0001', 'Lemon cookies', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(33, '0004', 'Blueberry strawberry', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(34, '0001', 'Guava raspberry *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(35, '0004', 'Mango ice *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(36, '0004', 'Strawberry lychee *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(37, '0004', 'Grape soda *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(38, '0000', 'Iced coffe *', 1, '1', 'IPLAY MAX', 'Iplay Max.JPG', 0),
(39, '0000', 'Spearmint', 1, '1', 'IPLAY BIG MAX', 'Iplay big Max.PNG', 0),
(40, '0000', 'Cool mint', 1, '1', 'IPLAY BIG MAX', 'Iplay big Max.PNG', 0),
(41, '0000', 'Double mint *', 1, '1', 'IPLAY BIG MAX', 'Iplay big Max.PNG', 0),
(42, '0000', 'Black mint', 1, '1', 'IPLAY BIG MAX', 'Iplay big Max.PNG', 0),
(43, '0000', 'Acapulcococo', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(44, '0000', 'Cabo ice', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(45, '0000', 'Sayulita margarita', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(46, '0000', 'Tulum mint *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(47, '0000', 'Rivera mango', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(48, '0000', 'Careyes sunset *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(49, '0000', 'Cancún breeze', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(50, '0000', 'Banana Coconut', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(51, '0000', 'Berry lemon twist *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(52, '0000', 'Black berry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(53, '0000', 'Blueberry mint *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(54, '0000', 'Blueberry cherry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(55, '0000', 'Blueberry storm *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(56, '0000', 'Chaparrita de mandarina', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(57, '0000', 'Chaparrita de piña', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(58, '0000', 'Chaparrita de uva', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(59, '0000', 'Cherry cranberry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(60, '0000', 'Coco strawberry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(61, '0000', 'Cool mint *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(62, '0000', 'Dark mint *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(63, '0000', 'Double Apple', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(64, '0000', 'Grape strawberry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(65, '0000', 'Kiwi strawberry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(66, '0000', 'Mamba *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(67, '0000', 'Mango litchi', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(68, '0000', 'Mr Peach mint *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(69, '0000', 'Peach Grape *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(70, '0000', 'Perla negra *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(71, '0000', 'Pink lemonade *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(72, '0000', 'Sakura Grape', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(73, '0000', 'Strawberry litchi burst', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(74, '0000', 'Strawberry mango *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(75, '0000', 'Strawberry sundae *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(76, '0000', 'Strawberry Watermelon *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(77, '0000', 'Ultra mint', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(78, '0000', 'Vainilla cream *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(79, '0000', 'Watermelon bubblegum', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(80, '0000', 'Watermelon crush *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(81, '0000', 'Banana strawberry *', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(82, '0000', 'Candy cane', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(83, '0000', 'Mr grinch', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(84, '0000', 'New years eve', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(85, '0000', 'Santa\'s hot cocoa', 1, '1', 'IPLAY XBOX', 'Iplay xbox.WEBP', 0),
(86, '0000', 'Perla negra', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(87, '0000', 'Kiwi strawberry *', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(88, '0000', 'Coco strawberry', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(89, '0000', 'Pink lemonade *', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(90, '0000', 'Grape strawberry *', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(91, '0000', 'Strawberry Watermelon', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(92, '0000', 'Mango litchi *', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(93, '0000', 'Blueberry mint', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(94, '0000', 'Watermelon ice', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(95, '0000', 'Dark mint *', 1, '1', 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', 0),
(96, '0000', 'MK ULTRA - BANANA', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(97, '0000', 'MK ULTRA - BERRY WATERMELON', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(98, '0000', 'MK ULTRA - BLACKCURRANT', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(99, '0000', 'MK ULTRA - COCONUT', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(100, '0000', 'MK ULTRA - ENERGY WATER ICE', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(101, '0000', 'MK ULTRA - GRAPE STRAWBERRY', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(102, '0000', 'MK ULTRA - GUAVA RASPBERRY', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(103, '0000', 'MK ULTRA - KIWI WATERMELON', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(104, '0000', 'MK ULTRA - MANGO PINEAPPLE', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(105, '0000', 'MK ULTRA - PEACH ICE', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(106, '0000', 'MK ULTRA - STRAWLEMON', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(107, '0000', 'MK ULTRA - TOBACCO', 1, '1', 'MASSKING ULTRA', 'Maskking ultra.JPG', 0),
(108, '0000', 'ALOE GRAPE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(109, '0000', 'AQUA', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(110, '0000', 'BERRY GRAPE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(111, '0000', 'BLUEBERRY SOUR RASPBERRY', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(112, '0000', 'BLUE RAZZ ICE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(113, '0000', 'DOUBLE WATERMELON', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(114, '0000', 'DRY TOBACCO', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(115, '0000', 'FIZZY CHERRY', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(116, '0000', 'GRAPE ICE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(117, '0000', 'HONEY DEW', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(118, '0000', 'MANGO', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(119, '0000', 'PASSION FRUIT', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(120, '0000', 'PEACH ICE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(121, '0000', 'PINEAPPLE ICE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(122, '0000', 'POMEGRANATE BERRY', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(123, '0000', 'SOEARMINT', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(124, '0000', 'STRAWBERRY MANGO', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(125, '0000', 'WATERMELON ICE', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(126, '0000', 'WATERMELON RASPBERRY', 1, '1', 'NASTY 8.5', 'Nasty 8_5.PNG', 0),
(127, '0000', 'Cool mint *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(128, '0000', 'Black mint', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(129, '0000', 'Cherry mint *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(130, '0000', 'Blackbery ice *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(131, '0000', 'Ice mint *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(132, '0000', 'Peach mango', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(133, '0000', 'Grape ice', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(134, '0000', 'Strawberry Watermelon *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(135, '0000', 'Grape lemonade', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(136, '0000', 'Coconut milk', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(137, '0000', 'Blueberry raspberry ice *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(138, '0000', 'Peach Blueberry *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(139, '0000', 'Mighty mint', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(140, '0000', 'Mango ice *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(141, '0000', 'Grape strawberry *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(142, '0000', 'Cherry ice', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(143, '0000', 'White caramillo *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(144, '0000', 'Coconut Pineapple', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(145, '0000', 'Mint tobacco *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(146, '0000', 'Lush ice *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(147, '0000', 'Unicorn Shake', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(148, '0000', 'Blueberry kiwi', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(149, '0000', 'Energy drink', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(150, '0000', 'Kiwi passion fruit Guava *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(151, '0000', 'Coco ice *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(152, '0000', 'Green Apple *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(153, '0000', 'Lychee ice', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(154, '0000', 'Orange ice *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(155, '0000', 'Clear *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(156, '0000', 'Raspberry Candy bubblegum *', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(157, '0000', 'Bubblegum mint', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(158, '0000', 'Guava raspberry', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(159, '0000', 'Apple strawberry raspberry', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(160, '0000', 'Peach ice', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(161, '0000', 'Strawberry banana', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(162, '0000', 'Candy cane', 1, '1', 'VHILL 3000', 'Vhill 3000.JPG', 0),
(163, '0000', 'Cranberry sunset *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(164, '0000', 'Hawaiian Watermelon *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(165, '0000', 'Sayulita melon', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(166, '0000', 'Mamitas mint *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(167, '0000', 'Coco mango beach', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(168, '0000', 'Grape ice *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(169, '0000', 'Pink lemonade *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(170, '0000', 'Peach mango *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(171, '0000', 'Mighty mint *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(172, '0000', 'Cherry ice *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(173, '0000', 'BlackBerry ice *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(174, '0000', 'Blueberry raspberry ice *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(175, '0000', 'Banana ice *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(176, '0000', 'Blueberry kiwi *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(177, '0000', 'Coco milk', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(178, '0000', 'Strawberry Watermelon *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(179, '0000', 'Blueberry cherry *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(180, '0000', 'Ice mint *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(181, '0000', 'Green Apple', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(182, '0000', 'Lush ice *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(183, '0000', 'Cherry bubblegum *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(184, '0000', 'Mango ice', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(185, '0000', 'White carajillo *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(186, '0000', 'Mint tobacco *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(187, '0000', 'Black mint *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(188, '0000', 'Strawberry banana *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(189, '0000', 'Santas mint', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(190, '0000', '1989 Peach mint *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(191, '0000', 'Black reputation *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(192, '0000', 'Cruel caramel summer *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(193, '0000', 'Blueberry love story *', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(194, '0000', 'All too well mint', 1, '1', 'VHILL 6000', 'Vhill 6000.PNG', 0),
(195, '0000', 'BlackBerry ice *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(196, '0000', 'Black mint *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(197, '0000', 'Mighty mint', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(198, '0000', 'Grape strawberry', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(199, '0000', 'Mixed berries ice *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(200, '0000', 'Watermelon bubblegum *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(201, '0000', 'Kiwi mint', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(202, '0000', 'Melon ice *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(203, '0000', 'Blueberry kiwi', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(204, '0000', 'Cherry ice *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(205, '0000', 'Peach ice', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(206, '0000', 'Lush ice', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(207, '0000', 'Strawberry Watermelon *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(208, '0000', 'Watermelon raspberry', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(209, '0000', 'Grape ice *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(210, '0000', 'Ice mint', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(211, '0000', 'Cool mint *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(212, '0000', 'Blueberry Watermelon *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(213, '0000', 'Blueberry ice *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(214, '0000', 'Pink lemonade', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(215, '0000', 'Grinch *', 1, '1', 'VHILL 12000', 'Vhill 12000.PNG', 0),
(216, '0000', 'Banana ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(217, '0000', 'Berry lemonade', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(218, '0000', 'Black ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(219, '0000', 'Blueberry ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(220, '0000', 'Blueberry Sour raspberry', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(221, '0000', 'Bubble gum', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(222, '0000', 'Coconut ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(223, '0000', 'Cool mint', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(224, '0000', 'Grape soda', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(225, '0000', 'Lemont mint', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(226, '0000', 'Lush ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(227, '0000', 'Mango lichi ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(228, '0000', 'Mango passion fruit', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(229, '0000', 'Mixed berries', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(230, '0000', 'Peach ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(231, '0000', 'Piña colada', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(232, '0000', 'Strawberry coconut', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(233, '0000', 'Strawberry lichy', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(234, '0000', 'Strawberry kiwi lichy', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(235, '0000', 'Strawberry watermelon', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(236, '0000', 'Miami mint', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(237, '0000', 'Mykonos', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(238, '0000', 'Ibiza', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(239, '0000', 'Polar ice', 1, '1', 'WONDER G4', 'Wonder G4.JPG', 0),
(240, '0000', 'Blueberry ice', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(241, '0000', 'Blueberry mint', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(242, '0000', 'California cherry', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(243, '0000', 'Coconut ice', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(244, '0000', 'Cool mint', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(245, '0000', 'Dark grapefruit', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(246, '0000', 'Fucking fab', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(247, '0000', 'Grape ice', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(248, '0000', 'Lemon mint', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(249, '0000', 'Mexico mango', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(250, '0000', 'Sour Apple ice', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(251, '0000', 'Watermelon ice', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(252, '0000', 'Watermelon mint', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(253, '0000', 'Watermelon pear dragón', 1, '1', 'WONDER G20', 'Wonder G20.PNG', 0),
(254, '0000', 'Blue dragón fruit peach', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(255, '0000', 'Blue razz ice', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(256, '0000', 'Blueberry Watermelon', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(257, '0000', 'California cherry', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(258, '0000', 'Coconut ice', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(259, '0000', 'Cool mint', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(260, '0000', 'Fucking fab', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(261, '0000', 'Juicy Peach ice', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(262, '0000', 'Lemon mint', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(263, '0000', 'Mexico mango', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(264, '0000', 'Pineapple lemon Watermelon', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(265, '0000', 'Sour Apple ice', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(266, '0000', 'Starwberry cherry lemon', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(267, '0000', 'Strawberry Watermelon', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(268, '0000', 'Watermelon ice', 1, '1', 'WONDER RACE', 'Wonder race.PNG', 0),
(269, '0000', 'Apple surge', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(270, '0000', 'Fresh mint', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(271, '0000', 'Mango Orange', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(272, '0000', 'Mango melón aloe', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(273, '0000', 'Pinenana melón', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(274, '0000', 'Orange kiwi', 1, '1', 'WAKA SMASH', 'Waka smash.JPG', 0),
(275, '0000', 'Banana acai', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(276, '0000', 'Aperol spritz', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(277, '0000', 'Acai berry', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(278, '0000', 'Caipiriña', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(279, '0000', 'Cherry soda ice', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(280, '0000', 'Copabanana Beach', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(281, '0000', 'Fresh mint', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(282, '0000', 'Guava raspberry ice', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(283, '0000', 'Icy coco water', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(284, '0000', 'Lemon cola ice', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(285, '0000', 'Mezcalina', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(286, '0000', 'Piña colada', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(287, '0000', 'Tequila icy twist', 1, '1', 'WAKA 16000', 'Waka 16000.PNG', 0),
(288, '0000', 'Strawberry burst *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(289, '0000', 'Strawberry banana', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(290, '0000', 'Strawberry mango *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(291, '0000', 'Malibú mix', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(292, '0000', 'Spring break *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(293, '0000', 'Manila sky', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(294, '0000', 'Vallarta rainbow', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(295, '0000', 'Juicy Grape', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(296, '0000', 'Icy agua de coco', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(297, '0000', 'Strawberry kiwi *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(298, '0000', 'Mango Peach', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(299, '0000', 'Mezcalina', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(300, '0000', 'Icy mango', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(301, '0000', 'Icy green Grape', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(302, '0000', 'Sour berry Candy', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(303, '0000', 'Banana coco', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(304, '0000', 'Peach Blue raspberry *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(305, '0000', 'Watermelon kiwi *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(306, '0000', 'Sour Apple', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(307, '0000', 'Watermelon bubblegum *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(308, '0000', 'Watermelon chill *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(309, '0000', 'Cool mint *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(310, '0000', 'Cherry berry *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(311, '0000', 'Fresh mint *', 1, '1', 'WAKA 18000', 'Waka 18000.JPG', 0),
(312, '0000', 'Mexico mango', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(313, '0000', 'Watermelon. Ice *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(314, '0000', 'Strawberry banana *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(315, '0000', 'White Grape *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(316, '0000', 'Sour Apple ice', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(317, '0000', 'Cherry bomb *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(318, '0000', 'Miami mint *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(319, '0000', 'Blue razz ice *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(320, '0000', 'Blueberry Watermelon *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(321, '0000', 'Peach mango Watermelon *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(322, '0000', 'Strawberry Watermelon *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0),
(323, '0000', 'Strawberry kiwi *', 1, '1', 'WAKA 36000', 'Waka 36000.JPG', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

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
