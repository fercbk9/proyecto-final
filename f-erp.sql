-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2018 a las 01:27:01
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `f-erp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso_unidad` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_stock` int(11) NOT NULL,
  `precio` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id`, `codigo`, `descripcion`, `peso_unidad`, `cantidad_stock`, `precio`, `created_at`, `updated_at`) VALUES
(3, '570564', 'AGUACATE HASS  GRANEL KG', '1,5', 2, 2.50, NULL, '2018-06-05 11:33:04'),
(4, '570711', 'CHAMPIÑON CORTADO P.K.', '0.5', 15, 1.35, '2018-05-30 22:00:00', '2018-05-30 22:00:00'),
(5, '570097', 'CILANTRO MANOJO P.U.', '0.2', 5, 0.35, NULL, '2018-06-01 18:33:48'),
(6, '500010', 'MAGDALENAS BOLSA', '1.25', 12, 1.00, '2018-06-01 06:35:05', '2018-06-01 06:35:05'),
(7, '12315', 'galletas', '1.4', 2, 1.30, '2018-06-06 19:52:36', '2018-06-06 19:52:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(35, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(36, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(37, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(38, '2016_06_01_000004_create_oauth_clients_table', 1),
(39, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(40, '2018_05_02_145501_users', 1),
(41, '2018_05_14_143257_create_nominas_table', 1),
(42, '2018_05_23_185846_create_vacaciones_table', 1),
(44, '2018_05_30_202953_create_inventarios_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

CREATE TABLE `nominas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `salario_base` double(8,2) NOT NULL,
  `fecha_nomina` date NOT NULL,
  `horas_extra` double(8,2) NOT NULL,
  `precio_hora_extra` double(8,2) NOT NULL,
  `seg_social` double(8,2) NOT NULL,
  `irpf` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `paga_extra` int(11) NOT NULL,
  `plus_convenio` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nominas`
--

INSERT INTO `nominas` (`id`, `id_empleado`, `salario_base`, `fecha_nomina`, `horas_extra`, `precio_hora_extra`, `seg_social`, `irpf`, `total`, `paga_extra`, `plus_convenio`, `created_at`, `updated_at`) VALUES
(1, 13, 1500.00, '2018-05-01', 4.00, 25.00, 0.04, 0.07, 2459.60, 1000, 40.00, '2018-05-24 08:53:46', '2018-05-24 08:53:46'),
(2, 12, 1200.00, '2018-05-30', 2.00, 10.00, 0.04, 0.07, 1121.40, 0, 40.00, '2018-05-30 17:06:36', '2018-05-30 17:06:36'),
(3, 12, 1220.00, '2018-06-01', 1.00, 10.00, 0.04, 0.07, 2130.30, 1000, 40.00, '2018-05-30 17:07:27', '2018-05-30 17:07:27'),
(4, 10, 1200.00, '2018-06-01', 2.00, 10.00, 0.04, 0.07, 2121.40, 1000, 40.00, '2018-05-30 17:56:53', '2018-05-30 17:56:53'),
(5, 4, 1200.00, '2018-11-01', 0.00, 0.00, 0.04, 0.07, 1103.60, 0, 40.00, '2018-05-30 18:03:35', '2018-05-30 18:03:35'),
(6, 8, 1200.00, '2018-06-01', 0.00, 0.00, 0.04, 0.07, 1103.60, 0, 40.00, '2018-06-01 06:12:07', '2018-06-01 06:12:07'),
(7, 3, 1000.00, '2018-12-01', 18.00, 10.00, 0.04, 0.07, 1085.80, 0, 40.00, '2018-06-04 17:47:33', '2018-06-04 17:47:33'),
(8, 12, 1201.00, '2018-09-01', 0.00, 0.00, 0.04, 0.07, 2104.49, 1000, 40.00, '2018-06-06 19:43:26', '2018-06-06 19:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '12iD70TdSo9vhL9YVYHySS4QuxfgzghGz7DyHIkn', 'http://localhost', 1, 0, 0, '2018-05-23 17:53:46', '2018-05-23 17:53:46'),
(2, NULL, 'Laravel Password Grant Client', 'd203cTBcziKr5GCSkota3GKnXLde5GiGJpSu1OKf', 'http://localhost', 0, 1, 0, '2018-05-23 17:53:46', '2018-05-23 17:53:46'),
(3, NULL, 'Laravel Personal Access Client', 'dglWNDJ6yfrpX96yE2xGkQX5OEJv5BJ5yH5MRBqg', 'http://localhost', 1, 0, 0, '2018-05-23 17:53:54', '2018-05-23 17:53:54'),
(4, NULL, 'Laravel Password Grant Client', 'gZOfVvCaagban4CONT5Qv4P2mJtsGg4o8iWhtOqG', 'http://localhost', 0, 1, 0, '2018-05-23 17:53:54', '2018-05-23 17:53:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-05-23 17:53:46', '2018-05-23 17:53:46'),
(2, 3, '2018-05-23 17:53:54', '2018-05-23 17:53:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dias_restantes` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellidos`, `direccion`, `telefono`, `cargo`, `fecha_nacimiento`, `email`, `password`, `dias_restantes`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Amy Klein', 'Hudson1', '9266 Gibson Brook\nDanielaberg, NH 38456-5371', '613.234.3391 x877', 'est', '1997-05-12', 'shirley75@example.org', '$2y$10$Hte6QlBMPP74gQya/w00OOhj5jNYnroUW3ZbVqoiY4Y.yeEXjw0ku', 30, 'liq7YMQfZR', '2018-05-23 17:32:33', '2018-05-30 16:27:08'),
(3, 'Raymundo Flatley', 'Swaniawski', '134 Klein Brooks Apt. 432\nCartwrightland, SC 80841', '1-805-592-9948 x93543', 'esse', '1997-05-12', 'cordelia.franecki@example.net', '$2y$10$4eVAqrQwtoGF9QnIkZAL8OhBitLrcXtPEjmsYf51Sg7DgA04Mcx0K', 30, 'lYNDhAiQL6', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(4, 'Abner McKenzie', 'Stamm', '283 Wuckert Wells\nSouth Stella, AZ 38586-3577', '762-975-0673', 'ut', '1997-05-12', 'gspinka@example.net', '$2y$10$/VgcMroUUOWqGKh9LJpoIOd5jVvSbfl1sig7pSYbmdg9HyCSPJYt.', 30, 'vzlsLLT11y', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(5, 'Mr. Humberto Labadie', 'Satterfield', '963 Haley Pass\nPort Vivaport, NC 64347-7007', '1-260-959-5946 x510', 'distinctio', '1997-05-12', 'ifarrell@example.net', '$2y$10$qysIpO5TtydiHHDErNUpmefeXqK0vSrBNJNGoccBPNYdfGnxAZqeS', 30, '6Jv5qqgi2W', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(6, 'Ephraim Lemke I', 'Heidenreich', '40616 Krystel Station Apt. 035\nThompsonchester, WY 43623-6866', '701.842.8249', 'recusandae', '1997-05-12', 'brown.ashly@example.net', '$2y$10$fPS19mQzumB2.HJ7ymdwDurvgwLqoH1BTbNRqWL1TV.5c6SJVKcye', 30, 'AN9U90k7yW', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(7, 'Mr. Gayle Fisher', 'Jast', '517 Nannie Route Apt. 969\nTrantowshire, MA 92526', '691-424-2792', 'voluptatem', '1997-05-12', 'schinner.jessyca@example.net', '$2y$10$cAxffX2D.m1lGjzbv.CjhOBEfHLVpBbmeKNwXBvotNEzn1sGMLSsi', 30, 'yUuPdCXVBC', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(8, 'Miss Mariela Hessel Jr.', 'Zieme', '22125 Kariane Isle Suite 667\nPort Zachariahburgh, UT 77895', '1-801-505-3261 x90081', 'libero', '1997-05-12', 'rschamberger@example.net', '$2y$10$e7ksGy6Pmil1vqRFXmhhVe57ryY2YMRgOZmSPMZnMijlNV7U.SAYu', 30, 'Xj8Sq3Jfys', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(9, 'Tierra Eichmann', 'Medhurst', '9253 Hilll Junctions\nNorth Doyleshire, DE 61249-3312', '(329) 413-8016 x7717', 'quos', '1997-05-12', 'baumbach.hilton@example.net', '$2y$10$fGIw9oi3fZPnkiu9J0wh6eVGsxQJe/a3MVJVyQMr4qVcFCS94Tjz6', 30, 'tsa59YB0MD', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(10, 'Alexane Kunde', 'Steuber', '1488 Satterfield Ways Apt. 252\nWest Emmaborough, SC 94959-3561', '+1-321-891-7495', 'eum', '1997-05-12', 'bill.parker@example.org', '$2y$10$SJ9h/wmqcSmY7ID8x3b4n.OvV1h4UWopC1VRkY957.fXh.9m3F8h6', 30, 'aCjuNvl6mM', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(12, 'jose', 'martinez', 'calle andorra', '626654689', 'EMPLEADO', '1999-02-21', 'jose@jose.com', '$2y$10$hJLivCiudqu/emEHmmR8ZeKP/nxlp2OPThw4TQzEw0knmjzCNevny', 2, NULL, '2018-05-23 17:48:18', '2018-06-06 19:31:04'),
(13, 'fernando', 'martinez pellicer', 'calle zaragoza', '626654689', 'ADMIN', '1999-02-21', 'fer@fer.com', '$2y$10$jOhyzjlj7mi26LYTNKw/a.Y0pjRN2VNMe0dxsMPs22YllKWkA5I6.', 16, NULL, '2018-05-23 17:55:29', '2018-06-01 06:11:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones`
--

CREATE TABLE `vacaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vacaciones`
--

INSERT INTO `vacaciones` (`id`, `id_empleado`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(1, 13, '2018-05-08', '2018-05-23', NULL, NULL),
(2, 13, '2018-04-03', '2018-05-14', NULL, NULL),
(3, 13, '2018-06-11', '2018-06-16', '2018-05-23 19:56:42', '2018-05-23 19:56:42'),
(4, 13, '2018-05-09', '2018-05-16', '2018-05-30 12:38:35', '2018-05-30 12:38:35'),
(5, 13, '2018-05-09', '2018-05-10', '2018-05-30 12:52:03', '2018-05-30 12:52:03'),
(6, 13, '2018-05-10', '2018-05-11', '2018-05-30 12:55:46', '2018-05-30 12:55:46'),
(17, 13, '2018-07-25', '2018-07-26', '2018-05-30 13:35:35', '2018-05-30 13:35:35'),
(18, 12, '2018-05-16', '2018-05-24', '2018-05-31 13:29:23', '2018-05-31 13:29:23'),
(19, 13, '2018-06-07', '2018-06-15', '2018-06-01 06:11:37', '2018-06-01 06:11:37'),
(20, 12, '2018-06-21', '2018-06-28', '2018-06-01 06:13:15', '2018-06-01 06:13:15'),
(21, 12, '2018-06-22', '2018-06-29', '2018-06-01 17:35:30', '2018-06-01 17:35:30'),
(22, 12, '2018-06-14', '2018-06-20', '2018-06-06 19:31:04', '2018-06-06 19:31:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventarios_codigo_unique` (`codigo`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `nominas`
--
ALTER TABLE `nominas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
