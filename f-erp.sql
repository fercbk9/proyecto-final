-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2018 a las 17:03:07
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

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
(6, '2018_05_02_145501_users', 1),
(8, '2018_05_14_143257_create_nominas_table', 2);

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
(2, 11, 1500.00, '2018-05-14', 4.00, 25.00, 0.04, 0.07, 2459.60, 1000, 40.00, '2018-05-14 13:29:21', '2018-05-14 13:29:21');

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
('025f5cde2764e91777af8859839572db2771a1d2e4bc06e50e490168d740ab2a7de9c247d47b151d', 11, 3, 'f-erp', '[]', 0, '2018-05-07 13:35:48', '2018-05-07 13:35:48', '2019-05-07 15:35:48'),
('0cce59f10683dd3bd0c4aa6693fa7201be29af28589a4a19e94105c96c6eed649e2a8b7830a5dafa', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:44:04', '2018-05-03 08:44:04', '2019-05-03 10:44:04'),
('14ba62c2bb3dd8a5d3e488d3259bb338e8792bfffcdfb39254d5716dee986f9a87b505e17898f7dd', 12, 3, 'f-erp', '[]', 0, '2018-05-07 07:42:48', '2018-05-07 07:42:48', '2019-05-07 09:42:48'),
('172941ca5d12b5d1e4f7f57298461e71007b5c0a849618114fe6a5ec11de7a626c643cafcad8b019', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:39:25', '2018-05-03 08:39:25', '2019-05-03 10:39:25'),
('2399b2f990195f3830a907537e78dd21524940f3810a4a026566c65df8bb821f1f9913fc8466afed', 11, 3, 'f-erp', '[]', 0, '2018-05-07 13:35:51', '2018-05-07 13:35:51', '2019-05-07 15:35:51'),
('28983e6985ae6a433f0f8becb800818141f39c6b55df3cd7f20227fc14db3e0566651b4a19d699f0', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:47:17', '2018-05-03 13:47:17', '2019-05-03 15:47:17'),
('29ce14a03a759840abbcc17cfa9813fedc42e5f95876419b2f3a990ed6ee11ec57094860763eb78f', 12, 3, 'f-erp', '[]', 0, '2018-05-03 13:22:01', '2018-05-03 13:22:01', '2019-05-03 15:22:01'),
('2af53c883f1cbcfa03cdd624c69614faa5ed9632af87751f84a83c61f7a1f0024834e0c884beffaf', 11, 3, 'f-erp', '[]', 0, '2018-05-03 09:35:21', '2018-05-03 09:35:21', '2019-05-03 11:35:21'),
('2ede6d331687cc5ddc3972361273aabc0d9adbe3bde3cadae130ece65b10e1bb527c271a015e1dfb', 11, 3, 'f-erp', '[]', 0, '2018-05-07 13:35:54', '2018-05-07 13:35:54', '2019-05-07 15:35:54'),
('32c273f56ca1130084e5a3862d7000630a095ff6ea9980cf0f699a5938252649da3bf62d0e8c635a', 11, 3, 'f-erp', '[]', 0, '2018-05-07 09:44:11', '2018-05-07 09:44:11', '2019-05-07 11:44:11'),
('34ff9b6e28936e633336645473c65afce87ee3d9e10ff17cd5daeb3af5872cbe4f8e6437b672f686', 12, 3, 'f-erp', '[]', 0, '2018-05-03 13:44:30', '2018-05-03 13:44:30', '2019-05-03 15:44:30'),
('39135a2f5a7c6ba8062d484f77e58cdd15f037266f4cf7b4be2f64a7a0021c0889616d5967e5035c', 11, 5, 'f-erp', '[]', 0, '2018-05-09 07:09:57', '2018-05-09 07:09:57', '2019-05-09 09:09:57'),
('3bc8c09b0019d1162a324474e9130e27898c3c1f83ee2f5fcfaafd9eb38fd3302167e2897af1c7fb', 1, 3, 'f-erp', '[]', 0, '2018-05-03 08:15:08', '2018-05-03 08:15:08', '2019-05-03 10:15:08'),
('3cff3c540db210b11628fa314656d5b2fefe7c9ce4d5e9970375ae0d30c0e01510e5c5235142a6f7', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:35:45', '2018-05-03 08:35:45', '2019-05-03 10:35:45'),
('3d9319bbb572c1b8a8f437a3d35032d35ef102422914e21d71b9d8ea54466e92630f12bd60034cac', 12, 3, 'f-erp', '[]', 0, '2018-05-07 04:37:48', '2018-05-07 04:37:48', '2019-05-07 06:37:48'),
('3e8b3d0f3dfaea2e881c29739193645b21310f3b4470149bdc088eb725e75f62404314f5732870a6', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:45:46', '2018-05-03 08:45:46', '2019-05-03 10:45:46'),
('3e940fc550916c1cfd17e3219537de0ab216a7b5e846e5b7a15b1ea7993a3568fab9fd9d3938a276', 12, 3, 'f-erp', '[]', 0, '2018-05-03 13:27:36', '2018-05-03 13:27:36', '2019-05-03 15:27:36'),
('408a6a1ca200b3ec6f3511e2316082e46a93f40d971690676531302e4a7d9f9fe69799d97d55425c', 12, 3, 'f-erp', '[]', 0, '2018-05-07 04:37:49', '2018-05-07 04:37:49', '2019-05-07 06:37:49'),
('40aaed89b025b4cf847245f1429b3a0e5027233fc549c444708e4aeb072b941419f41e068925a1fb', 11, 3, 'f-erp', '[]', 0, '2018-05-07 05:14:20', '2018-05-07 05:14:20', '2019-05-07 07:14:20'),
('4159d09e5214b9d622dc6b35f91428080000373dde05fd9f7d479e2368c38d4de1b56bc4ec1980ea', 11, 3, 'f-erp', '[]', 0, '2018-05-07 13:35:53', '2018-05-07 13:35:53', '2019-05-07 15:35:53'),
('46fbb0a936627c03b98f7cc9f39631784be132916527ab86b90313368e4da213d94c758b8357c712', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:41:00', '2018-05-03 13:41:00', '2019-05-03 15:41:00'),
('4f02a09ccb5bde39a5426b49774991c2d24d34807df2b8a510f071219c0c03d1ea216b9dde78ddaf', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:08:34', '2018-05-03 13:08:34', '2019-05-03 15:08:34'),
('57751d402fb599081fcdf704efb70dedd3cb42e7ef6bf325206de966c8daacaf01df828d727ca880', 12, 3, 'f-erp', '[]', 0, '2018-05-03 08:28:19', '2018-05-03 08:28:19', '2019-05-03 10:28:19'),
('579302190f4d132c0f5e9b4676c6d616830ec7a8b8cadbad4368f9c3cb49b55b9956c826fc61be31', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:42:20', '2018-05-03 08:42:20', '2019-05-03 10:42:20'),
('5b54f5f05d9dc5d9be9868d7e531f2354fc62fcf3891c36286cf74ec2161964142766e5865ae0f5f', 11, 3, 'f-erp', '[]', 0, '2018-05-03 09:29:11', '2018-05-03 09:29:11', '2019-05-03 11:29:11'),
('5beb53029699f359e0f4bd4ab781bb64c5d2239449c5a20344937a23d382a393d47bce43c6223e33', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:57:05', '2018-05-03 08:57:05', '2019-05-03 10:57:05'),
('5dcb0f151bd2b1c840fe324df755b57c5b8ed1e0dce80ece52992a007477baeefecfb0bced0bf871', 12, 3, 'f-erp', '[]', 0, '2018-05-07 04:37:46', '2018-05-07 04:37:46', '2019-05-07 06:37:46'),
('6112dae17a61510c044a09f279adfd03ac25f4c9844a1851b247ef2962025c6a36406ac7d194a825', 11, 3, 'f-erp', '[]', 0, '2018-05-07 09:34:21', '2018-05-07 09:34:21', '2019-05-07 11:34:21'),
('619a8c960b2e6d57d12351984c4ae5baf1260437190c71da897b06ff2b5d0ce297c48f9d00ee99b4', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:45:39', '2018-05-03 13:45:39', '2019-05-03 15:45:39'),
('681ffe44c028ccb6ed3e6b210a9310967ce3545757ef1bc9324d1f249402bb9491c9538335e239e6', 11, 3, 'f-erp', '[]', 0, '2018-05-07 05:15:34', '2018-05-07 05:15:34', '2019-05-07 07:15:34'),
('6fb24c6316e521dee23e762b25c140cb9127068f5864627ae932c4131c64d8e9cb3340a50d3a56bd', 12, 3, 'f-erp', '[]', 0, '2018-05-03 13:21:04', '2018-05-03 13:21:04', '2019-05-03 15:21:04'),
('7391794e7bad703396541a6610a827c3d43eee0610f2ee079e77c81a93c51c684a3da9a11dba0030', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:16:17', '2018-05-03 08:16:17', '2019-05-03 10:16:17'),
('73b05848b8c51a71b057821ea976060714dcd8c8b57a8c0c928361ca1ad5af3c97e138a417bb985a', 11, 5, 'f-erp', '[]', 0, '2018-05-09 07:11:37', '2018-05-09 07:11:37', '2019-05-09 09:11:37'),
('76e3e3e89f19bd71dfaafcae616a2ef9d601cff59580995ab12e9d9467a3deff8aded900130412be', 11, 3, 'f-erp', '[]', 0, '2018-05-07 05:17:01', '2018-05-07 05:17:01', '2019-05-07 07:17:01'),
('77b82882f8d3cbae691c9ce02c00c70fe00c7f9fe69101426b3e83b22e1b85d1f522ae973f478883', 11, 5, 'f-erp', '[]', 0, '2018-05-09 07:08:28', '2018-05-09 07:08:28', '2019-05-09 09:08:28'),
('7e6de2f4a01105ab5bf6463baf9e8712bc7cec883d890a0d93d57d9dc84e9bb6c3e05717c44422f2', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:58:45', '2018-05-03 13:58:45', '2019-05-03 15:58:45'),
('80a67de015d472cae590c5e55328f083904a78a608e8e24b99cb0f69ba07940181834a47bf7dbb1f', 11, 3, 'f-erp', '[]', 0, '2018-05-03 12:11:13', '2018-05-03 12:11:13', '2019-05-03 14:11:13'),
('84251426c4f1c2a38d3313535291a3fde0190c46a3ccacee765058778721ee725e5c056c7aa6a12b', 11, 3, 'f-erp', '[]', 0, '2018-05-03 12:30:17', '2018-05-03 12:30:17', '2019-05-03 14:30:17'),
('885d0842b40a88d767b1f853d6046d1d96fc781cd619b164208f23f184f6094b7f8dfe364becba41', 11, 3, 'f-erp', '[]', 0, '2018-05-03 12:11:39', '2018-05-03 12:11:39', '2019-05-03 14:11:39'),
('8ff0016fe8d8af0ad130a79e79cb86070721dc2c340f89735f4bd751da60333440dae57a5a6858b7', 11, 3, 'f-erp', '[]', 0, '2018-05-07 13:35:53', '2018-05-07 13:35:53', '2019-05-07 15:35:53'),
('9fef1b47c194b2a88f239d098a5aa1bfaf3cff53a21ab5abad03a938a4c49b6a0daec1b9b217a1a9', 11, 3, 'f-erp', '[]', 0, '2018-05-03 09:33:08', '2018-05-03 09:33:08', '2019-05-03 11:33:08'),
('a5126799e0b19bfe4d5a236f3c7a74a33df017b703d1afebc1552bf2858f82600f4a0841fedf3d63', 11, 3, 'f-erp', '[]', 0, '2018-05-03 12:39:20', '2018-05-03 12:39:20', '2019-05-03 14:39:20'),
('addbff8223f7dc13460c20436a466fc146316812fc4a25405f0b45f6f3394d1075ec93595bdaf441', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:45:10', '2018-05-03 08:45:10', '2019-05-03 10:45:10'),
('b1702455d2a91cf7fe41d0d435a36e5bc8a808af667e68d174d58687b929ef2e0b24c1100e65985d', 11, 5, 'f-erp', '[]', 0, '2018-05-09 07:07:51', '2018-05-09 07:07:51', '2019-05-09 09:07:51'),
('b7d1ba10a7709b30d1b26995e842e50055b2998f44cdfb4caa802635963bcd3129654676825b9597', 11, 3, 'f-erp', '[]', 0, '2018-05-03 09:29:14', '2018-05-03 09:29:14', '2019-05-03 11:29:14'),
('baddf5206a169e2b7f83b94c36d0b9f1d066f593da92ed2184c33c6aec3baff440a809d88b07be14', 11, 5, 'f-erp', '[]', 0, '2018-05-09 06:53:36', '2018-05-09 06:53:36', '2019-05-09 08:53:36'),
('c314f3a6ceb6490940aea9437aa0ac345ffb4b611b9cf670a2a8c7f104e0ce4a0cc4c9e904c96edf', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:47:21', '2018-05-03 08:47:21', '2019-05-03 10:47:21'),
('c68909dc2f1f8302b50625f8a79d9d57acf0deb6220381c9a53467982659102d5d2c63eead664f18', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:29:36', '2018-05-03 13:29:36', '2019-05-03 15:29:36'),
('d61cc359015a8c3d550f18168d1652d4ce36487822c1f6857cdc8f7e5320683cab5903e59730dd65', 11, 3, 'f-erp', '[]', 0, '2018-05-07 08:08:17', '2018-05-07 08:08:17', '2019-05-07 10:08:17'),
('df409cda3834ebcc07da8dc6f38d489c706be350760841aac622d416ebd4fd82f824b2e833d52bee', 11, 5, 'f-erp', '[]', 0, '2018-05-09 12:49:40', '2018-05-09 12:49:40', '2019-05-09 14:49:40'),
('e23121a3799b98551ac8ffbcb5e51c4f9fe90db633e0af68593cea4ff5f33c80284c07e8d854c640', 11, 3, 'f-erp', '[]', 0, '2018-05-07 13:35:52', '2018-05-07 13:35:52', '2019-05-07 15:35:52'),
('f0042ab47e39f002683fc41ffd381bfc25b5e32bcc3b22dad8b6034f1e1ea3313ba7e5cef9e5c06f', 11, 3, 'f-erp', '[]', 0, '2018-05-03 13:46:13', '2018-05-03 13:46:13', '2019-05-03 15:46:13'),
('f1ac0629cfcad72b5fe730a6834fdf0e8506100e8143f5cb0cd683aa40ffd4a7f28a803da283194d', 11, 5, 'f-erp', '[]', 0, '2018-05-09 06:53:18', '2018-05-09 06:53:18', '2019-05-09 08:53:18'),
('f523081275cd8cb127350d4ffd265e625d875aa4a9bd6eab6797584b84f03733857039a255ccf79f', 11, 3, 'f-erp', '[]', 0, '2018-05-03 08:42:07', '2018-05-03 08:42:07', '2019-05-03 10:42:07');

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
(1, NULL, 'Laravel Personal Access Client', '0YXJyGWq6lYki96c88i2nLQb70tELBiy8gtYr6gL', 'http://localhost', 1, 0, 0, '2018-05-03 08:12:40', '2018-05-03 08:12:40'),
(2, NULL, 'Laravel Password Grant Client', 'EhdTJTuc4BauyFVHPkczSrfs0Hg4TKgzjJNiLZBd', 'http://localhost', 0, 1, 0, '2018-05-03 08:12:41', '2018-05-03 08:12:41'),
(3, NULL, 'Laravel Personal Access Client', 'boDm3b4PYRvKPXHTieBBtcHxcNoRmJeo9RxWgeUq', 'http://localhost', 1, 0, 0, '2018-05-03 08:12:59', '2018-05-03 08:12:59'),
(4, NULL, 'Laravel Password Grant Client', 'GfL5O66il6rkEu9HqMB1vF2Muvz5K6Gr1kwDEOeG', 'http://localhost', 0, 1, 0, '2018-05-03 08:12:59', '2018-05-03 08:12:59'),
(5, NULL, 'Laravel Personal Access Client', '4rTmCQ12QzoOGMreOKrnUUmWiq9hYhOEFuagmWj4', 'http://localhost', 1, 0, 0, '2018-05-09 06:41:57', '2018-05-09 06:41:57'),
(6, NULL, 'Laravel Password Grant Client', '3KOrR7Nk2Wv5s3p0eE37soSlZSmvHzlZkdMvvAFq', 'http://localhost', 0, 1, 0, '2018-05-09 06:41:57', '2018-05-09 06:41:57');

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
(1, 1, '2018-05-03 08:12:41', '2018-05-03 08:12:41'),
(2, 3, '2018-05-03 08:12:59', '2018-05-03 08:12:59'),
(3, 5, '2018-05-09 06:41:57', '2018-05-09 06:41:57');

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
  `cargo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EMPLEADO',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `email`, `cargo`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Anabelle Johns', 'Raynor', '4166 Shanahan Route\nMedhursthaven, MA 32978-9325', '1-706-599-7201 x686', '1997-05-12', 'mortimer.doyle@example.com', 'EMPLEADO', '$2y$10$Blc0rdjnM6vAi7b.RicZtOhvQaJpW8yYi/GfrTDTCygYUSl1YY6Ha', 'VB9GZ2IQW1', '2018-05-03 07:34:52', '2018-05-03 07:34:52'),
(6, 'Anna Lemke', 'Heaney', '249 Dylan Summit Suite 724\nNew Velvabury, NE 56952-1035', '+1 (358) 738-2582', '1997-05-12', 'nicolas.casper@example.org', 'EMPLEADO', '$2y$10$EvDSJGCo39dfPVTSXhVHtuuQV6sH8B9vMHCb/fNUarABZFgTj.r7a', '3r5hd9He1l', '2018-05-03 07:34:52', '2018-05-03 07:34:52'),
(7, 'Ms. Hilma Tremblay IV', 'Monahan', '852 Halvorson Overpass Suite 949\nMcClurefort, IN 94060-6263', '+1 (243) 858-6248', '1997-05-12', 'vernice.sanford@example.net', 'EMPLEADO', '$2y$10$90FSVKwJ1z6c2S2GI/j9KOl2VU.f4yu69B2DjGM4oln77BUYB9Nnq', 'POhAZiRzt5', '2018-05-03 07:34:52', '2018-05-03 07:34:52'),
(8, 'Prof. Guillermo Hodkiewicz IV', 'Wolf', '294 Okuneva Locks\nHilpertton, GA 84779', '891-865-1563 x208', '1997-05-12', 'vesta90@example.com', 'EMPLEADO', '$2y$10$1LjHlj.5mqVbs/z/vWGR5upYlAgaHhuEEIcTXievcpWCJzsgt1H1S', 'IURPdUl0Ig', '2018-05-03 07:34:52', '2018-05-03 07:34:52'),
(9, 'Miller Hessel', 'Schuster', '4006 Torp Mountains\nPort Makenzie, CT 28722', '1-265-752-5897 x07993', '1997-05-12', 'areilly@example.org', 'EMPLEADO', '$2y$10$WpqIK38gVAZ32VVlklcwHOCOiGjoFxbz4W11h3KSy/y5DYSv1eywq', 'AmmBaiITcy', '2018-05-03 07:34:52', '2018-05-03 07:34:52'),
(11, 'fernando', 'martinez', 'calle zaragoza', '625481359', '1997-03-31', 'fer@fer.com', 'ADMIN', '$2y$10$k1j7mZOhdVS7qtfmKXSeK.D5LxMg3Q3Bupa6Onmrj9BRDRhAj3ih6', NULL, '2018-05-03 08:15:50', '2018-05-16 13:14:23'),
(13, 'jose', 'martinez', 'calle uno', '645646489', '1990-02-12', 'jose@jose.com', 'EMPLEADO', '$2y$10$ubAn4imZy/H3ovKQ.v2bwusjefK2KOMR2b7SqNZf74EJJDVwAE.5W', NULL, '2018-05-15 05:40:00', '2018-05-16 13:15:12');

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `nominas`
--
ALTER TABLE `nominas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
