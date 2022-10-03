-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-10-2022 a las 16:26:54
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bolcargo_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_nro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_embarque_id` bigint(20) UNSIGNED NOT NULL,
  `venta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oficina_id` bigint(20) UNSIGNED NOT NULL,
  `cliente` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentos_cp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hbl_ai_cnee_fletado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flete_menor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuanto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `puerto_embarque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `puerto_destino_id` bigint(20) UNSIGNED NOT NULL,
  `destino_final_id` bigint(20) UNSIGNED NOT NULL,
  `etd` date NOT NULL,
  `eta` date NOT NULL,
  `nro_total1` int(11) NOT NULL,
  `units_id1` bigint(20) UNSIGNED NOT NULL,
  `nro_total2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `units_id2` bigint(20) UNSIGNED NOT NULL,
  `socio_proveedor_id` bigint(20) UNSIGNED NOT NULL,
  `embarcado_id` bigint(20) UNSIGNED NOT NULL,
  `flete_master` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flete_house` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_ingresos` decimal(24,2) NOT NULL,
  `total_egresos` decimal(24,2) NOT NULL,
  `profit` decimal(24,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `file_nro`, `tipo_embarque_id`, `venta`, `oficina_id`, `cliente`, `cnee`, `contacto`, `dir`, `ciudad`, `fono`, `fax`, `nro_nit`, `master`, `house`, `documentos_cp`, `hbl_ai_cnee_fletado`, `flete_menor`, `cuanto`, `puerto_embarque`, `puerto_destino_id`, `destino_final_id`, `etd`, `eta`, `nro_total1`, `units_id1`, `nro_total2`, `units_id2`, `socio_proveedor_id`, `embarcado_id`, `flete_master`, `flete_house`, `notas`, `total_ingresos`, `total_egresos`, `profit`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, '0921201MEA', 1, 'MARIVEL AGUILAR', 1, 'GUILLERMINA BERNAL QUISPE', 'GUILLERMINA BERNAL QUISPE', 'GUILLERMINA BERNAL QUISPE', 'AV. LIBERTADORES NRO. 13 URBANIZACIÓN CIUDAD DEL ESTE UV 276 MZA 16', 'SANTA CRUZ, BOLIVIA', '22222', '11111', '11111', '(H) EURFL18610404ARI', '(N) BOLMA-404ARI', 'SI', 'SI', 'NO', 'SI', 'SHANGAI, CN', 1, 3, '2018-06-29', '2018-08-16', 1, 3, '0', 3, 1, 22, 'PREPAID', 'COLLECT', 'IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT T', '450.00', '415.00', '35.00', '2022-09-26', '2022-09-26 20:41:30', '2022-09-26 21:27:40'),
(2, '11111111', 1, 'MARCO PEREZ', 2, 'JUAN PEREZ', 'JUAN PEREZ', 'JUAN PEREZ', 'LOS OLIVOS CALLE 3 #3333', 'LA PAZ', '2222222', '3333333333', '1111111111', '(H) EURFL121312312ARI', '(N) BOLMA-342322ARI', 'SI', 'NO', 'NO', 'SI', 'SHANGHAI, CN', 1, 1, '2020-01-01', '2020-03-03', 1, 7, '1', 3, 2, 2, 'PREPAID', 'COLLECT', 'NOTAS DEL EMBARQUE', '70.00', '25.00', '45.00', '2022-09-28', '2022-09-28 21:35:20', '2022-09-30 23:23:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_egresos`
--

CREATE TABLE `cliente_egresos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente_egresos`
--

INSERT INTO `cliente_egresos` (`id`, `cliente_id`, `descripcion`, `monto`, `created_at`, `updated_at`) VALUES
(4, 1, 'FLETE MARITIMO', '415.00', '2022-09-26 21:08:40', '2022-09-26 21:08:40'),
(5, 2, 'EGRESO 1', '20.00', '2022-09-28 21:35:20', '2022-09-30 23:22:22'),
(8, 2, 'EGRES 2 MODIFICADO', '5.00', '2022-09-30 23:22:52', '2022-09-30 23:23:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_ingresos`
--

CREATE TABLE `cliente_ingresos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente_ingresos`
--

INSERT INTO `cliente_ingresos` (`id`, `cliente_id`, `descripcion`, `monto`, `created_at`, `updated_at`) VALUES
(2, 1, 'FLETE MARITIMO', '450.00', '2022-09-26 21:08:40', '2022-09-26 21:08:40'),
(3, 2, 'INGRESO 1', '40.00', '2022-09-28 21:35:20', '2022-09-28 21:35:20'),
(4, 2, 'INGRESO 2 MODIFICADO', '20.00', '2022-09-28 21:35:20', '2022-09-30 23:22:22'),
(6, 2, 'INGRESO 3', '10.00', '2022-09-30 23:22:52', '2022-09-30 23:22:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad_economica` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_manager` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_cheque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `nit`, `ciudad`, `dir`, `fono`, `web`, `actividad_economica`, `correo`, `operation_manager`, `nombre_cheque`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'BOLCARGO', 'BC', 'CHINA BOLCARGO S.R.L.', '111111111', 'EL ALTO - BOLIVIA', 'C. 131 N° 2517 Z. VILLA BOLIVAR D, ESQ. CALLE 130, PARALELO A LA AV. PANAMERICANO Y AV. 102', '22222', 'WEB', 'ACTIVIDAD ECONOMICA', 'CORREO@CORREO.COM', 'IVAN CASTAÑETA', 'MARIVEL REYNA AGUILAR CARRILLO', 'logo.png', NULL, '2022-09-26 14:52:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino_finals`
--

CREATE TABLE `destino_finals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `destino_finals`
--

INSERT INTO `destino_finals` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'LA PAZ', NULL, NULL),
(2, 'COCHABAMBA', NULL, NULL),
(3, 'SANTA CRUZ, BOLIVIA', NULL, NULL),
(4, 'ORURO', NULL, NULL),
(5, 'POTOSÍ', NULL, NULL),
(6, 'SUCRE', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Factura', NULL, NULL),
(2, 'Nota de Crédito', NULL, NULL),
(3, 'Nota de Debito', NULL, NULL),
(4, 'Credit Note', NULL, NULL),
(5, 'Debit Note', NULL, NULL),
(6, 'Confirmación de Pago', NULL, NULL),
(7, 'Cheque', NULL, NULL),
(8, 'Invoice', NULL, NULL),
(9, 'Solicitud de Pago', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarcados`
--

CREATE TABLE `embarcados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `embarcados`
--

INSERT INTO `embarcados` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'MSC', NULL, NULL),
(2, 'MAERSK', NULL, NULL),
(3, 'SHIPCO', NULL, NULL),
(4, 'CSAV', NULL, NULL),
(5, 'HAPAGLLOYD', NULL, NULL),
(6, 'K-LINE', NULL, NULL),
(7, 'SEABOARD MARINE', NULL, NULL),
(8, 'SACO SHIPPING', NULL, NULL),
(9, 'ECONOCARIBE', NULL, NULL),
(10, 'CLAN MARUBA', NULL, NULL),
(11, 'SMI', NULL, NULL),
(12, 'P&O NEDLLOYD', NULL, NULL),
(13, 'ANDEAN', NULL, NULL),
(14, 'P.A.L.', NULL, NULL),
(15, 'L.A.B.', NULL, NULL),
(16, 'UPS', NULL, NULL),
(17, 'AREOSUR', NULL, NULL),
(18, 'IBERIA', NULL, NULL),
(19, 'TAM', NULL, NULL),
(20, 'TAB', NULL, NULL),
(21, 'EVERGREEN', NULL, NULL),
(22, 'CCNI', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flete_maritimos`
--

CREATE TABLE `flete_maritimos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manifiestos`
--

CREATE TABLE `manifiestos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `shipper_id` bigint(20) UNSIGNED NOT NULL,
  `consignee` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocean_vessel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voyage_nro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port_discharge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_issue` date NOT NULL,
  `place_issue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marcas_numeros` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso` double(24,2) NOT NULL,
  `shipper_texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `consignee2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocean_vessel2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voyage_nro2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_issue2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mbl_hbl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `marcas_numeros2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso2` double(24,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `manifiestos`
--

INSERT INTO `manifiestos` (`id`, `cliente_id`, `shipper_id`, `consignee`, `ocean_vessel`, `voyage_nro`, `port_discharge`, `date_issue`, `place_issue`, `marcas_numeros`, `descripcion`, `peso`, `shipper_texto`, `consignee2`, `ocean_vessel2`, `voyage_nro2`, `place_issue2`, `mbl_hbl`, `marcas_numeros2`, `descripcion2`, `peso2`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'CHINA BOLCARGO SRL\r\nC. 131 N° 251 Z. VILLA BOLIVAR D, ESQ. CALLE 130, PARALELA A LA AV. PANAMERICANA Y AV. 102\r\nEL ALTO - BOLIVIA\r\nTEL. (591) 70553700', 'POLYNESIA', '0G110', 'ARICA', '2018-06-29', 'SHANGAI', 'WOD\r\nLCL/LCL\r\nGES6539951\r\n40\' HIGH CUBE\r\nK523', 'SAND TO CONATIN\r\nSTC.\r\nHOT STAMPING MACHINE\r\nMAGNETIC SWITH 220V\r\nPOSTIONNING PLATE\r\nTENSL\r\nADJUNSTING SCREEWW\r\nPRINTHER HEAD ON/OFF HINDLE\r\nMAINS WITCH\r\nSCREW\r\nACTIVE BAFLE\r\nPOOT SEALER\r\nTELON AND RESISTANCE', 90.00, 'JAIZOO CHEN GXU PACHING TECNOLOGY CO,,LTD\r\nADDRESS. NRO. 309 CAZHENG MANSION ZHULIN ROAD, XIUWU COUNTY', 'GUILLERMINA BERNAL, QUISPE\r\nNIT: 50403333\r\nSANTA CRUZ, BOLIVIA\r\nSANTA CRUZ, BOLIVIA', 'POLYNESIA', '04G10R1MA', 'SHANGAI', '(H) EURFL 1910000\r\n(N) BOLMA-404ARI', 'WOD\r\nLCL/LCL\r\nGEUSSSS\r\n40\' HIGH CUBNE\r\nK5322', 'SAN TO CONATIN\r\nSTC:\r\nHOT STAMPING MACHINE\r\nMAGNETIC SWITCH 220V\r\nPOSTIONG PLKATE\r\nTENSIL AGUSTING SCREW\r\nGREEN RUBER\r\nACTIVE BAFLE\r\nFOOT BEALER', 90.00, '2022-09-29', '2022-09-29 16:57:17', '2022-09-29 18:40:54'),
(2, 2, 1, 'CHINA BOLCARGO SRL\r\nC. 131 N° 251 Z. VILLA BOLIVAR D, ESQ. CALLE 130, PARALELA A LA AV. PANAMERICANA Y AV. 102\r\nEL ALTO - BOLIVIA\r\nTEL. (591) 70553700\r\nOTRA INFORMACIÓN COSIGNEE', 'POLYNESIA', '0G110', 'ARICA', '2018-06-29', 'SHANGAI', 'WOD\r\nLCL/LCL\r\nGES6539951\r\n40\' HIGH CUBE\r\nK523', 'SAND TO CONATIN\r\nSTC.\r\nHOT STAMPING MACHINE\r\nMAGNETIC SWITH 220V\r\nPOSTIONNING PLATE\r\nTENSL\r\nADJUNSTING SCREEWW\r\nPRINTHER HEAD ON/OFF HINDLE\r\nMAINS WITCH\r\nSCREW\r\nACTIVE BAFLE\r\nPOOT SEALER\r\nOTRA DESCRIPCION\r\nTELON AND RESISTANCE\r\nMAS DESCRIPCION DE CARGA', 90.00, 'JAIZOO CHEN GXU PACHING TECNOLOGY CO,,LTD\r\nADDRESS. NRO. 309 CAZHENG MANSION ZHULIN ROAD, XIUWU COUNTY\r\nSHIPER INFORMACIÓN', 'GUILLERMINA BERNAL, QUISPE\r\nNIT: 50403333\r\nSANTA CRUZ, BOLIVIA\r\nSANTA CRUZ, BOLIVIA\r\nOTRO CONSIGNEE', 'POLYNESIA', '04G10R1MA', 'SHANGAI', '(H) EURFL 1910000\r\n(N) BOLMA-404ARI\r\n(O) OTRO', 'WOD\r\nLCL/LCL\r\nGEUSSSS\r\n40\' HIGH CUBNE\r\nK5322\r\nMARCA FINAL', 'SAN TO CONATIN\r\nSTC:\r\nHOT STAMPING MACHINE\r\nMAGNETIC SWITCH 220V\r\nPOSTIONG PLKATE\r\nTENSIL AGUSTING SCREW\r\nGREEN RUBER\r\nACTIVE BAFLE\r\nFOOT BEALER\r\nMAS DESCRIPCION', 90.00, '2022-09-29', '2022-09-29 17:40:57', '2022-09-29 17:59:46');

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
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_09_19_201744_create_configuracions_table', 1),
(26, '2022_09_19_201800_create_tipo_embarques_table', 1),
(27, '2022_09_19_201801_create_oficinas_table', 1),
(28, '2022_09_19_201802_create_puerto_destinos_table', 1),
(29, '2022_09_19_201803_create_destino_finals_table', 1),
(30, '2022_09_19_201804_create_units_table', 1),
(31, '2022_09_19_201805_create_socio_proveedors_table', 1),
(32, '2022_09_19_201806_create_embarcados_table', 1),
(33, '2022_09_19_201820_create_clientes_table', 1),
(34, '2022_09_19_201839_create_shippers_table', 1),
(35, '2022_09_19_201840_create_manifiestos_table', 1),
(37, '2022_09_19_201948_create_nota_cobranzas_table', 1),
(38, '2022_09_19_202009_create_flete_maritimos_table', 1),
(39, '2022_09_19_202017_create_documentos_table', 1),
(40, '2022_09_19_202018_create_tconts_table', 1),
(41, '2022_09_19_203634_create_tcont_ingresos_table', 1),
(42, '2022_09_19_203642_create_tcont_egresos_table', 1),
(43, '2022_09_19_204520_create_cliente_egresos_table', 1),
(44, '2022_09_19_204538_create_cliente_ingresos_table', 1),
(45, '2014_10_12_000000_create_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_cobranzas`
--

CREATE TABLE `nota_cobranzas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nota_cobranzas`
--

INSERT INTO `nota_cobranzas` (`id`, `cliente_id`, `date`, `ref`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-06-08', 'BOLOR', '2022-09-30 18:45:46', '2022-10-03 16:10:12'),
(2, 2, '2022-07-06', 'BOLOR', '2022-09-30 18:48:09', '2022-09-30 18:48:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'SANTA CRUZ, BOLIVIA', NULL, NULL),
(2, 'LA PAZ', NULL, NULL),
(3, 'EL ALTO, BOLIVIA', NULL, NULL),
(4, 'ORURO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerto_destinos`
--

CREATE TABLE `puerto_destinos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `puerto_destinos`
--

INSERT INTO `puerto_destinos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'ARICA, CL', NULL, NULL),
(2, 'IQUIQUE, CL', NULL, NULL),
(3, 'MATARANI', NULL, NULL),
(4, 'AEROPUERTO LA PAZ', NULL, NULL),
(5, 'AEROPUERTO CBB', NULL, NULL),
(6, 'AEROPUERTO SCZ', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shippers`
--

CREATE TABLE `shippers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `shippers`
--

INSERT INTO `shippers` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '¡HYDE (GUANGZHOU) INTERNATIONAL LOGISTICS GROUP CO.LTD\r\nROOM 907-909, YUEDIAN BUILDING 4,5 ESAT OF TIANHE.\r\nGUANGZHOU, CHINA, TAXI.D.: 440100675656518', NULL, NULL),
(2, 'HYDE (GUANGZHOU) INTERNATIONAL LOGISTICS GROUP. CO.LTD\r\nROOM 999-777, YUEDIAN BUILDING 4,5 ESAT OF TIANHE.\r\nGUANGZHOU, CHINA, TAXI.D.: 44444444444444', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio_proveedors`
--

CREATE TABLE `socio_proveedors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socio_proveedors`
--

INSERT INTO `socio_proveedors` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'HYDE (GUANGZHOU)', NULL, NULL),
(2, 'GUANGZHOU SINOWAY INT\'L', NULL, NULL),
(3, 'LATIN INTERNET TECHNOLOGY', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconts`
--

CREATE TABLE `tconts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `container_nro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `container_nro2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `container_nro3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `container_nro4` varchar(2555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ingresos` decimal(24,2) NOT NULL,
  `total_egresos` decimal(24,2) NOT NULL,
  `profit` decimal(24,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tconts`
--

INSERT INTO `tconts` (`id`, `cliente_id`, `container_nro`, `container_nro2`, `container_nro3`, `container_nro4`, `total_ingresos`, `total_egresos`, `profit`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 'WOD', '', '', 'NULL', '450.00', '58.50', '391.50', '2022-09-30', '2022-09-30 21:39:48', '2022-09-30 23:49:41'),
(2, 2, 'WOD', '', 'ASD 33333-2', 'CTNR 00000-5', '145.00', '40.00', '105.00', '2022-09-30', '2022-09-30 21:41:21', '2022-10-01 00:16:47'),
(3, 1, 'WDD', '', '', '', '227.00', '70.00', '157.00', '2022-10-03', '2022-10-03 15:52:24', '2022-10-03 15:52:24'),
(4, 2, 'RERTT', '', '', '', '110.00', '55.00', '55.00', '2022-10-03', '2022-10-03 16:08:59', '2022-10-03 16:08:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcont_egresos`
--

CREATE TABLE `tcont_egresos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tcont_id` bigint(20) UNSIGNED NOT NULL,
  `documento_id` bigint(20) UNSIGNED NOT NULL,
  `nro` bigint(20) NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tcont_egresos`
--

INSERT INTO `tcont_egresos` (`id`, `tcont_id`, `documento_id`, `nro`, `monto`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 124, '58.50', '2022-09-30 21:39:48', '2022-09-30 23:49:41'),
(2, 2, 1, 23, '40.00', '2022-09-30 21:41:21', '2022-09-30 23:16:05'),
(3, 3, 2, 222, '70.00', '2022-10-03 15:52:24', '2022-10-03 15:52:24'),
(4, 4, 1, 122, '30.00', '2022-10-03 16:08:59', '2022-10-03 16:08:59'),
(5, 4, 2, 133, '25.00', '2022-10-03 16:08:59', '2022-10-03 16:08:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcont_ingresos`
--

CREATE TABLE `tcont_ingresos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tcont_id` bigint(20) UNSIGNED NOT NULL,
  `documento_id` bigint(20) UNSIGNED NOT NULL,
  `nro` bigint(20) NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tcont_ingresos`
--

INSERT INTO `tcont_ingresos` (`id`, `tcont_id`, `documento_id`, `nro`, `monto`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 323, '450.00', '2022-09-30 21:39:48', '2022-09-30 23:49:41'),
(2, 2, 1, 111, '100.00', '2022-09-30 21:41:22', '2022-09-30 23:21:50'),
(9, 2, 7, 333, '45.00', '2022-10-01 00:16:47', '2022-10-01 00:16:47'),
(10, 3, 7, 555, '160.00', '2022-10-03 15:52:24', '2022-10-03 15:52:24'),
(11, 3, 7, 55, '45.00', '2022-10-03 15:52:24', '2022-10-03 15:52:24'),
(12, 3, 1, 434, '22.00', '2022-10-03 15:52:24', '2022-10-03 15:52:24'),
(13, 4, 1, 33, '100.00', '2022-10-03 16:08:59', '2022-10-03 16:08:59'),
(14, 4, 1, 44, '10.00', '2022-10-03 16:08:59', '2022-10-03 16:08:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_embarques`
--

CREATE TABLE `tipo_embarques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_embarques`
--

INSERT INTO `tipo_embarques` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'LCL', NULL, NULL),
(2, 'MARÍTIMO', NULL, NULL),
(3, 'TERRESTRE', NULL, NULL),
(4, 'AÉREO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `units`
--

INSERT INTO `units` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '20\'', NULL, NULL),
(2, '40\'', NULL, NULL),
(3, '40\'HC', NULL, NULL),
(4, '40\'RF', NULL, NULL),
(5, '40\'OT', NULL, NULL),
(6, 'KGS', NULL, NULL),
(7, 'MTS 3', NULL, NULL),
(8, 'LCL', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('ADMINISTRADOR','AUXILIAR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `correo`, `fono`, `cel`, `tipo`, `foto`, `password`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, '0', '', '', NULL, '', '', 'ADMINISTRADOR', 'default.png', '$2y$10$cDSOdzTsMDQAfqcb6.WFtu40s.wmQ4Jl8poIwW69MSZnnedD3prKu', '2022-09-19', NULL, NULL),
(2, 'JPERES', 'JUAN', 'PERES', '', '1234', 'LP', 'LOS OLIVOS', 'jperes@gmail.com', '22222', '777777', 'AUXILIAR', '1664583993_JPERES.jpg', '$2y$10$NYJ2v3SlE.eDCv6NTMMNxOLaYQhCt2x5Haf22mN7vgN2CmDPR4QWW', '2022-09-26', '2022-09-26 14:55:32', '2022-10-01 00:26:33'),
(3, 'CCONTRERAS', 'CARLOS', 'CONTRERAS', '', '2222', 'CB', 'LOS OLIVOS', '', '22222', '777777', 'ADMINISTRADOR', 'default.png', '$2y$10$iLpUjcKxOwzZswvhCzUvk.GqF8pzCCbIAwSczkBkMcR3YzKn8MT3e', '2022-09-26', '2022-09-26 14:55:50', '2022-09-26 15:02:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_file_nro_unique` (`file_nro`),
  ADD KEY `clientes_tipo_embarque_id_foreign` (`tipo_embarque_id`),
  ADD KEY `clientes_oficina_id_foreign` (`oficina_id`),
  ADD KEY `clientes_puerto_destino_id_foreign` (`puerto_destino_id`),
  ADD KEY `clientes_destino_final_id_foreign` (`destino_final_id`),
  ADD KEY `clientes_units_id1_foreign` (`units_id1`),
  ADD KEY `clientes_units_id2_foreign` (`units_id2`),
  ADD KEY `clientes_socio_proveedor_id_foreign` (`socio_proveedor_id`),
  ADD KEY `clientes_embarcado_id_foreign` (`embarcado_id`);

--
-- Indices de la tabla `cliente_egresos`
--
ALTER TABLE `cliente_egresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_egresos_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `cliente_ingresos`
--
ALTER TABLE `cliente_ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_ingresos_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `destino_finals`
--
ALTER TABLE `destino_finals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `embarcados`
--
ALTER TABLE `embarcados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flete_maritimos`
--
ALTER TABLE `flete_maritimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flete_maritimos_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `manifiestos`
--
ALTER TABLE `manifiestos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manifiestos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `manifiestos_shipper_id_foreign` (`shipper_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nota_cobranzas`
--
ALTER TABLE `nota_cobranzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nota_cobranzas_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `puerto_destinos`
--
ALTER TABLE `puerto_destinos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `socio_proveedors`
--
ALTER TABLE `socio_proveedors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tconts`
--
ALTER TABLE `tconts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tconts_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `tcont_egresos`
--
ALTER TABLE `tcont_egresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tcont_egresos_tcont_id_foreign` (`tcont_id`),
  ADD KEY `tcont_egresos_documento_id_foreign` (`documento_id`);

--
-- Indices de la tabla `tcont_ingresos`
--
ALTER TABLE `tcont_ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tcont_ingresos_tcont_id_foreign` (`tcont_id`),
  ADD KEY `tcont_ingresos_documento_id_foreign` (`documento_id`);

--
-- Indices de la tabla `tipo_embarques`
--
ALTER TABLE `tipo_embarques`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD UNIQUE KEY `users_ci_unique` (`ci`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente_egresos`
--
ALTER TABLE `cliente_egresos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cliente_ingresos`
--
ALTER TABLE `cliente_ingresos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `destino_finals`
--
ALTER TABLE `destino_finals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `embarcados`
--
ALTER TABLE `embarcados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `flete_maritimos`
--
ALTER TABLE `flete_maritimos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manifiestos`
--
ALTER TABLE `manifiestos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `nota_cobranzas`
--
ALTER TABLE `nota_cobranzas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puerto_destinos`
--
ALTER TABLE `puerto_destinos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `shippers`
--
ALTER TABLE `shippers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `socio_proveedors`
--
ALTER TABLE `socio_proveedors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tconts`
--
ALTER TABLE `tconts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tcont_egresos`
--
ALTER TABLE `tcont_egresos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tcont_ingresos`
--
ALTER TABLE `tcont_ingresos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tipo_embarques`
--
ALTER TABLE `tipo_embarques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_destino_final_id_foreign` FOREIGN KEY (`destino_final_id`) REFERENCES `destino_finals` (`id`),
  ADD CONSTRAINT `clientes_embarcado_id_foreign` FOREIGN KEY (`embarcado_id`) REFERENCES `embarcados` (`id`),
  ADD CONSTRAINT `clientes_oficina_id_foreign` FOREIGN KEY (`oficina_id`) REFERENCES `oficinas` (`id`),
  ADD CONSTRAINT `clientes_puerto_destino_id_foreign` FOREIGN KEY (`puerto_destino_id`) REFERENCES `puerto_destinos` (`id`),
  ADD CONSTRAINT `clientes_socio_proveedor_id_foreign` FOREIGN KEY (`socio_proveedor_id`) REFERENCES `socio_proveedors` (`id`),
  ADD CONSTRAINT `clientes_tipo_embarque_id_foreign` FOREIGN KEY (`tipo_embarque_id`) REFERENCES `tipo_embarques` (`id`),
  ADD CONSTRAINT `clientes_units_id1_foreign` FOREIGN KEY (`units_id1`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `clientes_units_id2_foreign` FOREIGN KEY (`units_id2`) REFERENCES `units` (`id`);

--
-- Filtros para la tabla `cliente_egresos`
--
ALTER TABLE `cliente_egresos`
  ADD CONSTRAINT `cliente_egresos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `cliente_ingresos`
--
ALTER TABLE `cliente_ingresos`
  ADD CONSTRAINT `cliente_ingresos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `flete_maritimos`
--
ALTER TABLE `flete_maritimos`
  ADD CONSTRAINT `flete_maritimos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `manifiestos`
--
ALTER TABLE `manifiestos`
  ADD CONSTRAINT `manifiestos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `manifiestos_shipper_id_foreign` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`);

--
-- Filtros para la tabla `nota_cobranzas`
--
ALTER TABLE `nota_cobranzas`
  ADD CONSTRAINT `nota_cobranzas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `tconts`
--
ALTER TABLE `tconts`
  ADD CONSTRAINT `tconts_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `tcont_egresos`
--
ALTER TABLE `tcont_egresos`
  ADD CONSTRAINT `tcont_egresos_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  ADD CONSTRAINT `tcont_egresos_tcont_id_foreign` FOREIGN KEY (`tcont_id`) REFERENCES `tconts` (`id`);

--
-- Filtros para la tabla `tcont_ingresos`
--
ALTER TABLE `tcont_ingresos`
  ADD CONSTRAINT `tcont_ingresos_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  ADD CONSTRAINT `tcont_ingresos_tcont_id_foreign` FOREIGN KEY (`tcont_id`) REFERENCES `tconts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
