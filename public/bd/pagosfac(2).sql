-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2020 a las 03:46:19
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pagosfac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicions`
--

CREATE TABLE `adicions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registroadicion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaadicion` date NOT NULL,
  `valoradicion` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concargos`
--

CREATE TABLE `concargos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detalle_inter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `con_cargo_a` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `concargos`
--

INSERT INTO `concargos` (`id`, `detalle_inter`, `con_cargo_a`, `created_at`, `updated_at`) VALUES
(1, 'No Aplica', 'Alfm Reg. Norte', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(2, 'Inter No. 008 /2020', 'Ejercito', '2020-08-09 17:11:30', '2020-08-09 17:11:30'),
(3, 'Inter  No. 055 /2019', 'EJERCITO', '2020-08-10 00:45:53', '2020-08-10 00:45:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numcontrato` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valorcontrato` double(20,2) NOT NULL,
  `valoranticipo` double(20,2) DEFAULT NULL,
  `fecha_anticipo` date DEFAULT NULL,
  `amortizar` double(5,2) DEFAULT NULL,
  `valoradicion` double(20,2) DEFAULT NULL,
  `gran_total` double(20,2) DEFAULT NULL,
  `registro_pres_inic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechacontrato` date NOT NULL,
  `plazoejecucion` date NOT NULL,
  `interadmi` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objetocontrato` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo` double(20,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `contabla` tinyint(1) NOT NULL DEFAULT 0,
  `pagos` bigint(20) NOT NULL DEFAULT 0,
  `num_mes` bigint(20) NOT NULL DEFAULT 0,
  `ejecutado` double(5,2) DEFAULT NULL,
  `supervisor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proveedor_id` bigint(20) UNSIGNED NOT NULL,
  `tipocontrato_id` bigint(20) UNSIGNED NOT NULL,
  `dependencia_id` bigint(20) UNSIGNED NOT NULL,
  `concargo_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `numcontrato`, `valorcontrato`, `valoranticipo`, `fecha_anticipo`, `amortizar`, `valoradicion`, `gran_total`, `registro_pres_inic`, `fechacontrato`, `plazoejecucion`, `interadmi`, `objetocontrato`, `saldo`, `status`, `contabla`, `pagos`, `num_mes`, `ejecutado`, `supervisor`, `created_at`, `updated_at`, `proveedor_id`, `tipocontrato_id`, `dependencia_id`, `concargo_id`) VALUES
(1, '010-010-2020', 400000000.00, NULL, NULL, NULL, NULL, 400000000.00, NULL, '2020-02-27', '2020-12-30', NULL, 'ADQUISICION DE FRUVER Y DEMAS PARA ABASTECER EL CATERING BITER 2, ADMINISTRADO POR LA AGENCIA LOGISTICA REGIONAL NORTE', 400000000.00, 1, 0, 0, 0, NULL, 'Martha Lucia Rodríguez', '2020-08-09 17:07:48', '2020-08-09 17:11:50', 1, 2, 5, 2),
(2, '010-006-2020', 700000000.00, NULL, NULL, NULL, NULL, 700000000.00, NULL, '2020-02-21', '2020-12-30', NULL, 'ADQUISISCION DE FRUVER Y DEMAS PARA ABASTECER EL CATERING BITER 10, ADMINISTRADO POR LA AGENCIA LOGISTICA REGIONAL NORTE', 700000000.00, 1, 0, 0, 0, NULL, 'Martha Lucia Rodríguez', '2020-08-09 19:15:53', '2020-08-09 19:16:50', 2, 2, 5, 2),
(3, '010-007-2020', 450000000.00, NULL, NULL, NULL, NULL, 450000000.00, NULL, '2020-02-25', '2020-12-30', NULL, 'ADQUIRIR FRUVER Y DEMÁS PARA ABASTECER EL CATERING BITER 11, ADMINISTRADO POR LA AGENCIA LOGÍSTICA REGIONAL NORTE', 450000000.00, 1, 0, 0, 0, NULL, 'Martha Lucia Rodriguez', '2020-08-09 22:35:58', '2020-08-09 22:38:07', 3, 2, 5, 2),
(4, '010-037-2020', 70000000.00, NULL, NULL, NULL, NULL, 70000000.00, '36120', '2020-04-17', '2020-12-30', NULL, 'ADQUISICIÓN DE CARNES FRÍAS PARA ABASTECER LOS CATERING ADMINISTRADOS POR LA AGENCIA LOGÍSTICA DE LAS FUERZAS MILITARES REGIONAL NORTE', 70000000.00, 1, 0, 0, 0, NULL, 'TD. Isabel Murillo Ramirez', '2020-08-10 00:18:45', '2020-08-10 01:41:07', 3, 2, 5, 2),
(5, '010-025-2020', 80000000.00, NULL, NULL, NULL, NULL, 80000000.00, '26120', '2020-03-19', '2020-12-30', NULL, 'ADQUISICIÓN DE BEBIDAS LACTEAS PARA ABASTECER LOS CATERING ADMINISTRADOS POR LA AGENCIA LOGÍSTICA DE LAS FUERZAS MILITARES REGIONAL NORTE', 80000000.00, 1, 0, 0, 0, NULL, 'TD. Isabel Murillo Ramirez', '2020-08-10 00:27:08', '2020-08-10 01:42:13', 3, 2, 5, 2),
(6, '010-034-2020', 45000000.00, NULL, NULL, NULL, NULL, 45000000.00, '35220', '2020-04-14', '2020-12-30', NULL, 'ADQUISICIÓN DE COMIDAS ESPECIALES PARA ABASTECER LOS CATERING ADMINISTRADOS POR LA AGENCIA LOGISTICA DE LA REGIONAL NORTE', 45000000.00, 1, 0, 0, 0, NULL, 'TD. Isabel Murillo Ramirez', '2020-08-10 00:41:57', '2020-08-10 01:41:39', 4, 2, 5, 2),
(7, '010-015-2020', 57000000.00, NULL, NULL, NULL, NULL, 57000000.00, '21420 de 06-03-2020', '2020-03-05', '2020-12-30', NULL, 'ADQUISICIÓN DE CARNES DE RES PARA ABASTECER LOS CATERING (BATALLÓN LA POPA, BATALLÓN BIMUR 10, BATALLÓN G. RONDÓN) ADMINISTRADOS POR LA AGENCIA LOGÍSTICA REGIONAL NORTE.', 57000000.00, 1, 0, 0, 0, NULL, 'TD. Isabel Murillo Ramirez', '2020-08-10 00:45:23', '2020-08-10 00:58:27', 2, 2, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosmaestros`
--

CREATE TABLE `datosmaestros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `director` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_director` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle6` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `datosmaestros`
--

INSERT INTO `datosmaestros` (`id`, `director`, `cargo_director`, `detalle1`, `detalle2`, `detalle3`, `detalle4`, `detalle5`, `detalle6`, `created_at`, `updated_at`) VALUES
(1, 'Teniente Coronel Ricardo Jerez Soto', 'Ordenador Del Gasto', 'Con toda atención me permito enviar al señor Teniente Coronel Ricardo Jerez\n                            Soto, el informe de supervisión No. 03 Del contrato No. 010-011-2020 Correspondiente al\n                            primer pedido mayo 2020, de acuerdo con la siguiente información:', 'Se recibieron los Mantenimientos acordados en el contrato sin ningún inconveniente.', 'N/A', 'N/A', 'El servicio fue desarrollado por el personal asignado por la empresa sin novedad especial', 'Ninguna', '2020-08-09 16:25:07', '2020-08-09 16:25:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombredepen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `nombredepen`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2020-08-09 16:25:06', '2020-08-09 16:25:06'),
(2, 'Admistrativa', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(3, 'Contratos', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(4, 'Servicios Admin', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(5, 'Comedores', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(6, 'Cads', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(7, 'Soga', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(8, 'Tesoreria', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(9, 'Tecnologia', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(10, 'Contabilidad', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(11, 'Gestion Documental', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(12, 'Negocios Especiales', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(13, 'Cartera', '2020-08-09 16:25:07', '2020-08-09 16:25:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detapedidos`
--

CREATE TABLE `detapedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dtacontratos`
--

CREATE TABLE `dtacontratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factudetadis`
--

CREATE TABLE `factudetadis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registroadicion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaadicion` date NOT NULL,
  `valoradicion` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pago_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadetas`
--

CREATE TABLE `facturadetas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numfac` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechafac` date NOT NULL,
  `valorfac` double(20,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL,
  `dependencia_id` bigint(20) UNSIGNED NOT NULL,
  `uso_rubro_id` bigint(20) UNSIGNED NOT NULL,
  `pago_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numfac` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechafac` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL,
  `pago_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesesejecucions`
--

CREATE TABLE `mesesejecucions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numeral` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `obligacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entregable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ene` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feb` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mar` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abr` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `may` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jun` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jul` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ago` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sep` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oct` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nov` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dic` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_24_163446_create_proveedors_table', 1),
(5, '2020_06_24_163805_create_tipocontratos_table', 1),
(6, '2020_06_24_163856_create_productos_table', 1),
(7, '2020_06_24_164210_create_contratos_table', 1),
(8, '2020_06_24_164245_create_dtacontratos_table', 1),
(9, '2020_06_24_164317_create_pedidos_table', 1),
(10, '2020_06_24_164403_create_detapedidos_table', 1),
(11, '2020_06_24_164419_create_rubros_table', 1),
(12, '2020_07_12_032533_create_pagos_table', 1),
(13, '2020_07_12_032549_create_facturas_table', 1),
(14, '2020_07_30_204722_create_rubroprins_table', 1),
(15, '2020_07_30_204921_create_rubrocontratos_table', 1),
(16, '2020_07_30_205019_create_uso_rubros_table', 1),
(17, '2020_07_30_205124_create_facturadetas_table', 1),
(18, '2020_07_30_205218_create_adicions_table', 1),
(19, '2020_07_30_205327_create_mesesejecucions_table', 1),
(20, '2020_07_30_205601_create_factudetadis_table', 1),
(21, '2020_07_30_205818_create_datosmaestros_table', 1),
(22, '2020_07_30_205948_create_obligacions_table', 1),
(23, '2020_07_30_210046_create_obliga_pagos_table', 1),
(24, '2020_08_06_180433_create_riesgos_table', 1),
(25, '2020_08_06_180928_create_riesgo_pagos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obligacions`
--

CREATE TABLE `obligacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numeral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obligacion_deta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entregable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `obligacions`
--

INSERT INTO `obligacions` (`id`, `numeral`, `obligacion_deta`, `entregable`, `created_at`, `updated_at`, `contrato_id`) VALUES
(1, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ', '2020-08-09 17:25:50', '2020-08-09 17:25:50', 1),
(2, '10', 'Asumir Todos Los Costos De Vicio Ocultos Del Contrato Que Surja De La Presente Necesidad', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-09 17:26:22', '2020-08-09 17:26:22', 1),
(3, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Factura', '2020-08-09 17:26:55', '2020-08-09 17:26:55', 1),
(4, '10', 'El Contratista Debe Reponer O Sustituir Los Bienes Que No Cumplan Con Las Especificaciones De Calidad O Funcionamiento Requerido En Un Término De No Mayor A Un (1) Días Hábiles, Contados A Partir De La Comunicación Escrita Que Le Curse El Supervisor. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-09 17:27:25', '2020-08-09 17:27:25', 1),
(5, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad, De Lunes A Domingo (de 8:00 A 12:00 Y De 13:00 A 17:00 Horas), En El Caso De Los Requerimientos Relacionados Con El Producto LOS FRITOS Y TAMALES Se Entregan De Lunes A Domingo En El Horario De ( 04:00 A 06:00 Am), El Personal Y Vehículo Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad )', '2020-08-09 17:28:09', '2020-08-09 17:28:09', 1),
(6, '10', 'Una Vez Suscrito El Contrato, El Contratista Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Numero Teléfono, Celular, Telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva ', 'No Se Requirió Para Este Periodo ', '2020-08-09 17:28:43', '2020-08-09 17:28:43', 1),
(7, '10', 'Dotar Al Personal Manipular De Alimentos Con Uniforme Conforme Lo Establecido En El Numeral 2 Del Art 14 De La Resolución 2674 De 2013 ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-09 17:29:29', '2020-08-09 17:29:29', 1),
(8, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas.', 'Facturas Y Parafiscales', '2020-08-09 17:29:57', '2020-08-09 17:29:57', 1),
(9, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y De Los Vehículos ', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad) ', '2020-08-09 17:30:31', '2020-08-09 17:30:31', 1),
(10, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentaos Por Lo Menos (01) Vez Al Año Y Allegar Copia De La Cerficacion Medica Que Están Aptos Para La Manipulación De Alimentos Al Contratante', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-09 17:31:04', '2020-08-09 17:31:04', 1),
(11, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos De Acuerdo A Lo Establecido En El  Art13 De La Resolución 2674 De 2013 Y Allegar Copia De La Certificación De Los Mimas Contratantes', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-09 17:31:27', '2020-08-09 17:31:27', 1),
(12, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro De Los Quince Días Hábiles Posteriores Al Requerimiento.', 'No Se Requirió Para Este Periodo', '2020-08-09 17:32:01', '2020-08-09 17:32:01', 1),
(13, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-09 17:32:31', '2020-08-09 17:32:31', 1),
(14, '10', 'El Oferente Deberá Cumplir Con La Normativa Aplicable En Seguridad Y Salud En El Trabajo En Todo Lo Referente A La Implementación De Sistemas De Gestión De Seguridad Y Salud En El Trabajo SG-SST- Y Efectuar Los Controles Respectivos Que Permitan Prevenir Accidentes Propios Del Contrato De Sus Trabajadores Y En General Al Personal Que Designe Para El Desarrollo Y Cumplimiento Del Mismo Dicho Cumplimiento Será Objeto De Verificación Permanente Por Parte De La Entidad. ', 'Se Solicitó Por Correo El Cumplimiento De Esta Obligación ', '2020-08-09 17:33:02', '2020-08-09 17:33:02', 1),
(15, '10', 'Presentar Certificación Expedido Por El Representante Legar O Revisor Fiscal Del Cumplimiento Del Sistema De Gestión De Seguridad Y Salud En El Trabajo SGSS-', 'No Se Requirió Para Este Periodo', '2020-08-09 17:33:31', '2020-08-09 17:33:31', 1),
(16, '10', 'El Contratista Se Obliga Para Con La Agencia Logística A Realizar Las Publicaciones Y/o Aprobaciones Que Le Corresponden, En La Página De Contratación Estatal SECOP II, En Cuanto A Pólizas, Facturación Y Demás Documentos Propios Del Proceso, En Los Tiempos Establecidos Para Ello Y De Acuerdo A Los Lineamientos Establecido Por Colombia Compra Eficiente Establecido Por Colombia Compra Eficiente. ', 'En  Trámite De Publicación Facturas ', '2020-08-09 17:34:10', '2020-08-09 17:34:49', 1),
(17, '10', 'Aprobación (el Contratista Debe Aportar En La Plataforma Tanto El Contrato Como Las Modificaciones Y El Acta De Liquidación Que Publique La Entidad Contratante Con El Fin De Finalizar Cada Etapa Y Dar Cumplimiento A Lo Establecido En Las Guías De Colombia Compra Eficiente', 'No Se Requirió Para Este Periodo', '2020-08-09 17:35:18', '2020-08-09 17:35:18', 1),
(18, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ', '2020-08-09 19:19:01', '2020-08-09 19:19:01', 2),
(19, '10', 'Asumir Todos Los Costos De Vicio Ocultos Del Contrato Que Surja De La Presente Necesidad', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-09 19:19:34', '2020-08-09 19:19:34', 2),
(20, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Facturas', '2020-08-09 19:20:34', '2020-08-09 19:20:34', 2),
(21, '10', 'El Contratista Debe Reponer O Sustituir Los Bienes Que No Cumplan Con Las Especificaciones De Calidad O Funcionamiento Requerido En Un Término De No Mayor A Un (1) Días Hábiles, Contados A Partir De La Comunicación Escrita Que Le Curse El Supervisor. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-09 19:21:10', '2020-08-09 19:21:10', 2),
(22, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad, De Lunes A Domingo (de 8:00 A 12:00 Y De 13:00 A 17:00 Horas), En El Caso De Los Requerimientos Relacionados Con El Producto LOS FRITOS Y TAMALES Se Entregan De Lunes A Domingo En El Horario De ( 04:00 A 06:00 Am), El Personal Y Vehículo Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad ', '2020-08-09 19:22:01', '2020-08-09 19:22:01', 2),
(23, '10', 'Una Vez Suscrito El Contrato, El Contratista Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Numero Teléfono, Celular, Telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva ', 'No Se Requirió Para Este Periodo ', '2020-08-09 19:22:17', '2020-08-09 19:22:17', 2),
(24, '10', 'Dotar Al Personal Manipular De Alimentos Con Uniforme Conforme Lo Establecido En El Numeral 2 Del Art 14 De La Resolución 2674 De 2013 ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-09 19:22:45', '2020-08-09 19:22:45', 2),
(25, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas', 'Facturas Y Parafiscales', '2020-08-09 19:23:14', '2020-08-09 19:23:14', 2),
(26, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y De Los Vehículos ', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad) ', '2020-08-09 19:23:38', '2020-08-09 19:23:38', 2),
(27, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentaos Por Lo Menos (01) Vez Al Año Y Allegar Copia De La Cerficacion Medica Que Están Aptos Para La Manipulación De Alimentos Al Contratante', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-09 19:24:05', '2020-08-09 19:24:05', 2),
(28, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos De Acuerdo A Lo Establecido En El  Art13 De La Resolución 2674 De 2013 Y Allegar Copia De La Certificación De Los Mimas Contratantes', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-09 19:24:39', '2020-08-09 19:24:39', 2),
(29, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro De Los Quince Días Hábiles Posteriores Al Requerimiento.', 'No Se Requirió Para Este Periodo', '2020-08-09 19:25:09', '2020-08-09 19:25:09', 2),
(30, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-09 19:25:38', '2020-08-09 19:25:38', 2),
(31, '10', 'El Oferente Deberá Cumplir Con La Normativa Aplicable En Seguridad Y Salud En El Trabajo En Todo Lo Referente A La Implementación De Sistemas De Gestión De Seguridad Y Salud En El Trabajo SG-SST- Y Efectuar Los Controles Respectivos Que Permitan Prevenir Accidentes Propios Del Contrato De Sus Trabajadores Y En General Al Personal Que Designe Para El Desarrollo Y Cumplimiento Del Mismo Dicho Cumplimiento Será Objeto De Verificación Permanente Por Parte De La Entidad. ', 'Se Solicitó Por Correo El Cumplimiento De Esta Obligación ', '2020-08-09 19:26:04', '2020-08-09 19:26:04', 2),
(32, '10', 'Presentar Certificación Expedido Por El Representante Legar O Revisor Fiscal Del Cumplimiento Del Sistema De Gestión De Seguridad Y Salud En El Trabajo SGSS-', 'No Se Requirió Para Este Periodo', '2020-08-09 19:26:33', '2020-08-09 19:26:33', 2),
(33, '10', 'El Contratista Se Obliga Para Con La Agencia Logística A Realizar Las Publicaciones Y/o Aprobaciones Que Le Corresponden, En La Página De Contratación Estatal SECOP II, En Cuanto A Pólizas, Facturación Y Demás Documentos Propios Del Proceso, En Los Tiempos Establecidos Para Ello Y De Acuerdo A Los Lineamientos Establecido Por Colombia Compra Eficiente. ', 'En  Trámite De Publicación Facturas ', '2020-08-09 19:27:01', '2020-08-09 19:27:01', 2),
(34, '10', 'Aprobación (el Contratista Debe Aportar En La Plataforma Tanto El Contrato Como Las Modificaciones Y El Acta De Liquidación Que Publique La Entidad Contratante Con El Fin De Finalizar Cada Etapa Y Dar Cumplimiento A Lo Establecido En Las Guías De Colombia Compra Eficiente. ', 'No Se Requirió Para Este Periodo', '2020-08-09 19:27:31', '2020-08-09 19:27:31', 2),
(35, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ', '2020-08-09 22:44:14', '2020-08-09 22:44:14', 3),
(36, '10', 'Informar Al Supervisor Del Contrato Sobre Cualquier Irregularidad Que Proponga En Desarrollo Del Contrato.', 'No Se Presentó Irregularidad Con Relación Este Pago', '2020-08-09 22:44:38', '2020-08-09 22:44:38', 3),
(37, '10', 'Asumir Todos Los Costos De Vicios Ocultos Del Contrato Que Surja De La Presente Necesidad.', 'No Aplica Para Este Periodo', '2020-08-09 22:45:03', '2020-08-09 22:45:03', 3),
(38, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Facturas', '2020-08-09 22:45:36', '2020-08-09 22:45:36', 3),
(39, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad, De Lunes A Domingo (de 8:00 A 12:00 Y De 13:00 A 17:00 Horas), El Personal Y Vehículos Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar.', 'Acta De Recibo A Satisfacción', '2020-08-09 22:45:59', '2020-08-09 22:45:59', 3),
(40, '10', 'El CONTRATISTA Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Número Telefónico, Celular, Telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva.', 'Aportado A Través De Correo Electrónico', '2020-08-09 22:46:24', '2020-08-09 22:46:24', 3),
(41, '10', 'Dotar Al Personal Manipulador De Alimentos Con Uniformes Conforme Lo Establecido En El Numeral 2 Del Art. 14 De La Resolución 2674 De 2013.', 'Verificado Al Momento De La Entrega', '2020-08-09 22:46:46', '2020-08-09 22:46:46', 3),
(42, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas.', 'Facturas Y Parafiscales', '2020-08-09 22:47:12', '2020-08-09 22:47:12', 3),
(43, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y De Los Vehículos.', 'Compromiso Aportado Con La Oferta', '2020-08-09 22:47:36', '2020-08-09 22:47:36', 3),
(44, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentos, Por Lo Menos Una (01) Vez Al Año Y Allegar Copia De Los Mismos Al Contratante.', 'No Aplica Para Este Periodo', '2020-08-09 22:47:58', '2020-08-09 22:47:58', 3),
(45, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos, De Acuerdo A Lo Establecido En El Art. 13 De La Resolución 2674 De 2013 Y Allegar Copia De La Certificación De Las Mismas Al Contratante.', 'No Aplica Para Este Periodo', '2020-08-09 22:48:27', '2020-08-09 22:48:27', 3),
(46, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro De Los Quince (15) Días Hábiles Posteriores Al Requerimiento.', 'No Sé Requirió Para Este Periodo', '2020-08-09 22:48:45', '2020-08-09 22:48:45', 3),
(47, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción', '2020-08-09 22:49:03', '2020-08-09 22:49:03', 3),
(48, '10', 'El Contratista Deberá Cumplir Con La Normatividad Aplicable En Seguridad Y Salud En El Trabajo, En Todo Lo Referente A La Implementación De Sistema De Gestión De Seguridad Y Salud En El Trabajo SG-SST) Y Efectuar Los Controles Respectivos Que Permitan Prevenir Accidentes Y Enfermedades Laborales, Además De Controlar Los Riesgos Y Peligros Asociados A Las Actividades Propias Del Contrato De Sus Trabajadores Y En General Al Personal Que Designe Para El Desarrollo Y Cumplimiento Del Mismo. Dicho Cumplimiento Será Objeto De Verificación Permanente Por Parte De La Entidad', 'Compromiso Aportado Con La Oferta', '2020-08-09 22:49:29', '2020-08-09 22:49:29', 3),
(49, '10', 'Presentar Certificación Expedido Por El Representante Legal O Revisor Fiscal Del Cumplimiento Del Sistema De Gestión De Seguridad Y Salud En El Trabajo (SGSST).', 'No Sé Requirió Para Este Periodo', '2020-08-09 22:49:51', '2020-08-09 22:49:51', 3),
(50, '10', 'El Contratista Se Obliga A Cargar En La Plataforma SECOP II, Todos Los Documentos Que Se Originen Con La Ejecución Del Contrato Y Que Se Requiera Por La Plataforma (garantías, Facturas).', 'En Trámite De Publicación', '2020-08-09 22:50:12', '2020-08-09 22:50:12', 3),
(51, '10', 'VISITA TECNICA: La Entidad Podrá Realizar Visitas Técnicas A Las Instalaciones Del Oferente En Cualquier Momento De La Ejecución Del Contrato Sin Previo Aviso Con El Fin De Verificar La Trazabilidad Del Producto (Almacenamiento, Procesamiento, Distribución Y Transporte De Los Productos Que Se Están Suministrando) Y Las Medidas Higiénicas Sanitarias Estipuladas Por Ley, En Esta Visita Se Diligenciara Un Acta De Visita De Inspección Y Se Tomaran Registros Fotográficos.', 'No Sé Requirió Para Este Periodo', '2020-08-09 22:50:37', '2020-08-09 22:50:37', 3),
(52, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ', '2020-08-10 00:54:17', '2020-08-10 00:54:17', 7),
(53, '10', 'Informar Al Supervisor Del Contrato Sobre Cualquier Irregularidad Que Proponga En Desarrollo Del Contrato.', 'No Se Presentó Irregularidad Con Relación Este Pago', '2020-08-10 00:54:17', '2020-08-10 00:54:17', 7),
(54, '10', 'Asumir Todos Los Costos De Vicios Ocultos Del Contrato Que Surja De La Presente Necesidad.', 'No Aplica Para Este Periodo', '2020-08-10 00:54:17', '2020-08-10 00:54:17', 7),
(55, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Facturas', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(56, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad, De Lunes A Domingo (de 8:00 A 12:00 Y De 13:00 A 17:00 Horas), El Personal Y Vehículos Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar.', 'Acta De Recibo A Satisfacción', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(57, '10', 'El CONTRATISTA Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Número Telefónico, Celular, Telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva.', 'Aportado A Través De Correo Electrónico', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(58, '10', 'Dotar Al Personal Manipulador De Alimentos Con Uniformes Conforme Lo Establecido En El Numeral 2 Del Art. 14 De La Resolución 2674 De 2013.', 'Verificado Al Momento De La Entrega', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(59, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas.', 'Facturas Y Parafiscales', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(60, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y De Los Vehículos.', 'Compromiso Aportado Con La Oferta', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(61, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentos, Por Lo Menos Una (01) Vez Al Año Y Allegar Copia De Los Mismos Al Contratante.', 'No Aplica Para Este Periodo', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(62, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos, De Acuerdo A Lo Establecido En El Art. 13 De La Resolución 2674 De 2013 Y Allegar Copia De La Certificación De Las Mismas Al Contratante.', 'No Aplica Para Este Periodo', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(63, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro De Los Quince (15) Días Hábiles Posteriores Al Requerimiento.', 'No Sé Requirió Para Este Periodo', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(64, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(65, '10', 'El Contratista Deberá Cumplir Con La Normatividad Aplicable En Seguridad Y Salud En El Trabajo, En Todo Lo Referente A La Implementación De Sistema De Gestión De Seguridad Y Salud En El Trabajo SG-SST) Y Efectuar Los Controles Respectivos Que Permitan Prevenir Accidentes Y Enfermedades Laborales, Además De Controlar Los Riesgos Y Peligros Asociados A Las Actividades Propias Del Contrato De Sus Trabajadores Y En General Al Personal Que Designe Para El Desarrollo Y Cumplimiento Del Mismo. Dicho Cumplimiento Será Objeto De Verificación Permanente Por Parte De La Entidad', 'Compromiso Aportado Con La Oferta', '2020-08-10 00:54:18', '2020-08-10 00:54:18', 7),
(66, '10', 'Presentar Certificación Expedido Por El Representante Legal O Revisor Fiscal Del Cumplimiento Del Sistema De Gestión De Seguridad Y Salud En El Trabajo (SGSST).', 'No Sé Requirió Para Este Periodo', '2020-08-10 00:54:19', '2020-08-10 00:54:19', 7),
(67, '10', 'El Contratista Se Obliga A Cargar En La Plataforma SECOP II, Todos Los Documentos Que Se Originen Con La Ejecución Del Contrato Y Que Se Requiera Por La Plataforma (garantías, Facturas).', 'En Trámite De Publicación', '2020-08-10 00:54:19', '2020-08-10 00:54:19', 7),
(68, '10', 'VISITA TECNICA: La Entidad Podrá Realizar Visitas Técnicas A Las Instalaciones Del Oferente En Cualquier Momento De La Ejecución Del Contrato Sin Previo Aviso Con El Fin De Verificar La Trazabilidad Del Producto (Almacenamiento, Procesamiento, Distribución Y Transporte De Los Productos Que Se Están Suministrando) Y Las Medidas Higiénicas Sanitarias Estipuladas Por Ley, En Esta Visita Se Diligenciara Un Acta De Visita De Inspección Y Se Tomaran Registros Fotográficos.', 'No Sé Requirió Para Este Periodo', '2020-08-10 00:54:19', '2020-08-10 00:54:19', 7),
(69, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:03:44', '2020-08-10 01:03:44', 5),
(70, '10', 'Permitir El Acceso Del Supervisor Del Contrato A Las Instalaciones Del Contratista, A Efectos De Verificar La Calidad, Almacenamiento Y Distribución De Los Elementos', 'No Se Requirió Para Este Periodo', '2020-08-10 01:04:05', '2020-08-10 01:04:05', 5),
(71, '10', 'Informar Al Supervisor Del Contrato Sobre Cualquier Irregularidad Que Proponga En Desarrollo Del Contrato.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:04:36', '2020-08-10 01:04:36', 5),
(72, '10', 'Asumir Todos Los Costos De Vicios Ocultos Del Contrato Que Surja De La Presente Necesidad', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:05:03', '2020-08-10 01:05:03', 5),
(73, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Facturas', '2020-08-10 01:05:40', '2020-08-10 01:05:40', 5),
(74, '10', 'El Contratista Debe Reponer O Sustituir Los Bienes Que No Cumplan Con Las Especificaciones De Calidad O Funcionamiento Requerido En Un Término De No Mayor A Un (1) Días Hábiles, Contados A Partir De La Comunicación Escrita Que Le Curse El Supervisor. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:06:06', '2020-08-10 01:06:06', 5),
(75, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad De Lunes A Domingo (de 08:00 A 12:00 Y De 13:00 A 17:00 Horas), El Personal Y Vehículo Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:07:23', '2020-08-10 01:07:23', 5),
(76, '10', 'Una Vez Suscrito El Contrato, El Contratista Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Número Telefónico, Celular ,telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva.', 'No Se Requirió Para Este Periodo', '2020-08-10 01:08:18', '2020-08-10 01:08:18', 5),
(77, '10', 'Dotar Al Personal Manipulador De Alimentos Con Uniformes Conforme Lo Establecido En El Numeral 2 Del Art 14 De La Resolución 2674 De 2013.', 'Acta De Recibo A Satisfacción (no Se Presentó  Novedad)', '2020-08-10 01:12:41', '2020-08-10 01:12:41', 5),
(78, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas.', 'Facturas Y Parafiscales', '2020-08-10 01:13:08', '2020-08-10 01:13:08', 5),
(79, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y  De Los Vehículos.', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:13:31', '2020-08-10 01:13:31', 5),
(80, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentos, Por Lo Menos Una (01) Vez Al Año Y Allegar Copia De Los Mismos Al Contratante. ', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-10 01:13:50', '2020-08-10 01:13:50', 5),
(81, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos De Acuerdo A Lo Establecido En El Artículo 13 De La Resolución 2674 De 2013  Y Allegar Copia De La Certificación De Los Mismas Al Contratante. ', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-10 01:14:07', '2020-08-10 01:14:07', 5),
(82, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro Del Os Quince (15) Días Hábiles Posteriores Al Requerimiento.', 'No Se Requirió Para Este Periodo', '2020-08-10 01:14:29', '2020-08-10 01:14:29', 5),
(83, '10', 'El Contratista Se Obliga A Recibir En Sus Instalaciones ( Establecimientos ), Al Personal Que La Entidad Designe Para Realizar Visita Técnica O Revista Para La Verificación De Las Mismas ', 'No Se Requirió Para Este Periodo', '2020-08-10 01:14:52', '2020-08-10 01:14:52', 5),
(84, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción (no Se Presentó Novedad ', '2020-08-10 01:15:09', '2020-08-10 01:15:09', 5),
(85, '10', 'El Contratista Se Obliga Para  Con La Agencia Logística A Realizar Las Publicaciones Y Aprobaciones Que Le Corresponden , En La Página De Contratación Estatal SECOP II, En Cuanto Pólizas, Facturación Y Demás Documentos Propios Del Proceso, En Los Tiempos Establecidos Para Ello Y De Acuerdo A Las Herramientas Establecidas Por Colombia Compra Eficiente.', 'En Trámite De Publicación ', '2020-08-10 01:15:32', '2020-08-10 01:15:32', 5),
(86, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(87, '10', 'Permitir El Acceso Del Supervisor Del Contrato A Las Instalaciones Del Contratista, A Efectos De Verificar La Calidad, Almacenamiento Y Distribución De Los Elementos', 'No Se Requirió Para Este Periodo', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(88, '10', 'Informar Al Supervisor Del Contrato Sobre Cualquier Irregularidad Que Proponga En Desarrollo Del Contrato.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(89, '10', 'Asumir Todos Los Costos De Vicios Ocultos Del Contrato Que Surja De La Presente Necesidad', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(90, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Facturas', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(91, '10', 'El Contratista Debe Reponer O Sustituir Los Bienes Que No Cumplan Con Las Especificaciones De Calidad O Funcionamiento Requerido En Un Término De No Mayor A Un (1) Días Hábiles, Contados A Partir De La Comunicación Escrita Que Le Curse El Supervisor. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(92, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad De Lunes A Domingo (de 08:00 A 12:00 Y De 13:00 A 17:00 Horas), El Personal Y Vehículo Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(93, '10', 'Una Vez Suscrito El Contrato, El Contratista Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Número Telefónico, Celular ,telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva.', 'No Se Requirió Para Este Periodo', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(94, '10', 'Dotar Al Personal Manipulador De Alimentos Con Uniformes Conforme Lo Establecido En El Numeral 2 Del Art 14 De La Resolución 2674 De 2013.', 'Acta De Recibo A Satisfacción (no Se Presentó  Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(95, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas.', 'Facturas Y Parafiscales', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(96, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y  De Los Vehículos.', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(97, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentos, Por Lo Menos Una (01) Vez Al Año Y Allegar Copia De Los Mismos Al Contratante. ', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(98, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos De Acuerdo A Lo Establecido En El Artículo 13 De La Resolución 2674 De 2013  Y Allegar Copia De La Certificación De Los Mismas Al Contratante. ', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(99, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro Del Os Quince (15) Días Hábiles Posteriores Al Requerimiento.', 'No Se Requirió Para Este Periodo', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(100, '10', 'El Contratista Se Obliga A Recibir En Sus Instalaciones ( Establecimientos ), Al Personal Que La Entidad Designe Para Realizar Visita Técnica O Revista Para La Verificación De Las Mismas ', 'No Se Requirió Para Este Periodo', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(101, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción (no Se Presentó Novedad ', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(102, '10', 'El Contratista Se Obliga Para  Con La Agencia Logística A Realizar Las Publicaciones Y Aprobaciones Que Le Corresponden , En La Página De Contratación Estatal SECOP II, En Cuanto Pólizas, Facturación Y Demás Documentos Propios Del Proceso, En Los Tiempos Establecidos Para Ello Y De Acuerdo A Las Herramientas Establecidas Por Colombia Compra Eficiente.', 'En Trámite De Publicación ', '2020-08-10 01:25:09', '2020-08-10 01:25:09', 6),
(103, '10', 'Ejecutar El Objeto Del Contrato En óptimas Condiciones Y De Primera Calidad De Acuerdo A Las Especificaciones Técnicas Solicitadas En El Presente Documento.', 'Acta De Recibo A Satisfacción ', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(104, '10', 'Asumir Todos Los Costos De Vicio Ocultos Del Contrato Que Surja De La Presente Necesidad', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(105, '10', 'Entregar Al Supervisor Del Contrato Las Respectivas Facturas De La Entrega Del Bien.', 'Factura', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(106, '10', 'El Contratista Debe Reponer O Sustituir Los Bienes Que No Cumplan Con Las Especificaciones De Calidad O Funcionamiento Requerido En Un Término De No Mayor A Un (1) Días Hábiles, Contados A Partir De La Comunicación Escrita Que Le Curse El Supervisor. ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(107, '10', 'Entregar Los Bienes Objeto Del Presente Proceso Dentro De Las 24 Horas Siguientes Al Requerimiento Por Parte De La Entidad, De Lunes A Domingo (de 8:00 A 12:00 Y De 13:00 A 17:00 Horas), En El Caso De Los Requerimientos Relacionados Con El Producto LOS FRITOS Y TAMALES Se Entregan De Lunes A Domingo En El Horario De ( 04:00 A 06:00 Am), El Personal Y Vehículo Dispuestos Para La Entrega De Los Suministros Deberán Cumplir Con Los Requerimientos De Seguridad Y Registro Autorizado Para La Entrada A Cada Unidad Militar.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad )', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(108, '10', 'Una Vez Suscrito El Contrato, El Contratista Deberá Aportar Un Listado Que Contenga La Relación De Las Personas A Contactar Para Coordinar Los Pedidos, La Cual Debe Incluir Datos Tales Como Nombre, Numero Teléfono, Celular, Telefax, Correo Electrónico Y Cualquier Otro Dato Que Permita La Comunicación Rápida Y Efectiva ', 'No Se Requirió Para Este Periodo ', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(109, '10', 'Dotar Al Personal Manipular De Alimentos Con Uniforme Conforme Lo Establecido En El Numeral 2 Del Art 14 De La Resolución 2674 De 2013 ', 'Acta De Recibo A Satisfacción (no Se Presentó La Novedad)', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(110, '10', 'Entregar La Factura Original Debidamente Diligenciada Y Con Los Parafiscales Del Mes, Al Administrador Del Comedor Al Momento De Hacer La Entrega Del Pedido En Cada Uno De Los Comedores De Tropas.', 'Facturas Y Parafiscales', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(111, '10', 'Mantener Vigente Durante La Ejecución Del Contrato El Certificado De Inspección Sanitaria Del O Los Establecimientos De Comercio Y De Los Vehículos ', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad) ', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(112, '10', 'Practicar Exámenes Médicos A Los Manipuladores De Alimentaos Por Lo Menos (01) Vez Al Año Y Allegar Copia De La Cerficacion Medica Que Están Aptos Para La Manipulación De Alimentos Al Contratante', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(113, '10', 'Ejecutar Plan De Capacitación Dirigido A Los Manipuladores De Alimentos De Acuerdo A Lo Establecido En El  Art13 De La Resolución 2674 De 2013 Y Allegar Copia De La Certificación De Los Mimas Contratantes', 'Este Documento Fue Entregado En La Oferta Del Proveedor', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(114, '10', 'El Contratista Se Obliga A Entregar Toda La Documentación E Información Que No Tenga El Carácter De Reservado, Cuando La Entidad Lo Solicite, Dentro De Los Quince Días Hábiles Posteriores Al Requerimiento.', 'No Se Requirió Para Este Periodo', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(115, '10', 'Comprometerse A Mantener La Materia Prima Y/o Los Productos A Suministrar Bajo Las Buenas Prácticas De Almacenamiento, Sin Exponerlos Al Contacto Con Productos O Sustancias Químicas O Naturales Contaminantes Que Alteren Su Calidad E Inocuidad, Conservarlos En Un Ambiente Con Temperatura Adecuada, A Que El Empaque O Embalaje Están Fabricados Con Materiales Que Garanticen La Inocuidad Del Alimento, Que Son Adecuados Y Confieren Protección Contra La Contaminación.', 'Acta De Recibo A Satisfacción ( No Se Presentó Novedad)', '2020-08-10 01:37:51', '2020-08-10 01:37:51', 4),
(116, '10', 'El Oferente Deberá Cumplir Con La Normativa Aplicable En Seguridad Y Salud En El Trabajo En Todo Lo Referente A La Implementación De Sistemas De Gestión De Seguridad Y Salud En El Trabajo SG-SST- Y Efectuar Los Controles Respectivos Que Permitan Prevenir Accidentes Propios Del Contrato De Sus Trabajadores Y En General Al Personal Que Designe Para El Desarrollo Y Cumplimiento Del Mismo Dicho Cumplimiento Será Objeto De Verificación Permanente Por Parte De La Entidad. ', 'Se Solicitó Por Correo El Cumplimiento De Esta Obligación ', '2020-08-10 01:37:52', '2020-08-10 01:37:52', 4),
(117, '10', 'Presentar Certificación Expedido Por El Representante Legar O Revisor Fiscal Del Cumplimiento Del Sistema De Gestión De Seguridad Y Salud En El Trabajo SGSS-', 'No Se Requirió Para Este Periodo', '2020-08-10 01:37:52', '2020-08-10 01:37:52', 4),
(118, '10', 'El Contratista Se Obliga Para Con La Agencia Logística A Realizar Las Publicaciones Y/o Aprobaciones Que Le Corresponden, En La Página De Contratación Estatal SECOP II, En Cuanto A Pólizas, Facturación Y Demás Documentos Propios Del Proceso, En Los Tiempos Establecidos Para Ello Y De Acuerdo A Los Lineamientos Establecido Por Colombia Compra Eficiente Establecido Por Colombia Compra Eficiente. ', 'En  Trámite De Publicación Facturas ', '2020-08-10 01:37:52', '2020-08-10 01:37:52', 4),
(119, '10', 'Aprobación (el Contratista Debe Aportar En La Plataforma Tanto El Contrato Como Las Modificaciones Y El Acta De Liquidación Que Publique La Entidad Contratante Con El Fin De Finalizar Cada Etapa Y Dar Cumplimiento A Lo Establecido En Las Guías De Colombia Compra Eficiente', 'No Se Requirió Para Este Periodo', '2020-08-10 01:37:52', '2020-08-10 01:37:52', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obliga_pagos`
--

CREATE TABLE `obliga_pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numeral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obligacion_deta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entregable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mes_ejecucion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pago_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_pago` date NOT NULL,
  `total` double(10,2) NOT NULL,
  `saldo_viene` double(10,2) NOT NULL,
  `gran_total` double(15,2) NOT NULL,
  `pago_corresponde_mes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `porcentaje_cumplimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mes_ejecucion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consecu_informe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_plazoeje` date DEFAULT NULL,
  `registroadicion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_director` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nitproveedor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digver` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reprelegal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuenta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoper` enum('Juridica','Natural') COLLATE utf8mb4_unicode_ci NOT NULL,
  `regimensimpli` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `nombre`, `nitproveedor`, `digver`, `email`, `telefono`, `direccion`, `reprelegal`, `contacto`, `cuenta`, `tipoper`, `regimensimpli`, `created_at`, `updated_at`) VALUES
(1, 'ESTELA ISABEL YANCE SILVA', '574470419', NULL, 'esyansil@hotmail.com', '(5)4130100', 'Calle 3 No. 11-49 Fundación Magdalena', 'ESTELA ISABEL YANCE SILVA', NULL, NULL, 'Juridica', 0, '2020-08-09 16:33:55', '2020-08-09 16:33:55'),
(2, 'LUDYS ESTHER ASCANIO ROPERO', '49774270', NULL, 'ludysascanio@hotmail.com ', '3798850-3793542', 'kra 41 No54 - 68 B/quilla', 'LUDYS ESTHER ASCANIO ROPERO', NULL, NULL, 'Juridica', 0, '2020-08-09 16:43:55', '2020-08-09 16:55:37'),
(3, 'JAVIER OSVALDO RAMIREZ MARTINEZ S A S', '9011081453', NULL, 'contratosjavierramirez@gmail.com', '3157421629', 'CALLE 10 22 B 51 BRR GUAYABAL COVEÑAS SUCRE', 'JAVIER OSVALDO RAMÍREZ MARTÍNEZ', NULL, NULL, 'Juridica', 0, '2020-08-09 16:48:14', '2020-08-09 16:49:44'),
(4, 'LSI LIDER SPORT S.A.S', '9002665839', NULL, 'ovega@parquedelson.org', '3457293-3003112787', 'CARRA 39 No 73 - 105 Bquilla', 'CARLOS JAVIER BOLIVAR MENESES', NULL, NULL, 'Juridica', 0, '2020-08-09 16:53:40', '2020-08-09 16:53:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgos`
--

CREATE TABLE `riesgos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tratamiento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodicidad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `riesgos`
--

INSERT INTO `riesgos` (`id`, `tipo`, `descripcion`, `tratamiento`, `responsable`, `periodicidad`, `created_at`, `updated_at`, `contrato_id`) VALUES
(1, 'Operacional', 'La Existencia De Procesos, Procedimientos Y Parametros Inadecuados, Equipos Humanos O Tecnicos Que Impidan El Cimplimiento Oportuno Del Objeto', 'Verificar Minuciosamente Los Estudios De Mercado Y Solicitar Mayor Numero De Cotizaciones', 'Entidad Estatal', 'Deacuerdo A La Necesidad', '2020-08-09 18:32:38', '2020-08-09 18:32:38', 1),
(2, 'Economico', 'Los Efectos Favorables Y Desfavorables De La Alteracion De Las Condiciones De Financiacion Como Consecuencia De La Variacion En El Entorno Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo', 'Entidad Estatal', 'Ante Cualquier Novedad', '2020-08-09 18:33:45', '2020-08-09 18:33:45', 1),
(3, 'Operacional', 'Los Efectos Favorables Derivados De La Fluctuacion En Los Precios Del Mercado De Los Materiales, Insumos, Mano De Obra, Entre Otros, Que Sean Necesarios Para La Ejecucion Del Contrato', 'Trasladar El Riesgo Exigiendo La Garantia Unica Del Cumplimiento', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-09 18:35:02', '2020-08-09 18:35:02', 1),
(4, 'Operacional', 'Costos Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo Y Darle El Manejo Adecuado', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-09 18:35:58', '2020-08-09 18:35:58', 1),
(5, 'Operacional', 'Cambio De Las Politicas Gubernamentales Que Sean Probables Y Previsibles, Tales Como Cambios En La Stituacion Politica, Sistema De Gobierno Y Cambio En Las Condiciones Sociales Que Tengan Impacto En La Ejecucion Del Contrato', 'Verificacion De Los Cambios En Las Politicas ', 'Contratista', 'En El Evento Que Se Presente', '2020-08-09 18:36:52', '2020-08-09 18:36:52', 1),
(6, 'Economico', 'Presentacion De Ofertas Arficialmemte Bajas', 'Analizar Estudio De Mercado Que Demuestre Si Los Precios Son Artificialmente Bajos Y De Ser Asi Requerir Al Proponente Para Que Explique Y Demuestre Porque Sostiene Esos Precios, Requerir Al Oferente Para Que Explique Las Razones Que Sustenten El Valor Por Ofertado', 'Comité Evaluador Respectivo', 'Previo A La Adjudicacion', '2020-08-09 18:38:14', '2020-08-09 18:38:14', 1),
(7, 'Operacional', 'Reclamos De Terceros Sobre La Selección Del Oferente Que Retrasen Ek Perfeccionamiento Del Contrato', 'Responder Y Aclarar En El Menor Tiempo Posible Las Observaciones Presentadas', 'Grupo De Contratos', 'Previo A La Adjudicacion', '2020-08-09 18:39:10', '2020-08-09 18:39:10', 1),
(8, 'Operacional', 'Debido Proceso Por Cumplimiento Parcial O Total O Mora En El Suministro De Los Bienes', 'Supervisor Del Contrato Eleva Informe Del Incumplimiento O Mora Y La Entidad Cita A Audiencia De Que Trata El Articulo 86 De La Ley 1474 De 2011 Para Adelantar Debido Proceso Para Imposicion De Multas Y/o Sanciones Al Contratista', 'Entidad', 'Informe De Supervicion', '2020-08-09 18:39:58', '2020-08-09 18:39:58', 1),
(10, 'Operacional', 'La Existencia De Procesos, Procedimientos Y Parametros Inadecuados, Equipos Humanos O Tecnicos Que Impidan El Cimplimiento Oportuno Del Objeto', 'Verificar Minuciosamente Los Estudios De Mercado Y Solicitar Mayor Numero De Cotizaciones', 'Entidad Estatal', 'Deacuerdo A La Necesidad', '2020-08-09 21:23:58', '2020-08-09 21:23:58', 2),
(11, 'Economico', 'Los Efectos Favorables Y Desfavorables De La Alteracion De Las Condiciones De Financiacion Como Consecuencia De La Variacion En El Entorno Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo', 'Entidad Estatal', 'Ante Cualquier Novedad', '2020-08-09 21:23:58', '2020-08-09 21:23:58', 2),
(12, 'Operacional', 'Los Efectos Favorables Derivados De La Fluctuacion En Los Precios Del Mercado De Los Materiales, Insumos, Mano De Obra, Entre Otros, Que Sean Necesarios Para La Ejecucion Del Contrato', 'Trasladar El Riesgo Exigiendo La Garantia Unica Del Cumplimiento', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-09 21:23:58', '2020-08-09 21:23:58', 2),
(13, 'Operacional', 'Costos Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo Y Darle El Manejo Adecuado', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-09 21:23:58', '2020-08-09 21:23:58', 2),
(14, 'Operacional', 'Cambio De Las Politicas Gubernamentales Que Sean Probables Y Previsibles, Tales Como Cambios En La Stituacion Politica, Sistema De Gobierno Y Cambio En Las Condiciones Sociales Que Tengan Impacto En La Ejecucion Del Contrato', 'Verificacion De Los Cambios En Las Politicas ', 'Contratista', 'En El Evento Que Se Presente', '2020-08-09 21:23:59', '2020-08-09 21:23:59', 2),
(15, 'Economico', 'Presentacion De Ofertas Arficialmemte Bajas', 'Analizar Estudio De Mercado Que Demuestre Si Los Precios Son Artificialmente Bajos Y De Ser Asi Requerir Al Proponente Para Que Explique Y Demuestre Porque Sostiene Esos Precios, Requerir Al Oferente Para Que Explique Las Razones Que Sustenten El Valor Por Ofertado', 'Comité Evaluador Respectivo', 'Previo A La Adjudicacion', '2020-08-09 21:23:59', '2020-08-09 21:23:59', 2),
(16, 'Operacional', 'Reclamos De Terceros Sobre La Selección Del Oferente Que Retrasen Ek Perfeccionamiento Del Contrato', 'Responder Y Aclarar En El Menor Tiempo Posible Las Observaciones Presentadas', 'Grupo De Contratos', 'Previo A La Adjudicacion', '2020-08-09 21:23:59', '2020-08-09 21:23:59', 2),
(17, 'Operacional', 'Debido Proceso Por Cumplimiento Parcial O Total O Mora En El Suministro De Los Bienes', 'Supervisor Del Contrato Eleva Informe Del Incumplimiento O Mora Y La Entidad Cita A Audiencia De Que Trata El Articulo 86 De La Ley 1474 De 2011 Para Adelantar Debido Proceso Para Imposicion De Multas Y/o Sanciones Al Contratista', 'Entidad', 'Informe De Supervicion', '2020-08-09 21:23:59', '2020-08-09 21:23:59', 2),
(18, 'Operacional', 'La Existencia De Procesos, Procedimientos Y Parametros Inadecuados, Equipos Humanos O Tecnicos Que Impidan El Cimplimiento Oportuno Del Objeto', 'Verificar Minuciosamente Los Estudios De Mercado Y Solicitar Mayor Numero De Cotizaciones', 'Entidad Estatal', 'Deacuerdo A La Necesidad', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(19, 'Economico', 'Los Efectos Favorables Y Desfavorables De La Alteracion De Las Condiciones De Financiacion Como Consecuencia De La Variacion En El Entorno Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo', 'Entidad Estatal', 'Ante Cualquier Novedad', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(20, 'Operacional', 'Los Efectos Favorables Derivados De La Fluctuacion En Los Precios Del Mercado De Los Materiales, Insumos, Mano De Obra, Entre Otros, Que Sean Necesarios Para La Ejecucion Del Contrato', 'Trasladar El Riesgo Exigiendo La Garantia Unica Del Cumplimiento', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(21, 'Operacional', 'Costos Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo Y Darle El Manejo Adecuado', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(22, 'Operacional', 'Cambio De Las Politicas Gubernamentales Que Sean Probables Y Previsibles, Tales Como Cambios En La Stituacion Politica, Sistema De Gobierno Y Cambio En Las Condiciones Sociales Que Tengan Impacto En La Ejecucion Del Contrato', 'Verificacion De Los Cambios En Las Politicas ', 'Contratista', 'En El Evento Que Se Presente', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(23, 'Economico', 'Presentacion De Ofertas Arficialmemte Bajas', 'Analizar Estudio De Mercado Que Demuestre Si Los Precios Son Artificialmente Bajos Y De Ser Asi Requerir Al Proponente Para Que Explique Y Demuestre Porque Sostiene Esos Precios, Requerir Al Oferente Para Que Explique Las Razones Que Sustenten El Valor Por Ofertado', 'Comité Evaluador Respectivo', 'Previo A La Adjudicacion', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(24, 'Operacional', 'Reclamos De Terceros Sobre La Selección Del Oferente Que Retrasen Ek Perfeccionamiento Del Contrato', 'Responder Y Aclarar En El Menor Tiempo Posible Las Observaciones Presentadas', 'Grupo De Contratos', 'Previo A La Adjudicacion', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(25, 'Operacional', 'Debido Proceso Por Cumplimiento Parcial O Total O Mora En El Suministro De Los Bienes', 'Supervisor Del Contrato Eleva Informe Del Incumplimiento O Mora Y La Entidad Cita A Audiencia De Que Trata El Articulo 86 De La Ley 1474 De 2011 Para Adelantar Debido Proceso Para Imposicion De Multas Y/o Sanciones Al Contratista', 'Entidad', 'Informe De Supervicion', '2020-08-09 22:51:39', '2020-08-09 22:51:39', 3),
(26, 'Operacional', 'La Existencia De Procesos, Procedimientos Y Parametros Inadecuados, Equipos Humanos O Tecnicos Que Impidan El Cimplimiento Oportuno Del Objeto', 'Verificar Minuciosamente Los Estudios De Mercado Y Solicitar Mayor Numero De Cotizaciones', 'Entidad Estatal', 'Deacuerdo A La Necesidad', '2020-08-10 01:18:00', '2020-08-10 01:18:00', 5),
(27, 'Economico', 'Los Efectos Favorables Y Desfavorables De La Alteracion De Las Condiciones De Financiacion Como Consecuencia De La Variacion En El Entorno Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo', 'Entidad Estatal', 'Ante Cualquier Novedad', '2020-08-10 01:18:00', '2020-08-10 01:18:00', 5),
(28, 'Operacional', 'Los Efectos Favorables Derivados De La Fluctuacion En Los Precios Del Mercado De Los Materiales, Insumos, Mano De Obra, Entre Otros, Que Sean Necesarios Para La Ejecucion Del Contrato', 'Trasladar El Riesgo Exigiendo La Garantia Unica Del Cumplimiento', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-10 01:18:00', '2020-08-10 01:18:00', 5),
(29, 'Operacional', 'Costos Del Mercado', 'El Contratista Debe Asumir La Totalidad Del Riesgo Y Darle El Manejo Adecuado', 'Entidad Estatal ', 'Ante Cualquier Novedad', '2020-08-10 01:18:00', '2020-08-10 01:18:00', 5),
(30, 'Operacional', 'Cambio De Las Politicas Gubernamentales Que Sean Probables Y Previsibles, Tales Como Cambios En La Stituacion Politica, Sistema De Gobierno Y Cambio En Las Condiciones Sociales Que Tengan Impacto En La Ejecucion Del Contrato', 'Verificacion De Los Cambios En Las Politicas ', 'Contratista', 'En El Evento Que Se Presente', '2020-08-10 01:18:01', '2020-08-10 01:18:01', 5),
(31, 'Economico', 'Presentacion De Ofertas Arficialmemte Bajas', 'Analizar Estudio De Mercado Que Demuestre Si Los Precios Son Artificialmente Bajos Y De Ser Asi Requerir Al Proponente Para Que Explique Y Demuestre Porque Sostiene Esos Precios, Requerir Al Oferente Para Que Explique Las Razones Que Sustenten El Valor Por Ofertado', 'Comité Evaluador Respectivo', 'Previo A La Adjudicacion', '2020-08-10 01:18:01', '2020-08-10 01:18:01', 5),
(32, 'Operacional', 'Reclamos De Terceros Sobre La Selección Del Oferente Que Retrasen Ek Perfeccionamiento Del Contrato', 'Responder Y Aclarar En El Menor Tiempo Posible Las Observaciones Presentadas', 'Grupo De Contratos', 'Previo A La Adjudicacion', '2020-08-10 01:18:01', '2020-08-10 01:18:01', 5),
(33, 'Operacional', 'Debido Proceso Por Cumplimiento Parcial O Total O Mora En El Suministro De Los Bienes', 'Supervisor Del Contrato Eleva Informe Del Incumplimiento O Mora Y La Entidad Cita A Audiencia De Que Trata El Articulo 86 De La Ley 1474 De 2011 Para Adelantar Debido Proceso Para Imposicion De Multas Y/o Sanciones Al Contratista', 'Entidad', 'Informe De Supervicion', '2020-08-10 01:18:01', '2020-08-10 01:18:01', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgo_pagos`
--

CREATE TABLE `riesgo_pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tratamiento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodicidad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pago_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubrocontratos`
--

CREATE TABLE `rubrocontratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `valorrubro` double(20,2) DEFAULT NULL,
  `saldo` double(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contrato_id` bigint(20) UNSIGNED NOT NULL,
  `rubroprin_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rubrocontratos`
--

INSERT INTO `rubrocontratos` (`id`, `valorrubro`, `saldo`, `created_at`, `updated_at`, `contrato_id`, `rubroprin_id`) VALUES
(1, NULL, NULL, '2020-08-09 18:48:52', '2020-08-09 18:48:52', 1, 14),
(2, NULL, NULL, '2020-08-09 18:50:56', '2020-08-09 18:50:56', 1, 1),
(3, NULL, NULL, '2020-08-09 22:56:19', '2020-08-09 22:56:19', 2, 14),
(4, NULL, NULL, '2020-08-09 22:58:57', '2020-08-09 22:58:57', 2, 15),
(5, NULL, NULL, '2020-08-09 22:59:54', '2020-08-09 22:59:54', 2, 13),
(6, NULL, NULL, '2020-08-09 23:01:10', '2020-08-09 23:01:10', 2, 16),
(7, NULL, NULL, '2020-08-09 23:03:28', '2020-08-09 23:03:28', 2, 1),
(8, NULL, NULL, '2020-08-09 23:04:39', '2020-08-09 23:04:39', 2, 2),
(9, NULL, NULL, '2020-08-09 23:14:22', '2020-08-09 23:14:22', 3, 14),
(10, NULL, NULL, '2020-08-09 23:15:26', '2020-08-09 23:15:26', 3, 15),
(11, NULL, NULL, '2020-08-09 23:16:45', '2020-08-09 23:16:45', 3, 13),
(12, NULL, NULL, '2020-08-09 23:17:21', '2020-08-09 23:17:21', 3, 16),
(13, NULL, NULL, '2020-08-09 23:19:24', '2020-08-09 23:19:24', 3, 1),
(14, NULL, NULL, '2020-08-10 00:49:42', '2020-08-10 00:49:42', 7, 13),
(15, NULL, NULL, '2020-08-10 01:00:53', '2020-08-10 01:00:53', 5, 14),
(16, NULL, NULL, '2020-08-10 01:26:25', '2020-08-10 01:26:25', 6, 13),
(17, NULL, NULL, '2020-08-10 01:40:06', '2020-08-10 01:40:06', 4, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubroprins`
--

CREATE TABLE `rubroprins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo_rubro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_rubro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rubroprins`
--

INSERT INTO `rubroprins` (`id`, `codigo_rubro`, `nombre_rubro`, `created_at`, `updated_at`) VALUES
(1, 'A-05-01-01-000-001', 'PRODUCTOS DE LA AGRICULTURA Y LA HORTICULTURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'A-05-01-01-000-002', 'ANIMALES VIVOS Y PRODUCTOS ANIMALES (EXCEPTO LA CARNE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'A-05-01-01-000-003', 'PRODUCTOS DE LA SILVICULTURA Y DE LA EXPLOTACION FORESTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'A-05-01-01-000-004', 'PESCADO Y OTROS PRODUCTOS DE LA PESCA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'A-05-01-01-001-001', 'CARBON DE HULLA, LIGNITO Y TURBA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'A-05-01-01-001-002', 'PETROLEO CRUDO Y GAS NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'A-05-01-01-001-003', 'MINERALES Y CONCENTRADOS DE URANIO Y TORIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'A-05-01-01-001-004', 'MINERALES METALICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'A-05-01-01-001-005', 'PIEDRA, ARENA Y ARCILLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'A-05-01-01-001-006', 'OTROS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'A-05-01-01-001-007', 'ELECTRICIDAD, GAS DE CIUDAD, VAPOR Y AGUA CALIENTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'A-05-01-01-001-008', 'AGUA NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'A-05-01-01-002-001', 'CARNE, PESCADO, FRUTAS, HORTALIZAS, ACEITES Y GRASAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'A-05-01-01-002-002', 'PRODUCTOS LACTEOS Y OVOPRODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'A-05-01-01-002-003', 'PRODUCTOS DE MOLINERIA, ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDON OTROS PRODUCTOS ALIMENTICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'A-05-01-01-002-004', 'BEBIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'A-05-01-01-002-005', 'PRODUCTOS DE TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'A-05-01-01-002-006', 'HILADOS E HILOS TEJIDOS DE FIBRAS TEXTILES INCLUSO AFELPADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'A-05-01-01-002-007', 'ARTICULOS TEXTILES (EXCEPTO PRENDAS DE VESTIR)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'A-05-01-01-002-008', 'TEJIDO DE PUNTO O GANCHILLO PRENDAS DE VESTIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'A-05-01-01-002-009', 'CUERO Y PRODUCTOS DE CUERO CALZADO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'A-05-01-01-003-001', 'PRODUCTOS DE MADERA, CORCHO, CESTERIA Y ESPARTERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'A-05-01-01-003-002', 'PASTA O PULPA, PAPEL Y PRODUCTOS DE PAPEL IMPRESOS Y ARTICULOS RELACIONADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'A-05-01-01-003-003', 'PRODUCTOS DE HORNOS DE COQUE PRODUCTOS DE REFINACION DE PETROLEO Y COMBUSTIBLE NUCLEAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'A-05-01-01-003-004', 'QUIMICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'A-05-01-01-003-005', 'OTROS PRODUCTOS QUIMICOS FIBRAS ARTIFICIALES (O FIBRAS INDUSTRIALES HECHAS POR EL HOMBRE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'A-05-01-01-003-006', 'PRODUCTOS DE CAUCHO Y PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'A-05-01-01-003-007', 'VIDRIO Y PRODUCTOS DE VIDRIO Y OTROS PRODUCTOS NO METALICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'A-05-01-01-003-008', 'MUEBLES OTROS BIENES TRANSPORTABLES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'A-05-01-01-003-009', 'DESPERDICIOS DESECHOS Y RESIDUOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'A-05-01-01-004-001', 'METALES BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'A-05-01-01-004-002', 'PRODUCTOS METALICOS ELABORADOS (EXCEPTO MAQUINARIA Y EQUIPO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'A-05-01-01-004-003', 'MAQUINARIA PARA USO GENERAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'A-05-01-01-004-004', 'MAQUINARIA PARA USOS ESPECIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'A-05-01-01-004-005', 'MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'A-05-01-01-004-006', 'MAQUINARIA Y APARATOS ELECTRICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'A-05-01-01-004-007', 'EQUIPO Y APARATOS DE RADIO, TELEVISION Y COMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'A-05-01-01-004-008', 'APARATOS MEDICOS, INSTRUMENTOS OPTICOS Y DE PRECISION, RELOJES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'A-05-01-01-004-009', 'EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'A-05-01-02-005-004', 'SERVICIOS DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'A-05-01-02-006-001', 'SERVICIOS DE VENTA AL POR MAYOR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'A-05-01-02-006-002', 'SERVICIOS DE VENTA AL POR MENOR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'A-05-01-02-006-003', 'ALOJAMIENTO SERVICIOS DE SUMINISTROS DE COMIDAS Y BEBIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'A-05-01-02-006-004', 'SERVICIOS DE TRANSPORTE DE PASAJEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'A-05-01-02-006-005', 'SERVICIOS DE TRANSPORTE DE CARGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'A-05-01-02-006-006', 'SERVICIOS DE ALQUILER DE VEHICULOS DE TRANSPORTE CON OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'A-05-01-02-006-007', 'SERVICIOS DE APOYO AL TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'A-05-01-02-006-008', 'SERVICIOS POSTALES Y DE MENSAJERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'A-05-01-02-006-009', 'SERVICIOS DE DISTRIBUCION DE ELECTRICIDAD, GAS Y AGUA (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'A-05-01-02-007-001', 'SERVICIOS FINANCIEROS Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'A-05-01-02-007-002', 'SERVICIOS INMOBILIARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'A-05-01-02-007-003', 'SERVICIOS DE ARRENDAMIENTO O ALQUILER SIN OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'A-05-01-02-008-001', 'SERVICIOS DE INVESTIGACION Y DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'A-05-01-02-008-002', 'SERVICIOS JURIDICOS Y CONTABLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'A-05-01-02-008-003', 'OTROS SERVICIOS PROFESIONALES, CIENTIFICOS Y TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'A-05-01-02-008-004', 'SERVICIOS DE TELECOMUNICACIONES, TRANSMISION Y SUMINISTRO DE INFORMACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'A-05-01-02-008-005', 'SERVICIOS DE SOPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'A-05-01-02-008-006', 'SERVICIOS DE APOYO A LA AGRICULTURA, LA CAZA, LA SILVICULTURA, LA PESCA, LA MINERIA Y LOS SERVICIOS PUBLICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'A-05-01-02-008-007', 'SERVICIOS DE MANTENIMIENTO, REPARACION E INSTALACION (EXCEPTO SERVICIOS DE CONSTRUCCION)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'A-05-01-02-008-008', 'SERVICIOS DE FABRICACION DE INSUMOS FISICOS QUE SON PROPIEDAD DE OTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'A-05-01-02-008-009', 'OTROS SERVICIOS DE FABRICACION SERVICIOS DE EDICION, IMPRESION Y REPRODUCCION SERVICIOS DE RECUPERACION DE MATERIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'A-05-01-02-009-002', 'SERVICIOS DE EDUCACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'A-05-01-02-009-003', 'SERVICIOS PARA EL CUIDADO DE LA SALUD HUMANA Y SERVICIOS SOCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'A-05-01-02-009-004', 'SERVICIOS DE ALCANTARILLADO, RECOLECCION, TRATAMIENTO Y DISPOSICION DE DESECHOS Y OTROS SERVICIOS DE SANEAMIENTO AMBIENTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'A-05-01-02-009-006', 'SERVICIOS DE ESPARCIMIENTO, CULTURALES Y DEPORTIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'A-05-01-02-009-007', 'OTROS SERVICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'A-05-01-02-009-009', 'SERVICIOS PRESTADOS POR ORGANIZACIONES Y ORGANISMOS EXTRATERRITORIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'A-02-01-01-001-001', 'VIVIENDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'A-02-01-01-001-002', 'EDIFICIOS DISTINTOS A VIVIENDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'A-02-01-01-001-003', 'OTRAS ESTRUCTURAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'A-02-01-01-001-004', 'MEJORAS DE TIERRAS Y TERRENOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'A-02-01-01-002-001', 'BUQUES DE GUERRA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'A-02-01-01-002-002', 'SUBMARINOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'A-02-01-01-002-003', 'AERONAVES MILITARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'A-02-01-01-002-004', 'TANQUES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'A-02-01-01-002-005', 'DISPOSITIVOS DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'A-02-01-01-002-006', 'LANZA MISILES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'A-02-01-01-002-007', 'OTROS SISTEMAS DE ARMAMENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'A-02-01-01-003-008', 'MUEBLES, INSTRUMENTOS MUSICALES, ARTICULOS DE DEPORTE Y ANTIG?EDADES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'A-02-01-01-004-003', 'MAQUINARIA PARA USO GENERAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'A-02-01-01-004-004', 'MAQUINARIA PARA USOS ESPECIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'A-02-01-01-004-005', 'MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'A-02-01-01-004-006', 'MAQUINARIA Y APARATOS ELECTRICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'A-02-01-01-004-007', 'EQUIPO Y APARATOS DE RADIO, TELEVISION Y COMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'A-02-01-01-004-008', 'APARATOS MEDICOS, INSTRUMENTOS OPTICOS Y DE PRECISION, RELOJES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'A-02-01-01-004-009', 'EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'A-02-01-01-004-010', 'EQUIPO MILITAR Y POLICIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'A-02-01-01-006-001', 'RECURSOS BIOLOGICOS CULTIVADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'A-02-01-01-006-002', 'PRODUCTOS DE LA PROPIEDAD INTELECTUAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'A-02-01-02-003-008', 'JOYAS, METALES PRECIOSOS Y ANTIG?EDADES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'A-02-02-01-000-001', 'PRODUCTOS DE LA AGRICULTURA Y LA HORTICULTURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'A-02-02-01-000-002', 'ANIMALES VIVOS Y PRODUCTOS ANIMALES (EXCEPTO LA CARNE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'A-02-02-01-000-003', 'PRODUCTOS DE LA SILVICULTURA Y DE LA EXPLOTACION FORESTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'A-02-02-01-000-004', 'PESCADO Y OTROS PRODUCTOS DE LA PESCA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'A-02-02-01-001-001', 'CARBON DE HULLA, LIGNITO Y TURBA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'A-02-02-01-001-002', 'PETROLEO CRUDO Y GAS NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'A-02-02-01-001-003', 'MINERALES Y CONCENTRADOS DE URANIO Y TORIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'A-02-02-01-001-004', 'MINERALES METALICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'A-02-02-01-001-005', 'PIEDRA, ARENA Y ARCILLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'A-02-02-01-001-006', 'OTROS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'A-02-02-01-001-007', 'ELECTRICIDAD, GAS DE CIUDAD, VAPOR Y AGUA CALIENTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'A-02-02-01-001-008', 'AGUA NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'A-02-02-01-002-001', 'CARNE, PESCADO, FRUTAS, HORTALIZAS, ACEITES Y GRASAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'A-02-02-01-002-002', 'PRODUCTOS LACTEOS Y OVOPRODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'A-02-02-01-002-003', 'PRODUCTOS DE MOLINERIA, ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDON OTROS PRODUCTOS ALIMENTICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'A-02-02-01-002-004', 'BEBIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'A-02-02-01-002-005', 'PRODUCTOS DE TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'A-02-02-01-002-006', 'HILADOS E HILOS TEJIDOS DE FIBRAS TEXTILES INCLUSO AFELPADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'A-02-02-01-002-007', 'ARTICULOS TEXTILES (EXCEPTO PRENDAS DE VESTIR)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'A-02-02-01-002-008', 'DOTACION (PRENDAS DE VESTIR Y CALZADO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'A-02-02-01-003-001', 'PRODUCTOS DE MADERA, CORCHO, CESTERIA Y ESPARTERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'A-02-02-01-003-002', 'PASTA O PULPA, PAPEL Y PRODUCTOS DE PAPEL IMPRESOS Y ARTICULOS RELACIONADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'A-02-02-01-003-003', 'PRODUCTOS DE HORNOS DE COQUE PRODUCTOS DE REFINACION DE PETROLEO Y COMBUSTIBLE NUCLEAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'A-02-02-01-003-004', 'QUIMICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'A-02-02-01-003-005', 'OTROS PRODUCTOS QUIMICOS FIBRAS ARTIFICIALES (O FIBRAS INDUSTRIALES HECHAS POR EL HOMBRE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'A-02-02-01-003-006', 'PRODUCTOS DE CAUCHO Y PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'A-02-02-01-003-007', 'VIDRIO Y PRODUCTOS DE VIDRIO Y OTROS PRODUCTOS NO METALICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'A-02-02-01-003-008', 'OTROS BIENES TRANSPORTABLES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'A-02-02-01-004-001', 'METALES BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'A-02-02-01-004-002', 'PRODUCTOS METALICOS ELABORADOS (EXCEPTO MAQUINARIA Y EQUIPO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'A-02-02-01-004-003', 'MAQUINARIA PARA USO GENERAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'A-02-02-01-004-004', 'MAQUINARIA PARA USOS ESPECIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'A-02-02-01-004-005', 'MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'A-02-02-01-004-006', 'MAQUINARIA Y APARATOS ELECTRICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'A-02-02-01-004-007', 'PAQUETES DE SOFTWARE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'A-02-02-01-004-008', 'APARATOS MEDICOS, INSTRUMENTOS OPTICOS Y DE PRECISION, RELOJES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'A-02-02-01-004-009', 'EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'A-02-02-01-010-001', 'MUNICIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'A-02-02-01-010-002', 'MISILES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'A-02-02-01-010-003', 'COHETES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'A-02-02-01-010-004', 'BOMBAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'A-02-02-01-010-005', 'OTROS ELEMENTOS MILITARES DE UN SOLO USO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'A-02-02-02-005-004', 'SERVICIOS DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'A-02-02-02-006-003', 'ALOJAMIENTO SERVICIOS DE SUMINISTROS DE COMIDAS Y BEBIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'A-02-02-02-006-004', 'SERVICIOS DE TRANSPORTE DE PASAJEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'A-02-02-02-006-005', 'SERVICIOS DE TRANSPORTE DE CARGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'A-02-02-02-006-006', 'SERVICIOS DE ALQUILER DE VEHICULOS DE TRANSPORTE CON OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'A-02-02-02-006-007', 'SERVICIOS DE APOYO AL TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'A-02-02-02-006-008', 'SERVICIOS POSTALES Y DE MENSAJERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'A-02-02-02-006-009', 'SERVICIOS DE DISTRIBUCION DE ELECTRICIDAD, GAS Y AGUA (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'A-02-02-02-007-001', 'SERVICIOS FINANCIEROS Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'A-02-02-02-007-002', 'SERVICIOS INMOBILIARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'A-02-02-02-007-003', 'SERVICIOS DE ARRENDAMIENTO O ALQUILER SIN OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'A-02-02-02-008-001', 'SERVICIOS DE INVESTIGACION Y DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'A-02-02-02-008-002', 'SERVICIOS JURIDICOS Y CONTABLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'A-02-02-02-008-003', 'OTROS SERVICIOS PROFESIONALES, CIENTIFICOS Y TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'A-02-02-02-008-004', 'SERVICIOS DE TELECOMUNICACIONES, TRANSMISION Y SUMINISTRO DE INFORMACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'A-02-02-02-008-005', 'SERVICIOS DE SOPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'A-02-02-02-008-006', 'SERVICIOS DE APOYO A LA AGRICULTURA, LA CAZA, LA SILVICULTURA, LA PESCA, LA MINERIA Y LOS SERVICIOS PUBLICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'A-02-02-02-008-007', 'SERVICIOS DE MANTENIMIENTO, REPARACION E INSTALACION (EXCEPTO SERVICIOS DE CONSTRUCCION)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'A-02-02-02-008-008', 'SERVICIOS DE FABRICACION DE INSUMOS FISICOS QUE SON PROPIEDAD DE OTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'A-02-02-02-008-009', 'OTROS SERVICIOS DE FABRICACION SERVICIOS DE EDICION, IMPRESION Y REPRODUCCION SERVICIOS DE RECUPERACION DE MATERIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'A-02-02-02-009-002', 'SERVICIOS DE EDUCACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'A-02-02-02-009-003', 'SERVICIOS PARA EL CUIDADO DE LA SALUD HUMANA Y SERVICIOS SOCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'A-02-02-02-009-004', 'SERVICIOS DE ALCANTARILLADO, RECOLECCION, TRATAMIENTO Y DISPOSICION DE DESECHOS Y OTROS SERVICIOS DE SANEAMIENTO AMBIENTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'A-02-02-02-009-005', 'SERVICIOS DE ASOCIACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'A-02-02-02-009-006', 'SERVICIOS DE ESPARCIMIENTO, CULTURALES Y DEPORTIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'A-02-02-02-009-007', 'OTROS SERVICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'A-02-02-02-009-009', 'SERVICIOS PRESTADOS POR ORGANIZACIONES Y ORGANISMOS EXTRATERRITORIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE `rubros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombrerubro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontratos`
--

CREATE TABLE `tipocontratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombretipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipocontratos`
--

INSERT INTO `tipocontratos` (`id`, `nombretipo`, `created_at`, `updated_at`) VALUES
(1, 'Licitacion Publica', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(2, 'Seleccion Abreviada (subasta Inversa)', '2020-08-09 16:25:07', '2020-08-09 19:11:53'),
(3, 'Concurso De Meritos', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(4, 'Contratacion Directa', '2020-08-09 16:25:07', '2020-08-09 16:25:07'),
(5, 'Minima Cuantia', '2020-08-09 16:25:07', '2020-08-09 16:25:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dependencia_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `dependencia_id`) VALUES
(1, 'ivan padilla', 'ivanpadillamol@gmail.com', NULL, '$2y$10$CeHvhwegKOXvNd7jEH.p6OzpVzBInXVZHMoIXSE8d0pj3yAjLUk0S', NULL, '2020-08-09 16:29:50', '2020-08-09 16:29:50', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uso_rubros`
--

CREATE TABLE `uso_rubros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo_uso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_uso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rubroprin_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uso_rubros`
--

INSERT INTO `uso_rubros` (`id`, `codigo_uso`, `nombre_uso`, `created_at`, `updated_at`, `rubroprin_id`) VALUES
(1, 'A-05-01-01-000-001-01', 'CEREALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(2, 'A-05-01-01-000-001-02', 'HORTALIZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(3, 'A-05-01-01-000-001-03', 'FRUTAS Y NUECES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(4, 'A-05-01-01-000-001-04', 'SEMILLAS Y FRUTOS OLEAGINOSOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(5, 'A-05-01-01-000-001-05', 'RAICES Y TUBERCULOS COMESTIBLES RICOS EN ALMIDON O INULINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(6, 'A-05-01-01-000-001-06', 'PLANTAS AROMATICAS, BEBESTIBLES Y ESPECIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(7, 'A-05-01-01-000-001-07', 'LEGUMBRES, SECAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(8, 'A-05-01-01-000-001-08', 'PLANTAS UTILIZADAS EN LA FABRICACION DE AZUCAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(9, 'A-05-01-01-000-001-09', 'PRODUCTOS DE FORRAJE, FIBRAS, PLANTAS VIVAS, FLORES Y CAPULLOS DE FLORES, TABACO EN RAMA Y CAUCHO NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(10, 'A-05-01-01-000-002-01', 'ANIMALES VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(11, 'A-05-01-01-000-002-01-1', 'BOVINOS VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(12, 'A-05-01-01-000-002-01-2', 'OTROS RUMIANTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(13, 'A-05-01-01-000-002-01-3', 'CABALLOS Y OTROS EQUIDOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(14, 'A-05-01-01-000-002-01-4', 'GANADO PORCINO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(15, 'A-05-01-01-000-002-01-5', 'AVES DE CORRAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(16, 'A-05-01-01-000-002-01-9', 'OTROS ANIMALES VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(17, 'A-05-01-01-000-002-02', 'LECHE CRUDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(18, 'A-05-01-01-000-002-03', 'HUEVOS DE GALLINA O DE OTRAS AVES, CON CASCARA, FRESCOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(19, 'A-05-01-01-000-002-04', 'MATERIALES REPRODUCTIVOS DE ANIMALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(20, 'A-05-01-01-000-002-09', 'OTROS PRODUCTOS ANIMALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(21, 'A-05-01-01-000-003-01', 'MADERA EN BRUTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3),
(22, 'A-05-01-01-000-003-02', 'PRODUCTOS FORESTALES DIFERENTES A LA MADERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3),
(23, 'A-05-01-01-000-004', 'PESCADO Y OTROS PRODUCTOS DE LA PESCA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4),
(24, 'A-05-01-01-001-001', 'CARBON DE HULLA, LIGNITO Y TURBA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(25, 'A-05-01-01-001-002', 'PETROLEO CRUDO Y GAS NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6),
(26, 'A-05-01-01-001-003', 'MINERALES Y CONCENTRADOS DE URANIO Y TORIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7),
(27, 'A-05-01-01-001-004', 'MINERALES METALICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8),
(28, 'A-05-01-01-001-005', 'PIEDRA, ARENA Y ARCILLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9),
(29, 'A-05-01-01-001-006-01', 'MINERALES PARA LA INDUSTRIA QUIMICA, ABONOS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10),
(30, 'A-05-01-01-001-006-02', 'CLORURO DE SODIO PURO Y SUS SALES, AGUA DE MAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10),
(31, 'A-05-01-01-001-006-03', 'PIEDRAS PRECIOSAS Y SEMIPRECIOSAS PIEDRA POMEZ, PIEDRA ESMERIL ABRASIVOS NATURALES OTROS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10),
(32, 'A-05-01-01-001-007-01', 'ENERGIA ELECTRICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11),
(33, 'A-05-01-01-001-007-02', 'GAS DE CARBON, GAS DE AGUA, GAS POBRE Y OTROS GASES SIMILARES (EXCEPTO LOS GASES DE PETROLEO Y OTROS HIDROCARBUROS GASEOSOS)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11),
(34, 'A-05-01-01-001-007-03', 'VAPOR Y AGUA CALIENTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11),
(35, 'A-05-01-01-001-007-04', 'NIEVE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11),
(36, 'A-05-01-01-001-008', 'AGUA NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12),
(37, 'A-05-01-01-002-001-01', 'CARNE Y PRODUCTOS CARNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(38, 'A-05-01-01-002-001-02', 'PREPARACIONES Y CONSERVAS DE PESCADO, CRUSTACEOS, MOLUSCOS Y DEMAS INVERTEBRADOS ACUATICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(39, 'A-05-01-01-002-001-03', 'PREPARACIONES Y CONSERVAS DE HORTALIZAS, LEGUMBRES, TUBERCULOS Y PAPAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(40, 'A-05-01-01-002-001-04', 'PREPARACIONES Y CONSERVAS DE FRUTAS Y NUECES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(41, 'A-05-01-01-002-001-05', 'ACEITES Y GRASAS ANIMALES Y VEGETALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(42, 'A-05-01-01-002-001-06', 'BORRA DE ALGODON', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(43, 'A-05-01-01-002-001-07', 'TORTAS Y DEMAS RESIDUOS DE LA EXTRACCION DE GRASAS O ACEITES VEGETALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13),
(44, 'A-05-01-01-002-002', 'PRODUCTOS LACTEOS Y OVOPRODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14),
(45, 'A-05-01-01-002-003-01', 'PRODUCTOS DE MOLINERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(46, 'A-05-01-01-002-003-02', 'ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDON, AZUCARES Y JARABES DE AZUCAR N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(47, 'A-05-01-01-002-003-03', 'PREPARACIONES UTILIZADAS EN LA ALIMENTACION DE ANIMALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(48, 'A-05-01-01-002-003-04', 'PRODUCTOS DE PANADERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(49, 'A-05-01-01-002-003-05', 'AZUCAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(50, 'A-05-01-01-002-003-06', 'CACAO, CHOCOLATE Y CONFITERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(51, 'A-05-01-01-002-003-07', 'MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINACEOS SIMILARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(52, 'A-05-01-01-002-003-08', 'PRODUCTOS DEL CAFE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(53, 'A-05-01-01-002-003-09', 'OTROS PRODUCTOS ALIMENTICIOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15),
(54, 'A-05-01-01-002-004-01', 'ALCOHOL ETILICO AGUARDIENTES, LICORES Y OTRAS BEBIDAS ESPIRITUOSAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16),
(55, 'A-05-01-01-002-004-02', 'VINOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16),
(56, 'A-05-01-01-002-004-03', 'LICORES DE MALTA Y MALTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16),
(57, 'A-05-01-01-002-004-04', 'BEBIDAS NO ALCOHOLICAS AGUAS MINERALES EMBOTELLADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16),
(58, 'A-05-01-01-002-005', 'PRODUCTOS DE TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17),
(59, 'A-05-01-01-002-006', 'HILADOS E HILOS TEJIDOS DE FIBRAS TEXTILES INCLUSO AFELPADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18),
(60, 'A-05-01-01-002-007', 'ARTICULOS TEXTILES (EXCEPTO PRENDAS DE VESTIR)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 19),
(61, 'A-05-01-01-002-008-01', 'TEJIDOS DE PUNTO O GANCHILLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20),
(62, 'A-05-01-01-002-008-02', 'PRENDAS DE VESTIR (EXCEPTO PRENDAS DE PIEL)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20),
(63, 'A-05-01-01-002-008-03', 'PIELES FINAS CURTIDAS O ADOBADAS Y PIELES ARTIFICIALES ARTICULOS SIMILARES (EXCEPTO SOMBREROS Y DEMAS TOCADOS)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20),
(64, 'A-05-01-01-002-009-01', 'CUERO CURTIDO O ADOBADO CUERO REGENERADO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21),
(65, 'A-05-01-01-002-009-02', 'MALETAS, BOLSOS DE MANO Y ARTICULOS SIMILARES ARTICULOS DE TALABARTERIA Y GUARNICIONERIA, OTROS ARTICULOS DE CUERO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21),
(66, 'A-05-01-01-002-009-03', 'CALZADO CON SUELA Y PARTE SUPERIOR ELABORADOS DE CAUCHO O PLASTICO, O CON LA PARTE SUPERIOR DE CUERO O MATERIALES TEXTILES, DIFERENTES DE ZAPATOS DEPORTIVOS, CALZADO QUE INCORPORA PUNTERA PROTECTORA DE METAL Y CALZADO ESPECIAL MISCELANEO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21),
(67, 'A-05-01-01-002-009-04', 'CALZADO DEPORTIVO (EXCEPTO BOTAS DE PATINAR)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21),
(68, 'A-05-01-01-002-009-05', 'OTROS TIPOS DE CALZADO (EXCEPTO CALZADO DE ASBESTO, CALZADO ORTOPEDICO Y BOTAS DE ESQUIAR)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21),
(69, 'A-05-01-01-002-009-06', 'PARTES DE CALZADO PLANTILLAS REMOVIBLES, TALONERAS Y ARTICULOS SIMILARES POLAINAS CORTAS Y LARGAS, Y ARTICULOS SIMILARES Y SUS PARTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21),
(70, 'A-05-01-01-003-001', 'PRODUCTOS DE MADERA, CORCHO, CESTERIA Y ESPARTERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22),
(71, 'A-05-01-01-003-002-01', 'PASTA DE PAPEL, PAPEL Y CARTON', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(72, 'A-05-01-01-003-002-02', 'LIBROS IMPRESOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(73, 'A-05-01-01-003-002-03', 'DIARIOS, REVISTAS Y PUBLICACIONES PERIODICAS, PUBLICADOS POR LO MENOS CUATRO VECES POR SEMANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(74, 'A-05-01-01-003-002-04', 'DIARIOS, REVISTAS Y PUBLICACIONES PERIODICAS, PUBLICADOS MENOS DE CUATRO VECES POR SEMANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(75, 'A-05-01-01-003-002-05', 'MAPAS IMPRESOS MUSICA IMPRESA O EN MANUSCRITO TARJETAS POSTALES, TARJETAS DE FELICITACION, FOTOGRAFIAS Y PLANOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(76, 'A-05-01-01-003-002-06', 'SELLOS, CHEQUERAS, BILLETES DE BANCO, TITULOS DE ACCIONES, CATALOGOS Y FOLLETOS, MATERIAL PARA ANUNCIOS PUBLICITARIOS Y OTROS MATERIALES IMPRESOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(77, 'A-05-01-01-003-002-07', 'LIBROS DE REGISTROS, LIBROS DE CONTABILIDAD, CUADERNILLOS DE NOTAS, BLOQUES PARA CARTAS, AGENDAS Y ARTICULOS SIMILARES, SECANTES, ENCUADERNADORES, CLASIFICADORES PARA ARCHIVOS, FORMULARIOS Y OTROS ARTICULOS DE ESCRITORIO, DE PAPEL O CARTON', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(78, 'A-05-01-01-003-002-08', 'TIPOS DE IMPRENTA, PLANCHAS O CILINDROS, PREPARADOS PARA LAS ARTES GRAFICAS, PIEDRAS LITOGRAFICAS IMPRESAS U OTROS ELEMENTOS DE IMPRESION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23),
(79, 'A-05-01-01-003-003-01', 'CARBON COQUE Y SEMICOQUE, CARBON DE LIGNITO O CARBON DE HULLA CARBON DE RETORTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(80, 'A-05-01-01-003-003-02', 'ALQUITRAN DE CARBON, DE CARBON LIGNITO, HULLA Y OTRAS TORTAS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(81, 'A-05-01-01-003-003-03', 'ACEITES DE PETROLEO O ACEITES OBTENIDOS DE MINERALES BITUMINOSOS (EXCEPTO LOS ACEITES CRUDOS) PREPARADOS N.C.P., QUE CONTENGAN POR LO MENOS EL 70% DE SU PESO EN ACEITES DE ESOS TIPOS Y CUYOS COMPONENTES BASICOS SEAN ESOS ACEITES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(82, 'A-05-01-01-003-003-04', 'GAS DE PETROLEO Y OTROS HIDROCARBUROS GASEOSOS (EXCEPTO GAS NATURAL)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(83, 'A-05-01-01-003-003-05', 'VASELINA, CERA DE PARAFINA, CERA DE PETROLEO DE MICROCRISTALINA, CERA CRUDA, OZOCERITA, CERA DE LIGNITO, CERA DE TURBA, OTRAS CERAS MINERALES Y PRODUCTOS SIMILARES.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(84, 'A-05-01-01-003-003-06', 'ELEMENTOS RADIACTIVOS, ISOTOPOS Y COMPUESTOS RADIACTIVOS ALEACIONES, DISPERSIONES, PRODUCTOS CERAMICOS Y MEZCLAS QUE CONTENGAN ESTOS ELEMENTOS, ISOTOPOS O COMPUESTOS RADIACTIVOS RESIDUOS RADIACTIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(85, 'A-05-01-01-003-003-07', 'ELEMENTOS COMBUSTIBLES (CARTUCHOS) PARA REACTORES NUCLEARES O DE REACTORES NUCLEARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24),
(86, 'A-05-01-01-003-004-01', 'QUIMICOS ORGANICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(87, 'A-05-01-01-003-004-02', 'PRODUCTOS QUIMICOS INORGANICOS BASICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(88, 'A-05-01-01-003-004-03', 'EXTRACTOS TINTOREOS Y CURTIENTES TANINOS Y SUS DERIVADOS SUSTANCIAS COLORANTES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(89, 'A-05-01-01-003-004-04', 'PRODUCTOS MINERALES NATURALES ACTIVADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(90, 'A-05-01-01-003-004-05', 'PRODUCTOS QUIMICOS BASICOS DIVERSOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(91, 'A-05-01-01-003-004-06', 'ABONOS Y PLAGUICIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(92, 'A-05-01-01-003-004-07', 'PLASTICOS EN FORMAS PRIMARIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(93, 'A-05-01-01-003-004-08', 'CAUCHO SINTETICO Y FACTICIO DERIVADO DEL PETROLEO, MEZCLAS DE ESTOS CAUCHOS CON CAUCHO NATURAL Y GOMAS NATURALES SIMILARES, EN FORMAS PRIMARIAS O EN PLANCHAS, HOJAS O TIRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25),
(94, 'A-05-01-01-003-005-01', 'PINTURAS Y BARNICES Y PRODUCTOS RELACIONADOS COLORES PARA LA PINTURA ARTISTICA TINTAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26),
(95, 'A-05-01-01-003-005-02', 'PRODUCTOS FARMACEUTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26),
(96, 'A-05-01-01-003-005-03', 'JABON, PREPARADOS PARA LIMPIEZA, PERFUMES Y PREPARADOS DE TOCADOR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26),
(97, 'A-05-01-01-003-005-04', 'PRODUCTOS QUIMICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26),
(98, 'A-05-01-01-003-005-05', 'FIBRAS TEXTILES MANUFACTURADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26),
(99, 'A-05-01-01-003-006-01', 'LLANTAS DE CAUCHO Y NEUMATICOS (CAMARAS DE AIRE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27),
(100, 'A-05-01-01-003-006-02', 'OTROS PRODUCTOS DE CAUCHO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27),
(101, 'A-05-01-01-003-006-03', 'SEMIMANUFACTURAS DE PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27),
(102, 'A-05-01-01-003-006-04', 'PRODUCTOS DE EMPAQUE Y ENVASADO, DE PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27),
(103, 'A-05-01-01-003-006-09', 'OTROS PRODUCTOS PLASTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27),
(104, 'A-05-01-01-003-007-01', 'VIDRIO Y PRODUCTOS DE VIDRIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(105, 'A-05-01-01-003-007-02', 'ARTICULOS DE CERAMICA NO ESTRUCTURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(106, 'A-05-01-01-003-007-03', 'PRODUCTOS REFRACTARIOS Y PRODUCTOS ESTRUCTURALES NO REFRACTARIOS DE ARCILLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(107, 'A-05-01-01-003-007-04', 'YESO, CAL Y CEMENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(108, 'A-05-01-01-003-007-05', 'ARTICULOS DE CONCRETO, CEMENTO Y YESO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(109, 'A-05-01-01-003-007-06', 'PIEDRA DE CONSTRUCCION O DE TALLA LABRADAS, Y SUS MANUFACTURAS (EXCEPTO SIN LABRAR, QUE SE CLASIFICAN EN EL GRUPO 151)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(110, 'A-05-01-01-003-007-09', 'OTROS PRODUCTOS MINERALES NO METALICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28),
(111, 'A-05-01-01-003-008-01', 'MUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(112, 'A-05-01-01-003-008-01-1', 'ASIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(113, 'A-05-01-01-003-008-01-2', 'MUEBLES, DEL TIPO UTILIZADO EN OFICINAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(114, 'A-05-01-01-003-008-01-3', 'MUEBLES DE MADERA, DEL TIPO UTILIZADO EN LA COCINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(115, 'A-05-01-01-003-008-01-4', 'OTROS MUEBLES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(116, 'A-05-01-01-003-008-01-5', 'SOMIERES, COLCHONES CON MUELLES, RELLENOS O GUARNECIDOS INTERIORMENTE CON CUALQUIER MATERIAL, DE CAUCHO O PLASTICOS CELULARES, RECUBIERTOS O NO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(117, 'A-05-01-01-003-008-01-6', 'PARTES Y PIEZAS DE MUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(118, 'A-05-01-01-003-008-02', 'JOYAS Y ARTICULOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(119, 'A-05-01-01-003-008-03', 'INSTRUMENTOS MUSICALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(120, 'A-05-01-01-003-008-04', 'ARTICULOS DE DEPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(121, 'A-05-01-01-003-008-05', 'JUEGOS Y JUGUETES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(122, 'A-05-01-01-003-008-06', 'TIOVIVOS (CARRUSELES), COLUMPIOS, CASETAS DE TIRO Y DEMAS ATRACCIONES DE FERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(123, 'A-05-01-01-003-008-07', 'CONSTRUCCIONES PREFABRICADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(124, 'A-05-01-01-003-008-09', 'OTROS ARTICULOS MANUFACTURADOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29),
(125, 'A-05-01-01-003-009', 'DESPERDICIOS DESECHOS Y RESIDUOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30),
(126, 'A-05-01-01-004-001', 'METALES BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 31),
(127, 'A-05-01-01-004-002', 'PRODUCTOS METALICOS ELABORADOS (EXCEPTO MAQUINARIA Y EQUIPO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 32),
(128, 'A-05-01-01-004-003-01', 'MOTORES Y TURBINAS Y SUS PARTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33),
(129, 'A-05-01-01-004-003-02', 'BOMBAS, COMPRESORES, MOTORES DE FUERZA HIDRAULICA Y MOTORES DE POTENCIA NEUMATICA Y VALVULAS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33),
(130, 'A-05-01-01-004-003-03', 'COJINETES, ENGRANAJES, RUEDAS DE FRICCION Y ELEMENTOS DE TRANSMISION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33),
(131, 'A-05-01-01-004-003-04', 'HORNOS Y QUEMADORES PARA ALIMENTACION DE HOGARES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33),
(132, 'A-05-01-01-004-003-05', 'EQUIPO DE ELEVACION Y MANIPULACION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33),
(133, 'A-05-01-01-004-003-09', 'OTRAS MAQUINAS PARA USOS GENERALES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33),
(134, 'A-05-01-01-004-004-01', 'MAQUINARIA AGROPECUARIA O SILVICOLA Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(135, 'A-05-01-01-004-004-02', 'MAQUINAS HERRAMIENTAS Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(136, 'A-05-01-01-004-004-03', 'MAQUINARIA PARA LA INDUSTRIA METALURGICA Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(137, 'A-05-01-01-004-004-04', 'MAQUINARIA PARA LA MINERIA, LA EXPLOTACION DE CANTERAS Y LA CONSTRUCCION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(138, 'A-05-01-01-004-004-05', 'MAQUINARIA PARA LA ELABORACION DE ALIMENTOS, BEBIDAS Y TABACO, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(139, 'A-05-01-01-004-004-06', 'MAQUINARIA PARA LA FABRICACION DE TEXTILES, PRENDAS DE VESTIR Y ARTICULOS DE CUERO, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(140, 'A-05-01-01-004-004-07', 'ARMAS Y MUNICIONES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(141, 'A-05-01-01-004-004-08', 'APARATOS DE USO DOMESTICO Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(142, 'A-05-01-01-004-004-09', 'OTRA MAQUINARIA PARA USOS ESPECIALES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34),
(143, 'A-05-01-01-004-005-01', 'MAQUINAS PARA OFICINA Y CONTABILIDAD, Y SUS PARTES Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35),
(144, 'A-05-01-01-004-005-02', 'MAQUINARIA DE INFORMATICA Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35),
(145, 'A-05-01-01-004-006-01', 'MOTORES, GENERADORES Y TRANSFORMADORES ELECTRICOS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36),
(146, 'A-05-01-01-004-006-02', 'APARATOS DE CONTROL ELECTRICO Y DISTRIBUCION DE ELECTRICIDAD Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36),
(147, 'A-05-01-01-004-006-03', 'HILOS Y CABLES AISLADOS CABLE DE FIBRA OPTICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36),
(148, 'A-05-01-01-004-006-04', 'ACUMULADORES, PILAS Y BATERIAS PRIMARIAS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36),
(149, 'A-05-01-01-004-006-05', 'LAMPARAS ELECTRICAS DE INCANDESCENCIA O DESCARGA LAMPARAS DE ARCO, EQUIPO PARA ALUMBRADO ELECTRICO SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36),
(150, 'A-05-01-01-004-006-09', 'OTRO EQUIPO ELECTRICO Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36),
(151, 'A-05-01-01-004-007-01', 'VALVULAS Y TUBOS ELECTRONICOS COMPONENTES ELECTRONICOS SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(152, 'A-05-01-01-004-007-02', 'APARATOS TRANSMISORES DE TELEVISION Y RADIO TELEVISION, VIDEO Y CAMARAS DIGITALES TELEFONOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(153, 'A-05-01-01-004-007-03', 'RADIORRECEPTORES Y RECEPTORES DE TELEVISION APARATOS PARA LA GRABACION Y REPRODUCCION DE SONIDO Y VIDEO MICROFONOS, ALTAVOCES, AMPLIFICADORES, ETC.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(154, 'A-05-01-01-004-007-04', 'PARTES Y PIEZAS DE LOS PRODUCTOS DE LAS CLASES 4721 A 4733 Y 4822', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(155, 'A-05-01-01-004-007-05', 'DISCOS, CINTAS, DISPOSITIVOS DE ALMACENAMIENTO EN ESTADO SOLIDO NO VOLATILES Y OTROS MEDIOS, NO GRABADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(156, 'A-05-01-01-004-007-06', 'GRABACIONES DE AUDIO, VIDEO Y OTROS DISCOS, CINTAS Y OTROS MEDIOS FISICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(157, 'A-05-01-01-004-007-08', 'PAQUETES DE SOFTWARE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(158, 'A-05-01-01-004-007-09', 'TARJETAS CON BANDAS MAGNETICAS O PLAQUETAS (CHIP)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37),
(159, 'A-05-01-01-004-008-01', 'APARATOS MEDICOS Y QUIRURGICOS Y APARATOS ORTESICOS Y PROTESICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38),
(160, 'A-05-01-01-004-008-02', 'INSTRUMENTOS Y APARATOS DE MEDICION, VERIFICACION, ANALISIS, DE NAVEGACION Y PARA OTROS FINES (EXCEPTO INSTRUMENTOS OPTICOS) INSTRUMENTOS DE CONTROL DE PROCESOS INDUSTRIALES, SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38),
(161, 'A-05-01-01-004-008-03', 'INSTRUMENTOS OPTICOS Y EQUIPO FOTOGRAFICO PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38),
(162, 'A-05-01-01-004-008-04', 'RELOJES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38),
(163, 'A-05-01-01-004-009-01', 'VEHICULOS AUTOMOTORES, REMOLQUES Y SEMIRREMOLQUES Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(164, 'A-05-01-01-004-009-02', 'CARROCERIAS (INCLUSO CABINAS) PARA VEHICULOS AUTOMOTORES REMOLQUES Y SEMIRREMOLQUES Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(165, 'A-05-01-01-004-009-03', 'BUQUES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(166, 'A-05-01-01-004-009-04', 'EMBARCACIONES PARA DEPORTES Y RECREO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(167, 'A-05-01-01-004-009-05', 'LOCOMOTORAS Y MATERIAL RODANTE DE FERROCARRIL Y TRANVIA, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(168, 'A-05-01-01-004-009-06', 'AERONAVES Y NAVES ESPACIALES, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(169, 'A-05-01-01-004-009-09', 'OTRO EQUIPO DE TRANSPORTE, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(170, 'A-05-01-01-004-009-09-1', 'MOTOCICLETAS Y SIDECARES (VEHICULOS LATERALES A LAS MOTOCICLETAS)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(171, 'A-05-01-01-004-009-09-2', 'BICICLETAS Y SILLONES DE RUEDAS PARA DISCAPACITADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(172, 'A-05-01-01-004-009-09-3', 'VEHICULOS N.C.P. SIN PROPULSION MECANICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(173, 'A-05-01-01-004-009-09-4', 'PARTES Y PIEZAS PARA LOS PRODUCTOS DE LAS CLASES 4991 Y 4992', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39),
(174, 'A-05-01-02-005-004-01', 'SERVICIOS GENERALES DE CONSTRUCCION DE EDIFICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(175, 'A-05-01-02-005-004-01-1', 'SERVICIOS GENERALES DE CONSTRUCCION DE EDIFICACIONES RESIDENCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(176, 'A-05-01-02-005-004-01-2', 'SERVICIOS GENERALES DE CONSTRUCCION DE EDIFICACIONES NO RESIDENCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(177, 'A-05-01-02-005-004-02', 'SERVICIOS GENERALES DE CONSTRUCCION DE OBRAS DE INGENIERIA CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(178, 'A-05-01-02-005-004-02-1', 'SERVICIOS GENERALES DE CONSTRUCCION DE CARRETERAS (EXCEPTO CARRETERAS ELEVADAS), CALLES, VIAS FERREAS Y PISTAS DE ATERRIZAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(179, 'A-05-01-02-005-004-02-2', 'SERVICIOS GENERALES DE CONSTRUCCION DE PUENTES, CARRETERAS ELEVADAS Y TUNELES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(180, 'A-05-01-02-005-004-02-3', 'SERVICIOS GENERALES DE CONSTRUCCION DE PUERTOS, CANALES, PRESAS, SISTEMAS DE RIEGO Y OTRAS OBRAS HIDRAULICAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(181, 'A-05-01-02-005-004-02-4', 'SERVICIOS GENERALES DE CONSTRUCCION DE TUBERIAS PARA LA CONDUCCION DE GAS A LARGA DISTANCIA, LINEAS DE COMUNICACION Y CABLES DE PODER', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(182, 'A-05-01-02-005-004-02-5', 'SERVICIOS GENERALES DE CONSTRUCCION DE TUBERIAS Y CABLES LOCALES, Y OBRAS CONEXAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(183, 'A-05-01-02-005-004-02-6', 'SERVICIOS GENERALES DE CONSTRUCCION EN MINAS Y PLANTAS INDUSTRIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(184, 'A-05-01-02-005-004-02-7', 'SERVICIOS GENERALES DE CONSTRUCCIONES DEPORTIVAS AL AIRE LIBRE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(185, 'A-05-01-02-005-004-02-9', 'SERVICIOS GENERALES DE CONSTRUCCION DE OTRAS OBRAS DE INGENIERIA CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(186, 'A-05-01-02-005-004-03', 'SERVICIOS DE PREPARACION DEL TERRENO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(187, 'A-05-01-02-005-004-04', 'MONTAJE Y ERECCION DE CONSTRUCCIONES PREFABRICADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(188, 'A-05-01-02-005-004-05', 'SERVICIOS ESPECIALES DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(189, 'A-05-01-02-005-004-06', 'SERVICIOS DE INSTALACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(190, 'A-05-01-02-005-004-07', 'SERVICIOS DE TERMINACION Y ACABADOS DE EDIFICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40),
(191, 'A-05-01-02-006-001-01', 'SERVICIOS DE VENTA AL POR MAYOR, EXCEPTO LOS PRESTADOS A CAMBIO DE UNA RETRIBUCION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(192, 'A-05-01-02-006-001-01-1', 'SERVICIOS DE VENTA AL POR MAYOR DE PRODUCTOS AGROPECUARIOS, UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(193, 'A-05-01-02-006-001-01-2', 'SERVICIOS DE VENTA AL POR MAYOR DE ALIMENTOS, BEBIDAS Y TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(194, 'A-05-01-02-006-001-01-3', 'SERVICIOS DE VENTA AL POR MAYOR DE ARTICULOS TEXTILES, PRENDAS DE VESTIR Y CALZADO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(195, 'A-05-01-02-006-001-01-4', 'SERVICIOS DE VENTA AL POR MAYOR DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPOS DOMESTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(196, 'A-05-01-02-006-001-01-5', 'SERVICIOS DE VENTA AL POR MAYOR DE PRODUCTOS DIVERSOS DE CONSUMO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(197, 'A-05-01-02-006-001-01-6', 'SERVICIOS DE VENTA AL POR MAYOR DE MATERIALES DE CONSTRUCCION Y FERRETERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(198, 'A-05-01-02-006-001-01-7', 'SERVICIOS DE VENTA AL POR MAYOR DE PRODUCTOS QUIMICOS Y FARMACEUTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(199, 'A-05-01-02-006-001-01-8', 'SERVICIOS DE VENTA AL POR MAYOR DE MAQUINARIA, EQUIPO Y SUMINISTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(200, 'A-05-01-02-006-001-01-9', 'SERVICIOS DE VENTA AL POR MAYOR DE OTROS PRODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(201, 'A-05-01-02-006-001-02', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(202, 'A-05-01-02-006-001-02-1', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE PRODUCTOS AGROPECUARIOS, UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(203, 'A-05-01-02-006-001-02-2', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE ALIMENTOS, BEBIDAS Y TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(204, 'A-05-01-02-006-001-02-3', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE TEXTILES, PRENDAS DE VESTIR Y CALZADO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(205, 'A-05-01-02-006-001-02-4', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPOS DOMESTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(206, 'A-05-01-02-006-001-02-5', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE PRODUCTOS DIVERSOS DE CONSUMO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(207, 'A-05-01-02-006-001-02-6', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE MATERIALES DE CONSTRUCCION Y FERRETERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(208, 'A-05-01-02-006-001-02-7', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE PRODUCTOS QUIMICOS Y FARMACEUTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(209, 'A-05-01-02-006-001-02-8', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE MAQUINARIA, EQUIPO Y SUMINISTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(210, 'A-05-01-02-006-001-02-9', 'SERVICIOS DE VENTA AL POR MAYOR PRESTADOS A COMISION O POR CONTRATA DE OTROS PRODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41),
(211, 'A-05-01-02-006-002-01', 'SERVICIOS DE VENTA AL POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(212, 'A-05-01-02-006-002-01-1', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS AGROPECUARIOS UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(213, 'A-05-01-02-006-002-01-2', 'SERVICIOS DE VENTA AL POR MENOR, DE ALIMENTOS, BEBIDAS Y TABACO, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(214, 'A-05-01-02-006-002-01-3', 'SERVICIOS DE VENTA AL POR MENOR, DE ARTICULOS TEXTILES, PRENDAS DE VESTIR Y CALZADO, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(215, 'A-05-01-02-006-002-01-4', 'SERVICIOS DE VENTA AL POR MENOR DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPOS DOMESTICOS, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(216, 'A-05-01-02-006-002-01-5', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS DIVERSOS DE CONSUMO, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(217, 'A-05-01-02-006-002-01-6', 'SERVICIOS DE VENTA AL POR MENOR DE MATERIALES DE CONSTRUCCION Y FERRETERIA, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(218, 'A-05-01-02-006-002-01-7', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS QUIMICOS Y FARMACEUTICOS, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(219, 'A-05-01-02-006-002-01-8', 'SERVICIOS DE VENTA AL POR MENOR DE MAQUINARIA, EQUIPO Y SUMINISTROS, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(220, 'A-05-01-02-006-002-01-9', 'SERVICIOS DE VENTA AL POR MENOR DE OTROS PRODUCTOS, EN ESTABLECIMIENTOS NO ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(221, 'A-05-01-02-006-002-02', 'SERVICIOS DE VENTA AL POR MENOR EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(222, 'A-05-01-02-006-002-02-1', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS AGROPECUARIOS , UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(223, 'A-05-01-02-006-002-02-2', 'SERVICIOS DE VENTA AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(224, 'A-05-01-02-006-002-02-3', 'SERVICIOS DE VENTA AL POR MENOR DE ARTICULOS TEXTILES, PRENDAS DE VESTIR Y CALZADO EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(225, 'A-05-01-02-006-002-02-4', 'SERVICIOS DE VENTA AL POR MENOR DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPO DOMESTICOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(226, 'A-05-01-02-006-002-02-5', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS DIVERSOS DE CONSUMO EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(227, 'A-05-01-02-006-002-02-6', 'SERVICIOS DE VENTA AL POR MENOR DE MATERIALES DE CONSTRUCCION Y FERRETERIA EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(228, 'A-05-01-02-006-002-02-7', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS QUIMICOS Y FARMACEUTICOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(229, 'A-05-01-02-006-002-02-8', 'SERVICIOS DE VENTA AL POR MENOR DE MAQUINARIA, EQUIPO Y SUMINISTROS EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(230, 'A-05-01-02-006-002-02-9', 'SERVICIOS DE VENTA AL POR MENOR DE OTROS PRODUCTOS N.C.P. EN ESTABLECIMIENTOS ESPECIALIZADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(231, 'A-05-01-02-006-002-03', 'SERVICIOS DE VENTA AL POR MENOR POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(232, 'A-05-01-02-006-002-03-1', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS AGROPECUARIOS, UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(233, 'A-05-01-02-006-002-03-2', 'SERVICIOS DE VENTA AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO POR INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(234, 'A-05-01-02-006-002-03-3', 'SERVICIOS DE VENTA AL POR MENOR DE ARTICULOS TEXTILES, PRENDAS DE VESTIR Y CALZADO POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(235, 'A-05-01-02-006-002-03-4', 'SERVICIOS DE VENTA AL POR MENOR DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPOS DOMESTICOS POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(236, 'A-05-01-02-006-002-03-5', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS DIVERSOS DE CONSUMO POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(237, 'A-05-01-02-006-002-03-6', 'SERVICIOS DE VENTA AL POR MENOR DE MATERIALES DE CONSTRUCCION Y FERRETERIA POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(238, 'A-05-01-02-006-002-03-7', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS QUIMICOS Y FARMACEUTICOS POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(239, 'A-05-01-02-006-002-03-8', 'SERVICIOS DE VENTA AL POR MENOR DE MAQUINARIA, EQUIPO Y SUMINISTROS POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(240, 'A-05-01-02-006-002-03-9', 'SERVICIOS DE VENTA AL POR MENOR DE OTROS PRODUCTOS POR CORREO O INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(241, 'A-05-01-02-006-002-04', 'OTROS SERVICIOS DE VENTA AL POR MENOR NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(242, 'A-05-01-02-006-002-04-1', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS AGROPECUARIOS, UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(243, 'A-05-01-02-006-002-04-2', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(244, 'A-05-01-02-006-002-04-3', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE ARTICULOS TEXTILES, PRENDAS DE VESTIR Y CALZADO NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(245, 'A-05-01-02-006-002-04-4', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPOS DOMESTICOS NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(246, 'A-05-01-02-006-002-04-5', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS DIVERSOS DE CONSUMO NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(247, 'A-05-01-02-006-002-04-6', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE MATERIALES DE CONSTRUCCION Y FERRETERIA NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(248, 'A-05-01-02-006-002-04-7', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS QUIMICOS Y FARMACEUTICOS NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(249, 'A-05-01-02-006-002-04-8', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE MAQUINARIA, EQUIPO Y SUMINISTROS NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(250, 'A-05-01-02-006-002-04-9', 'OTROS SERVICIOS DE VENTA AL POR MENOR DE OTROS PRODUCTOS NO REALIZADOS EN ESTABLECIMIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(251, 'A-05-01-02-006-002-05', 'SERVICIOS DE VENTA AL POR MENOR PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(252, 'A-05-01-02-006-002-05-1', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS AGROPECUARIOS, UTILIZADOS PRINCIPALMENTE COMO MATERIAS PRIMAS, Y DE ANIMALES VIVOS, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(253, 'A-05-01-02-006-002-05-2', 'SERVICIOS DE VENTA AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(254, 'A-05-01-02-006-002-05-3', 'SERVICIOS DE VENTA AL POR MENOR DE ARTICULOS TEXTILES, PRENDAS DE VESTIR Y CALZADO, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(255, 'A-05-01-02-006-002-05-4', 'SERVICIOS DE VENTA AL POR MENOR DE ELECTRODOMESTICOS, ARTICULOS Y EQUIPO DOMESTICOS, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(256, 'A-05-01-02-006-002-05-5', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS DIVERSOS DE CONSUMO, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(257, 'A-05-01-02-006-002-05-6', 'SERVICIOS DE VENTA AL POR MENOR DE MATERIALES DE CONSTRUCCION Y FERRETERIA, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(258, 'A-05-01-02-006-002-05-7', 'SERVICIOS DE VENTA AL POR MENOR DE PRODUCTOS QUIMICOS Y FARMACEUTICOS, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(259, 'A-05-01-02-006-002-05-8', 'SERVICIOS DE VENTA AL POR MENOR DE MAQUINARIA, EQUIPO Y SUMINISTROS, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(260, 'A-05-01-02-006-002-05-9', 'SERVICIOS DE VENTA AL POR MENOR DE OTROS PRODUCTOS, PRESTADOS A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42),
(261, 'A-05-01-02-006-003-01', 'SERVICIOS DE ALOJAMIENTO PARA ESTANCIAS CORTAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43),
(262, 'A-05-01-02-006-003-02', 'OTROS SERVICIOS DE ALOJAMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43),
(263, 'A-05-01-02-006-003-03', 'SERVICIOS DE SUMINISTRO DE COMIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43),
(264, 'A-05-01-02-006-003-04', 'SERVICIOS DE SUMINISTRO DE BEBIDAS PARA SU CONSUMO DENTRO DEL ESTABLECIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43),
(265, 'A-05-01-02-006-004', 'SERVICIOS DE TRANSPORTE DE PASAJEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 44),
(266, 'A-05-01-02-006-005-01', 'SERVICIOS DE TRANSPORTE DE CARGA POR VIA TERRESTRE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45),
(267, 'A-05-01-02-006-005-02', 'SERVICIOS DE TRANSPORTE DE CARGA POR VIA ACUATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45),
(268, 'A-05-01-02-006-005-03', 'SERVICIOS DE TRANSPORTE DE CARGA POR VIA AEREA O ESPACIAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45),
(269, 'A-05-01-02-006-006', 'SERVICIOS DE ALQUILER DE VEHICULOS DE TRANSPORTE CON OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 46),
(270, 'A-05-01-02-006-007-01', 'SERVICIOS DE MANIPULACION DE CARGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(271, 'A-05-01-02-006-007-02', 'SERVICIOS DE ALMACENAMIENTO Y DEPOSITO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(272, 'A-05-01-02-006-007-03', 'SERVICIOS DE APOYO AL TRANSPORTE POR VIA FERREA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(273, 'A-05-01-02-006-007-04', 'SERVICIOS DE APOYO AL TRANSPORTE POR CARRETERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(274, 'A-05-01-02-006-007-05', 'SERVICIOS DE APOYO AL TRANSPORTE POR VIA ACUATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(275, 'A-05-01-02-006-007-06', 'SERVICIOS DE APOYO AL TRANSPORTE AEREO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(276, 'A-05-01-02-006-007-09', 'OTROS SERVICIOS DE APOYO AL TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47),
(277, 'A-05-01-02-006-008', 'SERVICIOS POSTALES Y DE MENSAJERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 48),
(278, 'A-05-01-02-006-009-01', 'SERVICIOS DE DISTRIBUCION DE ELECTRICIDAD, Y SERVICIOS DE DISTRIBUCION DE GAS (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 49),
(279, 'A-05-01-02-006-009-02', 'SERVICIOS DE DISTRIBUCION DE AGUA (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 49),
(280, 'A-05-01-02-007-001-01', 'SERVICIOS FINANCIEROS, EXCEPTO DE LA BANCA DE INVERSION, SERVICIOS DE SEGUROS Y SERVICIOS DE PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(281, 'A-05-01-02-007-001-01-1', 'SERVICIOS FINANCIEROS, EXCEPTO DE LA BANCA DE INVERSION, SERVICIOS DE SEGUROS Y SERVICIOS DE PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(282, 'A-05-01-02-007-001-01-2', 'SERVICIOS DE DEPOSITO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(283, 'A-05-01-02-007-001-01-3', 'SERVICIOS DE CONCESION DE CREDITO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(284, 'A-05-01-02-007-001-01-4', 'SERVICIOS DE LEASING (ARRENDAMIENTO FINANCIERO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(285, 'A-05-01-02-007-001-01-9', 'OTROS SERVICIOS FINANCIEROS, EXCEPTO LOS SERVICIOS DE LA BANCA DE INVERSION, SERVICIOS DE SEGUROS Y PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(286, 'A-05-01-02-007-001-02', 'SERVICIOS DE LA BANCA DE INVERSION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(287, 'A-05-01-02-007-001-03', 'SERVICIOS DE SEGUROS Y PENSIONES (CON EXCLUSION DE SERVICIOS DE REASEGURO), EXCEPTO LOS SERVICIOS DE SEGUROS SOCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(288, 'A-05-01-02-007-001-03-1', 'SERVICIOS DE SEGUROS VIDA (CON EXCLUSION DE LOS SERVICIOS DE REASEGURO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(289, 'A-05-01-02-007-001-03-2', 'SERVICIOS DE SEGUROS SOCIALES DE PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(290, 'A-05-01-02-007-001-03-3', 'SERVICIOS DE SEGUROS SOCIALES DE SALUD Y RIESGOS LABORALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(291, 'A-05-01-02-007-001-03-4', 'SERVICIOS DE SEGUROS DE SALUD Y DE ACCIDENTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(292, 'A-05-01-02-007-001-03-5', 'OTROS SERVICIOS DE SEGUROS DISTINTOS A LOS SEGUROS DE VIDA (EXCEPTO LOS SERVICIOS DE REASEGURO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(293, 'A-05-01-02-007-001-03-5-01', 'SERVICIOS DE SEGUROS DE VEHICULOS AUTOMOTORES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(294, 'A-05-01-02-007-001-03-5-02', 'SERVICIOS DE SEGUROS DE TRANSPORTE MARITIMO, DE AVIACION Y OTROS MEDIOS DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(295, 'A-05-01-02-007-001-03-5-03', 'SERVICIOS DE SEGUROS PARA TRANSPORTE DE MERCANCIAS (FLETES)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(296, 'A-05-01-02-007-001-03-5-04', 'SERVICIOS DE SEGUROS CONTRA INCENDIO, TERREMOTO O SUSTRACCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(297, 'A-05-01-02-007-001-03-5-05', 'SERVICIOS DE SEGUROS GENERALES DE RESPONSABILIDAD CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(298, 'A-05-01-02-007-001-03-5-06', 'SERVICIOS DE SEGURO DE CUMPLIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(299, 'A-05-01-02-007-001-03-5-07', 'SERVICIOS DE SEGURO OBLIGATORIO DE ACCIDENTES DE TRANSITO (SOAT)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(300, 'A-05-01-02-007-001-03-5-08', 'SERVICIOS DE SEGUROS DE VIAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(301, 'A-05-01-02-007-001-03-5-09', 'OTROS SERVICIOS DE SEGUROS DISTINTOS DE LOS SEGUROS DE VIDA N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(302, 'A-05-01-02-007-001-03-6', 'SERVICIOS DE LAS SOCIEDADES DE CAPITALIZACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(303, 'A-05-01-02-007-001-04', 'SERVICIOS DE REASEGURO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(304, 'A-05-01-02-007-001-05', 'SERVICIOS AUXILIARES A LOS SERVICIOS FINANCIEROS DISTINTOS DE LOS SEGUROS Y LAS PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(305, 'A-05-01-02-007-001-05-1', 'SERVICIOS RELACIONADOS CON LA BANCA DE INVERSION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(306, 'A-05-01-02-007-001-05-2', 'SERVICIOS DE CORRETAJE RELACIONADOS CON LOS PRODUCTOS DE VALORES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(307, 'A-05-01-02-007-001-05-3', 'SERVICIOS DE ADMINISTRACION DE CARTERAS, EXCEPTO LOS FONDOS DE PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(308, 'A-05-01-02-007-001-05-4', 'SERVICIOS FIDUCIARIOS Y DE CUSTODIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(309, 'A-05-01-02-007-001-05-5', 'SERVICIOS RELACIONADOS CON LA ADMINISTRACION DE LOS MERCADOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(310, 'A-05-01-02-007-001-05-9', 'OTROS SERVICIOS AUXILIARES A LOS SERVICIOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(311, 'A-05-01-02-007-001-06', 'SERVICIOS AUXILIARES DE SEGUROS, PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(312, 'A-05-01-02-007-001-06-1', 'SERVICIOS DE CORRETAJE Y AGENCIAS DE SEGUROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(313, 'A-05-01-02-007-001-06-2', 'SERVICIOS DE TASACION DE LAS RECLAMACIONES AL SEGURO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(314, 'A-05-01-02-007-001-06-3', 'SERVICIOS ACTUARIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(315, 'A-05-01-02-007-001-06-4', 'SERVICIOS DE ADMINISTRACION DE FONDOS DE PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(316, 'A-05-01-02-007-001-06-9', 'OTROS SERVICIOS AUXILIARES DE SEGUROS, PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(317, 'A-05-01-02-007-001-07', 'SERVICIOS DE MANTENIMIENTO DE ACTIVOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50),
(318, 'A-05-01-02-007-002-01', 'SERVICIOS INMOBILIARIOS RELATIVOS A BIENES RAICES PROPIOS O ARRENDADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(319, 'A-05-01-02-007-002-01-1', 'SERVICIOS DE ALQUILER O ARRENDAMIENTO CON O SIN OPCION DE COMPRA RELATIVOS A BIENES INMUEBLES PROPIOS O ARRENDADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(320, 'A-05-01-02-007-002-01-2', 'VENTA DE BIENES INMUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(321, 'A-05-01-02-007-002-01-3', 'SERVICIOS COMERCIALES RELACIONADOS CON TERRENOS DESOCUPADOS Y SUBDIVIDIDOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(322, 'A-05-01-02-007-002-02', 'SERVICIOS INMOBILIARIOS A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(323, 'A-05-01-02-007-002-02-1', 'SERVICIOS DE ADMINISTRACION DE BIENES INMUEBLES A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(324, 'A-05-01-02-007-002-02-2', 'SERVICIO DE ARRENDAMIENTO DE BIENES INMUEBLES A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(325, 'A-05-01-02-007-002-02-3', 'SERVICIO DE VENTA DE BIENES INMUEBLES A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(326, 'A-05-01-02-007-002-02-4', 'SERVICIOS DE VENTA DE TERRENOS A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(327, 'A-05-01-02-007-002-02-5', 'VALUACIONES INMOBILIARIAS A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51),
(328, 'A-05-01-02-007-003-01', 'SERVICIOS DE ARRENDAMIENTO O ALQUILER DE MAQUINARIA Y EQUIPO SIN OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(329, 'A-05-01-02-007-003-02', 'SERVICIOS DE ARRENDAMIENTO SIN OPCION DE COMPRA DE OTROS BIENES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52);
INSERT INTO `uso_rubros` (`id`, `codigo_uso`, `nombre_uso`, `created_at`, `updated_at`, `rubroprin_id`) VALUES
(330, 'A-05-01-02-007-003-03', 'DERECHOS DE USO DE PRODUCTOS DE PROPIEDAD INTELECTUAL Y OTROS PRODUCTOS SIMILARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(331, 'A-05-01-02-007-003-03-1', 'DERECHOS DE USO DE PROGRAMAS INFORMATICOS Y BASES DE DATOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(332, 'A-05-01-02-007-003-03-2', 'DERECHOS DE USO DE OBRAS ORIGINALES LITERARIAS, ARTISTICAS Y DE ENTRETENIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(333, 'A-05-01-02-007-003-03-3', 'DERECHOS DE USO DE PRODUCTOS DE INVESTIGACION Y DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(334, 'A-05-01-02-007-003-03-4', 'DERECHOS DE USO DE MARCAS Y FRANQUICIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(335, 'A-05-01-02-007-003-03-5', 'DERECHOS DE USO DE EVALUACION Y EXPLORACION MINERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(336, 'A-05-01-02-007-003-03-9', 'DERECHOS DE USO DE OTROS PRODUCTOS DE PROPIEDAD INTELECTUAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52),
(337, 'A-05-01-02-008-001-01', 'SERVICIOS DE INVESTIGACION Y DESARROLLO EXPERIMENTAL EN CIENCIAS NATURALES E INGENIERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53),
(338, 'A-05-01-02-008-001-02', 'SERVICIOS DE INVESTIGACION Y DESARROLLO EXPERIMENTAL EN CIENCIAS SOCIALES Y HUMANIDADES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53),
(339, 'A-05-01-02-008-001-03', 'SERVICIOS INTERDISCIPLINARIOS DE INVESTIGACION Y DESARROLLO EXPERIMENTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53),
(340, 'A-05-01-02-008-001-04', 'CREACIONES ORIGINALES RELACIONADAS CON LA INVESTIGACION Y DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53),
(341, 'A-05-01-02-008-002-01', 'SERVICIOS JURIDICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54),
(342, 'A-05-01-02-008-002-02', 'SERVICIOS DE CONTABILIDAD, AUDITORIA Y TENEDURIA DE LIBROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54),
(343, 'A-05-01-02-008-002-03', 'SERVICIOS DE PREPARACION Y ASESORAMIENTO TRIBUTARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54),
(344, 'A-05-01-02-008-002-04', 'SERVICIOS RELACIONADOS CON CASOS DE INSOLVENCIA Y LIQUIDACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54),
(345, 'A-05-01-02-008-003-01', 'SERVICIOS DE CONSULTORIA EN ADMINISTRACION Y SERVICIOS DE GESTION SERVICIOS DE TECNOLOGIA DE LA INFORMACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(346, 'A-05-01-02-008-003-01-1', 'SERVICIOS DE CONSULTORIA EN ADMINISTRACION Y SERVICIOS DE GESTION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(347, 'A-05-01-02-008-003-01-2', 'SERVICIOS DE CONSULTORIA PRESTADOS A LAS EMPRESAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(348, 'A-05-01-02-008-003-01-3', 'SERVICIOS DE TECNOLOGIA DE LA INFORMACION (TI) DE CONSULTORIA Y DE APOYO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(349, 'A-05-01-02-008-003-01-4', 'SERVICIOS DE DISE?O Y DESARROLLO DE LA TECNOLOGIA DE LA INFORMACION (TI)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(350, 'A-05-01-02-008-003-01-5', 'SERVICIOS DE SUMINISTRO DE INFRAESTRUCTURA DE HOSTING Y DE TECNOLOGIA DE LA INFORMACION (TI)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(351, 'A-05-01-02-008-003-01-6', 'SERVICIOS DE GESTION DE RED E INFRAESTRUCTURA DE TI', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(352, 'A-05-01-02-008-003-01-9', 'OTROS SERVICIOS DE GESTION, EXCEPTO LOS SERVICIOS DE ADMINISTRACION DE PROYECTOS DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(353, 'A-05-01-02-008-003-02', 'SERVICIOS DE ARQUITECTURA, SERVICIOS DE PLANEACION URBANA Y ORDENACION DEL TERRITORIO SERVICIOS DE ARQUITECTURA PAISAJISTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(354, 'A-05-01-02-008-003-03', 'SERVICIOS DE INGENIERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(355, 'A-05-01-02-008-003-04', 'SERVICIOS CIENTIFICOS Y OTROS SERVICIOS TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(356, 'A-05-01-02-008-003-04-1', 'SERVICIOS DE PROSPECCION GEOLOGICA, GEOFISICA Y OTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(357, 'A-05-01-02-008-003-04-2', 'SERVICIOS DE TOPOGRAFIA DE SUPERFICIE Y CARTOGRAFIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(358, 'A-05-01-02-008-003-04-3', 'PRONOSTICO DEL TIEMPO Y SERVICIOS METEOROLOGICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(359, 'A-05-01-02-008-003-04-4', 'SERVICIOS DE ENSAYO Y ANALISIS TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(360, 'A-05-01-02-008-003-05', 'SERVICIOS VETERINARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(361, 'A-05-01-02-008-003-06', 'SERVICIOS DE PUBLICIDAD Y EL SUMINISTRO DE ESPACIO O TIEMPO PUBLICITARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(362, 'A-05-01-02-008-003-07', 'SERVICIOS DE INVESTIGACION DE MERCADOS Y DE ENCUESTAS DE OPINION PUBLICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(363, 'A-05-01-02-008-003-08', 'SERVICIOS FOTOGRAFICOS Y SERVICIOS DE REVELADO FOTOGRAFICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(364, 'A-05-01-02-008-003-09', 'OTROS SERVICIOS PROFESIONALES Y TECNICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55),
(365, 'A-05-01-02-008-004-01', 'SERVICIOS DE TELEFONIA Y OTRAS TELECOMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56),
(366, 'A-05-01-02-008-004-02', 'SERVICIOS DE TELECOMUNICACIONES A TRAVES DE INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56),
(367, 'A-05-01-02-008-004-03', 'SERVICIOS DE CONTENIDOS EN LINEA (ON-LINE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56),
(368, 'A-05-01-02-008-004-04', 'SERVICIOS DE AGENCIAS DE NOTICIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56),
(369, 'A-05-01-02-008-004-05', 'SERVICIOS DE BIBLIOTECAS Y ARCHIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56),
(370, 'A-05-01-02-008-004-06', 'SERVICIOS DE PROGRAMACION, DISTRIBUCION Y TRANSMISION DE PROGRAMAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56),
(371, 'A-05-01-02-008-005-01', 'SERVICIOS DE EMPLEO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(372, 'A-05-01-02-008-005-02', 'SERVICIOS DE INVESTIGACION Y SEGURIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(373, 'A-05-01-02-008-005-03', 'SERVICIOS DE LIMPIEZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(374, 'A-05-01-02-008-005-04', 'SERVICIOS DE EMPAQUE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(375, 'A-05-01-02-008-005-05', 'SERVICIOS DE ORGANIZACION DE VIAJES, OPERADORES TURISTICOS Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(376, 'A-05-01-02-008-005-09', 'OTROS SERVICIOS AUXILIARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(377, 'A-05-01-02-008-005-09-1', 'SERVICIOS DE INFORMACION CREDITICIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(378, 'A-05-01-02-008-005-09-2', 'SERVICIOS DE AGENCIAS DE COBRANZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(379, 'A-05-01-02-008-005-09-3', 'SERVICIOS AUXILIARES POR TELEFONO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(380, 'A-05-01-02-008-005-09-4', 'SERVICIOS ADMINISTRATIVOS COMBINADOS DE OFICINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(381, 'A-05-01-02-008-005-09-5', 'SERVICIOS AUXILIARES ESPECIALIZADOS DE OFICINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(382, 'A-05-01-02-008-005-09-6', 'SERVICIOS DE ORGANIZACION Y ASISTENCIA DE CONVENCIONES Y FERIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(383, 'A-05-01-02-008-005-09-7', 'SERVICIOS DE MANTENIMIENTO Y CUIDADO DEL PAISAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(384, 'A-05-01-02-008-005-09-9', 'OTROS SERVICIOS DE APOYO Y DE INFORMACION N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57),
(385, 'A-05-01-02-008-006-01', 'SERVICIOS DE APOYO A LA AGRICULTURA, LA CAZA, LA SILVICULTURA Y LA PESCA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58),
(386, 'A-05-01-02-008-006-02', 'SERVICIOS DE APOYO A LA MINERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58),
(387, 'A-05-01-02-008-006-03', 'SERVICIOS DE APOYO A LA DISTRIBUCION DE ELECTRICIDAD, GAS Y AGUA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58),
(388, 'A-05-01-02-008-007-01', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE PRODUCTOS METALICOS ELABORADOS, MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(389, 'A-05-01-02-008-007-01-1', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE PRODUCTOS METALICOS ELABORADOS, EXCEPTO MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(390, 'A-05-01-02-008-007-01-2', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE MAQUINARIA DE OFICINA Y CONTABILIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(391, 'A-05-01-02-008-007-01-3', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE COMPUTADORES Y EQUIPO PERIFERICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(392, 'A-05-01-02-008-007-01-4', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE MAQUINARIA Y EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(393, 'A-05-01-02-008-007-01-5', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE OTRA MAQUINARIA Y OTRO EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(394, 'A-05-01-02-008-007-02', 'SERVICIOS DE REPARACION DE OTROS BIENES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(395, 'A-05-01-02-008-007-02-1', 'SERVICIOS DE REPARACION DE CALZADO Y ARTICULOS DE CUERO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(396, 'A-05-01-02-008-007-02-2', 'SERVICIOS DE REPARACION DE RELOJES Y JOYAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(397, 'A-05-01-02-008-007-02-3', 'SERVICIOS DE REPARACION DE PRENDAS DE VESTIR Y TEXTILES PARA EL HOGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(398, 'A-05-01-02-008-007-02-4', 'SERVICIOS DE REPARACION DE MUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(399, 'A-05-01-02-008-007-02-9', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE OTROS BIENES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(400, 'A-05-01-02-008-007-03', 'SERVICIOS DE INSTALACION (DISTINTOS DE LOS SERVICIOS DE CONSTRUCCION)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(401, 'A-05-01-02-008-007-03-1', 'SERVICIOS DE INSTALACION DE PRODUCTOS METALICOS ELABORADOS, EXCEPTO MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(402, 'A-05-01-02-008-007-03-2', 'SERVICIOS DE INSTALACION DE MAQUINARIA Y EQUIPO PARA EL SECTOR INDUSTRIAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(403, 'A-05-01-02-008-007-03-3', 'SERVICIOS DE INSTALACION DE MAQUINARIA DE OFICINA, CONTABILIDAD Y COMPUTADORES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(404, 'A-05-01-02-008-007-03-4', 'SERVICIOS DE INSTALACION DE EQUIPOS Y APARATOS DE RADIO, TELEVISION Y COMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(405, 'A-05-01-02-008-007-03-5', 'SERVICIOS DE INSTALACION DE MAQUINARIA Y EQUIPO MEDICO PROFESIONAL, E INSTRUMENTOS DE PRECISION Y OPTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(406, 'A-05-01-02-008-007-03-6', 'SERVICIOS DE INSTALACION DE MAQUINARIA Y APARATOS ELECTRICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(407, 'A-05-01-02-008-007-03-9', 'SERVICIOS DE INSTALACION DE OTROS BIENES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59),
(408, 'A-05-01-02-008-008-01', 'SERVICIOS DE FABRICACION DE ALIMENTOS, BEBIDAS Y TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(409, 'A-05-01-02-008-008-02', 'SERVICIOS DE FABRICACION DE TEXTILES, CONFECCIONES Y PRODUCTOS DE CUERO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(410, 'A-05-01-02-008-008-03', 'SERVICIOS DE FABRICACION DE LA MADERA Y EL PAPEL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(411, 'A-05-01-02-008-008-04', 'SERVICIOS DE FABRICACION DE PRODUCTOS DE LA REFINACION DEL PETROLEO, PRODUCTOS QUIMICOS Y FARMACEUTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(412, 'A-05-01-02-008-008-05', 'SERVICIOS DE FABRICACION DE PRODUCTOS DE CAUCHO, PLASTICO Y OTROS PRODUCTOS MINERALES NO METALICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(413, 'A-05-01-02-008-008-06', 'SERVICIOS DE FABRICACION DE PRODUCTOS METALURGICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(414, 'A-05-01-02-008-008-07', 'SERVICIOS DE FABRICACION DE PRODUCTOS METALICOS ELABORADOS, MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(415, 'A-05-01-02-008-008-08', 'SERVICIOS DE FABRICACION DE EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(416, 'A-05-01-02-008-008-09', 'OTROS SERVICIOS DE FABRICACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60),
(417, 'A-05-01-02-008-009-01', 'SERVICIOS DE EDICION, IMPRESION Y REPRODUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61),
(418, 'A-05-01-02-008-009-02', 'SERVICIOS DE MOLDEADO, ESTAMPADO, EXTRUSION Y FABRICACION DE PRODUCTOS SIMILARES DE PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61),
(419, 'A-05-01-02-008-009-03', 'SERVICIOS DE FUNDICION, FORJA, ESTAMPADO Y FABRICACION DE PRODUCTOS SIMILARES DE METALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61),
(420, 'A-05-01-02-008-009-04', 'SERVICIOS DE RECUPERACION DE MATERIALES, A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61),
(421, 'A-05-01-02-009-002-01', 'SERVICIOS DE EDUCACION DE LA PRIMERA INFANCIA Y PREESCOLAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(422, 'A-05-01-02-009-002-02', 'SERVICIOS DE ENSE?ANZA PRIMARIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(423, 'A-05-01-02-009-002-03', 'SERVICIOS DE EDUCACION SECUNDARIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(424, 'A-05-01-02-009-002-04', 'SERVICIOS DE EDUCACION POSTSECUNDARIA NO TERCIARIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(425, 'A-05-01-02-009-002-05', 'SERVICIOS DE EDUCACION SUPERIOR (TERCIARIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(426, 'A-05-01-02-009-002-09', 'OTROS TIPOS DE EDUCACION Y SERVICIOS DE APOYO EDUCATIVO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(427, 'A-05-01-02-009-003-01', 'SERVICIOS DE SALUD HUMANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63),
(428, 'A-05-01-02-009-003-02', 'SERVICIOS DE ATENCION RESIDENCIAL PARA PERSONAS MAYORES Y CON DISCAPACIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63),
(429, 'A-05-01-02-009-003-03', 'OTROS SERVICIOS SOCIALES CON ALOJAMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63),
(430, 'A-05-01-02-009-003-04', 'SERVICIOS SOCIALES SIN ALOJAMIENTO PARA PERSONAS MAYORES Y CON DISCAPACIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63),
(431, 'A-05-01-02-009-003-05', 'OTROS SERVICIOS SOCIALES SIN ALOJAMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63),
(432, 'A-05-01-02-009-004-01', 'SERVICIOS DE ALCANTARILLADO, SERVICIOS DE LIMPIEZA, TRATAMIENTO DE AGUAS RESIDUALES Y TANQUES SEPTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(433, 'A-05-01-02-009-004-02', 'SERVICIOS DE RECOLECCION DE DESECHOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(434, 'A-05-01-02-009-004-03', 'SERVICIOS DE TRATAMIENTO Y DISPOSICION DE DESECHOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(435, 'A-05-01-02-009-004-04', 'SERVICIOS DE DESCONTAMINACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(436, 'A-05-01-02-009-004-05', 'SERVICIOS DE SANEAMIENTO Y SIMILARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(437, 'A-05-01-02-009-004-09', 'OTROS SERVICIOS DE PROTECCION DEL MEDIO AMBIENTE N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(438, 'A-05-01-02-009-006-01', 'SERVICIOS AUDIOVISUALES Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(439, 'A-05-01-02-009-006-02', 'SERVICIOS DE PROMOCION Y PRESENTACION DE ARTES ESCENICAS Y EVENTOS DE ENTRETENIMIENTO EN VIVO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(440, 'A-05-01-02-009-006-03', 'SERVICIOS RELACIONADOS CON ACTORES Y OTROS ARTISTAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(441, 'A-05-01-02-009-006-04', 'SERVICIOS DE PRESERVACION Y MUSEOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(442, 'A-05-01-02-009-006-05', 'SERVICIOS DEPORTIVOS Y DEPORTES RECREATIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(443, 'A-05-01-02-009-006-06', 'SERVICIOS DE ATLETAS Y SERVICIOS DE AUXILIARES CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(444, 'A-05-01-02-009-006-09', 'OTROS SERVICIOS DE ESPARCIMIENTO Y DIVERSION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(445, 'A-05-01-02-009-007-01', 'SERVICIOS DE LAVADO, LIMPIEZA Y TE?IDO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66),
(446, 'A-05-01-02-009-007-02', 'SERVICIOS DE TRATAMIENTOS DE BELLEZA Y DE BIENESTAR FISICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66),
(447, 'A-05-01-02-009-007-03', 'SERVICIOS FUNERARIOS, DE CREMACION Y DE SEPULTURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66),
(448, 'A-05-01-02-009-007-09', 'OTROS SERVICIOS DIVERSOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66),
(449, 'A-05-01-02-009-009', 'SERVICIOS PRESTADOS POR ORGANIZACIONES Y ORGANISMOS EXTRATERRITORIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67),
(450, 'A-02-01-01-001-001', 'VIVIENDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(451, 'A-02-01-01-001-001-01', 'EDIFICIOS UTILIZADOS PARA RESIDENCIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(452, 'A-02-01-01-001-001-02', 'CASAS FLOTANTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(453, 'A-02-01-01-001-001-03', 'BARCAZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(454, 'A-02-01-01-001-001-04', 'VIVIENDAS MOVILES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(455, 'A-02-01-01-001-001-05', 'COCHES HABITACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(456, 'A-02-01-01-001-001-06', 'MONUMENTOS PUBLICOS CONSIDERADOS PRINCIPALMENTE COMO VIVIENDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(457, 'A-02-01-01-001-001-07', 'VIVIENDAS PARA PERSONAL MILITAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(458, 'A-02-01-01-001-001-08', 'CONSTRUCCIONES PREFABRICADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(459, 'A-02-01-01-001-001-09', 'OTROS EDIFICIOS UTILIZADOS COMO RESIDENCIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(460, 'A-02-01-01-001-002', 'EDIFICIOS DISTINTOS A VIVIENDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(461, 'A-02-01-01-001-002-01', 'MONUMENTOS PUBLICOS NO RESIDENCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(462, 'A-02-01-01-001-002-02', 'EDIFICIOS INDUSTRIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(463, 'A-02-01-01-001-002-03', 'EDIFICIOS COMERCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(464, 'A-02-01-01-001-002-04', 'EDIFICIOS PUBLICOS DE ENTRETENIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(465, 'A-02-01-01-001-002-05', 'EDIFICIOS DE HOTELES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(466, 'A-02-01-01-001-002-06', 'RESTAURANTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(467, 'A-02-01-01-001-002-07', 'EDIFICIOS EDUCATIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(468, 'A-02-01-01-001-002-08', 'EDIFICIOS RELACIONADOS CON LA SALUD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(469, 'A-02-01-01-001-002-09', 'PRISIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(470, 'A-02-01-01-001-002-10', 'EDIFICIOS Y ESTRUCTURAS PARA FINES MILITARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(471, 'A-02-01-01-001-002-11', 'OTROS EDIFICIOS NO RESIDENCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(472, 'A-02-01-01-001-003', 'OTRAS ESTRUCTURAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(473, 'A-02-01-01-001-003-01', 'AUTOPISTAS, CARRETERAS, CALLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(474, 'A-02-01-01-001-003-02', 'PISTAS DE ATERRIZAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(475, 'A-02-01-01-001-003-03', 'FERROCARRILES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(476, 'A-02-01-01-001-003-04', 'PUENTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(477, 'A-02-01-01-001-003-05', 'CARRETERAS ELEVADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(478, 'A-02-01-01-001-003-06', 'TUNELES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(479, 'A-02-01-01-001-003-07', 'ACUEDUCTOS Y OTROS CONDUCTOS DE SUMINISTRO DE AGUA, EXCEPTO GASODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(480, 'A-02-01-01-001-003-08', 'PUERTOS, VIAS NAVEGABLES E INSTALACIONES CONEXAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(481, 'A-02-01-01-001-003-09', 'REPRESAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(482, 'A-02-01-01-001-003-10', 'SISTEMAS DE RIEGO Y OBRAS HIDRAULICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(483, 'A-02-01-01-001-003-11', 'TUBERIAS DE LARGA DISTANCIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(484, 'A-02-01-01-001-003-12', 'OBRAS PARA LA COMUNICACION DE LARGA DISTANCIA Y LAS LINEAS ELECTRICAS (CABLES)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(485, 'A-02-01-01-001-003-13', 'GASODUCTOS Y OLEODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(486, 'A-02-01-01-001-003-14', 'CABLES LOCALES Y OBRAS CONEXAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(487, 'A-02-01-01-001-003-15', 'ALCANTARILLAS Y PLANTAS DE TRATAMIENTO DE AGUA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(488, 'A-02-01-01-001-003-16', 'CONSTRUCCIONES EN MINAS Y PLANTAS INDUSTRIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(489, 'A-02-01-01-001-003-17', 'CONSTRUCCIONES DEPORTIVAS AL AIRE LIBRE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(490, 'A-02-01-01-001-003-18', 'OTRAS OBRAS DE INGENIERIA CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(491, 'A-02-01-01-001-004', 'MEJORAS DE TIERRAS Y TERRENOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71),
(492, 'A-02-01-01-002-001', 'BUQUES DE GUERRA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72),
(493, 'A-02-01-01-002-002', 'SUBMARINOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73),
(494, 'A-02-01-01-002-003', 'AERONAVES MILITARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 74),
(495, 'A-02-01-01-002-004', 'TANQUES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 75),
(496, 'A-02-01-01-002-005', 'DISPOSITIVOS DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76),
(497, 'A-02-01-01-002-006', 'LANZA MISILES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 77),
(498, 'A-02-01-01-002-007', 'OTROS SISTEMAS DE ARMAMENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78),
(499, 'A-02-01-01-003-008', 'MUEBLES, INSTRUMENTOS MUSICALES, ARTICULOS DE DEPORTE Y ANTIG?EDADES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(500, 'A-02-01-01-003-008-01', 'MUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(501, 'A-02-01-01-003-008-01-1', 'ASIENTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(502, 'A-02-01-01-003-008-01-2', 'MUEBLES, DEL TIPO UTILIZADO EN OFICINAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(503, 'A-02-01-01-003-008-01-3', 'MUEBLES DE MADERA, DEL TIPO UTILIZADO EN LA COCINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(504, 'A-02-01-01-003-008-01-4', 'OTROS MUEBLES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(505, 'A-02-01-01-003-008-01-5', 'SOMIERES, COLCHONES CON MUELLES, RELLENOS O GUARNECIDOS INTERIORMENTE CON CUALQUIER MATERIAL, DE CAUCHO O PLASTICOS CELULARES, RECUBIERTOS O NO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(506, 'A-02-01-01-003-008-01-6', 'PARTES Y PIEZAS DE MUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(507, 'A-02-01-01-003-008-03', 'INSTRUMENTOS MUSICALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(508, 'A-02-01-01-003-008-04', 'ARTICULOS DE DEPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(509, 'A-02-01-01-003-008-09', 'ANTIG?EDADES U OTROS OBJETOS DE ARTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(510, 'A-02-01-01-004-003', 'MAQUINARIA PARA USO GENERAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(511, 'A-02-01-01-004-003-01', 'MOTORES Y TURBINAS Y SUS PARTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(512, 'A-02-01-01-004-003-02', 'BOMBAS, COMPRESORES, MOTORES DE FUERZA HIDRAULICA Y MOTORES DE POTENCIA NEUMATICA Y VALVULAS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(513, 'A-02-01-01-004-003-03', 'COJINETES, ENGRANAJES, RUEDAS DE FRICCION Y ELEMENTOS DE TRANSMISION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(514, 'A-02-01-01-004-003-04', 'HORNOS Y QUEMADORES PARA ALIMENTACION DE HOGARES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(515, 'A-02-01-01-004-003-05', 'EQUIPO DE ELEVACION Y MANIPULACION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(516, 'A-02-01-01-004-003-09', 'OTRAS MAQUINAS PARA USOS GENERALES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(517, 'A-02-01-01-004-004', 'MAQUINARIA PARA USOS ESPECIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(518, 'A-02-01-01-004-004-01', 'MAQUINARIA AGROPECUARIA O SILVICOLA Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(519, 'A-02-01-01-004-004-02', 'MAQUINAS HERRAMIENTAS Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(520, 'A-02-01-01-004-004-03', 'MAQUINARIA PARA LA INDUSTRIA METALURGICA Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(521, 'A-02-01-01-004-004-04', 'MAQUINARIA PARA LA MINERIA, LA EXPLOTACION DE CANTERAS Y LA CONSTRUCCION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(522, 'A-02-01-01-004-004-05', 'MAQUINARIA PARA LA ELABORACION DE ALIMENTOS, BEBIDAS Y TABACO, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(523, 'A-02-01-01-004-004-06', 'MAQUINARIA PARA LA FABRICACION DE TEXTILES, PRENDAS DE VESTIR Y ARTICULOS DE CUERO, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(524, 'A-02-01-01-004-004-08', 'APARATOS DE USO DOMESTICO Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(525, 'A-02-01-01-004-004-09', 'OTRA MAQUINARIA PARA USOS ESPECIALES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(526, 'A-02-01-01-004-005', 'MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82),
(527, 'A-02-01-01-004-005-01', 'MAQUINAS PARA OFICINA Y CONTABILIDAD, Y SUS PARTES Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82),
(528, 'A-02-01-01-004-005-02', 'MAQUINARIA DE INFORMATICA Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82),
(529, 'A-02-01-01-004-006', 'MAQUINARIA Y APARATOS ELECTRICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(530, 'A-02-01-01-004-006-01', 'MOTORES, GENERADORES Y TRANSFORMADORES ELECTRICOS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(531, 'A-02-01-01-004-006-02', 'APARATOS DE CONTROL ELECTRICO Y DISTRIBUCION DE ELECTRICIDAD Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(532, 'A-02-01-01-004-006-03', 'HILOS Y CABLES AISLADOS CABLE DE FIBRA OPTICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(533, 'A-02-01-01-004-006-04', 'ACUMULADORES, PILAS Y BATERIAS PRIMARIAS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(534, 'A-02-01-01-004-006-05', 'LAMPARAS ELECTRICAS DE INCANDESCENCIA O DESCARGA LAMPARAS DE ARCO, EQUIPO PARA ALUMBRADO ELECTRICO SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(535, 'A-02-01-01-004-006-09', 'OTRO EQUIPO ELECTRICO Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(536, 'A-02-01-01-004-007', 'EQUIPO Y APARATOS DE RADIO, TELEVISION Y COMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(537, 'A-02-01-01-004-007-01', 'VALVULAS Y TUBOS ELECTRONICOS COMPONENTES ELECTRONICOS SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(538, 'A-02-01-01-004-007-02', 'APARATOS TRANSMISORES DE TELEVISION Y RADIO TELEVISION, VIDEO Y CAMARAS DIGITALES TELEFONOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(539, 'A-02-01-01-004-007-03', 'RADIORRECEPTORES Y RECEPTORES DE TELEVISION APARATOS PARA LA GRABACION Y REPRODUCCION DE SONIDO Y VIDEO MICROFONOS, ALTAVOCES, AMPLIFICADORES, ETC.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(540, 'A-02-01-01-004-007-04', 'PARTES Y PIEZAS DE LOS PRODUCTOS DE LAS CLASES 4721 A 4733 Y 4822', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(541, 'A-02-01-01-004-007-05', 'DISCOS, CINTAS, DISPOSITIVOS DE ALMACENAMIENTO EN ESTADO SOLIDO NO VOLATILES Y OTROS MEDIOS, NO GRABADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(542, 'A-02-01-01-004-007-06', 'GRABACIONES DE AUDIO, VIDEO Y OTROS DISCOS, CINTAS Y OTROS MEDIOS FISICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(543, 'A-02-01-01-004-007-09', 'TARJETAS CON BANDAS MAGNETICAS O PLAQUETAS (CHIP)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(544, 'A-02-01-01-004-008', 'APARATOS MEDICOS, INSTRUMENTOS OPTICOS Y DE PRECISION, RELOJES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85),
(545, 'A-02-01-01-004-008-01', 'APARATOS MEDICOS Y QUIRURGICOS Y APARATOS ORTESICOS Y PROTESICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85),
(546, 'A-02-01-01-004-008-02', 'INSTRUMENTOS Y APARATOS DE MEDICION, VERIFICACION, ANALISIS, DE NAVEGACION Y PARA OTROS FINES (EXCEPTO INSTRUMENTOS OPTICOS) INSTRUMENTOS DE CONTROL DE PROCESOS INDUSTRIALES, SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85),
(547, 'A-02-01-01-004-008-03', 'INSTRUMENTOS OPTICOS Y EQUIPO FOTOGRAFICO PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85),
(548, 'A-02-01-01-004-008-04', 'RELOJES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85),
(549, 'A-02-01-01-004-009', 'EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(550, 'A-02-01-01-004-009-01', 'VEHICULOS AUTOMOTORES, REMOLQUES Y SEMIRREMOLQUES Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(551, 'A-02-01-01-004-009-02', 'CARROCERIAS (INCLUSO CABINAS) PARA VEHICULOS AUTOMOTORES REMOLQUES Y SEMIRREMOLQUES Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(552, 'A-02-01-01-004-009-03', 'BUQUES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(553, 'A-02-01-01-004-009-04', 'EMBARCACIONES PARA DEPORTES Y RECREO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(554, 'A-02-01-01-004-009-05', 'LOCOMOTORAS Y MATERIAL RODANTE DE FERROCARRIL Y TRANVIA, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(555, 'A-02-01-01-004-009-06', 'AERONAVES Y NAVES ESPACIALES, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(556, 'A-02-01-01-004-009-09', 'OTRO EQUIPO DE TRANSPORTE, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(557, 'A-02-01-01-004-009-09-1', 'MOTOCICLETAS Y SIDECARES (VEHICULOS LATERALES A LAS MOTOCICLETAS)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(558, 'A-02-01-01-004-009-09-2', 'BICICLETAS Y SILLONES DE RUEDAS PARA DISCAPACITADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(559, 'A-02-01-01-004-009-09-3', 'VEHICULOS N.C.P. SIN PROPULSION MECANICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(560, 'A-02-01-01-004-009-09-4', 'PARTES Y PIEZAS PARA LOS PRODUCTOS DE LAS CLASES 4991 Y 4992', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(561, 'A-02-01-01-004-010', 'EQUIPO MILITAR Y POLICIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(562, 'A-02-01-01-004-010-01', 'ARMAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(563, 'A-02-01-01-004-010-02', 'EQUIPO DE ALOJAMIENTO Y CAMPANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(564, 'A-02-01-01-004-010-03', 'EQUIPO DE INTELIGENCIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(565, 'A-02-01-01-004-010-04', 'EQUIPO MILITAR Y DE SEGURIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(566, 'A-02-01-01-004-010-05', 'EQUIPO POLICIA JUDICIAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(567, 'A-02-01-01-004-010-06', 'EQUIPO ANTIMOTINES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(568, 'A-02-01-01-004-010-07', 'OTROS EQUIPOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(569, 'A-02-01-01-006-001', 'RECURSOS BIOLOGICOS CULTIVADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(570, 'A-02-01-01-006-001-01', 'RECURSOS ANIMALES QUE GENERAN PRODUCTOS EN FORMA REPETIDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(571, 'A-02-01-01-006-001-01-1', 'ANIMALES DE CRIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(572, 'A-02-01-01-006-001-01-2', 'GANADO LECHERO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(573, 'A-02-01-01-006-001-01-3', 'ANIMALES DE TIRO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(574, 'A-02-01-01-006-001-01-4', 'ANIMALES UTILIZADOS PARA LA PRODUCCION DE LANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(575, 'A-02-01-01-006-001-01-5', 'ANIMALES EMPLEADOS PARA EL TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(576, 'A-02-01-01-006-001-01-6', 'ANIMALES EMPLEADOS PARA LAS CARRETAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(577, 'A-02-01-01-006-001-01-7', 'ANIMALES EMPLEADOS PARA EL ESPARCIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(578, 'A-02-01-01-006-001-01-8', 'OTROS ANIMALES QUE GENERAN PRODUCTOS EN FORMA REPETIDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(579, 'A-02-01-01-006-001-02', 'ARBOLES, CULTIVOS Y PLANTAS QUE GENERAN PRODUCTOS EN FORMA REPETIDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(580, 'A-02-01-01-006-001-02-1', 'ARBOLES FRUTALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(581, 'A-02-01-01-006-001-02-2', 'ARBOLES CULTIVADOS POR SUS NUECES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(582, 'A-02-01-01-006-001-02-3', 'ARBOLES CULTIVADOS POR SU SAVIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(583, 'A-02-01-01-006-001-02-4', 'ARBOLES CULTIVADOS POR SU RESINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(584, 'A-02-01-01-006-001-02-5', 'ARBOLES CULTIVADOS POR SU CORTEZA U HOJAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(585, 'A-02-01-01-006-001-02-6', 'OTROS ARBOLES, CULTIVOS Y PLANTAS QUE GENERAN PRODUCTOS EN FORMA REPETIDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(586, 'A-02-01-01-006-002', 'PRODUCTOS DE LA PROPIEDAD INTELECTUAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(587, 'A-02-01-01-006-002-01', 'INVESTIGACION Y DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(588, 'A-02-01-01-006-002-02', 'EXPLOTACION Y EVALUACION MINERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(589, 'A-02-01-01-006-002-02-1', 'COSTOS DE LAS PERFORACIONES DE PRUEBA Y SONDEO REALIZADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(590, 'A-02-01-01-006-002-02-2', 'COSTOS DE PRECALIFICACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(591, 'A-02-01-01-006-002-02-3', 'OBTENCION DE LICENCIAS, ADQUISICION Y AVALUOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(592, 'A-02-01-01-006-002-02-4', 'COSTOS DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(593, 'A-02-01-01-006-002-02-5', 'OTROS COSTOS DE EVALUACION Y EXPLOTACION MINERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(594, 'A-02-01-01-006-002-03', 'PROGRAMAS DE INFORMATICA Y BASES DE DATOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(595, 'A-02-01-01-006-002-03-1', 'PROGRAMAS DE INFORMATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(596, 'A-02-01-01-006-002-03-1-01', 'PAQUETES DE SOFTWARE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(597, 'A-02-01-01-006-002-03-2', 'BASES DE DATOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(598, 'A-02-01-01-006-002-03-2-02', 'GASTOS DE DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(599, 'A-02-01-01-006-002-04', 'ORIGINALES DE ENTRETENIMIENTO, LITERATURA Y ARTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(600, 'A-02-01-01-006-002-05', 'OTROS PRODUCTOS DE PROPIEDAD INTELECTUAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(601, 'A-02-01-02-003-008', 'JOYAS, METALES PRECIOSOS Y ANTIG?EDADES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 90),
(602, 'A-02-01-02-003-008-02', 'JOYAS Y ARTICULOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 90),
(603, 'A-02-01-02-003-008-09', 'ANTIG?EDADES U OTROS OBJETOS DE ARTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 90),
(604, 'A-02-02-01-000-001', 'PRODUCTOS DE LA AGRICULTURA Y LA HORTICULTURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(605, 'A-02-02-01-000-001-01', 'CEREALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(606, 'A-02-02-01-000-001-02', 'HORTALIZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(607, 'A-02-02-01-000-001-03', 'FRUTAS Y NUECES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(608, 'A-02-02-01-000-001-04', 'SEMILLAS Y FRUTOS OLEAGINOSOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(609, 'A-02-02-01-000-001-05', 'RAICES Y TUBERCULOS COMESTIBLES RICOS EN ALMIDON O INULINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(610, 'A-02-02-01-000-001-06', 'PLANTAS AROMATICAS, BEBESTIBLES Y ESPECIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(611, 'A-02-02-01-000-001-07', 'LEGUMBRES, SECAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(612, 'A-02-02-01-000-001-08', 'PLANTAS UTILIZADAS EN LA FABRICACION DE AZUCAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(613, 'A-02-02-01-000-001-09', 'PRODUCTOS DE FORRAJE, FIBRAS, PLANTAS VIVAS, FLORES Y CAPULLOS DE FLORES, TABACO EN RAMA Y CAUCHO NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(614, 'A-02-02-01-000-002', 'ANIMALES VIVOS Y PRODUCTOS ANIMALES (EXCEPTO LA CARNE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(615, 'A-02-02-01-000-002-01', 'ANIMALES VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(616, 'A-02-02-01-000-002-01-1', 'BOVINOS VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(617, 'A-02-02-01-000-002-01-2', 'OTROS RUMIANTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(618, 'A-02-02-01-000-002-01-3', 'CABALLOS Y OTROS EQUIDOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(619, 'A-02-02-01-000-002-01-4', 'GANADO PORCINO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(620, 'A-02-02-01-000-002-01-5', 'AVES DE CORRAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(621, 'A-02-02-01-000-002-01-9', 'OTROS ANIMALES VIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(622, 'A-02-02-01-000-002-02', 'LECHE CRUDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(623, 'A-02-02-01-000-002-03', 'HUEVOS DE GALLINA O DE OTRAS AVES, CON CASCARA, FRESCOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(624, 'A-02-02-01-000-002-04', 'MATERIALES REPRODUCTIVOS DE ANIMALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(625, 'A-02-02-01-000-002-09', 'OTROS PRODUCTOS ANIMALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(626, 'A-02-02-01-000-003', 'PRODUCTOS DE LA SILVICULTURA Y DE LA EXPLOTACION FORESTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 93),
(627, 'A-02-02-01-000-003-01', 'MADERA EN BRUTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 93),
(628, 'A-02-02-01-000-003-02', 'PRODUCTOS FORESTALES DIFERENTES A LA MADERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 93),
(629, 'A-02-02-01-000-004', 'PESCADO Y OTROS PRODUCTOS DE LA PESCA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 94),
(630, 'A-02-02-01-001-001', 'CARBON DE HULLA, LIGNITO Y TURBA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 95),
(631, 'A-02-02-01-001-002', 'PETROLEO CRUDO Y GAS NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 96),
(632, 'A-02-02-01-001-003', 'MINERALES Y CONCENTRADOS DE URANIO Y TORIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 97),
(633, 'A-02-02-01-001-004', 'MINERALES METALICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 98),
(634, 'A-02-02-01-001-005', 'PIEDRA, ARENA Y ARCILLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 99),
(635, 'A-02-02-01-001-006', 'OTROS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 100),
(636, 'A-02-02-01-001-006-01', 'MINERALES PARA LA INDUSTRIA QUIMICA, ABONOS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 100),
(637, 'A-02-02-01-001-006-02', 'CLORURO DE SODIO PURO Y SUS SALES, AGUA DE MAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 100),
(638, 'A-02-02-01-001-006-03', 'PIEDRAS PRECIOSAS Y SEMIPRECIOSAS PIEDRA POMEZ, PIEDRA ESMERIL ABRASIVOS NATURALES OTROS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 100),
(639, 'A-02-02-01-001-007', 'ELECTRICIDAD, GAS DE CIUDAD, VAPOR Y AGUA CALIENTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 101),
(640, 'A-02-02-01-001-007-01', 'ENERGIA ELECTRICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 101),
(641, 'A-02-02-01-001-007-02', 'GAS DE CARBON, GAS DE AGUA, GAS POBRE Y OTROS GASES SIMILARES (EXCEPTO LOS GASES DE PETROLEO Y OTROS HIDROCARBUROS GASEOSOS)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 101),
(642, 'A-02-02-01-001-007-03', 'VAPOR Y AGUA CALIENTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 101),
(643, 'A-02-02-01-001-007-04', 'NIEVE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 101),
(644, 'A-02-02-01-001-008', 'AGUA NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 102),
(645, 'A-02-02-01-002-001', 'CARNE, PESCADO, FRUTAS, HORTALIZAS, ACEITES Y GRASAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(646, 'A-02-02-01-002-001-01', 'CARNE Y PRODUCTOS CARNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(647, 'A-02-02-01-002-001-02', 'PREPARACIONES Y CONSERVAS DE PESCADO, CRUSTACEOS, MOLUSCOS Y DEMAS INVERTEBRADOS ACUATICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(648, 'A-02-02-01-002-001-03', 'PREPARACIONES Y CONSERVAS DE HORTALIZAS, LEGUMBRES, TUBERCULOS Y PAPAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(649, 'A-02-02-01-002-001-04', 'PREPARACIONES Y CONSERVAS DE FRUTAS Y NUECES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(650, 'A-02-02-01-002-001-05', 'ACEITES Y GRASAS ANIMALES Y VEGETALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(651, 'A-02-02-01-002-001-06', 'BORRA DE ALGODON', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(652, 'A-02-02-01-002-001-07', 'TORTAS Y DEMAS RESIDUOS DE LA EXTRACCION DE GRASAS O ACEITES VEGETALES HARINA Y POLVO DE SEMILLAS O DE FRUTOS OLEAGINOSOS (EXCEPTO LAS DE MOSTAZA) CERAS VEGETALES (EXCEPTO LOS TRIGLICERIDOS) DEGRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103),
(653, 'A-02-02-01-002-002', 'PRODUCTOS LACTEOS Y OVOPRODUCTOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 104),
(654, 'A-02-02-01-002-003', 'PRODUCTOS DE MOLINERIA, ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDON OTROS PRODUCTOS ALIMENTICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(655, 'A-02-02-01-002-003-01', 'PRODUCTOS DE MOLINERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(656, 'A-02-02-01-002-003-02', 'ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDON, AZUCARES Y JARABES DE AZUCAR N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(657, 'A-02-02-01-002-003-03', 'PREPARACIONES UTILIZADAS EN LA ALIMENTACION DE ANIMALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(658, 'A-02-02-01-002-003-04', 'PRODUCTOS DE PANADERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(659, 'A-02-02-01-002-003-05', 'AZUCAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(660, 'A-02-02-01-002-003-06', 'CACAO, CHOCOLATE Y CONFITERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(661, 'A-02-02-01-002-003-07', 'MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINACEOS SIMILARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(662, 'A-02-02-01-002-003-08', 'PRODUCTOS DEL CAFE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(663, 'A-02-02-01-002-003-09', 'OTROS PRODUCTOS ALIMENTICIOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105),
(664, 'A-02-02-01-002-004', 'BEBIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106),
(665, 'A-02-02-01-002-004-01', 'ALCOHOL ETILICO AGUARDIENTES, LICORES Y OTRAS BEBIDAS ESPIRITUOSAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106),
(666, 'A-02-02-01-002-004-02', 'VINOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106),
(667, 'A-02-02-01-002-004-03', 'LICORES DE MALTA Y MALTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106),
(668, 'A-02-02-01-002-004-04', 'BEBIDAS NO ALCOHOLICAS AGUAS MINERALES EMBOTELLADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106),
(669, 'A-02-02-01-002-005', 'PRODUCTOS DE TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 107),
(670, 'A-02-02-01-002-006', 'HILADOS E HILOS TEJIDOS DE FIBRAS TEXTILES INCLUSO AFELPADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 108),
(671, 'A-02-02-01-002-007', 'ARTICULOS TEXTILES (EXCEPTO PRENDAS DE VESTIR)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 109),
(672, 'A-02-02-01-002-008', 'DOTACION (PRENDAS DE VESTIR Y CALZADO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 110),
(673, 'A-02-02-01-003-001', 'PRODUCTOS DE MADERA, CORCHO, CESTERIA Y ESPARTERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 111),
(674, 'A-02-02-01-003-002', 'PASTA O PULPA, PAPEL Y PRODUCTOS DE PAPEL IMPRESOS Y ARTICULOS RELACIONADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(675, 'A-02-02-01-003-002-01', 'PASTA DE PAPEL, PAPEL Y CARTON', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(676, 'A-02-02-01-003-002-02', 'LIBROS IMPRESOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(677, 'A-02-02-01-003-002-03', 'DIARIOS, REVISTAS Y PUBLICACIONES PERIODICAS, PUBLICADOS POR LO MENOS CUATRO VECES POR SEMANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(678, 'A-02-02-01-003-002-04', 'DIARIOS, REVISTAS Y PUBLICACIONES PERIODICAS, PUBLICADOS MENOS DE CUATRO VECES POR SEMANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(679, 'A-02-02-01-003-002-05', 'MAPAS IMPRESOS MUSICA IMPRESA O EN MANUSCRITO TARJETAS POSTALES, TARJETAS DE FELICITACION, FOTOGRAFIAS Y PLANOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(680, 'A-02-02-01-003-002-06', 'SELLOS, CHEQUERAS, BILLETES DE BANCO, TITULOS DE ACCIONES, CATALOGOS Y FOLLETOS, MATERIAL PARA ANUNCIOS PUBLICITARIOS Y OTROS MATERIALES IMPRESOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(681, 'A-02-02-01-003-002-07', 'LIBROS DE REGISTROS, LIBROS DE CONTABILIDAD, CUADERNILLOS DE NOTAS, BLOQUES PARA CARTAS, AGENDAS Y ARTICULOS SIMILARES, SECANTES, ENCUADERNADORES, CLASIFICADORES PARA ARCHIVOS, FORMULARIOS Y OTROS ARTICULOS DE ESCRITORIO, DE PAPEL O CARTON', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(682, 'A-02-02-01-003-002-08', 'TIPOS DE IMPRENTA, PLANCHAS O CILINDROS, PREPARADOS PARA LAS ARTES GRAFICAS, PIEDRAS LITOGRAFICAS IMPRESAS U OTROS ELEMENTOS DE IMPRESION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112),
(683, 'A-02-02-01-003-003', 'PRODUCTOS DE HORNOS DE COQUE PRODUCTOS DE REFINACION DE PETROLEO Y COMBUSTIBLE NUCLEAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(684, 'A-02-02-01-003-003-01', 'CARBON COQUE Y SEMICOQUE, CARBON DE LIGNITO O CARBON DE HULLA CARBON DE RETORTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(685, 'A-02-02-01-003-003-02', 'ALQUITRAN DE CARBON, DE CARBON LIGNITO, HULLA Y OTRAS TORTAS MINERALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(686, 'A-02-02-01-003-003-03', 'ACEITES DE PETROLEO O ACEITES OBTENIDOS DE MINERALES BITUMINOSOS (EXCEPTO LOS ACEITES CRUDOS) PREPARADOS N.C.P., QUE CONTENGAN POR LO MENOS EL 70% DE SU PESO EN ACEITES DE ESOS TIPOS Y CUYOS COMPONENTES BASICOS SEAN ESOS ACEITES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(687, 'A-02-02-01-003-003-04', 'GAS DE PETROLEO Y OTROS HIDROCARBUROS GASEOSOS (EXCEPTO GAS NATURAL)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(688, 'A-02-02-01-003-003-05', 'VASELINA, CERA DE PARAFINA, CERA DE PETROLEO DE MICROCRISTALINA, CERA CRUDA, OZOCERITA, CERA DE LIGNITO, CERA DE TURBA, OTRAS CERAS MINERALES Y PRODUCTOS SIMILARES, COQUE DE PETROLEO, BETUN DE PETROLEO Y OTROS RESIDUOS DE LOS ACEITES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(689, 'A-02-02-01-003-003-06', 'ELEMENTOS RADIACTIVOS, ISOTOPOS Y COMPUESTOS RADIACTIVOS ALEACIONES, DISPERSIONES, PRODUCTOS CERAMICOS Y MEZCLAS QUE CONTENGAN ESTOS ELEMENTOS, ISOTOPOS O COMPUESTOS RADIACTIVOS RESIDUOS RADIACTIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(690, 'A-02-02-01-003-003-07', 'ELEMENTOS COMBUSTIBLES (CARTUCHOS) PARA REACTORES NUCLEARES O DE REACTORES NUCLEARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113),
(691, 'A-02-02-01-003-004', 'QUIMICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(692, 'A-02-02-01-003-004-01', 'QUIMICOS ORGANICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(693, 'A-02-02-01-003-004-02', 'PRODUCTOS QUIMICOS INORGANICOS BASICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(694, 'A-02-02-01-003-004-03', 'EXTRACTOS TINTOREOS Y CURTIENTES TANINOS Y SUS DERIVADOS SUSTANCIAS COLORANTES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(695, 'A-02-02-01-003-004-04', 'PRODUCTOS MINERALES NATURALES ACTIVADOS NEGRO ANIMAL ACEITE DE RESINA ACEITES TERPENICOS PRODUCIDOS EN EL TRATAMIENTO DE MADERAS DE ARBOLES CONIFEROS DIPENTENO Y ?-CIMENO EN BRUTO ACEITE DE PINO COLOFONIA Y ACIDOS RESINICOS,', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(696, 'A-02-02-01-003-004-05', 'PRODUCTOS QUIMICOS BASICOS DIVERSOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(697, 'A-02-02-01-003-004-06', 'ABONOS Y PLAGUICIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(698, 'A-02-02-01-003-004-07', 'PLASTICOS EN FORMAS PRIMARIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114);
INSERT INTO `uso_rubros` (`id`, `codigo_uso`, `nombre_uso`, `created_at`, `updated_at`, `rubroprin_id`) VALUES
(699, 'A-02-02-01-003-004-08', 'CAUCHO SINTETICO Y FACTICIO DERIVADO DEL PETROLEO, MEZCLAS DE ESTOS CAUCHOS CON CAUCHO NATURAL Y GOMAS NATURALES SIMILARES, EN FORMAS PRIMARIAS O EN PLANCHAS, HOJAS O TIRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114),
(700, 'A-02-02-01-003-005', 'OTROS PRODUCTOS QUIMICOS FIBRAS ARTIFICIALES (O FIBRAS INDUSTRIALES HECHAS POR EL HOMBRE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115),
(701, 'A-02-02-01-003-005-01', 'PINTURAS Y BARNICES Y PRODUCTOS RELACIONADOS COLORES PARA LA PINTURA ARTISTICA TINTAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115),
(702, 'A-02-02-01-003-005-02', 'PRODUCTOS FARMACEUTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115),
(703, 'A-02-02-01-003-005-03', 'JABON, PREPARADOS PARA LIMPIEZA, PERFUMES Y PREPARADOS DE TOCADOR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115),
(704, 'A-02-02-01-003-005-04', 'PRODUCTOS QUIMICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115),
(705, 'A-02-02-01-003-005-05', 'FIBRAS TEXTILES MANUFACTURADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115),
(706, 'A-02-02-01-003-006', 'PRODUCTOS DE CAUCHO Y PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116),
(707, 'A-02-02-01-003-006-01', 'LLANTAS DE CAUCHO Y NEUMATICOS (CAMARAS DE AIRE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116),
(708, 'A-02-02-01-003-006-02', 'OTROS PRODUCTOS DE CAUCHO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116),
(709, 'A-02-02-01-003-006-03', 'SEMIMANUFACTURAS DE PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116),
(710, 'A-02-02-01-003-006-04', 'PRODUCTOS DE EMPAQUE Y ENVASADO, DE PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116),
(711, 'A-02-02-01-003-006-09', 'OTROS PRODUCTOS PLASTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116),
(712, 'A-02-02-01-003-007', 'VIDRIO Y PRODUCTOS DE VIDRIO Y OTROS PRODUCTOS NO METALICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(713, 'A-02-02-01-003-007-01', 'VIDRIO Y PRODUCTOS DE VIDRIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(714, 'A-02-02-01-003-007-02', 'ARTICULOS DE CERAMICA NO ESTRUCTURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(715, 'A-02-02-01-003-007-03', 'PRODUCTOS REFRACTARIOS Y PRODUCTOS ESTRUCTURALES NO REFRACTARIOS DE ARCILLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(716, 'A-02-02-01-003-007-04', 'YESO, CAL Y CEMENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(717, 'A-02-02-01-003-007-05', 'ARTICULOS DE CONCRETO, CEMENTO Y YESO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(718, 'A-02-02-01-003-007-06', 'PIEDRA DE CONSTRUCCION O DE TALLA LABRADAS, Y SUS MANUFACTURAS (EXCEPTO SIN LABRAR, QUE SE CLASIFICAN EN EL GRUPO 151)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(719, 'A-02-02-01-003-007-09', 'OTROS PRODUCTOS MINERALES NO METALICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117),
(720, 'A-02-02-01-003-008', 'OTROS BIENES TRANSPORTABLES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118),
(721, 'A-02-02-01-003-008-05', 'JUEGOS Y JUGUETES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118),
(722, 'A-02-02-01-003-008-06', 'TIOVIVOS (CARRUSELES), COLUMPIOS, CASETAS DE TIRO Y DEMAS ATRACCIONES DE FERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118),
(723, 'A-02-02-01-003-008-07', 'CONSTRUCCIONES PREFABRICADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118),
(724, 'A-02-02-01-003-008-09', 'OTROS ARTICULOS MANUFACTURADOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118),
(725, 'A-02-02-01-003-009', 'DESPERDICIOS DESECHOS Y RESIDUOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118),
(726, 'A-02-02-01-004-001', 'METALES BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 119),
(727, 'A-02-02-01-004-002', 'PRODUCTOS METALICOS ELABORADOS (EXCEPTO MAQUINARIA Y EQUIPO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 120),
(728, 'A-02-02-01-004-003', 'MAQUINARIA PARA USO GENERAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(729, 'A-02-02-01-004-003-01', 'MOTORES Y TURBINAS Y SUS PARTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(730, 'A-02-02-01-004-003-02', 'BOMBAS, COMPRESORES, MOTORES DE FUERZA HIDRAULICA Y MOTORES DE POTENCIA NEUMATICA Y VALVULAS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(731, 'A-02-02-01-004-003-03', 'COJINETES, ENGRANAJES, RUEDAS DE FRICCION Y ELEMENTOS DE TRANSMISION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(732, 'A-02-02-01-004-003-04', 'HORNOS Y QUEMADORES PARA ALIMENTACION DE HOGARES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(733, 'A-02-02-01-004-003-05', 'EQUIPO DE ELEVACION Y MANIPULACION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(734, 'A-02-02-01-004-003-09', 'OTRAS MAQUINAS PARA USOS GENERALES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121),
(735, 'A-02-02-01-004-004', 'MAQUINARIA PARA USOS ESPECIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(736, 'A-02-02-01-004-004-01', 'MAQUINARIA AGROPECUARIA O SILVICOLA Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(737, 'A-02-02-01-004-004-02', 'MAQUINAS HERRAMIENTAS Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(738, 'A-02-02-01-004-004-03', 'MAQUINARIA PARA LA INDUSTRIA METALURGICA Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(739, 'A-02-02-01-004-004-04', 'MAQUINARIA PARA LA MINERIA, LA EXPLOTACION DE CANTERAS Y LA CONSTRUCCION Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(740, 'A-02-02-01-004-004-05', 'MAQUINARIA PARA LA ELABORACION DE ALIMENTOS, BEBIDAS Y TABACO, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(741, 'A-02-02-01-004-004-06', 'MAQUINARIA PARA LA FABRICACION DE TEXTILES, PRENDAS DE VESTIR Y ARTICULOS DE CUERO, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(742, 'A-02-02-01-004-004-08', 'APARATOS DE USO DOMESTICO Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(743, 'A-02-02-01-004-004-09', 'OTRA MAQUINARIA PARA USOS ESPECIALES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122),
(744, 'A-02-02-01-004-005', 'MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 123),
(745, 'A-02-02-01-004-005-01', 'MAQUINAS PARA OFICINA Y CONTABILIDAD, Y SUS PARTES Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 123),
(746, 'A-02-02-01-004-005-02', 'MAQUINARIA DE INFORMATICA Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 123),
(747, 'A-02-02-01-004-006', 'MAQUINARIA Y APARATOS ELECTRICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(748, 'A-02-02-01-004-006-01', 'MOTORES, GENERADORES Y TRANSFORMADORES ELECTRICOS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(749, 'A-02-02-01-004-006-02', 'APARATOS DE CONTROL ELECTRICO Y DISTRIBUCION DE ELECTRICIDAD Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(750, 'A-02-02-01-004-006-03', 'HILOS Y CABLES AISLADOS CABLE DE FIBRA OPTICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(751, 'A-02-02-01-004-006-04', 'ACUMULADORES, PILAS Y BATERIAS PRIMARIAS Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(752, 'A-02-02-01-004-006-05', 'LAMPARAS ELECTRICAS DE INCANDESCENCIA O DESCARGA LAMPARAS DE ARCO, EQUIPO PARA ALUMBRADO ELECTRICO SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(753, 'A-02-02-01-004-006-09', 'OTRO EQUIPO ELECTRICO Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124),
(754, 'A-02-02-01-004-007', 'PAQUETES DE SOFTWARE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(755, 'A-02-02-01-004-007-01', 'VALVULAS Y TUBOS ELECTRONICOS COMPONENTES ELECTRONICOS SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(756, 'A-02-02-01-004-007-02', 'APARATOS TRANSMISORES DE TELEVISION Y RADIO TELEVISION, VIDEO Y CAMARAS DIGITALES TELEFONOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(757, 'A-02-02-01-004-007-03', 'RADIORRECEPTORES Y RECEPTORES DE TELEVISION APARATOS PARA LA GRABACION Y REPRODUCCION DE SONIDO Y VIDEO MICROFONOS, ALTAVOCES, AMPLIFICADORES, ETC.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(758, 'A-02-02-01-004-007-04', 'PARTES Y PIEZAS DE LOS PRODUCTOS DE LAS CLASES 4721 A 4733 Y 4822', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(759, 'A-02-02-01-004-007-05', 'DISCOS, CINTAS, DISPOSITIVOS DE ALMACENAMIENTO EN ESTADO SOLIDO NO VOLATILES Y OTROS MEDIOS, NO GRABADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(760, 'A-02-02-01-004-007-06', 'GRABACIONES DE AUDIO, VIDEO Y OTROS DISCOS, CINTAS Y OTROS MEDIOS FISICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(761, 'A-02-02-01-004-007-08', 'PAQUETES DE SOFTWARE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(762, 'A-02-02-01-004-007-09', 'TARJETAS CON BANDAS MAGNETICAS O PLAQUETAS (CHIP)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125),
(763, 'A-02-02-01-004-008', 'APARATOS MEDICOS, INSTRUMENTOS OPTICOS Y DE PRECISION, RELOJES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 126),
(764, 'A-02-02-01-004-008-01', 'APARATOS MEDICOS Y QUIRURGICOS Y APARATOS ORTESICOS Y PROTESICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 126),
(765, 'A-02-02-01-004-008-02', 'INSTRUMENTOS Y APARATOS DE MEDICION, VERIFICACION, ANALISIS, DE NAVEGACION Y PARA OTROS FINES (EXCEPTO INSTRUMENTOS OPTICOS) INSTRUMENTOS DE CONTROL DE PROCESOS INDUSTRIALES, SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 126),
(766, 'A-02-02-01-004-008-03', 'INSTRUMENTOS OPTICOS Y EQUIPO FOTOGRAFICO PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 126),
(767, 'A-02-02-01-004-008-04', 'RELOJES Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 126),
(768, 'A-02-02-01-004-009', 'EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(769, 'A-02-02-01-004-009-01', 'VEHICULOS AUTOMOTORES, REMOLQUES Y SEMIRREMOLQUES Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(770, 'A-02-02-01-004-009-02', 'CARROCERIAS (INCLUSO CABINAS) PARA VEHICULOS AUTOMOTORES REMOLQUES Y SEMIRREMOLQUES Y SUS PARTES, PIEZAS Y ACCESORIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(771, 'A-02-02-01-004-009-03', 'BUQUES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(772, 'A-02-02-01-004-009-04', 'EMBARCACIONES PARA DEPORTES Y RECREO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(773, 'A-02-02-01-004-009-05', 'LOCOMOTORAS Y MATERIAL RODANTE DE FERROCARRIL Y TRANVIA, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(774, 'A-02-02-01-004-009-06', 'AERONAVES Y NAVES ESPACIALES, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(775, 'A-02-02-01-004-009-09', 'OTRO EQUIPO DE TRANSPORTE, Y SUS PARTES Y PIEZAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(776, 'A-02-02-01-004-009-09-1', 'MOTOCICLETAS Y SIDECARES (VEHICULOS LATERALES A LAS MOTOCICLETAS)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(777, 'A-02-02-01-004-009-09-2', 'BICICLETAS Y SILLONES DE RUEDAS PARA DISCAPACITADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(778, 'A-02-02-01-004-009-09-3', 'VEHICULOS N.C.P. SIN PROPULSION MECANICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(779, 'A-02-02-01-004-009-09-4', 'PARTES Y PIEZAS PARA LOS PRODUCTOS DE LAS CLASES 4991 Y 4992', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127),
(780, 'A-02-02-01-010-001', 'MUNICIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 128),
(781, 'A-02-02-01-010-002', 'MISILES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 130),
(782, 'A-02-02-01-010-003', 'COHETES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 131),
(783, 'A-02-02-01-010-004', 'BOMBAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 132),
(784, 'A-02-02-01-010-005', 'OTROS ELEMENTOS MILITARES DE UN SOLO USO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 133),
(785, 'A-02-02-02-005-004', 'SERVICIOS DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(786, 'A-02-02-02-005-004-01', 'SERVICIOS GENERALES DE CONSTRUCCION DE EDIFICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(787, 'A-02-02-02-005-004-01-1', 'SERVICIOS GENERALES DE CONSTRUCCION DE EDIFICACIONES RESIDENCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(788, 'A-02-02-02-005-004-01-2', 'SERVICIOS GENERALES DE CONSTRUCCION DE EDIFICACIONES NO RESIDENCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(789, 'A-02-02-02-005-004-02', 'SERVICIOS GENERALES DE CONSTRUCCION DE OBRAS DE INGENIERIA CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(790, 'A-02-02-02-005-004-02-1', 'SERVICIOS GENERALES DE CONSTRUCCION DE CARRETERAS (EXCEPTO CARRETERAS ELEVADAS), CALLES, VIAS FERREAS Y PISTAS DE ATERRIZAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(791, 'A-02-02-02-005-004-02-2', 'SERVICIOS GENERALES DE CONSTRUCCION DE PUENTES, CARRETERAS ELEVADAS Y TUNELES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(792, 'A-02-02-02-005-004-02-3', 'SERVICIOS GENERALES DE CONSTRUCCION DE PUERTOS, CANALES, PRESAS, SISTEMAS DE RIEGO Y OTRAS OBRAS HIDRAULICAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(793, 'A-02-02-02-005-004-02-4', 'SERVICIOS GENERALES DE CONSTRUCCION DE TUBERIAS PARA LA CONDUCCION DE GAS A LARGA DISTANCIA, LINEAS DE COMUNICACION Y CABLES DE PODER', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(794, 'A-02-02-02-005-004-02-5', 'SERVICIOS GENERALES DE CONSTRUCCION DE TUBERIAS Y CABLES LOCALES, Y OBRAS CONEXAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(795, 'A-02-02-02-005-004-02-6', 'SERVICIOS GENERALES DE CONSTRUCCION EN MINAS Y PLANTAS INDUSTRIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(796, 'A-02-02-02-005-004-02-7', 'SERVICIOS GENERALES DE CONSTRUCCIONES DEPORTIVAS AL AIRE LIBRE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(797, 'A-02-02-02-005-004-02-9', 'SERVICIOS GENERALES DE CONSTRUCCION DE OTRAS OBRAS DE INGENIERIA CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(798, 'A-02-02-02-005-004-03', 'SERVICIOS DE PREPARACION DEL TERRENO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(799, 'A-02-02-02-005-004-04', 'MONTAJE Y ERECCION DE CONSTRUCCIONES PREFABRICADAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(800, 'A-02-02-02-005-004-05', 'SERVICIOS ESPECIALES DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(801, 'A-02-02-02-005-004-06', 'SERVICIOS DE INSTALACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(802, 'A-02-02-02-005-004-07', 'SERVICIOS DE TERMINACION Y ACABADOS DE EDIFICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134),
(803, 'A-02-02-02-006-003', 'ALOJAMIENTO SERVICIOS DE SUMINISTROS DE COMIDAS Y BEBIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 135),
(804, 'A-02-02-02-006-003-01', 'SERVICIOS DE ALOJAMIENTO PARA ESTANCIAS CORTAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 135),
(805, 'A-02-02-02-006-003-02', 'OTROS SERVICIOS DE ALOJAMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 135),
(806, 'A-02-02-02-006-003-03', 'SERVICIOS DE SUMINISTRO DE COMIDAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 135),
(807, 'A-02-02-02-006-003-04', 'SERVICIOS DE SUMINISTRO DE BEBIDAS PARA SU CONSUMO DENTRO DEL ESTABLECIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 135),
(808, 'A-02-02-02-006-004', 'SERVICIOS DE TRANSPORTE DE PASAJEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 136),
(809, 'A-02-02-02-006-005', 'SERVICIOS DE TRANSPORTE DE CARGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 137),
(810, 'A-02-02-02-006-005-01', 'SERVICIOS DE TRANSPORTE DE CARGA POR VIA TERRESTRE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 137),
(811, 'A-02-02-02-006-005-02', 'SERVICIOS DE TRANSPORTE DE CARGA POR VIA ACUATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 137),
(812, 'A-02-02-02-006-005-03', 'SERVICIOS DE TRANSPORTE DE CARGA POR VIA AEREA O ESPACIAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 137),
(813, 'A-02-02-02-006-006', 'SERVICIOS DE ALQUILER DE VEHICULOS DE TRANSPORTE CON OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 138),
(814, 'A-02-02-02-006-007', 'SERVICIOS DE APOYO AL TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(815, 'A-02-02-02-006-007-01', 'SERVICIOS DE MANIPULACION DE CARGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(816, 'A-02-02-02-006-007-02', 'SERVICIOS DE ALMACENAMIENTO Y DEPOSITO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(817, 'A-02-02-02-006-007-03', 'SERVICIOS DE APOYO AL TRANSPORTE POR VIA FERREA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(818, 'A-02-02-02-006-007-04', 'SERVICIOS DE APOYO AL TRANSPORTE POR CARRETERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(819, 'A-02-02-02-006-007-05', 'SERVICIOS DE APOYO AL TRANSPORTE POR VIA ACUATICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(820, 'A-02-02-02-006-007-06', 'SERVICIOS DE APOYO AL TRANSPORTE AEREO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(821, 'A-02-02-02-006-007-09', 'OTROS SERVICIOS DE APOYO AL TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139),
(822, 'A-02-02-02-006-008', 'SERVICIOS POSTALES Y DE MENSAJERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 140),
(823, 'A-02-02-02-006-009', 'SERVICIOS DE DISTRIBUCION DE ELECTRICIDAD, GAS Y AGUA (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 141),
(824, 'A-02-02-02-006-009-01', 'SERVICIOS DE DISTRIBUCION DE ELECTRICIDAD, Y SERVICIOS DE DISTRIBUCION DE GAS (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 141),
(825, 'A-02-02-02-006-009-02', 'SERVICIOS DE DISTRIBUCION DE AGUA (POR CUENTA PROPIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 141),
(826, 'A-02-02-02-007-001', 'SERVICIOS FINANCIEROS Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(827, 'A-02-02-02-007-001-01', 'SERVICIOS FINANCIEROS, EXCEPTO DE LA BANCA DE INVERSION, SERVICIOS DE SEGUROS Y SERVICIOS DE PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(828, 'A-02-02-02-007-001-01-1', 'SERVICIOS FINANCIEROS, EXCEPTO DE LA BANCA DE INVERSION, SERVICIOS DE SEGUROS Y SERVICIOS DE PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(829, 'A-02-02-02-007-001-01-2', 'SERVICIOS DE DEPOSITO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(830, 'A-02-02-02-007-001-01-3', 'SERVICIOS DE CONCESION DE CREDITO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(831, 'A-02-02-02-007-001-01-4', 'SERVICIOS DE LEASING (ARRENDAMIENTO FINANCIERO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(832, 'A-02-02-02-007-001-01-9', 'OTROS SERVICIOS FINANCIEROS, EXCEPTO LOS SERVICIOS DE LA BANCA DE INVERSION, SERVICIOS DE SEGUROS Y PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(833, 'A-02-02-02-007-001-02', 'SERVICIOS DE LA BANCA DE INVERSION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(834, 'A-02-02-02-007-001-03', 'SERVICIOS DE SEGUROS Y PENSIONES (CON EXCLUSION DE SERVICIOS DE REASEGURO), EXCEPTO LOS SERVICIOS DE SEGUROS SOCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(835, 'A-02-02-02-007-001-03-1', 'SERVICIOS DE SEGUROS VIDA (CON EXCLUSION DE LOS SERVICIOS DE REASEGURO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(836, 'A-02-02-02-007-001-03-2', 'SERVICIOS DE SEGUROS SOCIALES DE PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(837, 'A-02-02-02-007-001-03-3', 'SERVICIOS DE SEGUROS SOCIALES DE SALUD Y RIESGOS LABORALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(838, 'A-02-02-02-007-001-03-4', 'SERVICIOS DE SEGUROS DE SALUD Y DE ACCIDENTES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(839, 'A-02-02-02-007-001-03-5', 'OTROS SERVICIOS DE SEGUROS DISTINTOS A LOS SEGUROS DE VIDA (EXCEPTO LOS SERVICIOS DE REASEGURO)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(840, 'A-02-02-02-007-001-03-5-01', 'SERVICIOS DE SEGUROS DE VEHICULOS AUTOMOTORES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(841, 'A-02-02-02-007-001-03-5-02', 'SERVICIOS DE SEGUROS DE TRANSPORTE MARITIMO, DE AVIACION Y OTROS MEDIOS DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(842, 'A-02-02-02-007-001-03-5-03', 'SERVICIOS DE SEGUROS PARA TRANSPORTE DE MERCANCIAS (FLETES)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(843, 'A-02-02-02-007-001-03-5-04', 'SERVICIOS DE SEGUROS CONTRA INCENDIO, TERREMOTO O SUSTRACCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(844, 'A-02-02-02-007-001-03-5-05', 'SERVICIOS DE SEGUROS GENERALES DE RESPONSABILIDAD CIVIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(845, 'A-02-02-02-007-001-03-5-06', 'SERVICIOS DE SEGURO DE CUMPLIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(846, 'A-02-02-02-007-001-03-5-07', 'SERVICIOS DE SEGURO OBLIGATORIO DE ACCIDENTES DE TRANSITO (SOAT)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(847, 'A-02-02-02-007-001-03-5-08', 'SERVICIOS DE SEGUROS DE VIAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(848, 'A-02-02-02-007-001-03-5-09', 'OTROS SERVICIOS DE SEGUROS DISTINTOS DE LOS SEGUROS DE VIDA N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(849, 'A-02-02-02-007-001-03-5-10', 'SEGURO DE INFIDELIDAD Y RIESGOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(850, 'A-02-02-02-007-001-03-5-11', 'SEGUROS EQUIPOS ELECTRICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(851, 'A-02-02-02-007-001-03-6', 'SERVICIOS DE LAS SOCIEDADES DE CAPITALIZACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(852, 'A-02-02-02-007-001-04', 'SERVICIOS DE REASEGURO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(853, 'A-02-02-02-007-001-05', 'SERVICIOS AUXILIARES A LOS SERVICIOS FINANCIEROS DISTINTOS DE LOS SEGUROS Y LAS PENSIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(854, 'A-02-02-02-007-001-05-1', 'SERVICIOS RELACIONADOS CON LA BANCA DE INVERSION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(855, 'A-02-02-02-007-001-05-2', 'SERVICIOS DE CORRETAJE RELACIONADOS CON LOS PRODUCTOS DE VALORES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(856, 'A-02-02-02-007-001-05-3', 'SERVICIOS DE ADMINISTRACION DE CARTERAS, EXCEPTO LOS FONDOS DE PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(857, 'A-02-02-02-007-001-05-4', 'SERVICIOS FIDUCIARIOS Y DE CUSTODIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(858, 'A-02-02-02-007-001-05-5', 'SERVICIOS RELACIONADOS CON LA ADMINISTRACION DE LOS MERCADOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(859, 'A-02-02-02-007-001-05-9', 'OTROS SERVICIOS AUXILIARES A LOS SERVICIOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(860, 'A-02-02-02-007-001-06', 'SERVICIOS AUXILIARES DE SEGUROS, PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(861, 'A-02-02-02-007-001-06-1', 'SERVICIOS DE CORRETAJE Y AGENCIAS DE SEGUROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(862, 'A-02-02-02-007-001-06-2', 'SERVICIOS DE TASACION DE LAS RECLAMACIONES AL SEGURO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(863, 'A-02-02-02-007-001-06-3', 'SERVICIOS ACTUARIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(864, 'A-02-02-02-007-001-06-4', 'SERVICIOS DE ADMINISTRACION DE FONDOS DE PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(865, 'A-02-02-02-007-001-06-9', 'OTROS SERVICIOS AUXILIARES DE SEGUROS, PENSIONES Y CESANTIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(866, 'A-02-02-02-007-001-07', 'SERVICIOS DE MANTENIMIENTO DE ACTIVOS FINANCIEROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142),
(867, 'A-02-02-02-007-002', 'SERVICIOS INMOBILIARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(868, 'A-02-02-02-007-002-01', 'SERVICIOS INMOBILIARIOS RELATIVOS A BIENES RAICES PROPIOS O ARRENDADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(869, 'A-02-02-02-007-002-01-1', 'SERVICIOS DE ALQUILER O ARRENDAMIENTO CON O SIN OPCION DE COMPRA RELATIVOS A BIENES INMUEBLES PROPIOS O ARRENDADOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(870, 'A-02-02-02-007-002-01-2', 'VENTA DE BIENES INMUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(871, 'A-02-02-02-007-002-01-3', 'SERVICIOS COMERCIALES RELACIONADOS CON TERRENOS DESOCUPADOS Y SUBDIVIDIDOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(872, 'A-02-02-02-007-002-02', 'SERVICIOS INMOBILIARIOS A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(873, 'A-02-02-02-007-002-02-1', 'SERVICIOS DE ADMINISTRACION DE BIENES INMUEBLES A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(874, 'A-02-02-02-007-002-02-2', 'SERVICIO DE ARRENDAMIENTO DE BIENES INMUEBLES A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(875, 'A-02-02-02-007-002-02-3', 'SERVICIO DE VENTA DE BIENES INMUEBLES A COMISION O POR CONTRATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(876, 'A-02-02-02-007-002-02-4', 'SERVICIOS DE VENTA DE TERRENOS A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(877, 'A-02-02-02-007-002-02-5', 'VALUACIONES INMOBILIARIAS A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143),
(878, 'A-02-02-02-007-003', 'SERVICIOS DE ARRENDAMIENTO O ALQUILER SIN OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144),
(879, 'A-02-02-02-007-003-01', 'SERVICIOS DE ARRENDAMIENTO O ALQUILER DE MAQUINARIA Y EQUIPO SIN OPERARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144),
(880, 'A-02-02-02-007-003-02', 'SERVICIOS DE ARRENDAMIENTO SIN OPCION DE COMPRA DE OTROS BIENES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144),
(881, 'A-02-02-02-008-001', 'SERVICIOS DE INVESTIGACION Y DESARROLLO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 145),
(882, 'A-02-02-02-008-001-01', 'SERVICIOS DE INVESTIGACION Y DESARROLLO EXPERIMENTAL EN CIENCIAS NATURALES E INGENIERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 145),
(883, 'A-02-02-02-008-001-02', 'SERVICIOS DE INVESTIGACION Y DESARROLLO EXPERIMENTAL EN CIENCIAS SOCIALES Y HUMANIDADES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 145),
(884, 'A-02-02-02-008-001-03', 'SERVICIOS INTERDISCIPLINARIOS DE INVESTIGACION Y DESARROLLO EXPERIMENTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 145),
(885, 'A-02-02-02-008-002', 'SERVICIOS JURIDICOS Y CONTABLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 146),
(886, 'A-02-02-02-008-002-01', 'SERVICIOS JURIDICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 146),
(887, 'A-02-02-02-008-002-02', 'SERVICIOS DE CONTABILIDAD, AUDITORIA Y TENEDURIA DE LIBROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 146),
(888, 'A-02-02-02-008-002-03', 'SERVICIOS DE PREPARACION Y ASESORAMIENTO TRIBUTARIO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 146),
(889, 'A-02-02-02-008-002-04', 'SERVICIOS RELACIONADOS CON CASOS DE INSOLVENCIA Y LIQUIDACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 146),
(890, 'A-02-02-02-008-003', 'OTROS SERVICIOS PROFESIONALES, CIENTIFICOS Y TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(891, 'A-02-02-02-008-003-01', 'SERVICIOS DE CONSULTORIA EN ADMINISTRACION Y SERVICIOS DE GESTION SERVICIOS DE TECNOLOGIA DE LA INFORMACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(892, 'A-02-02-02-008-003-01-1', 'SERVICIOS DE CONSULTORIA EN ADMINISTRACION Y SERVICIOS DE GESTION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(893, 'A-02-02-02-008-003-01-2', 'SERVICIOS DE CONSULTORIA PRESTADOS A LAS EMPRESAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(894, 'A-02-02-02-008-003-01-3', 'SERVICIOS DE TECNOLOGIA DE LA INFORMACION (TI) DE CONSULTORIA Y DE APOYO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(895, 'A-02-02-02-008-003-01-4', 'SERVICIOS DE DISE?O Y DESARROLLO DE LA TECNOLOGIA DE LA INFORMACION (TI)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(896, 'A-02-02-02-008-003-01-5', 'SERVICIOS DE SUMINISTRO DE INFRAESTRUCTURA DE HOSTING Y DE TECNOLOGIA DE LA INFORMACION (TI)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(897, 'A-02-02-02-008-003-01-6', 'SERVICIOS DE GESTION DE RED E INFRAESTRUCTURA DE TI', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(898, 'A-02-02-02-008-003-01-9', 'OTROS SERVICIOS DE GESTION, EXCEPTO LOS SERVICIOS DE ADMINISTRACION DE PROYECTOS DE CONSTRUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(899, 'A-02-02-02-008-003-02', 'SERVICIOS DE ARQUITECTURA, SERVICIOS DE PLANEACION URBANA Y ORDENACION DEL TERRITORIO SERVICIOS DE ARQUITECTURA PAISAJISTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(900, 'A-02-02-02-008-003-03', 'SERVICIOS DE INGENIERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(901, 'A-02-02-02-008-003-04', 'SERVICIOS CIENTIFICOS Y OTROS SERVICIOS TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(902, 'A-02-02-02-008-003-04-1', 'SERVICIOS DE PROSPECCION GEOLOGICA, GEOFISICA Y OTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(903, 'A-02-02-02-008-003-04-2', 'SERVICIOS DE TOPOGRAFIA DE SUPERFICIE Y CARTOGRAFIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(904, 'A-02-02-02-008-003-04-3', 'PRONOSTICO DEL TIEMPO Y SERVICIOS METEOROLOGICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(905, 'A-02-02-02-008-003-04-4', 'SERVICIOS DE ENSAYO Y ANALISIS TECNICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(906, 'A-02-02-02-008-003-05', 'SERVICIOS VETERINARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(907, 'A-02-02-02-008-003-06', 'SERVICIOS DE PUBLICIDAD Y EL SUMINISTRO DE ESPACIO O TIEMPO PUBLICITARIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(908, 'A-02-02-02-008-003-07', 'SERVICIOS DE INVESTIGACION DE MERCADOS Y DE ENCUESTAS DE OPINION PUBLICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(909, 'A-02-02-02-008-003-08', 'SERVICIOS FOTOGRAFICOS Y SERVICIOS DE REVELADO FOTOGRAFICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(910, 'A-02-02-02-008-003-09', 'OTROS SERVICIOS PROFESIONALES Y TECNICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147),
(911, 'A-02-02-02-008-004', 'SERVICIOS DE TELECOMUNICACIONES, TRANSMISION Y SUMINISTRO DE INFORMACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(912, 'A-02-02-02-008-004-01', 'SERVICIOS DE TELEFONIA Y OTRAS TELECOMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(913, 'A-02-02-02-008-004-02', 'SERVICIOS DE TELECOMUNICACIONES A TRAVES DE INTERNET', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(914, 'A-02-02-02-008-004-03', 'SERVICIOS DE CONTENIDOS EN LINEA (ON-LINE)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(915, 'A-02-02-02-008-004-04', 'SERVICIOS DE AGENCIAS DE NOTICIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(916, 'A-02-02-02-008-004-05', 'SERVICIOS DE BIBLIOTECAS Y ARCHIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(917, 'A-02-02-02-008-004-06', 'SERVICIOS DE PROGRAMACION, DISTRIBUCION Y TRANSMISION DE PROGRAMAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148),
(918, 'A-02-02-02-008-005', 'SERVICIOS DE SOPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(919, 'A-02-02-02-008-005-01', 'SERVICIOS DE EMPLEO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(920, 'A-02-02-02-008-005-02', 'SERVICIOS DE INVESTIGACION Y SEGURIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(921, 'A-02-02-02-008-005-03', 'SERVICIOS DE LIMPIEZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(922, 'A-02-02-02-008-005-04', 'SERVICIOS DE EMPAQUE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(923, 'A-02-02-02-008-005-05', 'SERVICIOS DE ORGANIZACION DE VIAJES, OPERADORES TURISTICOS Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(924, 'A-02-02-02-008-005-09', 'OTROS SERVICIOS AUXILIARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(925, 'A-02-02-02-008-005-09-1', 'SERVICIOS DE INFORMACION CREDITICIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(926, 'A-02-02-02-008-005-09-2', 'SERVICIOS DE AGENCIAS DE COBRANZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(927, 'A-02-02-02-008-005-09-3', 'SERVICIOS AUXILIARES POR TELEFONO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(928, 'A-02-02-02-008-005-09-4', 'SERVICIOS ADMINISTRATIVOS COMBINADOS DE OFICINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(929, 'A-02-02-02-008-005-09-5', 'SERVICIOS AUXILIARES ESPECIALIZADOS DE OFICINA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(930, 'A-02-02-02-008-005-09-6', 'SERVICIOS DE ORGANIZACION Y ASISTENCIA DE CONVENCIONES Y FERIAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(931, 'A-02-02-02-008-005-09-7', 'SERVICIOS DE MANTENIMIENTO Y CUIDADO DEL PAISAJE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(932, 'A-02-02-02-008-005-09-9', 'OTROS SERVICIOS DE APOYO Y DE INFORMACION N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149),
(933, 'A-02-02-02-008-006', 'SERVICIOS DE APOYO A LA AGRICULTURA, LA CAZA, LA SILVICULTURA, LA PESCA, LA MINERIA Y LOS SERVICIOS PUBLICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 150),
(934, 'A-02-02-02-008-006-01', 'SERVICIOS DE APOYO A LA AGRICULTURA, LA CAZA, LA SILVICULTURA Y LA PESCA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 150),
(935, 'A-02-02-02-008-006-02', 'SERVICIOS DE APOYO A LA MINERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 150),
(936, 'A-02-02-02-008-006-03', 'SERVICIOS DE APOYO A LA DISTRIBUCION DE ELECTRICIDAD, GAS Y AGUA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 150),
(937, 'A-02-02-02-008-007', 'SERVICIOS DE MANTENIMIENTO, REPARACION E INSTALACION (EXCEPTO SERVICIOS DE CONSTRUCCION)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(938, 'A-02-02-02-008-007-01', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE PRODUCTOS METALICOS ELABORADOS, MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(939, 'A-02-02-02-008-007-01-1', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE PRODUCTOS METALICOS ELABORADOS, EXCEPTO MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(940, 'A-02-02-02-008-007-01-2', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE MAQUINARIA DE OFICINA Y CONTABILIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(941, 'A-02-02-02-008-007-01-3', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE COMPUTADORES Y EQUIPO PERIFERICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(942, 'A-02-02-02-008-007-01-4', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE MAQUINARIA Y EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(943, 'A-02-02-02-008-007-01-5', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE OTRA MAQUINARIA Y OTRO EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(944, 'A-02-02-02-008-007-02', 'SERVICIOS DE REPARACION DE OTROS BIENES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(945, 'A-02-02-02-008-007-02-1', 'SERVICIOS DE REPARACION DE CALZADO Y ARTICULOS DE CUERO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(946, 'A-02-02-02-008-007-02-2', 'SERVICIOS DE REPARACION DE RELOJES Y JOYAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(947, 'A-02-02-02-008-007-02-3', 'SERVICIOS DE REPARACION DE PRENDAS DE VESTIR Y TEXTILES PARA EL HOGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(948, 'A-02-02-02-008-007-02-4', 'SERVICIOS DE REPARACION DE MUEBLES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(949, 'A-02-02-02-008-007-02-9', 'SERVICIOS DE MANTENIMIENTO Y REPARACION DE OTROS BIENES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(950, 'A-02-02-02-008-007-03', 'SERVICIOS DE INSTALACION (DISTINTOS DE LOS SERVICIOS DE CONSTRUCCION)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(951, 'A-02-02-02-008-007-03-1', 'SERVICIOS DE INSTALACION DE PRODUCTOS METALICOS ELABORADOS, EXCEPTO MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(952, 'A-02-02-02-008-007-03-2', 'SERVICIOS DE INSTALACION DE MAQUINARIA Y EQUIPO PARA EL SECTOR INDUSTRIAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(953, 'A-02-02-02-008-007-03-3', 'SERVICIOS DE INSTALACION DE MAQUINARIA DE OFICINA, CONTABILIDAD Y COMPUTADORES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(954, 'A-02-02-02-008-007-03-4', 'SERVICIOS DE INSTALACION DE EQUIPOS Y APARATOS DE RADIO, TELEVISION Y COMUNICACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(955, 'A-02-02-02-008-007-03-5', 'SERVICIOS DE INSTALACION DE MAQUINARIA Y EQUIPO MEDICO PROFESIONAL, E INSTRUMENTOS DE PRECISION Y OPTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(956, 'A-02-02-02-008-007-03-6', 'SERVICIOS DE INSTALACION DE MAQUINARIA Y APARATOS ELECTRICOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(957, 'A-02-02-02-008-007-03-9', 'SERVICIOS DE INSTALACION DE OTROS BIENES N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151),
(958, 'A-02-02-02-008-008', 'SERVICIOS DE FABRICACION DE INSUMOS FISICOS QUE SON PROPIEDAD DE OTROS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(959, 'A-02-02-02-008-008-01', 'SERVICIOS DE FABRICACION DE ALIMENTOS, BEBIDAS Y TABACO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(960, 'A-02-02-02-008-008-02', 'SERVICIOS DE FABRICACION DE TEXTILES, CONFECCIONES Y PRODUCTOS DE CUERO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(961, 'A-02-02-02-008-008-03', 'SERVICIOS DE FABRICACION DE LA MADERA Y EL PAPEL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(962, 'A-02-02-02-008-008-04', 'SERVICIOS DE FABRICACION DE PRODUCTOS DE LA REFINACION DEL PETROLEO, PRODUCTOS QUIMICOS Y FARMACEUTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(963, 'A-02-02-02-008-008-05', 'SERVICIOS DE FABRICACION DE PRODUCTOS DE CAUCHO, PLASTICO Y OTROS PRODUCTOS MINERALES NO METALICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(964, 'A-02-02-02-008-008-06', 'SERVICIOS DE FABRICACION DE PRODUCTOS METALURGICOS BASICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(965, 'A-02-02-02-008-008-07', 'SERVICIOS DE FABRICACION DE PRODUCTOS METALICOS ELABORADOS, MAQUINARIA Y EQUIPO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(966, 'A-02-02-02-008-008-08', 'SERVICIOS DE FABRICACION DE EQUIPO DE TRANSPORTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(967, 'A-02-02-02-008-008-09', 'OTROS SERVICIOS DE FABRICACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152),
(968, 'A-02-02-02-008-009', 'OTROS SERVICIOS DE FABRICACION SERVICIOS DE EDICION, IMPRESION Y REPRODUCCION SERVICIOS DE RECUPERACION DE MATERIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153),
(969, 'A-02-02-02-008-009-01', 'SERVICIOS DE EDICION, IMPRESION Y REPRODUCCION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153),
(970, 'A-02-02-02-008-009-02', 'SERVICIOS DE MOLDEADO, ESTAMPADO, EXTRUSION Y FABRICACION DE PRODUCTOS SIMILARES DE PLASTICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153),
(971, 'A-02-02-02-008-009-03', 'SERVICIOS DE FUNDICION, FORJA, ESTAMPADO Y FABRICACION DE PRODUCTOS SIMILARES DE METALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153),
(972, 'A-02-02-02-008-009-04', 'SERVICIOS DE RECUPERACION DE MATERIALES, A COMISION O POR CONTRATO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153),
(973, 'A-02-02-02-009-002', 'SERVICIOS DE EDUCACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(974, 'A-02-02-02-009-002-01', 'SERVICIOS DE EDUCACION DE LA PRIMERA INFANCIA Y PREESCOLAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(975, 'A-02-02-02-009-002-02', 'SERVICIOS DE ENSE?ANZA PRIMARIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(976, 'A-02-02-02-009-002-03', 'SERVICIOS DE EDUCACION SECUNDARIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(977, 'A-02-02-02-009-002-04', 'SERVICIOS DE EDUCACION POSTSECUNDARIA NO TERCIARIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(978, 'A-02-02-02-009-002-05', 'SERVICIOS DE EDUCACION SUPERIOR (TERCIARIA)', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(979, 'A-02-02-02-009-002-09', 'OTROS TIPOS DE EDUCACION Y SERVICIOS DE APOYO EDUCATIVO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154),
(980, 'A-02-02-02-009-003', 'SERVICIOS PARA EL CUIDADO DE LA SALUD HUMANA Y SERVICIOS SOCIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155),
(981, 'A-02-02-02-009-003-01', 'SERVICIOS DE SALUD HUMANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155),
(982, 'A-02-02-02-009-003-02', 'SERVICIOS DE ATENCION RESIDENCIAL PARA PERSONAS MAYORES Y CON DISCAPACIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155),
(983, 'A-02-02-02-009-003-03', 'OTROS SERVICIOS SOCIALES CON ALOJAMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155),
(984, 'A-02-02-02-009-003-04', 'SERVICIOS SOCIALES SIN ALOJAMIENTO PARA PERSONAS MAYORES Y CON DISCAPACIDAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155),
(985, 'A-02-02-02-009-003-05', 'OTROS SERVICIOS SOCIALES SIN ALOJAMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155),
(986, 'A-02-02-02-009-004', 'SERVICIOS DE ALCANTARILLADO, RECOLECCION, TRATAMIENTO Y DISPOSICION DE DESECHOS Y OTROS SERVICIOS DE SANEAMIENTO AMBIENTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(987, 'A-02-02-02-009-004-01', 'SERVICIOS DE ALCANTARILLADO, SERVICIOS DE LIMPIEZA, TRATAMIENTO DE AGUAS RESIDUALES Y TANQUES SEPTICOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(988, 'A-02-02-02-009-004-02', 'SERVICIOS DE RECOLECCION DE DESECHOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(989, 'A-02-02-02-009-004-03', 'SERVICIOS DE TRATAMIENTO Y DISPOSICION DE DESECHOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(990, 'A-02-02-02-009-004-04', 'SERVICIOS DE DESCONTAMINACION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(991, 'A-02-02-02-009-004-05', 'SERVICIOS DE SANEAMIENTO Y SIMILARES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(992, 'A-02-02-02-009-004-09', 'OTROS SERVICIOS DE PROTECCION DEL MEDIO AMBIENTE N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156),
(993, 'A-02-02-02-009-005', 'SERVICIOS DE ASOCIACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 157),
(994, 'A-02-02-02-009-005-01', 'SERVICIOS PROPORCIONADOS POR ORGANIZACIONES GREMIALES, COMERCIALES Y ORGANIZACIONES DE EMPLEADORES Y DE PROFESIONALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 157),
(995, 'A-02-02-02-009-005-02', 'SERVICIOS PROPORCIONADOS POR SINDICATOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 157),
(996, 'A-02-02-02-009-005-09', 'SERVICIOS PROPORCIONADOS POR OTRAS ASOCIACIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 157),
(997, 'A-02-02-02-009-006', 'SERVICIOS DE ESPARCIMIENTO, CULTURALES Y DEPORTIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(998, 'A-02-02-02-009-006-01', 'SERVICIOS AUDIOVISUALES Y SERVICIOS CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(999, 'A-02-02-02-009-006-02', 'SERVICIOS DE PROMOCION Y PRESENTACION DE ARTES ESCENICAS Y EVENTOS DE ENTRETENIMIENTO EN VIVO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(1000, 'A-02-02-02-009-006-03', 'SERVICIOS RELACIONADOS CON ACTORES Y OTROS ARTISTAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(1001, 'A-02-02-02-009-006-04', 'SERVICIOS DE PRESERVACION Y MUSEOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(1002, 'A-02-02-02-009-006-05', 'SERVICIOS DEPORTIVOS Y DEPORTES RECREATIVOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(1003, 'A-02-02-02-009-006-06', 'SERVICIOS DE ATLETAS Y SERVICIOS DE AUXILIARES CONEXOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(1004, 'A-02-02-02-009-006-09', 'OTROS SERVICIOS DE ESPARCIMIENTO Y DIVERSION', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158),
(1005, 'A-02-02-02-009-007', 'OTROS SERVICIOS', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159),
(1006, 'A-02-02-02-009-007-01', 'SERVICIOS DE LAVADO, LIMPIEZA Y TE?IDO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159),
(1007, 'A-02-02-02-009-007-02', 'SERVICIOS DE TRATAMIENTOS DE BELLEZA Y DE BIENESTAR FISICO', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159),
(1008, 'A-02-02-02-009-007-03', 'SERVICIOS FUNERARIOS, DE CREMACION Y DE SEPULTURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159),
(1009, 'A-02-02-02-009-007-09', 'OTROS SERVICIOS DIVERSOS N.C.P.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159),
(1010, 'A-02-02-02-009-009', 'SERVICIOS PRESTADOS POR ORGANIZACIONES Y ORGANISMOS EXTRATERRITORIALES', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 160);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adicions`
--
ALTER TABLE `adicions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adicions_contrato_id_foreign` (`contrato_id`);

--
-- Indices de la tabla `concargos`
--
ALTER TABLE `concargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contratos_numcontrato_unique` (`numcontrato`),
  ADD KEY `contratos_proveedor_id_foreign` (`proveedor_id`),
  ADD KEY `contratos_tipocontrato_id_foreign` (`tipocontrato_id`),
  ADD KEY `contratos_dependencia_id_foreign` (`dependencia_id`),
  ADD KEY `contratos_concargo_id_foreign` (`concargo_id`);

--
-- Indices de la tabla `datosmaestros`
--
ALTER TABLE `datosmaestros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detapedidos`
--
ALTER TABLE `detapedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dtacontratos`
--
ALTER TABLE `dtacontratos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factudetadis`
--
ALTER TABLE `factudetadis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factudetadis_pago_id_foreign` (`pago_id`);

--
-- Indices de la tabla `facturadetas`
--
ALTER TABLE `facturadetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturadetas_contrato_id_foreign` (`contrato_id`),
  ADD KEY `facturadetas_dependencia_id_foreign` (`dependencia_id`),
  ADD KEY `facturadetas_uso_rubro_id_foreign` (`uso_rubro_id`),
  ADD KEY `facturadetas_pago_id_foreign` (`pago_id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `facturas_numfac_unique` (`numfac`),
  ADD KEY `facturas_contrato_id_foreign` (`contrato_id`),
  ADD KEY `facturas_pago_id_foreign` (`pago_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesesejecucions`
--
ALTER TABLE `mesesejecucions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `obligacions`
--
ALTER TABLE `obligacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obligacions_contrato_id_foreign` (`contrato_id`);

--
-- Indices de la tabla `obliga_pagos`
--
ALTER TABLE `obliga_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obliga_pagos_pago_id_foreign` (`pago_id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_contrato_id_foreign` (`contrato_id`),
  ADD KEY `pagos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proveedors_nitproveedor_unique` (`nitproveedor`),
  ADD UNIQUE KEY `proveedors_email_unique` (`email`);

--
-- Indices de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riesgos_contrato_id_foreign` (`contrato_id`);

--
-- Indices de la tabla `riesgo_pagos`
--
ALTER TABLE `riesgo_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riesgo_pagos_pago_id_foreign` (`pago_id`);

--
-- Indices de la tabla `rubrocontratos`
--
ALTER TABLE `rubrocontratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rubrocontratos_contrato_id_foreign` (`contrato_id`),
  ADD KEY `rubrocontratos_rubroprin_id_foreign` (`rubroprin_id`);

--
-- Indices de la tabla `rubroprins`
--
ALTER TABLE `rubroprins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipocontratos`
--
ALTER TABLE `tipocontratos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_dependencia_id_foreign` (`dependencia_id`);

--
-- Indices de la tabla `uso_rubros`
--
ALTER TABLE `uso_rubros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uso_rubros_rubroprin_id_foreign` (`rubroprin_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adicions`
--
ALTER TABLE `adicions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `concargos`
--
ALTER TABLE `concargos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `datosmaestros`
--
ALTER TABLE `datosmaestros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detapedidos`
--
ALTER TABLE `detapedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dtacontratos`
--
ALTER TABLE `dtacontratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factudetadis`
--
ALTER TABLE `factudetadis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturadetas`
--
ALTER TABLE `facturadetas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesesejecucions`
--
ALTER TABLE `mesesejecucions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `obligacions`
--
ALTER TABLE `obligacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `obliga_pagos`
--
ALTER TABLE `obliga_pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `riesgo_pagos`
--
ALTER TABLE `riesgo_pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rubrocontratos`
--
ALTER TABLE `rubrocontratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `rubroprins`
--
ALTER TABLE `rubroprins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `rubros`
--
ALTER TABLE `rubros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocontratos`
--
ALTER TABLE `tipocontratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uso_rubros`
--
ALTER TABLE `uso_rubros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adicions`
--
ALTER TABLE `adicions`
  ADD CONSTRAINT `adicions_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`);

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_concargo_id_foreign` FOREIGN KEY (`concargo_id`) REFERENCES `concargos` (`id`),
  ADD CONSTRAINT `contratos_dependencia_id_foreign` FOREIGN KEY (`dependencia_id`) REFERENCES `dependencias` (`id`),
  ADD CONSTRAINT `contratos_proveedor_id_foreign` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedors` (`id`),
  ADD CONSTRAINT `contratos_tipocontrato_id_foreign` FOREIGN KEY (`tipocontrato_id`) REFERENCES `tipocontratos` (`id`);

--
-- Filtros para la tabla `factudetadis`
--
ALTER TABLE `factudetadis`
  ADD CONSTRAINT `factudetadis_pago_id_foreign` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`);

--
-- Filtros para la tabla `facturadetas`
--
ALTER TABLE `facturadetas`
  ADD CONSTRAINT `facturadetas_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `facturadetas_dependencia_id_foreign` FOREIGN KEY (`dependencia_id`) REFERENCES `dependencias` (`id`),
  ADD CONSTRAINT `facturadetas_pago_id_foreign` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`),
  ADD CONSTRAINT `facturadetas_uso_rubro_id_foreign` FOREIGN KEY (`uso_rubro_id`) REFERENCES `uso_rubros` (`id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `facturas_pago_id_foreign` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`);

--
-- Filtros para la tabla `obligacions`
--
ALTER TABLE `obligacions`
  ADD CONSTRAINT `obligacions_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`);

--
-- Filtros para la tabla `obliga_pagos`
--
ALTER TABLE `obliga_pagos`
  ADD CONSTRAINT `obliga_pagos_pago_id_foreign` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `pagos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `riesgos`
--
ALTER TABLE `riesgos`
  ADD CONSTRAINT `riesgos_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`);

--
-- Filtros para la tabla `riesgo_pagos`
--
ALTER TABLE `riesgo_pagos`
  ADD CONSTRAINT `riesgo_pagos_pago_id_foreign` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`id`);

--
-- Filtros para la tabla `rubrocontratos`
--
ALTER TABLE `rubrocontratos`
  ADD CONSTRAINT `rubrocontratos_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `rubrocontratos_rubroprin_id_foreign` FOREIGN KEY (`rubroprin_id`) REFERENCES `rubroprins` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_dependencia_id_foreign` FOREIGN KEY (`dependencia_id`) REFERENCES `dependencias` (`id`);

--
-- Filtros para la tabla `uso_rubros`
--
ALTER TABLE `uso_rubros`
  ADD CONSTRAINT `uso_rubros_rubroprin_id_foreign` FOREIGN KEY (`rubroprin_id`) REFERENCES `rubroprins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
