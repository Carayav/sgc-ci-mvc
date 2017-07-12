-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "sgc" ----------------------------------
CREATE DATABASE IF NOT EXISTS `sgc` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sgc`;
-- ---------------------------------------------------------


-- CREATE TABLE "Bitacora" ---------------------------------
-- DROP TABLE "Bitacora" ---------------------------------------
DROP TABLE IF EXISTS `Bitacora` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Bitacora" -------------------------------------
CREATE TABLE `Bitacora` ( 
	`BitacoraId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`FechaHora` DateTime NULL,
	`CampanhaId` Int( 11 ) NOT NULL,
	`PerfilId` Int( 11 ) NOT NULL,
	`UsuarioId` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `BitacoraId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Perfil" -----------------------------------
-- DROP TABLE "Perfil" -----------------------------------------
DROP TABLE IF EXISTS `Perfil` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Perfil" ---------------------------------------
CREATE TABLE `Perfil` ( 
	`PerfilId` Int( 11 ) NOT NULL,
	`FotoReferencia` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`PlayaId` Int( 11 ) NOT NULL,
	`DescMedicion` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `PerfilId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Campanha" ---------------------------------
-- DROP TABLE "Campanha" ---------------------------------------
DROP TABLE IF EXISTS `Campanha` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Campanha" -------------------------------------
CREATE TABLE `Campanha` ( 
	`CampanhaId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Estado` Bit( 1 ) NOT NULL,
	`TamanhoMedicion` Decimal( 3, 0 ) NOT NULL,
	`PlayaId` Int( 255 ) NOT NULL,
	`UsuarioId` Int( 11 ) NOT NULL COMMENT 'ID del Usuario Encargado
',
	`FechaHora` DateTime NOT NULL,
	PRIMARY KEY ( `CampanhaId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Ciudad" -----------------------------------
-- DROP TABLE "Ciudad" -----------------------------------------
DROP TABLE IF EXISTS `Ciudad` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Ciudad" ---------------------------------------
CREATE TABLE `Ciudad` ( 
	`CiudadId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Nombre` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`RegionId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `CiudadId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "FotoPlaya" --------------------------------
-- DROP TABLE "FotoPlaya" --------------------------------------
DROP TABLE IF EXISTS `FotoPlaya` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "FotoPlaya" ------------------------------------
CREATE TABLE `FotoPlaya` ( 
	`FotoId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Autor` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`FechaHora` DateTime NOT NULL,
	`Descripcion` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`PlayaId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `FotoId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "IntegranteBitacora" -----------------------
-- DROP TABLE "IntegranteBitacora" -----------------------------
DROP TABLE IF EXISTS `IntegranteBitacora` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "IntegranteBitacora" ---------------------------
CREATE TABLE `IntegranteBitacora` ( 
	`IntegranteBitacoraId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`UsuarioId` Int( 11 ) NOT NULL,
	`BitacoraId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `IntegranteBitacoraId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Marea" ------------------------------------
-- DROP TABLE "Marea" ------------------------------------------
DROP TABLE IF EXISTS `Marea` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Marea" ----------------------------------------
CREATE TABLE `Marea` ( 
	`MareaId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Altura` Decimal( 2, 2 ) NOT NULL,
	`FechaHora` DateTime NOT NULL,
	`Tipo` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`CiudadId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `MareaId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Medicion" ---------------------------------
-- DROP TABLE "Medicion" ---------------------------------------
DROP TABLE IF EXISTS `Medicion` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Medicion" -------------------------------------
CREATE TABLE `Medicion` ( 
	`Estacion` Int( 11 ) NOT NULL,
	`Comentario` VarChar( 500 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`MedicionId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`EstacionMedicion` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`BitacoraId` Int( 11 ) NOT NULL,
	`DistVertical` Decimal( 2, 2 ) NOT NULL,
	`DistHorizontal` Decimal( 2, 2 ) NOT NULL,
	PRIMARY KEY ( `MedicionId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "OleajePlaya" ------------------------------
-- DROP TABLE "OleajePlaya" ------------------------------------
DROP TABLE IF EXISTS `OleajePlaya` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "OleajePlaya" ----------------------------------
CREATE TABLE `OleajePlaya` ( 
	`FechaHora` DateTime NOT NULL,
	`Direccion` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`OleajePlayaId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Periodo` Int( 11 ) NOT NULL,
	`PlayaId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `OleajePlayaId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Pais" -------------------------------------
-- DROP TABLE "Pais" -------------------------------------------
DROP TABLE IF EXISTS `Pais` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Pais" -----------------------------------------
CREATE TABLE `Pais` ( 
	`PaisId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Nombre` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `PaisId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 13;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Playa" ------------------------------------
-- DROP TABLE "Playa" ------------------------------------------
DROP TABLE IF EXISTS `Playa` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Playa" ----------------------------------------
CREATE TABLE `Playa` ( 
	`PlayaId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Nombre` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`Orientacion` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`DescGeneral` VarChar( 500 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`DescTecnica` VarChar( 500 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`FotoSuperior` VarChar( 500 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`FotoPrincipal` VarChar( 500 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`CiudadId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `PlayaId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 17;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Pronostico" -------------------------------
-- DROP TABLE "Pronostico" -------------------------------------
DROP TABLE IF EXISTS `Pronostico` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Pronostico" -----------------------------------
CREATE TABLE `Pronostico` ( 
	`PronosticoId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Fecha` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`TiempoId` Int( 11 ) NOT NULL,
	`CiudadId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `PronosticoId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Region" -----------------------------------
-- DROP TABLE "Region" -----------------------------------------
DROP TABLE IF EXISTS `Region` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Region" ---------------------------------------
CREATE TABLE `Region` ( 
	`RegionId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Nombre` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`PaisId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `RegionId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Tiempo" -----------------------------------
-- DROP TABLE "Tiempo" -----------------------------------------
DROP TABLE IF EXISTS `Tiempo` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Tiempo" ---------------------------------------
CREATE TABLE `Tiempo` ( 
	`TiempoId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`Descripcion` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `TiempoId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "Usuario" ----------------------------------
-- DROP TABLE "Usuario" ----------------------------------------
DROP TABLE IF EXISTS `Usuario` CASCADE;
-- -------------------------------------------------------------


-- CREATE TABLE "Usuario" --------------------------------------
CREATE TABLE `Usuario` ( 
	`UsuarioId` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`NombreApellido` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`Tipo` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Tipo de usuario
tecnico
jefe proyecto
',
	`Correo` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `UsuarioId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "Bitacora" ---------------------------------
/*!40000 ALTER TABLE `Bitacora` DISABLE KEYS */

INSERT INTO `Bitacora`(`BitacoraId`,`FechaHora`,`CampanhaId`,`PerfilId`,`UsuarioId`) VALUES ( '1', '2017-07-10 00:00:00', '1', '0', '' );
INSERT INTO `Bitacora`(`BitacoraId`,`FechaHora`,`CampanhaId`,`PerfilId`,`UsuarioId`) VALUES ( '2', '2017-07-10 00:00:00', '1', '1', '' );
/*!40000 ALTER TABLE `Bitacora` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "Perfil" -----------------------------------
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */

INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '0', NULL, 'desc-med-perf-0', '1' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '1', NULL, 'desc-med-perf-1', '1' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '2', NULL, 'desc-med-perf-2', '1' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '3', NULL, 'desc-med-perf-3', '1' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '4', NULL, 'desc-med-perf-4', '1' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '5', NULL, 'desc-med-perf-5', '1' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '6', NULL, 'desc-med-perf-6', '2' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '7', NULL, 'desc-med-perf-7', '2' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '8', NULL, 'desc-med-perf-8', '2' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '9', NULL, 'desc-med-perf-9', '2' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '10', NULL, 'desc-med-perf-10', '2' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '11', NULL, 'desc-med-perf-11', '3' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '12', NULL, 'desc-med-perf-12', '3' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '13', NULL, 'desc-med-perf-13', '3' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '14', NULL, 'desc-med-perf-14', '4' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '15', NULL, 'desc-med-perf-15', '4' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '16', NULL, 'desc-med-perf-16', '4' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '17', NULL, 'desc-med-perf-17', '13' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '18', NULL, 'desc-med-perf-18', '13' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '19', NULL, 'desc-med-perf-19', '13' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '20', NULL, 'desc-med-perf-20', '14' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '21', NULL, 'desc-med-perf-21', '14' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '22', NULL, 'desc-med-perf-22', '14' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '23', NULL, 'desc-med-perf-23', '15' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '24', NULL, 'desc-med-perf-24', '15' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '25', NULL, 'desc-med-perf-25', '15' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '26', NULL, 'desc-med-perf-26', '16' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '27', NULL, 'desc-med-perf-27', '16' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '28', NULL, 'desc-med-perf-28', '16' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '29', NULL, 'desc-med-perf-29', '5' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '30', NULL, 'desc-med-perf-30', '5' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '31', NULL, 'desc-med-perf-31', '5' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '32', NULL, 'desc-med-perf-32', '6' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '33', NULL, 'desc-med-perf-33', '6' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '34', NULL, 'desc-med-perf-34', '6' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '35', NULL, 'desc-med-perf-35', '7' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '36', NULL, 'desc-med-perf-36', '7' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '37', NULL, 'desc-med-perf-37', '7' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '38', NULL, 'desc-med-perf-38', '8' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '39', NULL, 'desc-med-perf-39', '8' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '40', NULL, 'desc-med-perf-40', '8' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '41', NULL, 'desc-med-perf-41', '9' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '42', NULL, 'desc-med-perf-42', '9' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '43', NULL, 'desc-med-perf-43', '9' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '44', NULL, 'desc-med-perf-44', '10' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '45', NULL, 'desc-med-perf-45', '10' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '46', NULL, 'desc-med-perf-46', '10' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '47', NULL, 'desc-med-perf-47', '11' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '48', NULL, 'desc-med-perf-48', '11' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '49', NULL, 'desc-med-perf-49', '11' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '50', NULL, 'desc-med-perf-50', '12' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '51', NULL, 'desc-med-perf-51', '12' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '52', NULL, 'desc-med-perf-52', '12' );
INSERT INTO `Perfil`(`PerfilId`,`FotoReferencia`,`DescMedicion`,`PlayaId`) VALUES ( '53', NULL, 'desc-med-perf-53', '13' );
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "Campanha" ---------------------------------
/*!40000 ALTER TABLE `Campanha` DISABLE KEYS */

INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '1', '2017-07-09 00:00:00', '1', b'1', '3', '1' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '2', '2017-06-09 00:00:00', '1', b'0', '3', '1' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '3', '2017-05-09 00:00:00', '1', b'0', '3', '1' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '4', '2017-07-09 00:00:00', '1', b'1', '3', '2' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '5', '2017-06-09 00:00:00', '1', b'0', '3', '2' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '6', '2017-07-09 00:00:00', '1', b'1', '3', '3' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '7', '2017-06-09 00:00:00', '1', b'0', '3', '3' );
INSERT INTO `Campanha`(`CampanhaId`,`FechaHora`,`TamanhoMedicion`,`Estado`,`UsuarioId`,`PlayaId`) VALUES ( '8', '2017-05-09 00:00:00', '1', b'0', '3', '3' );
/*!40000 ALTER TABLE `Campanha` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "Ciudad" -----------------------------------
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */

INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '1', 'vina', '1' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '2', 'valparaiso', '1' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '3', 'la serena', '2' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '4', 'coquimbo', '2' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '5', 'rio de janeiro', '8' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '6', 'niterói', '8' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '7', 'salvador ', '9' );
INSERT INTO `Ciudad`(`CiudadId`,`Nombre`,`RegionId`) VALUES ( '8', 'porto seguro', '9' );
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "FotoPlaya" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "IntegranteBitacora" -----------------------
-- ---------------------------------------------------------


-- Dump data of "Marea" ------------------------------------
-- ---------------------------------------------------------


-- Dump data of "Medicion" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "OleajePlaya" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "Pais" -------------------------------------
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */

INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '1', 'chile' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '2', 'argentina' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '3', 'brasil' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '4', 'perú' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '5', 'ecuador' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '6', 'colombia' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '7', 'venezuela' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '8', 'uruguay' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '9', 'panama' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '10', 'costa rica' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '11', 'cuba' );
INSERT INTO `Pais`(`PaisId`,`Nombre`) VALUES ( '12', 'puerto rico' );
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "Playa" ------------------------------------
/*!40000 ALTER TABLE `Playa` DISABLE KEYS */

INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '1', 'la salinas', 'orientacion-playa1', 'descripcion-general-playa1', 'descripcion-tecnica-playa1', NULL, NULL, '1' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '2', 'reñaca', 'orientacion-playa2', 'descripcion-general-playa2', 'descripcion-tecnica-playa2', NULL, NULL, '1' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '3', 'torpeñaca', 'orientacion-playa3', 'descripcion-general-playa3', 'descripcion-tecnica-playa3', NULL, NULL, '2' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '4', 'san mateo beach', 'orientacion-playa4', 'descripcion-general-playa4', 'descripcion-tecnica-playa4', NULL, NULL, '2' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '5', 'icarai', 'orientacion-icarai', 'desc-gral-icarai', 'desc-tec-icarai', NULL, NULL, '6' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '6', 'camboinhas', 'orientacio-camboinhas', 'desc-gral-camboinhas', 'desc-tec-camboinhas', NULL, NULL, '6' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '7', 'ipanema', 'orientacio-ipanema', 'desc-gral-ipanema', 'desc-tec-ipanema', NULL, NULL, '5' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '8', 'copacabana', 'orientacio-copacabana', 'desc-gral-copacabana', 'desc-tec-copacabana', NULL, NULL, '5' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '9', 'stella maris', 'orientacio-stella maris', 'desc-gral-stella maris', 'desc-tec-stella maris', NULL, NULL, '7' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '10', 'porto da barra', 'orientacio-porto da barra', 'desc-gral-porto da barra', 'desc-tec-porto da barra', NULL, NULL, '7' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '11', 'trancoso', 'orientacio-trancoso', 'desc-gral-trancoso', 'desc-tec-trancoso', NULL, NULL, '8' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '12', 'los coqueiros', 'orientacio-los coqueiros', 'desc-gral-los coqueiros', 'desc-tec-los coqueiros', NULL, NULL, '8' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '13', 'peñuelas', 'orientacio-peñuelas', 'desc-gral-peñuelas', 'desc-tec-peñuelas', NULL, NULL, '4' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '14', 'la herradura', 'orientacio-la herradura', 'desc-gral-la herradura', 'desc-tec-la herradura', NULL, NULL, '4' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '15', 'la serena', 'orientacio-la serena', 'desc-gral-la serena', 'desc-tec-la serena', NULL, NULL, '3' );
INSERT INTO `Playa`(`PlayaId`,`Nombre`,`Orientacion`,`DescGeneral`,`DescTecnica`,`FotoSuperior`,`FotoPrincipal`,`CiudadId`) VALUES ( '16', 'cuatro esquinas', 'orientacio-cuatro esquinas', 'desc-gral-cuatro esquinas', 'desc-tec-cuatro esquinas', NULL, NULL, '3' );
/*!40000 ALTER TABLE `Playa` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "Pronostico" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "Region" -----------------------------------
/*!40000 ALTER TABLE `Region` DISABLE KEYS */

INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '1', 'Valparaiso', '1' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '2', 'Coquimbo', '1' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '3', 'Antofagasta', '1' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '4', 'Ar-01', '2' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '5', 'Ar-02', '2' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '6', 'pe-01', '4' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '7', 'pe-02', '4' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '8', 'rio de janeiro', '3' );
INSERT INTO `Region`(`RegionId`,`Nombre`,`PaisId`) VALUES ( '9', 'bahia', '3' );
/*!40000 ALTER TABLE `Region` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "Tiempo" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "Usuario" ----------------------------------
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */

INSERT INTO `Usuario`(`UsuarioId`,`NombreApellido`,`Tipo`,`Correo`) VALUES ( '1', 'claudio araya', 'tecnico', 'claudio.araya@alumnos.uv.cl' );
INSERT INTO `Usuario`(`UsuarioId`,`NombreApellido`,`Tipo`,`Correo`) VALUES ( '2', 'daniel toro', 'tecnico', 'daniel.toro@alumnos.uv.cl' );
INSERT INTO `Usuario`(`UsuarioId`,`NombreApellido`,`Tipo`,`Correo`) VALUES ( '3', 'sebastian rubio', 'jp', 'sebastian.rubio@laumnos.uv.cl' );
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */

-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_BITACORA_SGC_CAMPANHA1_idx" --------
-- CREATE INDEX "fk_SGC_BITACORA_SGC_CAMPANHA1_idx" ------------
CREATE INDEX `fk_SGC_BITACORA_SGC_CAMPANHA1_idx` USING BTREE ON `Bitacora`( `CampanhaId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_BITACORA_SGC_PERFIL1_idx" ----------
-- CREATE INDEX "fk_SGC_BITACORA_SGC_PERFIL1_idx" --------------
CREATE INDEX `fk_SGC_BITACORA_SGC_PERFIL1_idx` USING BTREE ON `Bitacora`( `PerfilId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_PERFIL_SGC_PLAYA1_idx" -------------
-- CREATE INDEX "fk_SGC_PERFIL_SGC_PLAYA1_idx" -----------------
CREATE INDEX `fk_SGC_PERFIL_SGC_PLAYA1_idx` USING BTREE ON `Perfil`( `PlayaId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_CAMPANHA_SGC_USUARIO1_idx" ---------
-- CREATE INDEX "fk_SGC_CAMPANHA_SGC_USUARIO1_idx" -------------
CREATE INDEX `fk_SGC_CAMPANHA_SGC_USUARIO1_idx` USING BTREE ON `Campanha`( `UsuarioId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_SGC_PLAYA_SGC_CAMPANHA" ---------------
-- CREATE INDEX "lnk_SGC_PLAYA_SGC_CAMPANHA" -------------------
CREATE INDEX `lnk_SGC_PLAYA_SGC_CAMPANHA` USING BTREE ON `Campanha`( `PlayaId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_CIUDAD_SGC_REGION1_idx" ------------
-- CREATE INDEX "fk_SGC_CIUDAD_SGC_REGION1_idx" ----------------
CREATE INDEX `fk_SGC_CIUDAD_SGC_REGION1_idx` USING BTREE ON `Ciudad`( `RegionId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_FOTO_PLAYA_SGC_PLAYA1_idx" ---------
-- CREATE INDEX "fk_SGC_FOTO_PLAYA_SGC_PLAYA1_idx" -------------
CREATE INDEX `fk_SGC_FOTO_PLAYA_SGC_PLAYA1_idx` USING BTREE ON `FotoPlaya`( `PlayaId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1_idx" 
-- CREATE INDEX "fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1_idx" 
CREATE INDEX `fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1_idx` USING BTREE ON `IntegranteBitacora`( `BitacoraId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_INTEGRANTES_BITACORA_SGC_USUARIO1_idx" 
-- CREATE INDEX "fk_SGC_INTEGRANTES_BITACORA_SGC_USUARIO1_idx" -
CREATE INDEX `fk_SGC_INTEGRANTES_BITACORA_SGC_USUARIO1_idx` USING BTREE ON `IntegranteBitacora`( `UsuarioId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_MAREA_SGC_CIUDAD1_idx" -------------
-- CREATE INDEX "fk_SGC_MAREA_SGC_CIUDAD1_idx" -----------------
CREATE INDEX `fk_SGC_MAREA_SGC_CIUDAD1_idx` USING BTREE ON `Marea`( `CiudadId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_MEDICION_SGC_BITACORA1_idx" --------
-- CREATE INDEX "fk_SGC_MEDICION_SGC_BITACORA1_idx" ------------
CREATE INDEX `fk_SGC_MEDICION_SGC_BITACORA1_idx` USING BTREE ON `Medicion`( `BitacoraId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1_idx" -------
-- CREATE INDEX "fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1_idx" -----------
CREATE INDEX `fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1_idx` USING BTREE ON `OleajePlaya`( `PlayaId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_PLAYA_SGC_CIUDAD1_idx" -------------
-- CREATE INDEX "fk_SGC_PLAYA_SGC_CIUDAD1_idx" -----------------
CREATE INDEX `fk_SGC_PLAYA_SGC_CIUDAD1_idx` USING BTREE ON `Playa`( `CiudadId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1_idx" -
-- CREATE INDEX "fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1_idx" -----
CREATE INDEX `fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1_idx` USING BTREE ON `Pronostico`( `CiudadId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1_idx" -
-- CREATE INDEX "fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1_idx" -----
CREATE INDEX `fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1_idx` USING BTREE ON `Pronostico`( `TiempoId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_SGC_REGION_SGC_PAIS_idx" ---------------
-- CREATE INDEX "fk_SGC_REGION_SGC_PAIS_idx" -------------------
CREATE INDEX `fk_SGC_REGION_SGC_PAIS_idx` USING BTREE ON `Region`( `PaisId` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_BITACORA_SGC_CAMPANHA1" -------------
-- DROP LINK "fk_SGC_BITACORA_SGC_CAMPANHA1" -------------------
ALTER TABLE `Bitacora` DROP FOREIGN KEY `fk_SGC_BITACORA_SGC_CAMPANHA1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_BITACORA_SGC_CAMPANHA1" -----------------
ALTER TABLE `Bitacora`
	ADD CONSTRAINT `fk_SGC_BITACORA_SGC_CAMPANHA1` FOREIGN KEY ( `SGC_CAMPANHA_CAMP_ID` )
	REFERENCES `Campanha`( `CAMP_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_BITACORA_SGC_PERFIL1" ---------------
-- DROP LINK "fk_SGC_BITACORA_SGC_PERFIL1" ---------------------
ALTER TABLE `Bitacora` DROP FOREIGN KEY `fk_SGC_BITACORA_SGC_PERFIL1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_BITACORA_SGC_PERFIL1" -------------------
ALTER TABLE `Bitacora`
	ADD CONSTRAINT `fk_SGC_BITACORA_SGC_PERFIL1` FOREIGN KEY ( `SGC_PERFIL_PERF_NUMERO` )
	REFERENCES `Perfil`( `PERF_NUMERO` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_SGC_PLAYA_SGC_CAMPANHA" ----------------
-- DROP LINK "lnk_SGC_PLAYA_SGC_CAMPANHA" ----------------------
ALTER TABLE `Campanha` DROP FOREIGN KEY `lnk_SGC_PLAYA_SGC_CAMPANHA`;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_SGC_PLAYA_SGC_CAMPANHA" --------------------
ALTER TABLE `Campanha`
	ADD CONSTRAINT `lnk_SGC_PLAYA_SGC_CAMPANHA` FOREIGN KEY ( `SGC_PLAYA_PLA_ID` )
	REFERENCES `Playa`( `PLA_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_SGC_USUARIO_SGC_CAMPANHA" --------------
-- DROP LINK "lnk_SGC_USUARIO_SGC_CAMPANHA" --------------------
ALTER TABLE `Campanha` DROP FOREIGN KEY `lnk_SGC_USUARIO_SGC_CAMPANHA`;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_SGC_USUARIO_SGC_CAMPANHA" ------------------
ALTER TABLE `Campanha`
	ADD CONSTRAINT `lnk_SGC_USUARIO_SGC_CAMPANHA` FOREIGN KEY ( `SGC_USUARIO_USR_ID` )
	REFERENCES `Usuario`( `USR_ID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_CIUDAD_SGC_REGION1" -----------------
-- DROP LINK "fk_SGC_CIUDAD_SGC_REGION1" -----------------------
ALTER TABLE `Ciudad` DROP FOREIGN KEY `fk_SGC_CIUDAD_SGC_REGION1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_CIUDAD_SGC_REGION1" ---------------------
ALTER TABLE `Ciudad`
	ADD CONSTRAINT `fk_SGC_CIUDAD_SGC_REGION1` FOREIGN KEY ( `SGC_REGION_REG_ID` )
	REFERENCES `Region`( `REG_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_FOTO_PLAYA_SGC_PLAYA1" --------------
-- DROP LINK "fk_SGC_FOTO_PLAYA_SGC_PLAYA1" --------------------
ALTER TABLE `FotoPlaya` DROP FOREIGN KEY `fk_SGC_FOTO_PLAYA_SGC_PLAYA1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_FOTO_PLAYA_SGC_PLAYA1" ------------------
ALTER TABLE `FotoPlaya`
	ADD CONSTRAINT `fk_SGC_FOTO_PLAYA_SGC_PLAYA1` FOREIGN KEY ( `SGC_PLAYA_PLA_ID` )
	REFERENCES `Playa`( `PLA_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1" -
-- DROP LINK "fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1" -------
ALTER TABLE `IntegranteBitacora` DROP FOREIGN KEY `fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1" -----
ALTER TABLE `IntegranteBitacora`
	ADD CONSTRAINT `fk_SGC_INTEGRANTES_BITACORA_SGC_BITACORA1` FOREIGN KEY ( `BIT_ID` )
	REFERENCES `Bitacora`( `BIT_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_MAREA_SGC_CIUDAD1" ------------------
-- DROP LINK "fk_SGC_MAREA_SGC_CIUDAD1" ------------------------
ALTER TABLE `Marea` DROP FOREIGN KEY `fk_SGC_MAREA_SGC_CIUDAD1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_MAREA_SGC_CIUDAD1" ----------------------
ALTER TABLE `Marea`
	ADD CONSTRAINT `fk_SGC_MAREA_SGC_CIUDAD1` FOREIGN KEY ( `SGC_CIUDAD_CIU_ID` )
	REFERENCES `Ciudad`( `CIU_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_MEDICION_SGC_BITACORA1" -------------
-- DROP LINK "fk_SGC_MEDICION_SGC_BITACORA1" -------------------
ALTER TABLE `Medicion` DROP FOREIGN KEY `fk_SGC_MEDICION_SGC_BITACORA1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_MEDICION_SGC_BITACORA1" -----------------
ALTER TABLE `Medicion`
	ADD CONSTRAINT `fk_SGC_MEDICION_SGC_BITACORA1` FOREIGN KEY ( `SGC_BITACORA_BIT_ID` )
	REFERENCES `Bitacora`( `BIT_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1" ------------
-- DROP LINK "fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1" ------------------
ALTER TABLE `OleajePlaya` DROP FOREIGN KEY `fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1" ----------------
ALTER TABLE `OleajePlaya`
	ADD CONSTRAINT `fk_SGC_OLEAJE_PLAYA_SGC_PLAYA1` FOREIGN KEY ( `SGC_PLAYA_PLA_ID` )
	REFERENCES `Playa`( `PLA_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_PERFIL_SGC_PLAYA1" ------------------
-- DROP LINK "fk_SGC_PERFIL_SGC_PLAYA1" ------------------------
ALTER TABLE `Perfil` DROP FOREIGN KEY `fk_SGC_PERFIL_SGC_PLAYA1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_PERFIL_SGC_PLAYA1" ----------------------
ALTER TABLE `Perfil`
	ADD CONSTRAINT `fk_SGC_PERFIL_SGC_PLAYA1` FOREIGN KEY ( `SGC_PLAYA_PLA_ID` )
	REFERENCES `Playa`( `PLA_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_PLAYA_SGC_CIUDAD1" ------------------
-- DROP LINK "fk_SGC_PLAYA_SGC_CIUDAD1" ------------------------
ALTER TABLE `Playa` DROP FOREIGN KEY `fk_SGC_PLAYA_SGC_CIUDAD1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_PLAYA_SGC_CIUDAD1" ----------------------
ALTER TABLE `Playa`
	ADD CONSTRAINT `fk_SGC_PLAYA_SGC_CIUDAD1` FOREIGN KEY ( `SGC_CIUDAD_CIU_ID` )
	REFERENCES `Ciudad`( `CIU_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1" ------
-- DROP LINK "fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1" ------------
ALTER TABLE `Pronostico` DROP FOREIGN KEY `fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1" ----------
ALTER TABLE `Pronostico`
	ADD CONSTRAINT `fk_SGC_PRONOSTICO_TIEMPO_SGC_CIUDAD1` FOREIGN KEY ( `SGC_CIUDAD_CIU_ID` )
	REFERENCES `Ciudad`( `CIU_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1" ------
-- DROP LINK "fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1" ------------
ALTER TABLE `Pronostico` DROP FOREIGN KEY `fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1" ----------
ALTER TABLE `Pronostico`
	ADD CONSTRAINT `fk_SGC_PRONOSTICO_TIEMPO_SGC_TIEMPO1` FOREIGN KEY ( `SGC_TIEMPO_TIE_ID` )
	REFERENCES `Tiempo`( `TIE_ID` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_SGC_REGION_SGC_PAIS" --------------------
-- DROP LINK "fk_SGC_REGION_SGC_PAIS" --------------------------
ALTER TABLE `Region` DROP FOREIGN KEY `fk_SGC_REGION_SGC_PAIS`;
-- -------------------------------------------------------------


-- CREATE LINK "fk_SGC_REGION_SGC_PAIS" ------------------------
ALTER TABLE `Region`
	ADD CONSTRAINT `fk_SGC_REGION_SGC_PAIS` FOREIGN KEY ( `SGC_PAIS_PAI_ID` )
	REFERENCES `Pais`( `PAI_ID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


