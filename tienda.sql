-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2021 a las 06:17:43
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL,
  `numeroDocumento` bigint(20) DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `emailCliente` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nombreCliente` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `idTipoDocumento`, `numeroDocumento`, `direccion`, `emailCliente`, `nombreCliente`, `telefono`) VALUES
(1, 1, 80224554, 'AV BOYACA N 4-22', 'cliente1@', 'nombre1', '1111111'),
(2, 1, 1024483139, 'direccion 2', 'dos@', 'nombre dos', '22222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `codigoDetalleVenta` bigint(20) NOT NULL,
  `cantidadProducto` int(11) DEFAULT NULL,
  `codigoProducto` bigint(20) DEFAULT NULL,
  `codigoVenta` bigint(20) DEFAULT NULL,
  `valorTotal` double DEFAULT NULL,
  `ValorVenta` double DEFAULT NULL,
  `valorIva` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) NOT NULL,
  `codigoProducto` bigint(10) DEFAULT NULL,
  `ivaCompra` double DEFAULT NULL,
  `nitProveedor` bigint(20) DEFAULT NULL,
  `nombreProducto` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `precioCompra` double DEFAULT NULL,
  `precioVenta` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) NOT NULL,
  `nitProveedor` bigint(20) DEFAULT NULL,
  `ciudadProveedor` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `direccionProveedor` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nombreProveedor` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `telefonoProveedor` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`id`, `tipo`) VALUES
(1, 'CEDULA'),
(2, 'CEDULA EXTRANJERA'),
(3, 'TARJETA DE IDENTIDAD'),
(4, 'REGISTRO CIVIL'),
(5, 'NIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `numeroDocumentoUsuario` bigint(20) DEFAULT NULL,
  `emailUsuario` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nombreUsuario` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `codigoVenta` bigint(20) NOT NULL,
  `cedulaCliente` bigint(20) DEFAULT NULL,
  `cedulaUsuario` bigint(20) DEFAULT NULL,
  `ivaVenta` double DEFAULT NULL,
  `totalVenta` double DEFAULT NULL,
  `valorVenta` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numeroDocumento` (`numeroDocumento`),
  ADD KEY `FK_idTipoDoc` (`idTipoDocumento`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`codigoDetalleVenta`),
  ADD KEY `FK_CodigoProducto` (`codigoProducto`),
  ADD KEY `FK_CodigoVenta` (`codigoVenta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigoProducto` (`codigoProducto`),
  ADD KEY `nitProveedor` (`nitProveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nitproveedor` (`nitProveedor`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numeroDocumentoUsuario` (`numeroDocumentoUsuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`codigoVenta`),
  ADD KEY `FK_cedulaCliente` (`cedulaCliente`),
  ADD KEY `FK_cedulaUsuario` (`cedulaUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `codigoDetalleVenta` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `codigoVenta` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_idTipoDoc` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`id`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `FK_CodigoProducto` FOREIGN KEY (`codigoProducto`) REFERENCES `productos` (`codigoProducto`),
  ADD CONSTRAINT `FK_CodigoVenta` FOREIGN KEY (`codigoVenta`) REFERENCES `ventas` (`codigoVenta`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_nitProveedor` FOREIGN KEY (`nitProveedor`) REFERENCES `proveedores` (`nitproveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_cedulaCliente` FOREIGN KEY (`cedulaCliente`) REFERENCES `cliente` (`numeroDocumento`),
  ADD CONSTRAINT `FK_cedulaUsuario` FOREIGN KEY (`cedulaUsuario`) REFERENCES `usuarios` (`numeroDocumentoUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
