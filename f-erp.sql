-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2018 a las 00:06:54
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
(42, '2018_05_23_185846_create_vacaciones_table', 1);

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
(1, 'Terrill Gleichner', 'Johnson', '440 Nicolas Extension Apt. 841\nSandrinetown, NY 07330-1559', '(979) 661-4242 x97491', 'earum', '1997-05-12', 'mbeer@example.net', '$2y$10$fzOms.jSV/Cs.milArM9yuBtxQ/OKfBNaJrSJ.LspUZuuFi5q7C/C', 30, '57ulzxsJXZ', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(2, 'Amy Klein', 'Hudson', '9266 Gibson Brook\nDanielaberg, NH 38456-5371', '613.234.3391 x877', 'est', '1997-05-12', 'shirley75@example.org', '$2y$10$Hte6QlBMPP74gQya/w00OOhj5jNYnroUW3ZbVqoiY4Y.yeEXjw0ku', 30, 'liq7YMQfZR', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(3, 'Raymundo Flatley', 'Swaniawski', '134 Klein Brooks Apt. 432\nCartwrightland, SC 80841', '1-805-592-9948 x93543', 'esse', '1997-05-12', 'cordelia.franecki@example.net', '$2y$10$4eVAqrQwtoGF9QnIkZAL8OhBitLrcXtPEjmsYf51Sg7DgA04Mcx0K', 30, 'lYNDhAiQL6', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(4, 'Abner McKenzie', 'Stamm', '283 Wuckert Wells\nSouth Stella, AZ 38586-3577', '762-975-0673', 'ut', '1997-05-12', 'gspinka@example.net', '$2y$10$/VgcMroUUOWqGKh9LJpoIOd5jVvSbfl1sig7pSYbmdg9HyCSPJYt.', 30, 'vzlsLLT11y', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(5, 'Mr. Humberto Labadie', 'Satterfield', '963 Haley Pass\nPort Vivaport, NC 64347-7007', '1-260-959-5946 x510', 'distinctio', '1997-05-12', 'ifarrell@example.net', '$2y$10$qysIpO5TtydiHHDErNUpmefeXqK0vSrBNJNGoccBPNYdfGnxAZqeS', 30, '6Jv5qqgi2W', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(6, 'Ephraim Lemke I', 'Heidenreich', '40616 Krystel Station Apt. 035\nThompsonchester, WY 43623-6866', '701.842.8249', 'recusandae', '1997-05-12', 'brown.ashly@example.net', '$2y$10$fPS19mQzumB2.HJ7ymdwDurvgwLqoH1BTbNRqWL1TV.5c6SJVKcye', 30, 'AN9U90k7yW', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(7, 'Mr. Gayle Fisher', 'Jast', '517 Nannie Route Apt. 969\nTrantowshire, MA 92526', '691-424-2792', 'voluptatem', '1997-05-12', 'schinner.jessyca@example.net', '$2y$10$cAxffX2D.m1lGjzbv.CjhOBEfHLVpBbmeKNwXBvotNEzn1sGMLSsi', 30, 'yUuPdCXVBC', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(8, 'Miss Mariela Hessel Jr.', 'Zieme', '22125 Kariane Isle Suite 667\nPort Zachariahburgh, UT 77895', '1-801-505-3261 x90081', 'libero', '1997-05-12', 'rschamberger@example.net', '$2y$10$e7ksGy6Pmil1vqRFXmhhVe57ryY2YMRgOZmSPMZnMijlNV7U.SAYu', 30, 'Xj8Sq3Jfys', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(9, 'Tierra Eichmann', 'Medhurst', '9253 Hilll Junctions\nNorth Doyleshire, DE 61249-3312', '(329) 413-8016 x7717', 'quos', '1997-05-12', 'baumbach.hilton@example.net', '$2y$10$fGIw9oi3fZPnkiu9J0wh6eVGsxQJe/a3MVJVyQMr4qVcFCS94Tjz6', 30, 'tsa59YB0MD', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(10, 'Alexane Kunde', 'Steuber', '1488 Satterfield Ways Apt. 252\nWest Emmaborough, SC 94959-3561', '+1-321-891-7495', 'eum', '1997-05-12', 'bill.parker@example.org', '$2y$10$SJ9h/wmqcSmY7ID8x3b4n.OvV1h4UWopC1VRkY957.fXh.9m3F8h6', 30, 'aCjuNvl6mM', '2018-05-23 17:32:33', '2018-05-23 17:32:33'),
(12, 'jose', 'martinez', 'calle andorra', '626654689', 'ADMIN', '1999-02-21', 'jose@jose.com', '$2y$10$mDFv3R3URpgK/vm87RppuOb3iE9eh/8UQJV.HmbkDzKVInoG4pLAS', 30, NULL, '2018-05-23 17:48:18', '2018-05-23 17:48:18'),
(13, 'fernando', 'martinez pellicer', 'calle zaragoza', '626654689', 'ADMIN', '1999-02-21', 'fer@fer.com', '$2y$10$GmaumMccZ9cYltC4kzSGuOi9DhS.xxIPI7ig.UbavcH3JWqn4efNa', 25, NULL, '2018-05-23 17:55:29', '2018-05-23 19:56:42');

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
(3, 13, '2018-06-11', '2018-06-16', '2018-05-23 19:56:42', '2018-05-23 19:56:42');

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `nominas`
--
ALTER TABLE `nominas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
