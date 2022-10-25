-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 03:11:50
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_aaaj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `nombre` varchar(60) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`nombre`, `clave`, `horas_semana`, `horas_totales`) VALUES
('Construye DB', '142', 6, 90),
('Desarrolla aplicaciones web con conexion a base de datos', '143', 6, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Administracion de re', 'Mixto', 'Maria ROsa SAnchez Live'),
('contabilidad', 'MIxto', NULL),
('Electricidad', 'Matutino', NULL),
('Logística', 'matutino', NULL),
('Mecaníca', 'Matutino', NULL),
('Programación', 'Mixto', 'Ricardo Mendez Rojas'),
('soporte y mantenimie', 'mixto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `numero_decontrol` varchar(14) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `edad` tinyint(2) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `grupo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`nombre`, `telefono`, `numero_decontrol`, `apellidos`, `edad`, `domicilio`, `grupo`) VALUES
('Arturo Isael', '4181824382', '19311050750475', 'Correa Barcenas', 18, 'Av. Educacion tecnologica #2', '5PV'),
('Brian Ulises', '4181824382', '19311050750489', 'Almaguer Perez', 18, 'Av. Educacion tecnologica #2', '5PV'),
('Juan Angel', '4181824382', '19311050750471', 'Almanza Arevalo', 18, 'Av. Educacion tecnologica #2', '5PV'),
('Tristan', '4181824382', '19311050750789', 'Martinez Gonzales', 18, 'Av. Educacion tecnologica #2', '5PV'),
('Victor Manuel', '4181824382', '19311050750584', 'Landeros Morales', 18, 'Av. Educacion tecnologica #2', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura.`
--

CREATE TABLE `estudiante_asignatura.` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(5) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(50) NOT NULL,
  `tutor` varchar(30) NOT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5AM', 'Matutino', 'Juan Arevalo', 'Luis Gerardo Salazar Torres', 'Administracion De re'),
('5AV', 'Vespertino', 'Emily Monserrat Avila Largo', 'Misael horacio Silva Muños', 'Administracion De re'),
('5CM', 'Matutino', 'tristan Martinez', 'Norma Alicia Romero Vazquez', 'contabilidad'),
('5CV', 'Vespertino', 'Diego Alejandro', 'Jose Luis Silva Muños', 'contabilidad'),
('5E', 'Matutino', 'Dexire Alexandra Martinez', 'Luis Godinez Almaguer', 'Electricidad'),
('5LM', 'Matutino', 'Brian ulises', 'Jose Cristobal Perez', 'Logistica'),
('5LV', 'Vespertino', 'Yazmin Hernandez', 'Martin Antonio Vasquez Deanda', 'Logistica'),
('5M', 'Matutino', 'Victor Manuel Landeros', 'Maria Rosa sanchez Live', 'Mecaníca'),
('5PM', 'Matutino', 'Gael Quintana Romero', 'Ricardo Mendez Rojas', 'Programación'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Carrillo', 'Programación'),
('5SM', 'Matutino', 'isael mares', 'Gabriel Barron', 'soporte y mantenimie'),
('5SV', 'Vespertino', 'Angel Arevalo', 'Gabriel Barron', 'soporte y mantenimie');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `índice_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura.`
--
ALTER TABLE `estudiante_asignatura.`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura.`
--
ALTER TABLE `estudiante_asignatura.`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`nombre`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`nombre`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
