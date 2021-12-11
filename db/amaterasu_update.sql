SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE amaterasu;
USE amaterasu;

CREATE TABLE `t_alumnos` (
  `idAlumno` int(11) NOT NULL,
  `n_Control` int(11) DEFAULT NULL,
  `nombreAlumno` varchar(255) DEFAULT NULL,
  `apellidoPaternoA` varchar(255) DEFAULT NULL,
  `apellidoMaternoA` varchar(255) DEFAULT NULL,
  `carrera` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `fk_semestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_alumnos` (`idAlumno`, `n_Control`, `nombreAlumno`, `apellidoPaternoA`, `apellidoMaternoA`, `carrera`, `fechaNacimiento`, `fk_semestre`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 191190077, 'Jose', 'Fuentes', 'Suarez', 'Sistemas', '2000-06-23', 1);

CREATE TABLE `t_docentes` (
  `idDocentes` int(11) NOT NULL,
  `rfc` varchar(255) DEFAULT NULL,
  `areaProfesor` varchar(255) DEFAULT NULL,
  `nombreDocente` varchar(255) DEFAULT NULL,
  `apellidoPaternoP` varchar(255) DEFAULT NULL,
  `apellidoMaternoP` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_docentes` (`idDocentes`, `rfc`, `areaProfesor`, `nombreDocente`, `apellidoPaternoP`, `apellidoMaternoP`, `fechaNacimiento`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'CUPU800825569', 'Sistemas', 'Diego', 'Sahashi', 'Uchiha', '1990-03-08'),
(3, 'CUPU800825569', 'Sistemas', 'Prueba', 'Paterno', 'Materno', '1989-04-09');

CREATE TABLE `t_usuario` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `rol` int(11) NOT NULL,
  `admin` int(1) NOT NULL DEFAULT 0,
  `datosAlumno` int(11) DEFAULT 1,
  `datosDocente` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_usuario` (`idUsuario`, `email`, `password`, `estado`, `rol`, `admin`, `datosAlumno`, `datosDocente`) VALUES
(2, 'prueba@mail.com', '$2y$10$0Dxb5OVtNvkK.e7GJxoB9eGS/UxnuJzxbLuNXCcc7qEehBChhekJ6', 2, 2, 1, 1, 2),
(5, 'docente@mail.com', '$2y$10$0Dxb5OVtNvkK.e7GJxoB9eGS/UxnuJzxbLuNXCcc7qEehBChhekJ6', 2, 2, 0, 1, 3),
(6, 'alumno1@mail.com', '$2y$10$0Dxb5OVtNvkK.e7GJxoB9eGS/UxnuJzxbLuNXCcc7qEehBChhekJ6', 2, 3, 0, 2, 1);
ALTER TABLE `t_alumnos`
  ADD PRIMARY KEY (`idAlumno`),
  ADD KEY `fk_semestre` (`fk_semestre`);

ALTER TABLE `t_docentes`
  ADD PRIMARY KEY (`idDocentes`);

ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `datosAlumno` (`datosAlumno`),
  ADD KEY `datosDocente` (`datosDocente`);

ALTER TABLE `t_alumnos`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `t_docentes`
  MODIFY `idDocentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `t_usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `t_alumnos`
  ADD CONSTRAINT `t_alumnos_ibfk_1` FOREIGN KEY (`fk_semestre`) REFERENCES `t_semestre` (`idSemestre`) ON UPDATE CASCADE;

ALTER TABLE `t_usuario`
  ADD CONSTRAINT `t_usuario_ibfk_1` FOREIGN KEY (`datosDocente`) REFERENCES `t_docentes` (`idDocentes`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_usuario_ibfk_2` FOREIGN KEY (`datosAlumno`) REFERENCES `t_alumnos` (`idAlumno`) ON UPDATE CASCADE;