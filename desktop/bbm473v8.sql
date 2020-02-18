CREATE DATABASE  IF NOT EXISTS `bbm473v8` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bbm473v8`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: bbm473v8
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bread`
--

DROP TABLE IF EXISTS `bread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bread` (
  `ID` int(10) unsigned NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `bread_ID_fk` FOREIGN KEY (`ID`) REFERENCES `items` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bread`
--

LOCK TABLES `bread` WRITE;
/*!40000 ALTER TABLE `bread` DISABLE KEYS */;
INSERT INTO `bread` VALUES (16,'White'),(18,'Sesame');
/*!40000 ALTER TABLE `bread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `chief_of_the_month`
--

DROP TABLE IF EXISTS `chief_of_the_month`;
/*!50001 DROP VIEW IF EXISTS `chief_of_the_month`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chief_of_the_month` AS SELECT 
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dinner_of_the_month`
--

DROP TABLE IF EXISTS `dinner_of_the_month`;
/*!50001 DROP VIEW IF EXISTS `dinner_of_the_month`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dinner_of_the_month` AS SELECT 
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dinners`
--

DROP TABLE IF EXISTS `dinners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinners` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Meat_ID` int(10) unsigned NOT NULL,
  `Bread_ID` int(10) unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Meat_Count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dinners_ID_index` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinners`
--

LOCK TABLES `dinners` WRITE;
/*!40000 ALTER TABLE `dinners` DISABLE KEYS */;
INSERT INTO `dinners` VALUES (1,11,16,'Hot-Dog',1),(2,11,16,'Double Hot-Dog',2),(3,12,15,'Beef Burger',1),(4,12,15,'Double Beef Burger',2),(5,12,15,'Triple Beef Burger',3),(6,13,18,'Chicken Burger',1),(7,13,18,'Double Chicken Burger',2),(8,13,18,'Triple Chicken Burger',3),(9,14,15,'Fish Burger',1),(10,14,15,'Double Fish Burger',2);
/*!40000 ALTER TABLE `dinners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinners_chief`
--

DROP TABLE IF EXISTS `dinners_chief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinners_chief` (
  `Dinners_ID` int(10) unsigned NOT NULL,
  `Users_Chief_ID` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL,
  `Status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`Dinners_ID`,`Users_Chief_ID`,`Date`),
  KEY `dinners_chief_Dinners_ID_fk_idx` (`Dinners_ID`),
  KEY `dinners_chief_Users_Chief_ID_fk` (`Users_Chief_ID`),
  CONSTRAINT `dinners_chief_Dinners_ID_fk` FOREIGN KEY (`Dinners_ID`) REFERENCES `dinners` (`ID`),
  CONSTRAINT `dinners_chief_Users_Chief_ID_fk` FOREIGN KEY (`Users_Chief_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinners_chief`
--

LOCK TABLES `dinners_chief` WRITE;
/*!40000 ALTER TABLE `dinners_chief` DISABLE KEYS */;
INSERT INTO `dinners_chief` VALUES (1,3,'2020-01-08 22:08:32',0),(1,3,'2020-01-08 22:11:03',0),(1,3,'2020-01-08 22:12:24',0),(1,3,'2020-01-08 22:13:02',0),(1,3,'2020-01-08 22:13:41',0),(1,3,'2020-01-08 22:15:00',0),(1,3,'2020-01-08 22:21:15',0),(1,3,'2020-01-08 22:23:43',0),(1,3,'2020-01-08 22:24:44',0),(1,3,'2020-01-08 23:12:21',0),(1,3,'2020-01-09 10:03:30',0),(1,3,'2020-01-09 10:10:41',0),(1,3,'2020-01-09 10:10:54',0),(1,3,'2020-01-09 10:12:34',0),(1,3,'2020-01-09 10:18:46',0),(1,3,'2020-01-09 10:21:25',0),(1,3,'2020-01-09 10:23:16',0),(1,3,'2020-01-09 10:36:21',0),(1,3,'2020-01-09 10:38:10',0),(1,3,'2020-01-09 10:38:45',0),(1,3,'2020-01-09 10:40:15',0),(1,3,'2020-01-09 10:40:29',0),(1,3,'2020-01-09 10:41:39',0),(1,3,'2020-01-09 10:44:51',0),(1,3,'2020-01-09 10:47:10',0),(1,3,'2020-01-09 10:48:12',0),(1,3,'2020-01-09 11:11:05',0),(1,3,'2020-01-09 16:33:53',0),(1,3,'2020-01-09 16:44:24',0),(1,3,'2020-01-09 23:13:12',0),(1,3,'2020-01-09 23:14:24',0),(1,5,'2020-01-09 10:25:58',0),(2,3,'2020-01-09 10:36:21',0),(2,3,'2020-01-09 10:49:32',0),(2,3,'2020-01-09 16:33:53',0),(2,3,'2020-01-09 16:44:24',0),(2,3,'2020-01-09 23:14:24',0),(3,3,'2020-01-08 22:03:26',0),(4,3,'2020-01-08 22:09:24',0),(10,3,'2020-01-08 22:09:24',0);
/*!40000 ALTER TABLE `dinners_chief` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinnertable`
--

DROP TABLE IF EXISTS `dinnertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinnertable` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DinnerTable_Number` int(10) unsigned NOT NULL,
  `Bill_Total` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dinnertable_ID_index` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinnertable`
--

LOCK TABLES `dinnertable` WRITE;
/*!40000 ALTER TABLE `dinnertable` DISABLE KEYS */;
INSERT INTO `dinnertable` VALUES (1,1,45),(2,2,0),(3,3,0),(4,4,40),(5,5,35),(6,6,0),(7,7,0),(8,8,0),(9,9,0),(10,10,0);
/*!40000 ALTER TABLE `dinnertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinnertable_orders`
--

DROP TABLE IF EXISTS `dinnertable_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinnertable_orders` (
  `DinnerTable_ID` int(10) unsigned NOT NULL,
  `Orders_ID` int(10) unsigned NOT NULL,
  `DinnerTable_Number` int(10) unsigned NOT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`DinnerTable_ID`,`Orders_ID`),
  KEY `dinnertable_orders_Orders_ID_fk_idx` (`Orders_ID`),
  CONSTRAINT `dinnertable_orders_Orders_ID_fk` FOREIGN KEY (`Orders_ID`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinnertable_orders`
--

LOCK TABLES `dinnertable_orders` WRITE;
/*!40000 ALTER TABLE `dinnertable_orders` DISABLE KEYS */;
INSERT INTO `dinnertable_orders` VALUES (1,55,1,'2020-01-09 23:14:24'),(2,25,2,'2020-01-08 22:13:41'),(3,19,3,'2020-01-08 22:08:32'),(3,24,3,'2020-01-08 22:13:02'),(3,27,3,'2020-01-08 22:21:15'),(3,33,3,'2020-01-09 10:10:41'),(3,34,3,'2020-01-09 10:10:54'),(4,18,4,'2020-01-08 22:05:16'),(4,23,4,'2020-01-08 22:12:24'),(4,28,4,'2020-01-08 22:23:43'),(4,32,4,'2020-01-09 10:03:30'),(4,36,4,'2020-01-09 10:12:34'),(5,20,5,'2020-01-08 22:09:24'),(5,22,5,'2020-01-08 22:11:03'),(5,29,5,'2020-01-08 22:24:44'),(5,31,5,'2020-01-08 23:12:21'),(5,39,5,'2020-01-09 10:23:16'),(5,53,5,'2020-01-09 16:44:24'),(10,26,10,'2020-01-08 22:15:00');
/*!40000 ALTER TABLE `dinnertable_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dinnertable_orders_AFTER_INSERT` AFTER INSERT ON `dinnertable_orders` FOR EACH ROW BEGIN
	DECLARE myVar INT;
    SELECT Cost into myVar from orders where NEW.Orders_ID = orders.ID;
    
	UPDATE dinnertable
	SET Bill_Total = Bill_Total + myVar
	WHERE ID = NEW.DinnerTable_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dinnertable_orders_BEFORE_DELETE` BEFORE DELETE ON `dinnertable_orders` FOR EACH ROW BEGIN
	DELETE FROM Orders_Waiter WHERE Orders_ID = OLD.Orders_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dinnertable_orders_AFTER_DELETE` AFTER DELETE ON `dinnertable_orders` FOR EACH ROW BEGIN
	DECLARE myVar INT;
    SELECT Cost into myVar from orders where OLD.Orders_ID = orders.ID;
    
	UPDATE dinnertable
	SET Bill_Total = Bill_Total - myVar
	WHERE ID = OLD.DinnerTable_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `drink`
--

DROP TABLE IF EXISTS `drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drink` (
  `ID` int(10) unsigned NOT NULL,
  `Brand` varchar(45) NOT NULL,
  `Size` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `drink_ID_fk` FOREIGN KEY (`ID`) REFERENCES `items` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drink`
--

LOCK TABLES `drink` WRITE;
/*!40000 ALTER TABLE `drink` DISABLE KEYS */;
INSERT INTO `drink` VALUES (1,'cocacola',330),(2,'cocacola',330),(3,'cocacola',1000),(4,'pepsi',330),(5,'pepsi',330),(6,'pepsi',1000),(7,'sprite',330),(8,'fanta',330),(9,'cappy',330),(10,'erikli',500);
/*!40000 ALTER TABLE `drink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Count` int(10) unsigned NOT NULL,
  `Expirty_Date` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `items_ID_index` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Coca-Cola (33cl.)',100,'2020-12-30 23:59:59'),(2,'Coca-Cola Light (33cl.)',100,'2020-12-30 23:59:59'),(3,'Coca-Cola (1lt.)',1,'2020-12-30 23:59:59'),(4,'Fuse Tea (33cl.)',10,'2020-12-30 23:59:59'),(5,'Pepsi (33cl.)',100,'2020-12-30 23:59:59'),(6,'Pepsi (1lt.)',100,'2020-12-30 23:59:59'),(7,'Sprite (33cl.)',10,'2020-12-30 23:59:59'),(8,'Fanta (33 cl.)',10,'2020-12-30 23:59:59'),(9,'Cappy (33cl.)',10,'2020-12-30 23:59:59'),(10,'Water (50cl.)',100,'2020-12-30 23:59:59'),(11,'sausage',100,'2020-12-30 23:59:59'),(12,'beef patties',100,'2020-12-30 23:59:59'),(13,'chicken patties',100,'2020-12-30 23:59:59'),(14,'fish patties',100,'2020-12-30 23:59:59'),(15,'Hamburger bread',100,'2020-01-31 23:59:59'),(16,'Hot-Dog bread',100,'2020-01-31 23:59:59'),(18,'Hamburger bread (Sesame)',100,'2020-01-31 23:59:59');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meat`
--

DROP TABLE IF EXISTS `meat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meat` (
  `ID` int(10) unsigned NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `meat_ID_fk` FOREIGN KEY (`ID`) REFERENCES `items` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meat`
--

LOCK TABLES `meat` WRITE;
/*!40000 ALTER TABLE `meat` DISABLE KEYS */;
INSERT INTO `meat` VALUES (11,'sausage'),(12,'patty'),(13,'patty'),(14,'patty');
/*!40000 ALTER TABLE `meat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Drink_ID` int(10) unsigned NOT NULL,
  `Dinners_ID` int(10) unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Cost` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,1,'Hot-Dog & Coca-Cola Menu',10),(2,1,2,'Double Hot-Dog & Coca-Cola Menu',15),(3,1,1,'Beef Burger & Coca-Cola Menu',20),(4,1,1,'Double Beef Burger & Coca-Cola Menu',25),(5,1,1,'Triple Beef Burger & Coca-Cola Menu',30),(6,1,1,'Chicken Burger & Coca-Cola Menu',5),(7,1,1,'Double Chicken Burger & Coca-Cola Menu',8),(8,1,1,'Triple Chicken Burger & Coca-Cola Menu',11),(9,1,1,'Fish Burger & Coca-Cola Menu',15),(10,1,1,'Double Fish Burger & Coca-Cola Menu',20);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `number_of_employees`
--

DROP TABLE IF EXISTS `number_of_employees`;
/*!50001 DROP VIEW IF EXISTS `number_of_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number_of_employees` AS SELECT 
 1 AS `COUNT(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Cost` int(10) unsigned NOT NULL,
  `Status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `orders_ID_index` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,0),(2,0,0),(3,0,0),(4,0,0),(5,0,0),(6,0,0),(7,0,0),(8,0,0),(9,0,0),(10,0,0),(11,0,0),(12,0,0),(13,0,0),(14,0,0),(15,0,0),(16,0,0),(17,0,0),(18,0,0),(19,0,0),(20,0,0),(21,0,0),(22,0,0),(23,0,0),(24,0,0),(25,0,0),(26,0,0),(27,0,0),(28,0,0),(29,0,0),(30,0,0),(31,0,0),(32,0,0),(33,0,0),(34,0,0),(35,0,0),(36,40,0),(37,10,0),(38,25,0),(39,10,0),(40,65,0),(41,45,0),(42,45,0),(43,45,0),(44,40,0),(45,30,0),(46,45,0),(48,45,0),(53,25,0),(55,45,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_menu`
--

DROP TABLE IF EXISTS `orders_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_menu` (
  `Order_Number` int(11) NOT NULL AUTO_INCREMENT,
  `Orders_ID` int(10) unsigned NOT NULL,
  `Menu_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Order_Number`,`Orders_ID`,`Menu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_menu`
--

LOCK TABLES `orders_menu` WRITE;
/*!40000 ALTER TABLE `orders_menu` DISABLE KEYS */;
INSERT INTO `orders_menu` VALUES (3,0,0),(4,14,3),(5,14,3),(6,15,3),(7,15,8),(8,16,2),(9,16,9),(10,17,3),(11,17,10),(12,18,3),(13,18,10),(14,19,4),(15,19,9),(16,20,4),(17,20,10),(18,21,3),(19,21,9),(20,22,1),(21,23,3),(22,24,5),(23,25,4),(24,25,4),(25,26,4),(26,26,9),(27,26,10),(28,27,1),(29,28,1),(30,28,10),(31,29,4),(32,29,9),(33,31,8),(34,31,7),(35,32,10),(36,33,4),(37,33,5),(38,34,5),(39,34,9),(42,36,3),(43,36,10),(44,37,1),(45,38,4),(46,39,1),(47,40,3),(48,40,10),(49,40,9),(50,40,1),(51,41,5),(52,41,2),(53,42,5),(54,42,9),(56,43,9),(57,44,4),(58,44,9),(59,45,1),(60,45,10),(73,53,1),(74,53,2),(78,55,1),(79,55,3),(80,55,2);
/*!40000 ALTER TABLE `orders_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_waiter`
--

DROP TABLE IF EXISTS `orders_waiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_waiter` (
  `Orders_ID` int(10) unsigned NOT NULL,
  `Users_Waiter_ID` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Orders_ID`,`Users_Waiter_ID`),
  KEY `orders_waiter_Orders_ID_idx` (`Orders_ID`),
  KEY `orders_waiter_Users_Waiter_ID` (`Users_Waiter_ID`),
  CONSTRAINT `orders_waiter_Orders_ID` FOREIGN KEY (`Orders_ID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `orders_waiter_Users_Waiter_ID` FOREIGN KEY (`Users_Waiter_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_waiter`
--

LOCK TABLES `orders_waiter` WRITE;
/*!40000 ALTER TABLE `orders_waiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_waiter` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_waiter_AFTER_INSERT` AFTER INSERT ON `orders_waiter` FOR EACH ROW BEGIN
	UPDATE orders
	SET Status = 1
	WHERE ID = NEW.Orders_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DinnerTable_ID` int(10) unsigned NOT NULL,
  `Payment_Amount` int(10) unsigned NOT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`DinnerTable_ID`),
  KEY `payment_ID_index` (`ID`),
  KEY `payment_DinnerTable_ID_fk_idx` (`DinnerTable_ID`),
  CONSTRAINT `payment_DinnerTable_ID_fk` FOREIGN KEY (`DinnerTable_ID`) REFERENCES `dinnertable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payment_AFTER_INSERT` AFTER INSERT ON `payment` FOR EACH ROW BEGIN
	DECLARE myVar INT;
    SELECT DISTINCT d.DinnerTable_Number into myVar 
    FROM dinnertable d
    WHERE NEW.DinnerTable_ID = d.ID;
	INSERT INTO dinnertable(DinnerTable_Number, Bill_Total) 
    VALUES (myVar,0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `total_earnings_of_the_month`
--

DROP TABLE IF EXISTS `total_earnings_of_the_month`;
/*!50001 DROP VIEW IF EXISTS `total_earnings_of_the_month`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_earnings_of_the_month` AS SELECT 
 1 AS `SUM(Payment_Amount)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `User_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID_index` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'ismail','ismail','İsmail Ateş','manager'),(3,'sevgi','sevgi','Sevginur Aşçı','chief'),(4,'coşkun','coşkun','Coşkun Baran','chief'),(5,'hami','hami','Hami Aydoğdu','chief'),(6,'şerife','şerife','Şerife Aşveren','chief'),(7,'hanife','hanife','Hanife Duygu Ata','chief'),(8,'şeyda','şeyda','Şeyda Nur Arıkan','waiter'),(9,'gökmen','gökmen','Gökmen Batur','waiter'),(10,'ateş','ateş','Ateş Aycı','waiter'),(21,'burak','burak','Burak Ünsal','manager');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `waiter_of_the_month`
--

DROP TABLE IF EXISTS `waiter_of_the_month`;
/*!50001 DROP VIEW IF EXISTS `waiter_of_the_month`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waiter_of_the_month` AS SELECT 
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bbm473v8'
--
/*!50003 DROP PROCEDURE IF EXISTS `Bread_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Bread_CRUD`(
      pAction VARCHAR(10)
      ,pID INT
      ,pName VARCHAR(45)
      ,pCount INT
      ,pExpirty_Date DATETIME
      ,pType VARCHAR(45)
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM bread b, items i
        WHERE b.ID = pID AND i.ID = b.ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO items(Name, Count, Expirty_Date)
        VALUES (pName, pCount, pExpirty_date);
        INSERT INTO bread(ID,Type)
        VALUES ((SELECT max(ID) from items),pType);
    END IF;
 
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE items
        SET Name=pName , Count=pCount, Expirty_Date=pExpirty_Date
        WHERE ID = pID;
        UPDATE bread
        SET Type=pType
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM bread WHERE ID = pID;
        DELETE FROM items WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Dinners_Chief_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Dinners_Chief_CRUD`(
      pAction VARCHAR(10)
      ,pDinners_ID INT
      ,pUsers_Chief_ID INT
      ,pStatus TINYINT(1)
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT Users.Name Chief_Name, Dinners.Name Dinner_Name, Dinners_Chief.Date, Dinners_Chief.Status Status 
        FROM Dinners_Chief, Users, Dinners
        WHERE Dinners_Chief.Users_Chief_ID = Users.ID AND Dinners_Chief.Dinners_ID = Dinners.ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO Dinners_Chief(Dinners_ID,Users_Chief_ID,Date,Status)
        VALUES (pDinners_ID,pUsers_Chief_ID,now(),0);
    END IF;
    
        -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE Dinners_Chief
        SET Status = pStatus
        WHERE Dinners_ID = pDinners_ID AND Users_Chief_ID = pUsers_Chief_ID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		    DELETE FROM Dinners_Chief WHERE Users_Chief_ID = pUsers_Chief_ID AND pDinners_ID = Dinners_ID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Dinners_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Dinners_CRUD`(
	pAction VARCHAR(10)
	,pID INT
    ,pMeat_ID INT
    ,pBread_ID INT
    ,pName VARCHAR(45)
    ,pMeat_Count INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM dinners
        WHERE ID = pId;
    END IF;
    
	-- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO dinners(ID,Meat_ID,Bread_ID,Name,Meat_Count)
        VALUES (pID,pMeat_ID,pBread_ID,pName,pMeat_Count);
    END IF;
    
    -- UPDATE
    IF pAction= "UPDATE" THEN
	UPDATE dinners
        SET Meat_ID = pMeat_ID, Bread_ID = pBread_ID, Meat_Count = pMeat_Count, Name = pName
        WHERE ID = pID;
    END IF;
    
    -- DELETE
    IF pAction = "DELETE" THEN
			DELETE FROM dinners WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DinnerTable_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DinnerTable_CRUD`(
	pAction VARCHAR(10)
	,pId INT 
    ,pDinnerTable_Number INT
    ,pBill_Total INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM dinnertable
        WHERE ID = pId;
    END IF;
    -- SELECTALL
    IF pAction = "SELECTALL" THEN
        SELECT * 
        FROM dinnertable;
    END IF;
    
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO dinnertable(DinnerTable_Number,Bill_Total)
        VALUES (pDinnerTable_Number,pBill_Total);
    END IF;
    
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE dinnertable
        SET Bill_Total = pBill_Total
        WHERE ID = pID;
    END IF;
    
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM dinnertable WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DinnerTable_Orders_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DinnerTable_Orders_CRUD`(
      pAction VARCHAR(10)
      ,pDinnerTable_ID INT 
      ,pOrders_ID INT
      ,pDinnerTable_Number INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
      SELECT * FROM dinnertable_orders WHERE Orders_ID = pOrders.ID and DinnerTable_ID = pDinnerTable.ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO dinnertable_orders(DinnerTable_ID,Orders_ID,DinnerTable_Number,Date)
        VALUES (pDinnerTable_ID,pOrders_ID,pDinnerTable_Number, now());
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM dinnertable_orders WHERE DinnerTable_ID = pDinnerTable_ID and Orders_ID = pOrders_ID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Drink_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Drink_CRUD`(
      pAction VARCHAR(10)
      ,pID INT
      ,pName VARCHAR(45)
      ,pCount INT
      ,pExpirty_Date DATETIME
      ,pBrand VARCHAR(45)
	  ,pSize INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM drink d, items i
        WHERE d.ID = pID AND i.ID = pID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
		INSERT INTO items(Name, Count, Expirty_Date)
        VALUES (pName, pCount, pExpirty_Date);
        INSERT INTO drink(ID, Brand, Size)
        VALUES ((select max(ID) from items), pBrand, pSize);
    END IF;
 
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE drink
        SET Name=pName , Count=pCount, Expirty_Date=pExpirty_Date, Brand=pBrand, Size=pSize
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM drink WHERE ID = pID;
        DELETE FROM items WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Items_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Items_CRUD`(
      pAction VARCHAR(10)
      ,pID INT
      ,pName VARCHAR(45)
      ,pCount INT
      ,pExpirity_Date DATETIME
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM items
        WHERE ID = pID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO items(Name, Count, Expirty_Date)
        VALUES (pName, pCount, pExpirity_Date);
    END IF;
 
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE items
        SET Name=pName, Count=pCount, Expirty_Date=pExpirity_Date
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM items WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Meat_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Meat_CRUD`(
      pAction VARCHAR(10)
      ,pID INT
      ,pName VARCHAR(45)
      ,pCount INT
      ,pExpirty_Date DATETIME
      ,pType VARCHAR(45)
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM meat m, items i
        WHERE m.ID = pID AND i.ID = p.ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO items(Name, Count, Expirty_Date)
        VALUES (pName, pCount, pExpirty_date);
        INSERT INTO meat(ID,Type)
        VALUES ((SELECT max(ID) from items),pType);
    END IF;
 
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE items
        SET Name=pName , Count=pCount, Expirty_Date=pExpirty_Date
        WHERE ID = pID;
        UPDATE meat
        SET Type=pType
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM meat WHERE ID = pID;
        DELETE FROM items WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Menu_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Menu_CRUD`(
	pAction VARCHAR(10)
	,pId INT
	,pDrink_ID INT
    ,pDinners_ID INT
    ,pName VARCHAR(45)
    ,pCost INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM Menu
        WHERE ID = pId;
    END IF;
    
    -- SELECTALL
    IF pAction = "SELECTALL" THEN
        SELECT * 
        FROM Menu;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO menu(Drink_ID,Dinners_ID,Name,Cost)
        VALUES (pDrink_ID,pDinners_ID,pName,pCost);
    END IF;
    
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE Menu
        SET Name = pName, Cost = pCost, Drink_ID = pDrink_ID, Dinners_ID = pDinners_ID
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		    DELETE FROM Menu WHERE ID = pID OR Name = pName;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Orders_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Orders_CRUD`(
	pAction VARCHAR(10)
	,pId INT
    ,pCost INT 
    ,pStatus TINYINT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM Orders
        WHERE ID = pId;
    END IF;
    
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO Orders(ID,Cost,Status)
        VALUES (ID,pCost,0);
    END IF;
    
    -- UPDATE
    IF pAction = "UPDATE" THEN
		UPDATE Orders
        SET Cost = pCost, Status = pStatus
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM orders WHERE ID = pID;
		DELETE FROM dinnertable_orders WHERE pID = dinnertable_orders.Orders_ID;
		DELETE FROM orders_waiter WHERE orders_waiter.Orders_ID = pID;
        DELETE FROM orders_menu WHERE orders_menu.Orders_ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Orders_Menu_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Orders_Menu_CRUD`(
      pAction VARCHAR(10)
      ,pOrder_Nubmer INT
      ,pOrders_ID INT
      ,pMenu_ID INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM Orders_Menu
        WHERE Orders_ID = pOrders_ID AND pMenu_ID = Menu_ID AND pOrder_Nubmer = Order_Number;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO Orders_Menu(Orders_ID, Menu_ID)
        VALUES (pOrders_ID, pMenu_ID);
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM Orders_Menu WHERE pOrder_Nubmer = Order_Number;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Orders_Waiter_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Orders_Waiter_CRUD`(
      pAction VARCHAR(10)
      ,pUsers_Waiter_ID INT
      ,pOrders_ID INT
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * 
        FROM Orders_Waiter 
        WHERE Users_Waiter_ID = pUsers_Waiter_ID AND pOrders_Id = Orders_ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO Order_Waiter(Users_Waiter_ID, Orders_ID, Date)
        VALUES (pUsers_Waiter_ID, pOrders_ID, now());
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
		DELETE FROM Orders_Waiter WHERE Users_Waiter_ID = pWaiter_ID AND pOrders_Id = Orders_ID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Payment_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Payment_CRUD`(
      pAction VARCHAR(10)
      ,pID INT
      ,pDinnerTable_ID INT
      ,pPayment_amount int(10)
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * FROM payment WHERE pID = ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO payment(DinnerTable_ID, Payment_Amount, Date)
        VALUES (pDinnerTable_ID, pPayment_amount, now());
    END IF;
 
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE payment
        SET Payment_Amount = payment_amount
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
        DELETE FROM payment WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Users_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Users_CRUD`(
      pAction VARCHAR(10)
      ,pId INT
      ,pUser_name VARCHAR(45)
      ,pPassword VARCHAR(45)
      ,pName VARCHAR(45)
      ,pUser_Type VARCHAR(45)
)
BEGIN
    -- SELECT
    IF pAction = "SELECT" THEN
        SELECT * FROM users where pID = ID;
    END IF;
 
    -- INSERT
    IF pAction = "INSERT" THEN
        INSERT INTO users(User_name, Password, Name, User_Type)
        VALUES (pUser_Name, pPassword, pName, pUser_Type);
    END IF;
 
    -- UPDATE
    IF pAction = "UPDATE" THEN
        UPDATE Users
        SET Name = pName, User_name = pUser_name, Password = pPassword, User_Type = pUser_Type
        WHERE ID = pID;
    END IF;
     
    -- DELETE
    IF pAction = "DELETE" THEN
        DELETE FROM Users WHERE ID = pID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `chief_of_the_month`
--

/*!50001 DROP VIEW IF EXISTS `chief_of_the_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chief_of_the_month` AS select `u`.`Name` AS `Name` from (`dinners_chief` `c` join `users` `u`) where (`c`.`Users_Chief_ID` = `u`.`ID`) group by ((0 <> `c`.`Users_Chief_ID`) and (0 <> month(`c`.`Date`))) order by count(`c`.`Users_Chief_ID`) desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dinner_of_the_month`
--

/*!50001 DROP VIEW IF EXISTS `dinner_of_the_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dinner_of_the_month` AS select `d`.`Name` AS `Name` from (`dinners_chief` `c` join `dinners` `d`) where (`c`.`Dinners_ID` = `d`.`ID`) group by ((0 <> `c`.`Dinners_ID`) and (0 <> month(`c`.`Date`))) order by count(`c`.`Dinners_ID`) desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_of_employees`
--

/*!50001 DROP VIEW IF EXISTS `number_of_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_employees` AS select count(0) AS `COUNT(*)` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_earnings_of_the_month`
--

/*!50001 DROP VIEW IF EXISTS `total_earnings_of_the_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_earnings_of_the_month` AS select sum(`p`.`Payment_Amount`) AS `SUM(Payment_Amount)` from `payment` `p` group by month(`p`.`Date`) limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waiter_of_the_month`
--

/*!50001 DROP VIEW IF EXISTS `waiter_of_the_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `waiter_of_the_month` AS select `u`.`Name` AS `Name` from (`orders_waiter` `o` join `users` `u`) where (`o`.`Users_Waiter_ID` = `u`.`ID`) group by ((0 <> `o`.`Users_Waiter_ID`) and (0 <> month(`o`.`Date`))) order by count(`o`.`Users_Waiter_ID`) desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-09 23:29:59
