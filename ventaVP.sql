-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-02-2025 a las 05:00:05
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
(22, 6, 7, '7.00', '2024-12-18 05:46:49', '2024121806464963BE510D'),
(23, 245, 3, '2070.00', '2025-01-25 06:57:18', '202501250757183880D4CF'),
(24, 246, 1, '690.00', '2025-01-25 06:57:18', '202501250757183880D4CF'),
(25, 99, 1, '265.00', '2025-01-27 21:40:34', '20250127224034142750C7'),
(26, 129, 1, '285.00', '2025-01-27 21:40:34', '20250127224034142750C7'),
(27, 13, 1, '265.00', '2025-01-27 21:40:34', '20250127224034142750C7'),
(28, 3, 1, '265.00', '2025-01-29 15:45:30', '20250129164530AE58616B'),
(29, 5, 1, '265.00', '2025-01-29 15:48:45', '202501290948456AAD2DAA'),
(30, 14, 1, '265.00', '2025-01-29 16:17:39', '2025012910173929326B6A'),
(31, 3, 1, '265.00', '2025-01-29 16:48:14', '202501291048148568BAE5'),
(32, 1, 1, '265.00', '2025-01-29 16:52:37', '20250129105236EF3ED9A1'),
(33, 1, 1, '265.00', '2025-02-04 22:41:27', '20250204164127E8145D79'),
(34, 1, 1, '265.00', '2025-02-04 22:41:27', '20250204164127E8145D79'),
(35, 1, 1, '265.00', '2025-02-04 22:42:17', '2025020416421709724AC1'),
(36, 1, 1, '265.00', '2025-02-04 22:42:17', '2025020416421709724AC1'),
(37, 1, 1, '265.00', '2025-02-04 22:53:35', '20250204165335B82934D4'),
(38, 1, 1, '265.00', '2025-02-04 22:53:35', '20250204165335B82934D4'),
(39, 1, 1, '265.00', '2025-02-04 22:54:25', '20250204165425BB25758E'),
(40, 1, 1, '265.00', '2025-02-04 22:54:25', '20250204165425BB25758E'),
(41, 1, 1, '265.00', '2025-02-04 23:02:08', '202502041702080A0FDD3C'),
(42, 1, 1, '265.00', '2025-02-04 23:02:08', '202502041702080A0FDD3C'),
(43, 1, 1, '265.00', '2025-02-04 23:02:59', '202502041702593BF1034D'),
(44, 1, 1, '265.00', '2025-02-04 23:02:59', '202502041702593BF1034D'),
(45, 1, 3, '265.00', '2025-02-04 23:14:09', '2025020417140982556DAC'),
(46, 1, 3, '265.00', '2025-02-04 23:14:09', '2025020417140982556DAC'),
(47, 1, 7, '265.00', '2025-02-05 06:51:20', '2025020500512021BDAE1B'),
(48, 1, 7, '265.00', '2025-02-05 06:51:20', '2025020500512021BDAE1B'),
(49, 2, 11, '265.00', '2025-02-05 06:59:26', '20250205005926373C0C95'),
(50, 2, 11, '265.00', '2025-02-05 06:59:26', '20250205005926373C0C95'),
(51, 3, 9, '265.00', '2025-02-05 07:05:01', '2025020501050122C53607');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `prefijo` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`, `img`, `precio`, `prefijo`) VALUES
(1, 'IPLAY MAX', 'Iplay_Max-removebg-preview.png', '265', '0'),
(2, 'IPLAY BIG MAX', 'Iplay big Max.PNG', '375', '0'),
(3, 'IPLAY XBOX', 'Iplay xbox.WEBP', '355', '0'),
(4, 'IPLAY XBOX PRO', 'Iplay xbox pro.WEBP', '410', '0'),
(5, 'MASSKING ULTRA', 'Maskking_ultra-removebg-preview.png', '265', '0'),
(6, 'NASTY 8.5', 'Nasty 8_5.PNG', '410', '0'),
(7, 'VHILL 3000', 'Vhill_3000-removebg-preview.png', '285', '0'),
(8, 'VHILL 6000', 'Vhill_6000-removebg-preview.png', '385', '0'),
(9, 'VHILL 12000', 'Vhill_12000-removebg-preview.png', '585', '0'),
(10, 'WONDER G4', 'Wonder_G4-removebg-preview.png', '365', '0'),
(11, 'WONDER G20', 'Wonder G20.PNG', '690', '0'),
(12, 'WONDER RACE', 'Wonder race.PNG', '590', '0'),
(13, 'WAKA SMASH', 'Waka_smash-removebg-preview.png', '1', '0'),
(14, 'WAKA 16000', 'Waka 16000.PNG', '690', '0'),
(15, 'WAKA 18000', 'Waka_18000-removebg-preview.png', '725', '0'),
(16, 'WAKA 36000', 'Waka_36000-removebg-preview.png', '790', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `zac` int(11) NOT NULL,
  `leon` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `oferta` int(11) NOT NULL,
  `ruta` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `descripcion`, `zac`, `leon`, `precio`, `categoria`, `oferta`, `ruta`) VALUES
(1, 'Banana ice *', 0, -3, '265', 'IPLAY MAX', 0, NULL),
(2, 'Berry Watermelon', 0, 0, '265', 'IPLAY MAX', 0, NULL),
(3, 'Coconut ice', 3, 0, '265', 'IPLAY MAX', 0, NULL),
(4, 'Banana cherry', 13, 0, '265', 'IPLAY MAX', 0, NULL),
(5, 'Cranberry Grape *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(6, 'Blue razz lemon *', 1, 0, '265', 'IPLAY MAX', 1, NULL),
(7, 'Mango strawberry', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(8, 'Blueberry rainbow', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(9, 'Watermelon banana *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(10, 'Watermelon bubblegum *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(11, 'Cucumber lemonade *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(12, 'Peach berries ice', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(13, 'Sour raspberry *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(14, 'Lush ice *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(15, 'Pineapple Coconut *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(16, 'Strawberry ice *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(17, 'Cool mint', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(18, 'Grape strawberry *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(19, 'Black mint *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(20, 'Low mint *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(21, 'Peach ice *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(22, 'Blueberry cherry *', 1, 0, '265', 'IPLAY MAX', 1, NULL),
(23, 'Energy watter ice *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(24, 'Rainbow candy', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(25, 'Grape ice *', 1, 0, '265', 'IPLAY MAX', 1, NULL),
(26, 'Root beer *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(27, 'Black dragón fruit', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(28, 'Kiwi dragón berry', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(29, 'Passion fruit *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(30, 'Blueberry ice *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(31, 'Coco strawberry', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(32, 'Lemon cookies', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(33, 'Blueberry strawberry', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(34, 'Guava raspberry *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(35, 'Mango ice *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(36, 'Strawberry lychee *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(37, 'Grape soda *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(38, 'Iced coffe *', 1, 0, '265', 'IPLAY MAX', 0, NULL),
(39, 'Spearmint', 1, 0, '375', 'IPLAY BIG MAX', 0, NULL),
(40, 'Cool mint', 1, 0, '375', 'IPLAY BIG MAX', 0, NULL),
(41, 'Double mint *', 1, 0, '375', 'IPLAY BIG MAX', 0, NULL),
(42, 'Black mint', 1, 0, '375', 'IPLAY BIG MAX', 0, NULL),
(43, 'Acapulcococo', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(44, 'Cabo ice', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(45, 'Sayulita margarita', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(46, 'Tulum mint *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(47, 'Rivera mango', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(48, 'Careyes sunset *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(49, 'Cancún breeze', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(50, 'Banana Coconut', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(51, 'Berry lemon twist *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(52, 'Black berry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(53, 'Blueberry mint *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(54, 'Blueberry cherry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(55, 'Blueberry storm *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(56, 'Chaparrita de mandarina', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(57, 'Chaparrita de piña', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(58, 'Chaparrita de uva', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(59, 'Cherry cranberry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(60, 'Coco strawberry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(61, 'Cool mint *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(62, 'Dark mint *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(63, 'Double Apple', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(64, 'Grape strawberry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(65, 'Kiwi strawberry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(66, 'Mamba *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(67, 'Mango litchi', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(68, 'Mr Peach mint *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(69, 'Peach Grape *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(70, 'Perla negra *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(71, 'Pink lemonade *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(72, 'Sakura Grape', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(73, 'Strawberry litchi burst', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(74, 'Strawberry mango *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(75, 'Strawberry sundae *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(76, 'Strawberry Watermelon *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(77, 'Ultra mint', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(78, 'Vainilla cream *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(79, 'Watermelon bubblegum', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(80, 'Watermelon crush *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(81, 'Banana strawberry *', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(82, 'Candy cane', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(83, 'Mr grinch', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(84, 'New years eve', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(85, 'Santa\'s hot cocoa', 1, 0, '355', 'IPLAY XBOX', 0, NULL),
(86, 'Perla negra', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(87, 'Kiwi strawberry *', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(88, 'Coco strawberry', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(89, 'Pink lemonade *', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(90, 'Grape strawberry *', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(91, 'Strawberry Watermelon', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(92, 'Mango litchi *', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(93, 'Blueberry mint', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(94, 'Watermelon ice', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(95, 'Dark mint *', 1, 0, '410', 'IPLAY XBOX PRO', 0, NULL),
(96, 'MK ULTRA - BANANA', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(97, 'MK ULTRA - BERRY WATERMELON', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(98, 'MK ULTRA - BLACKCURRANT', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(99, 'MK ULTRA - COCONUT', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(100, 'MK ULTRA - ENERGY WATER ICE', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(101, 'MK ULTRA - GRAPE STRAWBERRY', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(102, 'MK ULTRA - GUAVA RASPBERRY', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(103, 'MK ULTRA - KIWI WATERMELON', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(104, 'MK ULTRA - MANGO PINEAPPLE', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(105, 'MK ULTRA - PEACH ICE', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(106, 'MK ULTRA - STRAWLEMON', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(107, 'MK ULTRA - TOBACCO', 1, 0, '265', 'MASSKING ULTRA', 0, NULL),
(108, 'ALOE GRAPE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(109, 'AQUA', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(110, 'BERRY GRAPE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(111, 'BLUEBERRY SOUR RASPBERRY', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(112, 'BLUE RAZZ ICE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(113, 'DOUBLE WATERMELON', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(114, 'DRY TOBACCO', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(115, 'FIZZY CHERRY', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(116, 'GRAPE ICE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(117, 'HONEY DEW', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(118, 'MANGO', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(119, 'PASSION FRUIT', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(120, 'PEACH ICE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(121, 'PINEAPPLE ICE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(122, 'POMEGRANATE BERRY', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(123, 'SOEARMINT', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(124, 'STRAWBERRY MANGO', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(125, 'WATERMELON ICE', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(126, 'WATERMELON RASPBERRY', 1, 0, '410', 'NASTY 8.5', 0, NULL),
(127, 'Cool mint *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(128, 'Black mint', 1, 0, '285', 'VHILL 3000', 0, NULL),
(129, 'Cherry mint *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(130, 'Blackbery ice *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(131, 'Ice mint *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(132, 'Peach mango', 1, 0, '285', 'VHILL 3000', 0, NULL),
(133, 'Grape ice', 1, 0, '285', 'VHILL 3000', 0, NULL),
(134, 'Strawberry Watermelon *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(135, 'Grape lemonade', 1, 0, '285', 'VHILL 3000', 0, NULL),
(136, 'Coconut milk', 1, 0, '285', 'VHILL 3000', 0, NULL),
(137, 'Blueberry raspberry ice *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(138, 'Peach Blueberry *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(139, 'Mighty mint', 1, 0, '285', 'VHILL 3000', 0, NULL),
(140, 'Mango ice *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(141, 'Grape strawberry *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(142, 'Cherry ice', 1, 0, '285', 'VHILL 3000', 0, NULL),
(143, 'White caramillo *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(144, 'Coconut Pineapple', 1, 0, '285', 'VHILL 3000', 0, NULL),
(145, 'Mint tobacco *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(146, 'Lush ice *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(147, 'Unicorn Shake', 1, 0, '285', 'VHILL 3000', 0, NULL),
(148, 'Blueberry kiwi', 1, 0, '285', 'VHILL 3000', 0, NULL),
(149, 'Energy drink', 1, 0, '285', 'VHILL 3000', 0, NULL),
(150, 'Kiwi passion fruit Guava *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(151, 'Coco ice *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(152, 'Green Apple *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(153, 'Lychee ice', 1, 0, '285', 'VHILL 3000', 0, NULL),
(154, 'Orange ice *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(155, 'Clear *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(156, 'Raspberry Candy bubblegum *', 1, 0, '285', 'VHILL 3000', 0, NULL),
(157, 'Bubblegum mint', 1, 0, '285', 'VHILL 3000', 0, NULL),
(158, 'Guava raspberry', 1, 0, '285', 'VHILL 3000', 0, NULL),
(159, 'Apple strawberry raspberry', 1, 0, '285', 'VHILL 3000', 0, NULL),
(160, 'Peach ice', 1, 0, '285', 'VHILL 3000', 0, NULL),
(161, 'Strawberry banana', 1, 0, '285', 'VHILL 3000', 0, NULL),
(162, 'Candy cane', 1, 0, '285', 'VHILL 3000', 0, NULL),
(163, 'Cranberry sunset *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(164, 'Hawaiian Watermelon *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(165, 'Sayulita melon', 1, 0, '385', 'VHILL 6000', 0, NULL),
(166, 'Mamitas mint *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(167, 'Coco mango beach', 1, 0, '385', 'VHILL 6000', 0, NULL),
(168, 'Grape ice *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(169, 'Pink lemonade *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(170, 'Peach mango *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(171, 'Mighty mint *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(172, 'Cherry ice *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(173, 'BlackBerry ice *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(174, 'Blueberry raspberry ice *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(175, 'Banana ice *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(176, 'Blueberry kiwi *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(177, 'Coco milk', 1, 0, '385', 'VHILL 6000', 0, NULL),
(178, 'Strawberry Watermelon *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(179, 'Blueberry cherry *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(180, 'Ice mint *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(181, 'Green Apple', 1, 0, '385', 'VHILL 6000', 0, NULL),
(182, 'Lush ice *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(183, 'Cherry bubblegum *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(184, 'Mango ice', 1, 0, '385', 'VHILL 6000', 0, NULL),
(185, 'White carajillo *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(186, 'Mint tobacco *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(187, 'Black mint *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(188, 'Strawberry banana *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(189, 'Santas mint', 1, 0, '385', 'VHILL 6000', 0, NULL),
(190, '1989 Peach mint *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(191, 'Black reputation *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(192, 'Cruel caramel summer *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(193, 'Blueberry love story *', 1, 0, '385', 'VHILL 6000', 0, NULL),
(194, 'All too well mint', 1, 0, '385', 'VHILL 6000', 0, NULL),
(195, 'BlackBerry ice *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(196, 'Black mint *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(197, 'Mighty mint', 1, 0, '585', 'VHILL 12000', 0, NULL),
(198, 'Grape strawberry', 1, 0, '585', 'VHILL 12000', 0, NULL),
(199, 'Mixed berries ice *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(200, 'Watermelon bubblegum *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(201, 'Kiwi mint', 1, 0, '585', 'VHILL 12000', 0, NULL),
(202, 'Melon ice *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(203, 'Blueberry kiwi', 1, 0, '585', 'VHILL 12000', 0, NULL),
(204, 'Cherry ice *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(205, 'Peach ice', 1, 0, '585', 'VHILL 12000', 0, NULL),
(206, 'Lush ice', 1, 0, '585', 'VHILL 12000', 0, NULL),
(207, 'Strawberry Watermelon *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(208, 'Watermelon raspberry', 1, 0, '585', 'VHILL 12000', 0, NULL),
(209, 'Grape ice *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(210, 'Ice mint', 1, 0, '585', 'VHILL 12000', 0, NULL),
(211, 'Cool mint *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(212, 'Blueberry Watermelon *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(213, 'Blueberry ice *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(214, 'Pink lemonade', 1, 0, '585', 'VHILL 12000', 0, NULL),
(215, 'Grinch *', 1, 0, '585', 'VHILL 12000', 0, NULL),
(216, 'Banana ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(217, 'Berry lemonade', 1, 0, '365', 'WONDER G4', 0, NULL),
(218, 'Black ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(219, 'Blueberry ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(220, 'Blueberry Sour raspberry', 1, 0, '365', 'WONDER G4', 0, NULL),
(221, 'Bubble gum', 1, 0, '365', 'WONDER G4', 0, NULL),
(222, 'Coconut ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(223, 'Cool mint', 1, 0, '365', 'WONDER G4', 0, NULL),
(224, 'Grape soda', 1, 0, '365', 'WONDER G4', 0, NULL),
(225, 'Lemont mint', 1, 0, '365', 'WONDER G4', 0, NULL),
(226, 'Lush ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(227, 'Mango lichi ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(228, 'Mango passion fruit', 1, 0, '365', 'WONDER G4', 0, NULL),
(229, 'Mixed berries', 1, 0, '365', 'WONDER G4', 0, NULL),
(230, 'Peach ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(231, 'Piña colada', 1, 0, '365', 'WONDER G4', 0, NULL),
(232, 'Strawberry coconut', 1, 0, '365', 'WONDER G4', 0, NULL),
(233, 'Strawberry lichy', 1, 0, '365', 'WONDER G4', 0, NULL),
(234, 'Strawberry kiwi lichy', 1, 0, '365', 'WONDER G4', 0, NULL),
(235, 'Strawberry watermelon', 1, 0, '365', 'WONDER G4', 0, NULL),
(236, 'Miami mint', 1, 0, '365', 'WONDER G4', 0, NULL),
(237, 'Mykonos', 1, 0, '365', 'WONDER G4', 0, NULL),
(238, 'Ibiza', 1, 0, '365', 'WONDER G4', 0, NULL),
(239, 'Polar ice', 1, 0, '365', 'WONDER G4', 0, NULL),
(240, 'Blueberry ice', 1, 0, '690', 'WONDER G20', 0, NULL),
(241, 'Blueberry mint', 1, 0, '690', 'WONDER G20', 0, NULL),
(242, 'California cherry', 1, 0, '690', 'WONDER G20', 0, NULL),
(243, 'Coconut ice', 1, 0, '690', 'WONDER G20', 0, NULL),
(244, 'Cool mint', 1, 0, '690', 'WONDER G20', 0, NULL),
(245, 'Dark grapefruit', 1, 0, '690', 'WONDER G20', 0, NULL),
(246, 'Fucking fab', 1, 0, '690', 'WONDER G20', 0, NULL),
(247, 'Grape ice', 1, 0, '690', 'WONDER G20', 0, NULL),
(248, 'Lemon mint', 1, 0, '690', 'WONDER G20', 0, NULL),
(249, 'Mexico mango', 1, 0, '690', 'WONDER G20', 0, NULL),
(250, 'Sour Apple ice', 1, 0, '690', 'WONDER G20', 0, NULL),
(251, 'Watermelon ice', 1, 0, '690', 'WONDER G20', 0, NULL),
(252, 'Watermelon mint', 1, 0, '690', 'WONDER G20', 0, NULL),
(253, 'Watermelon pear dragón', 1, 0, '690', 'WONDER G20', 0, NULL),
(254, 'Blue dragón fruit peach', 1, 0, '590', 'WONDER RACE', 0, NULL),
(255, 'Blue razz ice', 1, 0, '590', 'WONDER RACE', 0, NULL),
(256, 'Blueberry Watermelon', 1, 0, '590', 'WONDER RACE', 0, NULL),
(257, 'California cherry', 1, 0, '590', 'WONDER RACE', 0, NULL),
(258, 'Coconut ice', 1, 0, '590', 'WONDER RACE', 0, NULL),
(259, 'Cool mint', 1, 0, '590', 'WONDER RACE', 0, NULL),
(260, 'Fucking fab', 1, 0, '590', 'WONDER RACE', 0, NULL),
(261, 'Juicy Peach ice', 1, 0, '590', 'WONDER RACE', 0, NULL),
(262, 'Lemon mint', 1, 0, '590', 'WONDER RACE', 0, NULL),
(263, 'Mexico mango', 1, 0, '590', 'WONDER RACE', 0, NULL),
(264, 'Pineapple lemon Watermelon', 1, 0, '590', 'WONDER RACE', 0, NULL),
(265, 'Sour Apple ice', 1, 0, '590', 'WONDER RACE', 0, NULL),
(266, 'Starwberry cherry lemon', 1, 0, '590', 'WONDER RACE', 0, NULL),
(267, 'Strawberry Watermelon', 1, 0, '590', 'WONDER RACE', 0, NULL),
(268, 'Watermelon ice', 1, 0, '590', 'WONDER RACE', 0, NULL),
(269, 'Apple surge', 1, 0, '1', 'WAKA SMASH', 0, NULL),
(270, 'Fresh mint', 1, 0, '1', 'WAKA SMASH', 0, NULL),
(271, 'Mango Orange', 1, 0, '1', 'WAKA SMASH', 0, NULL),
(272, 'Mango melón aloe', 1, 0, '1', 'WAKA SMASH', 0, NULL),
(273, 'Pinenana melón', 1, 0, '1', 'WAKA SMASH', 0, NULL),
(274, 'Orange kiwi', 1, 0, '1', 'WAKA SMASH', 0, NULL),
(275, 'Banana acai', 1, 0, '690', 'WAKA 16000', 0, NULL),
(276, 'Aperol spritz', 1, 0, '690', 'WAKA 16000', 0, NULL),
(277, 'Acai berry', 1, 0, '690', 'WAKA 16000', 0, NULL),
(278, 'Caipiriña', 1, 0, '690', 'WAKA 16000', 0, NULL),
(279, 'Cherry soda ice', 1, 0, '690', 'WAKA 16000', 0, NULL),
(280, 'Copabanana Beach', 1, 0, '690', 'WAKA 16000', 0, NULL),
(281, 'Fresh mint', 1, 0, '690', 'WAKA 16000', 0, NULL),
(282, 'Guava raspberry ice', 1, 0, '690', 'WAKA 16000', 0, NULL),
(283, 'Icy coco water', 1, 0, '690', 'WAKA 16000', 0, NULL),
(284, 'Lemon cola ice', 1, 0, '690', 'WAKA 16000', 0, NULL),
(285, 'Mezcalina', 1, 0, '690', 'WAKA 16000', 0, NULL),
(286, 'Piña colada', 1, 0, '690', 'WAKA 16000', 0, NULL),
(287, 'Tequila icy twist', 1, 0, '690', 'WAKA 16000', 0, NULL),
(288, 'Strawberry burst *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(289, 'Strawberry banana', 1, 0, '725', 'WAKA 18000', 0, NULL),
(290, 'Strawberry mango *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(291, 'Malibú mix', 1, 0, '725', 'WAKA 18000', 0, NULL),
(292, 'Spring break *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(293, 'Manila sky', 1, 0, '725', 'WAKA 18000', 0, NULL),
(294, 'Vallarta rainbow', 1, 0, '725', 'WAKA 18000', 0, NULL),
(295, 'Juicy Grape', 1, 0, '725', 'WAKA 18000', 0, NULL),
(296, 'Icy agua de coco', 1, 0, '725', 'WAKA 18000', 0, NULL),
(297, 'Strawberry kiwi *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(298, 'Mango Peach', 1, 0, '725', 'WAKA 18000', 0, NULL),
(299, 'Mezcalina', 1, 0, '725', 'WAKA 18000', 0, NULL),
(300, 'Icy mango', 1, 0, '725', 'WAKA 18000', 0, NULL),
(301, 'Icy green Grape', 1, 0, '725', 'WAKA 18000', 0, NULL),
(302, 'Sour berry Candy', 1, 0, '725', 'WAKA 18000', 0, NULL),
(303, 'Banana coco', 1, 0, '725', 'WAKA 18000', 0, NULL),
(304, 'Peach Blue raspberry *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(305, 'Watermelon kiwi *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(306, 'Sour Apple', 1, 0, '725', 'WAKA 18000', 0, NULL),
(307, 'Watermelon bubblegum *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(308, 'Watermelon chill *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(309, 'Cool mint *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(310, 'Cherry berry *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(311, 'Fresh mint *', 1, 0, '725', 'WAKA 18000', 0, NULL),
(312, 'Mexico mango', 1, 0, '790', 'WAKA 36000', 0, NULL),
(313, 'Watermelon. Ice *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(314, 'Strawberry banana *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(315, 'White Grape *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(316, 'Sour Apple ice', 1, 0, '790', 'WAKA 36000', 0, NULL),
(317, 'Cherry bomb *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(318, 'Miami mint *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(319, 'Blue razz ice *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(320, 'Blueberry Watermelon *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(321, 'Peach mango Watermelon *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(322, 'Strawberry Watermelon *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(323, 'Strawberry kiwi *', 1, 0, '790', 'WAKA 36000', 0, NULL),
(325, 'otro', 1, 1, '1', 'IPLAY MAX', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE `usr` (
  `id` int(11) NOT NULL,
  `usr` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usr`
--

INSERT INTO `usr` (`id`, `usr`, `pwd`, `perfil`) VALUES
(1, 'admin', '123456789', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_completa`
--

CREATE TABLE `venta_completa` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_last` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificador` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `entregado` int(11) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `venta_completa`
--

INSERT INTO `venta_completa` (`id`, `nombre_completo`, `direccion`, `telefono`, `email`, `card_last`, `identificador`, `estado`, `entregado`, `fecha_registro`) VALUES
(2, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '202412180618148C85CAD2', 2, 0, '0000-00-00 00:00:00'),
(3, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '20241218062236DEB677EF', 1, 0, '0000-00-00 00:00:00'),
(4, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '202412180625366F46B839', 1, 0, '0000-00-00 00:00:00'),
(5, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '2024121806264925B24C71', 2, 0, '0000-00-00 00:00:00'),
(6, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '202412180631493C8B0E92', 1, 0, '0000-00-00 00:00:00'),
(7, 'z', 'x', '11222', 'dasdasd@dadfd.net', '11223456', '2024121806364087885759', 1, 0, '0000-00-00 00:00:00'),
(8, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '20241218064127685F1374', 1, 0, '0000-00-00 00:00:00'),
(9, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '20241218064248C858A85B', 2, 0, '0000-00-00 00:00:00'),
(10, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '20241218064353FD457428', 1, 0, '0000-00-00 00:00:00'),
(11, 'xxs', 'ssss', '223333', '2233ddsd@vdfd.com', '827839', '2024121806441559522A44', 1, 0, '0000-00-00 00:00:00'),
(12, 'Jesús Rodolfo Leaños Villegas', 'Calle camino del pinar 111', '4915000', 'jesusrlv@gmail.com', '98762343', '2024121806464963BE510D', 1, 1, '0000-00-00 00:00:00'),
(13, 'hh', 'hh', '888', 'hukk', '54387548', '2025012507500734C5DA6D', 1, 0, '0000-00-00 00:00:00'),
(14, 'ds', 'ds', '8667', 'sds', '6465464564', '202501250757183880D4CF', 1, 0, '0000-00-00 00:00:00'),
(15, 'dsds', 'sdsd', '23232323', 'sdsdsd@sdsds', '22222', '20250127224034142750C7', 1, 0, '0000-00-00 00:00:00'),
(16, 's', 's', 's', 's', 's', '20250129164530AE58616B', 2, NULL, '0000-00-00 00:00:00'),
(17, 'dsd', 'sds', 'sdsd', 'sdsd', 'sdsds', '202501290948456AAD2DAA', 2, NULL, '2025-01-29 09:48:45'),
(18, 'fd', 'df', 'fd', 'df', 'df', '20250129095014F749E6AD', 2, NULL, '2025-01-29 09:50:14'),
(19, 'ds', 'ds', 'ds', 'ds', 'ds', '20250129095317A5B155DE', 2, NULL, '2025-01-29 09:53:17'),
(20, 'ds', 'ds', 'ds', 'ds', 'ds', '20250129095521EA830634', 2, NULL, '2025-01-29 09:55:21'),
(21, 'ds', 'ds', 'ds', 'ds', 'ds', '2025012909572597A6E40A', 1, NULL, '2025-01-29 09:57:25'),
(22, 'd', 'd', 'd', 'd', 'd', '20250129095739360E724B', 1, NULL, '2025-01-29 09:57:39'),
(23, 'd', 'd', 'd', 'd', 'd', '20250129100305D7006CE0', 2, 1, '2025-01-29 10:03:05'),
(24, 'dsds', 'ds', 'sd', 'sd', 'sd', '20250129100324588DB374', 2, 1, '2025-01-29 10:03:24'),
(25, 'dsds', 'ds', 'sd', 'sd', 'sd', '20250129100408635C5895', 2, 1, '2025-01-29 10:04:08'),
(26, 'dsds', 'ds', 'sd', 'sd', 'sd', '20250129100420E98ADC2C', 2, 1, '2025-01-29 10:04:20'),
(27, 'e', 'e', 'e', 'e', '3', '2025012910173929326B6A', 1, NULL, '2025-01-29 10:17:39'),
(28, 'Diana Anahi Barrios', 'ee', '333', '333', '333', '202501291048148568BAE5', 1, 1, '2025-01-29 10:48:14'),
(29, 'x', 'x', '1', 'x', '1', '20250129105236EF3ED9A1', 2, 1, '2025-01-29 10:52:36'),
(30, 'jesus', 'rl', '999', NULL, NULL, '20250204164127E8145D79', 1, NULL, '2025-02-04 16:41:27'),
(31, 'redr', 'reer', '3333', NULL, NULL, '2025020416421709724AC1', 1, NULL, '2025-02-04 16:42:17'),
(32, 'd', 'd', '2', NULL, NULL, '20250204165335B82934D4', 1, NULL, '2025-02-04 16:53:35'),
(33, 'jesus', 'd', '9', NULL, NULL, '20250204165425BB25758E', 1, NULL, '2025-02-04 16:54:25'),
(34, 'jesus', 'd', '9', NULL, NULL, '202502041702080A0FDD3C', 1, NULL, '2025-02-04 17:02:08'),
(35, 'jesusrlv', 'd', '999999', NULL, NULL, '202502041702593BF1034D', 1, NULL, '2025-02-04 17:02:59'),
(36, 'reducir', 'd', '9', NULL, NULL, '2025020417140982556DAC', 1, 0, '2025-02-04 17:14:09'),
(37, 'jesusrlv', 'd', '9', NULL, NULL, '2025020500512021BDAE1B', 1, NULL, '2025-02-05 00:51:20'),
(38, 'jesus2', 'd2', '9', NULL, NULL, '20250205005926373C0C95', 1, 1, '2025-02-05 00:59:26'),
(39, 'jesusr3', 'd3', '9898', NULL, NULL, '2025020501050122C53607', 1, 1, '2025-02-05 01:05:01');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT de la tabla `usr`
--
ALTER TABLE `usr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta_completa`
--
ALTER TABLE `venta_completa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
