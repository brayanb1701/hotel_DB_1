-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2019 a las 09:46:25
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel_bramavek`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_actividades`
--

CREATE TABLE `t_actividades` (
  `cod_act` int(11) NOT NULL,
  `nomb_act` varchar(25) NOT NULL,
  `precio_act` float NOT NULL,
  `descp_act` text NOT NULL,
  `fk_cod_lug` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_actividades`
--

INSERT INTO `t_actividades` (`cod_act`, `nomb_act`, `precio_act`, `descp_act`, `fk_cod_lug`) VALUES
(1, 'Conferencia', 20000, 'Si quieres contar con nosotros para hacer tus presentaciones en nuestra bella sala', 5),
(2, 'Noche de Solteras', 25000, 'Porque estar soltera está de moda, pasa esta noche en nuestro bar de la manera más espectacular', 3),
(3, 'Torneo de Mario Kart', 15000, 'Recordar los viejos tiempos o dejar a tus hijos jugar en este espacio es perfecto', 1),
(4, 'Ejercicio', 15000, 'Si quieres estar de vacaciones pero sin perder el hábito de entrenar', 2),
(5, 'Dia de Spa', 30000, 'Un día de relajación para que te dejes consentir ', 6),
(6, 'Noche Roja', 25000, 'Una noche donde todo puede pasar, sólo para atrevidos en la grandiosa piscina', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_actividades_factura`
--

CREATE TABLE `t_actividades_factura` (
  `id_act_fc` bigint(20) UNSIGNED NOT NULL,
  `fecha_af` date NOT NULL,
  `fk_cod_act` int(11) NOT NULL,
  `fk_cod_fc` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_actividades_factura`
--

INSERT INTO `t_actividades_factura` (`id_act_fc`, `fecha_af`, `fk_cod_act`, `fk_cod_fc`) VALUES
(1, '2018-12-19', 1, 3),
(2, '2018-01-16', 3, 2),
(3, '2018-03-17', 5, 7),
(4, '2018-01-18', 6, 2),
(5, '2018-04-24', 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_admin`
--

CREATE TABLE `t_admin` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_admin`
--

INSERT INTO `t_admin` (`usuario`, `password`, `nombres`, `apellidos`) VALUES
('admin', '12053bramavek', 'Kev', 'Springsteen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_camas`
--

CREATE TABLE `t_camas` (
  `cod_cama` int(11) NOT NULL,
  `tipo_c` char(1) NOT NULL,
  `fk_nro_hab` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `t_camas`
--

INSERT INTO `t_camas` (`cod_cama`, `tipo_c`, `fk_nro_hab`) VALUES
(1234, 'Q', 205),
(1235, 'Q', 303),
(1236, 'Q', 666),
(2323, 'D', 131),
(2324, 'D', 410),
(2325, 'D', 507),
(7897, 'S', 410),
(7898, 'S', 507);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_comidas`
--

CREATE TABLE `t_comidas` (
  `cod_comid` int(11) NOT NULL,
  `valor_comid` float NOT NULL,
  `nomb_comid` varchar(50) NOT NULL,
  `descp_comid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_comidas`
--

INSERT INTO `t_comidas` (`cod_comid`, `valor_comid`, `nomb_comid`, `descp_comid`) VALUES
(123, 25000, 'Arroz Mediterraneo', 'Arroz, trozos de carne, pollo, verduras y demás'),
(234, 30000, 'Pastas con pollo', 'Bañadas en salsa bechamel'),
(345, 20000, 'Hamburguesa tradicional', 'Con pollo desmechado y tocineta'),
(456, 22000, 'Arroz negro', 'Con mariscos'),
(567, 35000, 'Lomo fino', 'Acompañado de ensalada rusa'),
(678, 40000, 'Pierna de cordero', 'Al horno con patatas fritas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_comidas_factura`
--

CREATE TABLE `t_comidas_factura` (
  `id_com_fc` bigint(20) UNSIGNED NOT NULL,
  `fecha_com` date NOT NULL,
  `cant_com` int(11) NOT NULL,
  `fk_cod_comid` int(11) NOT NULL,
  `fk_cod_fc` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_comidas_factura`
--

INSERT INTO `t_comidas_factura` (`id_com_fc`, `fecha_com`, `cant_com`, `fk_cod_comid`, `fk_cod_fc`) VALUES
(1, '2018-04-26', 2, 678, 6),
(2, '2018-12-18', 4, 234, 3),
(3, '2018-06-29', 1, 234, 2),
(4, '2018-03-16', 2, 456, 7),
(5, '2018-12-19', 4, 567, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_factura`
--

CREATE TABLE `t_factura` (
  `cod_fc` bigint(20) UNSIGNED NOT NULL,
  `fecha_fc` timestamp NOT NULL,
  `subtotal` float NOT NULL,
  `iva_fc` float NOT NULL,
  `valor_total` float NOT NULL,
  `desc_fc` text NOT NULL,
  `fk_cod_prom` int(11) NOT NULL,
  `fk_cod_r` bigint(20) UNSIGNED DEFAULT NULL,
  `fk_cod_met` int(11) NOT NULL,
  `fk_nro_ident` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_factura`
--

INSERT INTO `t_factura` (`cod_fc`, `fecha_fc`, `subtotal`, `iva_fc`, `valor_total`, `desc_fc`, `fk_cod_prom`, `fk_cod_r`, `fk_cod_met`, `fk_nro_ident`) VALUES
(1, '2018-04-18 18:52:12', 1900000, 361000, 1691000, '30', 6, 6, 1, 13457902246),
(2, '2018-06-30 22:45:43', 1350000, 256500, 1471500, '0', 8, 3, 3, 56784235),
(3, '2018-12-22 16:30:29', 2500000, 475000, 2975000, '0', 8, 5, 4, 10987657987),
(4, '2018-04-09 12:55:55', 1750000, 332500, 2082500, '18', 4, 1, 1, 1007414346),
(5, '2018-12-09 17:12:12', 1250000, 237500, 1262500, '0', 8, 2, 2, 64568942),
(6, '2018-04-27 21:54:39', 2850000, 541500, 3391500, '12', 2, 7, 1, 47896422),
(7, '2018-03-18 19:45:22', 1500000, 285000, 1785000, '0', 8, NULL, 1, 36789865),
(8, '2018-02-18 20:30:33', 1500000, 285000, 1605000, '12', 2, NULL, 2, 63368846),
(9, '2018-12-18 20:40:00', 2000000, 380000, 2380000, '0', 8, NULL, 3, 91245373),
(10, '2018-11-15 23:32:55', 1800000, 342000, 1962000, '10', 1, NULL, 3, 27832910);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_habitaciones`
--

CREATE TABLE `t_habitaciones` (
  `nro_hab` int(11) NOT NULL,
  `capacidad` tinyint(4) NOT NULL,
  `tamaño` varchar(10) NOT NULL,
  `precio_noche` int(11) NOT NULL,
  `dispon` char(2) NOT NULL,
  `fk_cod_th` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `t_habitaciones`
--

INSERT INTO `t_habitaciones` (`nro_hab`, `capacidad`, `tamaño`, `precio_noche`, `dispon`, `fk_cod_th`) VALUES
(131, 2, '65', 150000, 'SD', 1),
(205, 2, '70', 190000, 'SD', 2),
(303, 2, '80', 200000, 'ND', 2),
(410, 7, '80', 280000, 'ND', 4),
(507, 5, '90', 300000, 'ND', 3),
(666, 2, '90', 310000, 'SD', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_habitaciones_factura`
--

CREATE TABLE `t_habitaciones_factura` (
  `id_hab_fc` bigint(20) UNSIGNED NOT NULL,
  `fk_nro_hab` int(11) NOT NULL,
  `fk_cod_fc` bigint(20) UNSIGNED NOT NULL,
  `fecha_hf` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_habitaciones_factura`
--

INSERT INTO `t_habitaciones_factura` (`id_hab_fc`, `fk_nro_hab`, `fk_cod_fc`, `fecha_hf`) VALUES
(1, 507, 6, '2018-04-27'),
(2, 205, 7, '2018-03-18'),
(3, 131, 2, '2018-01-22'),
(4, 410, 4, '2018-04-09'),
(5, 303, 8, '2018-02-18'),
(6, 666, 3, '2018-12-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_huespedes`
--

CREATE TABLE `t_huespedes` (
  `nro_ident` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `lugar_origen` varchar(40) NOT NULL,
  `celular` varchar(14) NOT NULL,
  `fecha_nac` date NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `correo_elec` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_huespedes`
--

INSERT INTO `t_huespedes` (`nro_ident`, `nombres`, `apellidos`, `lugar_origen`, `celular`, `fecha_nac`, `edad`, `correo_elec`, `password`) VALUES
(27832910, 'Claudia Patricia', 'Alvarez Mayorga', 'Cali', '3214565432', '1953-12-04', 65, NULL, '12345c'),
(36789865, 'Thomas', 'Donell Spencer', 'Chicago', '7678976568', '1980-06-05', 39, 'tommydcsp@gmail.es', '12345t'),
(47896422, 'Patricio', 'Estupiñan Gonzalez', 'Cali', '3445049545', '1989-12-31', 29, 'patrigonz@hotmail.com', '12345p'),
(56784235, 'Fernanda ', 'Caceres Ortiz', 'Medellín', '3015676432', '1990-12-06', 28, 'fernandisortiz@hotmail.es', '12345f'),
(56788754, 'Karen Andrea', 'Jaimes Jaimes', 'Pereira', '3434235932', '1982-01-30', 37, 'karejaimes@gmail.com', '12345k'),
(63368846, 'Andrew', 'Newball Merlyn', 'San Francisco', '6567898767', '1977-03-07', 42, 'andrewmry@yahoo.es', '12345a'),
(64568942, 'Martina', 'Sepúlveda Ojeda', 'Santa Marta', '3166787654', '1985-02-03', 34, 'martisep@yahoo.es', '12345m'),
(91245373, 'Gloria Marcela', 'Santander Florez', 'Bogotá', '3019294949', '1970-05-08', 49, NULL, '12345g'),
(976358087, 'Barry ', 'James Allen', 'Los Angeles', '6507646532', '1991-09-09', 27, 'barryallen@hotmail.com', '12345b'),
(1007414346, 'Pedro', 'Ramirez Galvis', 'Bucaramanga', '3015765434', '1990-05-08', 29, 'p.ramirezg@gmail.com', '12345p'),
(10987657987, 'Stephen ', 'Amell Gustin', 'Vancouver ', '2343565777', '1984-06-03', 35, 'stepamellg@yahoo.es', '12345s'),
(13457902246, 'Pamela', 'Baker Lotz', 'Toronto', '4565435467', '1988-06-04', 31, 'pamelab@gmail.com', '12345p');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_lugares`
--

CREATE TABLE `t_lugares` (
  `cod_lug` int(11) NOT NULL,
  `nom_lug` varchar(30) NOT NULL,
  `estado_lug` char(1) NOT NULL,
  `descrip_lug` text
) ;

--
-- Volcado de datos para la tabla `t_lugares`
--

INSERT INTO `t_lugares` (`cod_lug`, `nom_lug`, `estado_lug`, `descrip_lug`) VALUES
(1, 'Sala de videojuegos', 'D', 'La sala de videojuegos consta de diferentes tipos de consola como Playstation, Nintendo y Xbox'),
(2, 'Gym', 'D', 'Puedes estar en nuestro hotel y aun así no perder la figura'),
(3, 'Bar-Disco', 'D', 'Deseas bailar hasta el amanecer y pasarla bien, este es el mejor lugar'),
(4, 'Restaurante', 'D', 'Un ambiente espectacular para disfrutar de las mejores comidas'),
(5, 'Sala de eventos', 'R', 'Si necesitas realizar algún tipo de evento, este es el sitio perfecto'),
(6, 'Sala de masajes', 'R', 'Puedes relajarte en las manos de nuestras mejores masajistas'),
(7, 'Piscina', 'D', 'Para un día caluroso es la mejor actividad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_metodo_pago`
--

CREATE TABLE `t_metodo_pago` (
  `cod_met` int(11) NOT NULL,
  `nombre_met` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_metodo_pago`
--

INSERT INTO `t_metodo_pago` (`cod_met`, `nombre_met`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta debito'),
(3, 'Tarjeta credito'),
(4, 'Credicontado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_paquetes`
--

CREATE TABLE `t_paquetes` (
  `cod_paq` int(11) NOT NULL,
  `nomb_pq` varchar(25) NOT NULL,
  `valor_pq` int(11) NOT NULL,
  `desc_pq` text NOT NULL,
  `fk_cod_tem` bigint(20) UNSIGNED NOT NULL,
  `fk_nomb_tem` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_paquetes`
--

INSERT INTO `t_paquetes` (`cod_paq`, `nomb_pq`, `valor_pq`, `desc_pq`, `fk_cod_tem`, `fk_nomb_tem`) VALUES
(1232, 'Todo Incluido Alta', 1500000, 'Podrás de disfrutar de todas las comodidades de nuestro hotel y los beneficios de este', 1, 'A'),
(1233, 'Todo Incluido Baja', 2000000, 'Podrás de disfrutar de todas las comodidades de nuestro hotel y los beneficios de este', 4, 'B'),
(3454, 'Parejas', 2000000, 'El amor es parte fundamental para nosotros por eso, para ti que quieres tener un rato agradable con tu pareja te invitamos a disfrutar de una hermosa noche al lado de la persona que más amas', 2, 'A'),
(4565, 'Recién Casados', 1800000, 'Para celebrar la unión de dos almas que se convierten en una ven a disfrutar tu luna de miel con unos buenos y bonitos recuerdos.', 3, 'A'),
(4566, 'Familiar', 2750000, 'La familia es lo parte indispensable en la vida de todo ser humano por eso podrás disfrutar de todas las comodidades junto a tus hijos y ser más unidos.', 6, 'B'),
(6764, 'Individual', 1000000, 'Si quieres despejar tu mente o estas en un viaje de negocios este paquete es especial para ti, con las comodidades básicas pero perfectas.', 4, 'B'),
(7887, 'Amigos', 2500000, 'Pasar un rato agradable rodeado de tus amigos y estar cómodos, dos cosas que puedes tener en este hotel junto con algunas actividades adicionales que puedes realizar', 5, 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_productos`
--

CREATE TABLE `t_productos` (
  `cod_prod` bigint(20) UNSIGNED NOT NULL,
  `nombr_prod` varchar(25) NOT NULL,
  `desc_prod` text NOT NULL,
  `precio_cu` int(11) NOT NULL,
  `fk_codigo_pv` bigint(20) UNSIGNED NOT NULL,
  `fk_nr_idpv` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_productos`
--

INSERT INTO `t_productos` (`cod_prod`, `nombr_prod`, `desc_prod`, `precio_cu`, `fk_codigo_pv`, `fk_nr_idpv`) VALUES
(67657567, 'Flores', 'Para que tengas un detalle con tu pareja', 30000, 9857, 45567876),
(76675675, 'Vestido de baño', 'De color blanco, beige, negro y crema', 100000, 1708, 67895643),
(134532567, 'Bolsos de mano', 'Variedad de bolsos según tu necesidad', 130000, 1468, 91345243),
(245049328, 'Licores', 'Licores de alta calidad para que disfrutes al máximo tu estadía', 5000000, 3256, 67776453),
(345345453, 'Gafas', 'Gafas de sol para disfrutar en la estadía del hotel', 12000, 1206, 23443234),
(656546987, 'Sandalias', 'Los mejores estilos y colores', 17000, 1081, 78965474),
(767878789, 'Útiles personales ', 'Cremas, perfumes, y demás', 50000, 1674, 10458432918),
(789087654, 'Condones', 'Disfruta del hotel con la mayor seguridad', 10000, 6753, 63345665),
(890674523, 'Botiquín Básico', 'Medicamentos, vendas, gasas, esparadrapo y demás', 100000, 2346, 37283402),
(987678900, 'Sombrero', 'Disfruta del hotel protegiéndote del sol', 13400, 6853, 10094333214);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_productos_factura`
--

CREATE TABLE `t_productos_factura` (
  `id_prod_fc` bigint(20) UNSIGNED NOT NULL,
  `fk_cod_prod` bigint(20) UNSIGNED NOT NULL,
  `fk_cod_fc` bigint(20) UNSIGNED NOT NULL,
  `fecha_pf` date NOT NULL,
  `cantidad_pf` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_productos_factura`
--

INSERT INTO `t_productos_factura` (`id_prod_fc`, `fk_cod_prod`, `fk_cod_fc`, `fecha_pf`, `cantidad_pf`) VALUES
(1, 656546987, 6, '2018-04-25', 1),
(2, 134532567, 6, '2018-04-24', 3),
(3, 789087654, 2, '2018-06-28', 5),
(4, 890674523, 3, '2018-12-18', 1),
(5, 890674523, 3, '2018-12-20', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_promociones`
--

CREATE TABLE `t_promociones` (
  `cod_prom` int(11) NOT NULL,
  `nombre_prom` varchar(50) NOT NULL,
  `descrip_prom` text NOT NULL,
  `valor_desc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_promociones`
--

INSERT INTO `t_promociones` (`cod_prom`, `nombre_prom`, `descrip_prom`, `valor_desc`) VALUES
(1, 'Escapada romantica', 'Desconectate del mundo junto a tu pareja y disfruta del mejor alojamiento en nuestro hotel', 10),
(2, 'Relax', 'Ven y disfruta de las comodidades de nuestro hotel y déjate consentir en nuestra sala de masajes', 12),
(3, 'Semana santa', 'Tiempo de recogimiento en familia para pensar en Jesús, hospedate en nuestro hotel y vive esos momentos con nosotros', 15),
(4, 'Navidad', 'Para compartir en familia es un plan perfecto venir a nuestro hotel', 18),
(5, 'Día de las madres', 'Disfruta ese día junto a tu Mamá y llevala a un ambiente fuera de casa', 25),
(6, 'Cumpleaños', 'Por tus cumpleaños tendrás un descuento especial para ti y para otra persona, disfrutarás al mejor estilo del Hotel Bramavek', 30),
(7, 'Grupo', 'Si vienes al Hotel Bramavek con más de 20 personas, tendrás una súper promoción', 35),
(8, 'Ninguna', 'Sin promoción', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_proveedores`
--

CREATE TABLE `t_proveedores` (
  `nr_idpv` bigint(20) UNSIGNED NOT NULL,
  `codigo_pv` bigint(20) UNSIGNED NOT NULL,
  `nombre_pv` varchar(50) NOT NULL,
  `direcc_pv` varchar(40) NOT NULL,
  `tel_pv` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_proveedores`
--

INSERT INTO `t_proveedores` (`nr_idpv`, `codigo_pv`, `nombre_pv`, `direcc_pv`, `tel_pv`) VALUES
(23443234, 1206, 'Sunglasses SA', 'Transv. 132 #76-12', '6327569'),
(37283402, 2346, 'Primeros Auxilios Kev', 'Cll 453 # 56-78', '6789434'),
(45567876, 9857, 'Floristería María', 'Cra. 27 # 65-43', '6545787'),
(63345665, 6753, 'Condones M', 'Cra. 5 # 22-45', '6754835'),
(67776453, 3256, 'La Licorera Ltda', 'Cll. 9 #14-56', '6546789'),
(67895643, 1708, 'Summer SA', 'Cll. 140 #25-43', '6783245'),
(78965474, 1081, 'Sandalias SA', 'Cra. 432 #54-11', '6923456'),
(91345243, 1468, 'Bolsos Ange Ltda', 'Transv. 342 # 67-11', '6894367'),
(10094333214, 6853, 'Sombreros Rodolfo SA', 'Cll. 654 # 12-76', '6342467'),
(10458432918, 1674, 'Consentir SA', 'Cll 124 # 34-424', '6365423');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_reservas`
--

CREATE TABLE `t_reservas` (
  `cod_r` bigint(20) UNSIGNED NOT NULL,
  `cant_habit` tinyint(4) NOT NULL,
  `fecha_llegada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `dias_hospedaje` int(11) NOT NULL,
  `estado_reserva` char(3) NOT NULL,
  `fk_nro_ident` bigint(20) UNSIGNED NOT NULL,
  `fk_cod_paq` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `t_reservas`
--

INSERT INTO `t_reservas` (`cod_r`, `cant_habit`, `fecha_llegada`, `fecha_salida`, `dias_hospedaje`, `estado_reserva`, `fk_nro_ident`, `fk_cod_paq`) VALUES
(1, 1, '2019-04-03', '2019-04-09', 6, 'CON', 1007414346, 1232),
(2, 2, '2019-12-04', '2018-12-09', 5, 'CON', 64568942, 7887),
(3, 1, '2018-06-25', '2018-06-30', 5, 'CON', 56784235, 3454),
(4, 1, '2018-01-26', '2018-01-28', 2, 'CAN', 976358087, 6764),
(5, 2, '2018-12-17', '2018-12-22', 5, 'CON', 10987657987, 1232),
(6, 1, '2018-04-10', '2018-04-18', 8, 'CON', 13457902246, 4565),
(7, 3, '2018-04-23', '2018-04-27', 4, 'CON', 47896422, 4566),
(8, 3, '2018-01-14', '2018-01-22', 8, 'CAN', 56788754, 1233);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_temporadas`
--

CREATE TABLE `t_temporadas` (
  `cod_tem` bigint(20) UNSIGNED NOT NULL,
  `nomb_tem` char(1) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL
) ;

--
-- Volcado de datos para la tabla `t_temporadas`
--

INSERT INTO `t_temporadas` (`cod_tem`, `nomb_tem`, `fecha_ini`, `fecha_fin`) VALUES
(1, 'A', '0000-12-15', '0000-01-15'),
(2, 'A', '0000-06-20', '0000-07-20'),
(3, 'A', '0000-01-04', '0000-04-20'),
(4, 'B', '0000-01-16', '0000-03-30'),
(5, 'B', '0000-04-21', '0000-06-19'),
(6, 'B', '0000-07-21', '0000-12-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_tipo_hab`
--

CREATE TABLE `t_tipo_hab` (
  `cod_th` int(11) NOT NULL,
  `nom_th` varchar(20) NOT NULL,
  `descp_th` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `t_tipo_hab`
--

INSERT INTO `t_tipo_hab` (`cod_th`, `nom_th`, `descp_th`) VALUES
(1, 'Flash', 'Posee una cama doble, TV, aire acondicionado, caja fuerte, baño y mobiliario básico'),
(2, 'Pareja', 'Posee una cama queen, TV, aire acondicionado, caja fuerte, baño y mobiliario básico'),
(3, 'Familiar', 'Posee una cama doble, una cama sencilla, una litera, sofá, TV, aire acondicionado, caja fuerte, baño y mobiliario básico'),
(4, 'Amigos', 'Posee una cama doble junto con tres camas individuales, una litera, una mini cava, un sofá, TV, aire acondicionado, caja fuerte, baño y mobiliario básico'),
(5, 'Suite', 'Posee una cama queen, TV, aire acondicionado, caja fuerte, baño, mobiliario básico y terraza');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_actividades`
--
ALTER TABLE `t_actividades`
  ADD PRIMARY KEY (`cod_act`),
  ADD KEY `fk_cod_lug_ac` (`fk_cod_lug`);

--
-- Indices de la tabla `t_actividades_factura`
--
ALTER TABLE `t_actividades_factura`
  ADD PRIMARY KEY (`id_act_fc`),
  ADD UNIQUE KEY `id_act_fc` (`id_act_fc`),
  ADD KEY `fk_cod_act_af` (`fk_cod_act`),
  ADD KEY `fk_cod_fc_af` (`fk_cod_fc`);

--
-- Indices de la tabla `t_camas`
--
ALTER TABLE `t_camas`
  ADD PRIMARY KEY (`cod_cama`),
  ADD KEY `fk_nro_hab_fc` (`fk_nro_hab`);

--
-- Indices de la tabla `t_comidas`
--
ALTER TABLE `t_comidas`
  ADD PRIMARY KEY (`cod_comid`);

--
-- Indices de la tabla `t_comidas_factura`
--
ALTER TABLE `t_comidas_factura`
  ADD PRIMARY KEY (`id_com_fc`),
  ADD UNIQUE KEY `id_com_fc` (`id_com_fc`),
  ADD KEY `fk_cod_comid_cf` (`fk_cod_comid`),
  ADD KEY `fk_cod_fc_cf` (`fk_cod_fc`);

--
-- Indices de la tabla `t_factura`
--
ALTER TABLE `t_factura`
  ADD PRIMARY KEY (`cod_fc`),
  ADD UNIQUE KEY `cod_fc` (`cod_fc`),
  ADD KEY `fk_cod_r_fc` (`fk_cod_r`),
  ADD KEY `fk_cod_prom_fc` (`fk_cod_prom`),
  ADD KEY `fk_nro_ident_hues` (`fk_nro_ident`),
  ADD KEY `fk_cod_met_fc` (`fk_cod_met`);

--
-- Indices de la tabla `t_habitaciones`
--
ALTER TABLE `t_habitaciones`
  ADD PRIMARY KEY (`nro_hab`),
  ADD KEY `fk_cod_th_hab` (`fk_cod_th`);

--
-- Indices de la tabla `t_habitaciones_factura`
--
ALTER TABLE `t_habitaciones_factura`
  ADD PRIMARY KEY (`id_hab_fc`),
  ADD UNIQUE KEY `id_hab_fc` (`id_hab_fc`),
  ADD KEY `fk_nro_hab_hf` (`fk_nro_hab`),
  ADD KEY `fk_cod_fc_hf` (`fk_cod_fc`);

--
-- Indices de la tabla `t_huespedes`
--
ALTER TABLE `t_huespedes`
  ADD PRIMARY KEY (`nro_ident`);

--
-- Indices de la tabla `t_lugares`
--
ALTER TABLE `t_lugares`
  ADD PRIMARY KEY (`cod_lug`);

--
-- Indices de la tabla `t_metodo_pago`
--
ALTER TABLE `t_metodo_pago`
  ADD PRIMARY KEY (`cod_met`);

--
-- Indices de la tabla `t_paquetes`
--
ALTER TABLE `t_paquetes`
  ADD PRIMARY KEY (`cod_paq`),
  ADD KEY `fk_cod_nomb_pq` (`fk_cod_tem`,`fk_nomb_tem`);

--
-- Indices de la tabla `t_productos`
--
ALTER TABLE `t_productos`
  ADD PRIMARY KEY (`cod_prod`),
  ADD KEY `fk_productos_proveedores` (`fk_nr_idpv`,`fk_codigo_pv`);

--
-- Indices de la tabla `t_productos_factura`
--
ALTER TABLE `t_productos_factura`
  ADD PRIMARY KEY (`id_prod_fc`),
  ADD UNIQUE KEY `id_prod_fc` (`id_prod_fc`),
  ADD KEY `fk_prodfc_productos` (`fk_cod_prod`),
  ADD KEY `fk_prodfc_factura` (`fk_cod_fc`);

--
-- Indices de la tabla `t_promociones`
--
ALTER TABLE `t_promociones`
  ADD PRIMARY KEY (`cod_prom`);

--
-- Indices de la tabla `t_proveedores`
--
ALTER TABLE `t_proveedores`
  ADD PRIMARY KEY (`nr_idpv`,`codigo_pv`);

--
-- Indices de la tabla `t_reservas`
--
ALTER TABLE `t_reservas`
  ADD PRIMARY KEY (`cod_r`),
  ADD UNIQUE KEY `cod_r` (`cod_r`),
  ADD KEY `fk_nro_ident_r` (`fk_nro_ident`),
  ADD KEY `fk_cod_paq` (`fk_cod_paq`);

--
-- Indices de la tabla `t_temporadas`
--
ALTER TABLE `t_temporadas`
  ADD PRIMARY KEY (`cod_tem`,`nomb_tem`),
  ADD UNIQUE KEY `cod_tem` (`cod_tem`);

--
-- Indices de la tabla `t_tipo_hab`
--
ALTER TABLE `t_tipo_hab`
  ADD PRIMARY KEY (`cod_th`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_actividades_factura`
--
ALTER TABLE `t_actividades_factura`
  MODIFY `id_act_fc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_comidas_factura`
--
ALTER TABLE `t_comidas_factura`
  MODIFY `id_com_fc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_factura`
--
ALTER TABLE `t_factura`
  MODIFY `cod_fc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_habitaciones_factura`
--
ALTER TABLE `t_habitaciones_factura`
  MODIFY `id_hab_fc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `t_productos_factura`
--
ALTER TABLE `t_productos_factura`
  MODIFY `id_prod_fc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_reservas`
--
ALTER TABLE `t_reservas`
  MODIFY `cod_r` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_temporadas`
--
ALTER TABLE `t_temporadas`
  MODIFY `cod_tem` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_actividades`
--
ALTER TABLE `t_actividades`
  ADD CONSTRAINT `fk_cod_lug_ac` FOREIGN KEY (`fk_cod_lug`) REFERENCES `t_lugares` (`cod_lug`);

--
-- Filtros para la tabla `t_actividades_factura`
--
ALTER TABLE `t_actividades_factura`
  ADD CONSTRAINT `fk_cod_act_af` FOREIGN KEY (`fk_cod_act`) REFERENCES `t_actividades` (`cod_act`),
  ADD CONSTRAINT `fk_cod_fc_af` FOREIGN KEY (`fk_cod_fc`) REFERENCES `t_factura` (`cod_fc`);

--
-- Filtros para la tabla `t_camas`
--
ALTER TABLE `t_camas`
  ADD CONSTRAINT `fk_nro_hab_fc` FOREIGN KEY (`fk_nro_hab`) REFERENCES `t_habitaciones` (`nro_hab`);

--
-- Filtros para la tabla `t_comidas_factura`
--
ALTER TABLE `t_comidas_factura`
  ADD CONSTRAINT `fk_cod_comid_cf` FOREIGN KEY (`fk_cod_comid`) REFERENCES `t_comidas` (`cod_comid`),
  ADD CONSTRAINT `fk_cod_fc_cf` FOREIGN KEY (`fk_cod_fc`) REFERENCES `t_factura` (`cod_fc`);

--
-- Filtros para la tabla `t_factura`
--
ALTER TABLE `t_factura`
  ADD CONSTRAINT `fk_cod_met_fc` FOREIGN KEY (`fk_cod_met`) REFERENCES `t_metodo_pago` (`cod_met`),
  ADD CONSTRAINT `fk_cod_prom_fc` FOREIGN KEY (`fk_cod_prom`) REFERENCES `t_promociones` (`cod_prom`),
  ADD CONSTRAINT `fk_cod_r_fc` FOREIGN KEY (`fk_cod_r`) REFERENCES `t_reservas` (`cod_r`),
  ADD CONSTRAINT `fk_nro_ident_hues` FOREIGN KEY (`fk_nro_ident`) REFERENCES `t_huespedes` (`nro_ident`);

--
-- Filtros para la tabla `t_habitaciones`
--
ALTER TABLE `t_habitaciones`
  ADD CONSTRAINT `fk_cod_th_hab` FOREIGN KEY (`fk_cod_th`) REFERENCES `t_tipo_hab` (`cod_th`);

--
-- Filtros para la tabla `t_habitaciones_factura`
--
ALTER TABLE `t_habitaciones_factura`
  ADD CONSTRAINT `fk_cod_fc_hf` FOREIGN KEY (`fk_cod_fc`) REFERENCES `t_factura` (`cod_fc`),
  ADD CONSTRAINT `fk_nro_hab_hf` FOREIGN KEY (`fk_nro_hab`) REFERENCES `t_habitaciones` (`nro_hab`);

--
-- Filtros para la tabla `t_paquetes`
--
ALTER TABLE `t_paquetes`
  ADD CONSTRAINT `fk_cod_nomb_pq` FOREIGN KEY (`fk_cod_tem`,`fk_nomb_tem`) REFERENCES `t_temporadas` (`cod_tem`, `nomb_tem`);

--
-- Filtros para la tabla `t_productos`
--
ALTER TABLE `t_productos`
  ADD CONSTRAINT `fk_productos_proveedores` FOREIGN KEY (`fk_nr_idpv`,`fk_codigo_pv`) REFERENCES `t_proveedores` (`nr_idpv`, `codigo_pv`);

--
-- Filtros para la tabla `t_productos_factura`
--
ALTER TABLE `t_productos_factura`
  ADD CONSTRAINT `fk_prodfc_factura` FOREIGN KEY (`fk_cod_fc`) REFERENCES `t_factura` (`cod_fc`),
  ADD CONSTRAINT `fk_prodfc_productos` FOREIGN KEY (`fk_cod_prod`) REFERENCES `t_productos` (`cod_prod`);

--
-- Filtros para la tabla `t_reservas`
--
ALTER TABLE `t_reservas`
  ADD CONSTRAINT `fk_cod_paq` FOREIGN KEY (`fk_cod_paq`) REFERENCES `t_paquetes` (`cod_paq`),
  ADD CONSTRAINT `fk_nro_ident_r` FOREIGN KEY (`fk_nro_ident`) REFERENCES `t_huespedes` (`nro_ident`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
