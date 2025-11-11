-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: Practico4
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `numero_cliente` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`numero_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,20345678,'Pérez','Carlos'),(2,21456789,'Gómez','Ana'),(3,22567890,'Torres','Luis'),(4,23678901,'Fernández','Carla'),(5,24789012,'Ramos','Sofía'),(6,25890123,'Alvarez','Diego'),(7,26901234,'Martínez','Lucía'),(8,27912345,'García','Mariano');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuentas`
--

DROP TABLE IF EXISTS `Cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cuentas` (
  `numero_cuenta` int NOT NULL AUTO_INCREMENT,
  `saldo` decimal(10,2) NOT NULL,
  `numero_cliente` int NOT NULL,
  `beneficio_otorgado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`numero_cuenta`),
  KEY `numero_cliente` (`numero_cliente`),
  CONSTRAINT `Cuentas_ibfk_1` FOREIGN KEY (`numero_cliente`) REFERENCES `Clientes` (`numero_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuentas`
--

LOCK TABLES `Cuentas` WRITE;
/*!40000 ALTER TABLE `Cuentas` DISABLE KEYS */;
INSERT INTO `Cuentas` VALUES (1001,1500.00,1,0),(1002,191827.32,2,1),(1003,184416.00,3,1),(1004,5000.00,4,0),(1005,2500.00,5,0),(1006,183804.00,6,1),(1007,950.00,7,0),(1008,4000.00,8,0),(1009,700.00,1,0),(1010,1500.00,5,0);
/*!40000 ALTER TABLE `Cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Historial_movimientos`
--

DROP TABLE IF EXISTS `Historial_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Historial_movimientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saldo_anterior` decimal(10,2) NOT NULL,
  `saldo_actual` decimal(10,2) NOT NULL,
  `numero_cuenta` int NOT NULL,
  `numero_movimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numero_cuenta` (`numero_cuenta`),
  KEY `numero_movimiento` (`numero_movimiento`),
  CONSTRAINT `Historial_movimientos_ibfk_1` FOREIGN KEY (`numero_cuenta`) REFERENCES `Cuentas` (`numero_cuenta`),
  CONSTRAINT `Historial_movimientos_ibfk_2` FOREIGN KEY (`numero_movimiento`) REFERENCES `Movimientos` (`numero_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Historial_movimientos`
--

LOCK TABLES `Historial_movimientos` WRITE;
/*!40000 ALTER TABLE `Historial_movimientos` DISABLE KEYS */;
INSERT INTO `Historial_movimientos` VALUES (1,1500.00,2000.00,1001,1),(2,2000.00,1800.00,1001,2),(3,3200.00,4200.00,1002,3),(4,800.00,700.00,1003,4),(5,5000.00,6500.00,1004,5),(6,6500.00,6200.00,1004,6),(7,2500.00,3200.00,1005,7),(8,1200.00,1100.00,1006,8),(9,950.00,1200.00,1007,9),(10,4000.00,3500.00,1008,10),(11,700.00,900.00,1009,11),(12,1500.00,1350.00,1010,12),(13,4200.00,3800.00,1002,13),(14,3200.00,3500.00,1005,14),(15,3500.00,4100.00,1008,15),(16,3800.00,4800.00,1002,16),(17,4800.00,3900.00,1002,17),(18,1800.00,2300.00,1001,18),(19,2300.00,2100.00,1001,19),(20,3900.00,4900.00,1002,20),(21,700.00,600.00,1003,21),(22,6200.00,7700.00,1004,22),(23,7700.00,7400.00,1004,23),(24,3500.00,4200.00,1005,24),(25,1100.00,1000.00,1006,25),(26,1200.00,1450.00,1007,26),(27,4100.00,3600.00,1008,27),(28,900.00,1100.00,1009,28),(29,1350.00,1200.00,1010,29),(30,4900.00,4500.00,1002,30),(31,4200.00,4500.00,1005,31),(32,3600.00,4200.00,1008,32),(33,4500.00,7500.00,1002,33),(34,7500.00,6500.00,1002,34),(35,3666.00,2666.00,1002,40),(36,2666.00,4466.00,1002,41),(37,4466.00,6266.00,1002,42),(38,6266.00,8066.00,1002,43),(39,1200.00,200.00,1006,44),(40,8066.00,188066.00,1002,45),(41,200.00,180200.00,1006,46),(42,800.00,180800.00,1003,47);
/*!40000 ALTER TABLE `Historial_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movimientos`
--

DROP TABLE IF EXISTS `Movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movimientos` (
  `numero_movimiento` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `tipo` enum('CREDITO','DEBITO') NOT NULL,
  `numero_cuenta` int NOT NULL,
  PRIMARY KEY (`numero_movimiento`),
  KEY `numero_cuenta` (`numero_cuenta`),
  CONSTRAINT `Movimientos_ibfk_1` FOREIGN KEY (`numero_cuenta`) REFERENCES `Cuentas` (`numero_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movimientos`
--

LOCK TABLES `Movimientos` WRITE;
/*!40000 ALTER TABLE `Movimientos` DISABLE KEYS */;
INSERT INTO `Movimientos` VALUES (1,'2025-01-05',500.00,'CREDITO',1001),(2,'2025-01-10',200.00,'DEBITO',1001),(3,'2025-01-12',1000.00,'CREDITO',1002),(4,'2025-01-15',100.00,'DEBITO',1003),(5,'2025-02-01',1500.00,'CREDITO',1004),(6,'2025-02-10',300.00,'DEBITO',1004),(7,'2025-02-05',700.00,'CREDITO',1005),(8,'2025-02-15',100.00,'DEBITO',1006),(9,'2025-03-01',250.00,'CREDITO',1007),(10,'2025-03-02',500.00,'DEBITO',1008),(11,'2025-03-10',200.00,'CREDITO',1009),(12,'2025-03-12',150.00,'DEBITO',1010),(13,'2025-03-15',400.00,'DEBITO',1002),(14,'2025-03-16',300.00,'CREDITO',1005),(15,'2025-10-20',600.00,'CREDITO',1008),(16,'2025-10-21',1000.00,'CREDITO',1002),(17,'2025-10-21',900.00,'DEBITO',1002),(18,'2025-10-05',500.00,'CREDITO',1001),(19,'2025-10-10',200.00,'DEBITO',1001),(20,'2025-10-12',1000.00,'CREDITO',1002),(21,'2025-10-15',100.00,'DEBITO',1003),(22,'2025-10-01',1500.00,'CREDITO',1004),(23,'2025-10-10',300.00,'DEBITO',1004),(24,'2025-10-05',700.00,'CREDITO',1005),(25,'2025-10-15',100.00,'DEBITO',1006),(26,'2025-10-01',250.00,'CREDITO',1007),(27,'2025-10-02',500.00,'DEBITO',1008),(28,'2025-10-10',200.00,'CREDITO',1009),(29,'2025-10-12',150.00,'DEBITO',1010),(30,'2025-10-15',400.00,'DEBITO',1002),(31,'2025-10-16',300.00,'CREDITO',1005),(32,'2025-10-20',600.00,'CREDITO',1008),(33,'2025-10-21',3000.00,'CREDITO',1002),(34,'2025-10-21',1000.00,'DEBITO',1002),(37,'2025-11-11',1800.00,'CREDITO',1002),(38,'2025-11-11',1800.00,'CREDITO',1002),(39,'2025-11-11',4566.00,'DEBITO',1002),(40,'2025-11-11',1000.00,'DEBITO',1002),(41,'2025-11-11',1800.00,'CREDITO',1002),(42,'2025-11-11',1800.00,'CREDITO',1002),(43,'2025-11-11',1800.00,'CREDITO',1002),(44,'2025-11-11',1000.00,'DEBITO',1006),(45,'2025-11-11',180000.00,'CREDITO',1002),(46,'2025-11-11',180000.00,'CREDITO',1006),(47,'2025-11-11',180000.00,'CREDITO',1003);
/*!40000 ALTER TABLE `Movimientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `actualizar_saldo` AFTER INSERT ON `Movimientos` FOR EACH ROW begin
    declare saldo_anterior decimal(10,2);
    declare saldo_nuevo decimal(10,2);

    select saldo
    into saldo_anterior
    from Cuentas
    where numero_cuenta = new.numero_cuenta;

    if new.tipo = 'CREDITO' then
        set saldo_nuevo = saldo_anterior + new.importe;
    elseif new.tipo = 'DEBITO' then
        set saldo_nuevo = saldo_anterior - new.importe;
    end if;

    UPDATE Cuentas
    SET saldo = saldo_nuevo
    WHERE numero_cuenta = NEW.numero_cuenta;

    INSERT INTO Historial_movimientos (saldo_anterior, saldo_actual, numero_cuenta, numero_movimiento)
    VALUES (saldo_anterior, saldo_nuevo, NEW.numero_cuenta, NEW.numero_movimiento);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'Practico4'
--
/*!50003 DROP PROCEDURE IF EXISTS `AplicarInteresCursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `AplicarInteresCursor`(
    IN p_porcentaje DECIMAL(5,2),
    IN p_saldo_minimo DECIMAL(10,2)
)
BEGIN
    DECLARE v_numero_cuenta INT;
    DECLARE v_saldo DECIMAL(10,2);
    DECLARE v_otorgado BOOLEAN;
    DECLARE fin BOOLEAN DEFAULT FALSE;
    DECLARE cuentas_afectadas INT DEFAULT 0;

    DECLARE cur_cuentas CURSOR FOR
        SELECT numero_cuenta, saldo, beneficio_otorgado
        FROM Cuentas
        WHERE saldo > p_saldo_minimo;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    OPEN cur_cuentas;

    lectura: LOOP
        FETCH cur_cuentas INTO v_numero_cuenta, v_saldo, v_otorgado;
        IF fin THEN
            LEAVE lectura;
        END IF;

        IF v_otorgado = FALSE THEN
            UPDATE Cuentas
            SET saldo = v_saldo + (v_saldo * (p_porcentaje / 100)),
                beneficio_otorgado = TRUE
            WHERE numero_cuenta = v_numero_cuenta;

            SET cuentas_afectadas = cuentas_afectadas + 1;
        END IF;
    END LOOP lectura;

    CLOSE cur_cuentas;

    SELECT cuentas_afectadas AS cuentas_bonificadas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CuentasConSaldoMayorQue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `CuentasConSaldoMayorQue`(IN limite
DECIMAL(10,2))
BEGIN
 SELECT numero_cuenta, saldo from Cuentas where saldo > limite;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Depositar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `Depositar`(IN cuenta int, in monto decimal(10,2))
BEGIN
	INSERT INTO Movimientos (numero_cuenta, tipo, importe, fecha)
    VALUES (cuenta, 'CREDITO', monto, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Extraer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `Extraer`(IN cuenta int, in monto decimal(10,2))
BEGIN
DECLARE saldo_actual DECIMAL(10,2);
SELECT saldo
    INTO saldo_actual
		FROM Cuentas
		WHERE numero_cuenta = cuenta;
IF saldo_actual >= monto THEN
	INSERT INTO Movimientos (numero_cuenta, tipo, importe, fecha)
        VALUES (cuenta, 'DEBITO', monto, CURDATE());
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Saldo insuficiente para realizar la extracción';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalMovimientosDelMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `TotalMovimientosDelMes`(IN cuenta int, out total DECIMAL(10,2))
BEGIN
 SELECT IFNULL(SUM(
 Case 
  When tipo = 'CREDITO' then importe
  When tipo = 'DEBITO' then -importe
  Else 0
  end
  ),0) as TotalDelMes
 from Movimientos
 where numero_cuenta = cuenta
 AND MONTH(fecha) = MONTH(CURDATE())
 AND YEAR(fecha) = YEAR(CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalMovimientosDelMesCursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `TotalMovimientosDelMesCursor`(
    IN p_cuenta INT,
    OUT p_total DECIMAL(10,2)
)
BEGIN

DECLARE v_importe DECIMAL(10,2);
DECLARE v_tipo ENUM('CREDITO', 'DEBITO');
DECLARE fin BOOLEAN DEFAULT FALSE;

DECLARE cursor_movimiento CURSOR FOR
        SELECT importe, tipo
        FROM Movimientos
        WHERE numero_cuenta = p_cuenta
          AND MONTH(fecha) = MONTH(CURDATE())
          AND YEAR(fecha) = YEAR(CURDATE());

DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    SET p_total = 0;
    OPEN cursor_movimiento;

    lectura: LOOP
        FETCH cursor_movimiento INTO v_importe, v_tipo;
        IF fin THEN
            LEAVE lectura;
        END IF;

        IF v_tipo = 'CREDITO' THEN
            SET p_total = p_total + v_importe;
        ELSEIF v_tipo = 'DEBITO' THEN
            SET p_total = p_total - v_importe;
        END IF;
    END LOOP lectura;

    CLOSE cursor_movimiento;

    SELECT p_total AS TotalDelMesActual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VerCuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `VerCuentas`()
BEGIN
 SELECT numero_cuenta, saldo from Cuentas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-11  3:03:05
