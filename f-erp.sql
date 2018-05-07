-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2018 a las 00:53:10
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
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2018_05_02_145501_users', 1);

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

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('055af7abe14744e55b99fee2a7e81ff54a724dc90d0e9ee1c6c8a1677c87418e8a083226993b6953', 11, 1, 'f-erp', '[]', 0, '2018-05-07 16:16:57', '2018-05-07 16:16:57', '2019-05-07 18:16:57'),
('c57cb27f5c4c07d2d65f938e3a05258ff8d433ed8023ac493935047eee6e4a276bfc04f034072f86', 11, 1, 'f-erp', '[]', 0, '2018-05-07 16:20:13', '2018-05-07 16:20:13', '2019-05-07 18:20:13');

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
(1, NULL, 'Laravel Personal Access Client', '6U49h7UDdYDgEFQbH3UE5Ab69qDUKyWzTbULh2Zf', 'http://localhost', 1, 0, 0, '2018-05-07 16:13:19', '2018-05-07 16:13:19'),
(2, NULL, 'Laravel Password Grant Client', 'Su4pSVgQ8WGW5EBnCzc8WA9EHxdwJ8mlNEwkTl6K', 'http://localhost', 0, 1, 0, '2018-05-07 16:13:19', '2018-05-07 16:13:19');

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
(1, 1, '2018-05-07 16:13:19', '2018-05-07 16:13:19');

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
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Dr. Aletha Brekke', 'Olson', '230 Daniela Dam Apt. 602\nHazelburgh, OR 09863', '+1-941-875-5797', '1997-05-11', 'jocelyn.kessler@example.org', '$2y$10$ukLNMo9BzXJuq5VngdjbvugsMPzChq7u2J6slbi6Gs2kh0TRLnd9i', '1Jx2TBJfVZ', '2018-05-07 16:09:58', '2018-05-07 17:00:12'),
(6, 'Cheyenne Sawayn', 'Baumbach', '2139 Cremin Ports Suite 633\nBernadettefurt, RI 41490', '1-846-556-4579 x3115', '1997-05-11', 'gavin.gibson@example.org', '$2y$10$yvX/YWU4XJjS4zd7Q.8KKuPNPE870UJRHSrlyHY9rKNTbsD/qLaUm', '4V4pzxNWHp', '2018-05-07 16:09:58', '2018-05-07 16:59:08'),
(7, 'Dagmar Fritsch II', 'Kunze', '23907 Ratke Gardens Apt. 048\nEast Onie, TN 69556', '1-868-876-5971 x60658', '1997-05-12', 'mbosco@example.org', '$2y$10$xaVafKs5R18pxGGC3r1MqOffcrnvkoJnEkS7s0uoLC9qmMDWr8meK', 'pvyCnuNQnz', '2018-05-07 16:09:58', '2018-05-07 16:09:58'),
(8, 'Mrs. Nettie Williamson', 'Kunde', '8439 Klocko Parkway\nSouth Aiyana, NH 73739', '+1.489.549.2128', '1997-05-12', 'watson.senger@example.org', '$2y$10$QY06/RoDIqrXyF4AgTgEY.Yz5SEUPiI/erYbDuB0FmXRUCcELbLBq', 'DwwtMWAQi4', '2018-05-07 16:09:58', '2018-05-07 16:09:58'),
(9, 'Khalil Goyette', 'Okuneva', '420 Camilla Prairie Suite 386\nYazminton, AK 24752-4989', '1-373-374-1197 x16036', '1997-05-12', 'stefan.sipes@example.net', '$2y$10$0pgIsPQ5n/o8NCss7Ikv3eOnXyd0FL1aNplFY8FssrYLYk5K0vM3G', 'OeIzPFT5GH', '2018-05-07 16:09:58', '2018-05-07 16:09:58'),
(10, 'Prof. Kaylee Jacobi III', 'Steuber', '2579 Haag Drives\nEast Kurtisland, DC 04175-4212', '547.808.6178 x4311', '1997-05-12', 'doug45@example.org', '$2y$10$Nd/DfyMWjQkVqpJTFm43ie82RqDaB0bEneQSkr.TNKP97s.Ga90jC', 'qCCipYK629', '2018-05-07 16:09:58', '2018-05-07 16:09:58'),
(11, 'fernando', 'martinez', 'calle andorra', '626654689', '1999-02-21', 'fer@fer.com', '$2y$10$LkCtF1/weFKFLlFTN/HR2Os4k7JhZ6lqY0fNBBGjualvmFjl7kBO2', NULL, '2018-05-07 16:16:41', '2018-05-07 16:16:41'),
(13, 'jose', 'martinez', 'calle andorra', '654987321', '1997-02-12', 'jose@jose.com', '$2y$10$16YU3038259cZU2tcpCaF.XndTIVr.zJZepLxcJ2LCuW2EUkyrcA6', NULL, '2018-05-07 17:47:08', '2018-05-07 17:49:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
