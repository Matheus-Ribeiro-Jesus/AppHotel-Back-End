-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: projecthotel
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `adicionais`
--

DROP TABLE IF EXISTS `adicionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicionais`
--

LOCK TABLES `adicionais` WRITE;
/*!40000 ALTER TABLE `adicionais` DISABLE KEYS */;
INSERT INTO `adicionais` VALUES (2,'Café da manha',350.00),(3,'teste',12.00);
/*!40000 ALTER TABLE `adicionais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargo_id` int(11) DEFAULT 5,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `email` (`email`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `cargo_id` FOREIGN KEY (`cargo_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'Matheus','123-456-789','(15)1234-5633','matheus@gmail.com','$2y$10$h.cjBLvSZefBTJgFSWIT2uYB6pxZy/JlDVDU9ArA3chMNgtPBPlTO',1),(5,'Lucas','222-444-223','(15)1234-5678','Lucas@gmail.com','123',5),(12,'a','a','a','a@a','$2y$10$Vuw2nojMdgmfrYUkZmWPzupUitzARcEXew8XVtzqJOdZ8xZoOt/7S',3),(13,'fghgf','hgf','jhg','a@f','$2y$10$u4qcapbGWIST0fMARhwNZeXAdsDuqnFjDoxNbOh.A2YA2ym/zkaaq',5),(14,'Matheus2','123','1232','mtxp@gmail.com','$2y$10$jexsiVpKx0uY5ShWGrPYge45BOle82.yvXH2okEf.nfjKAXBLOyPC',5),(16,'matheus-teste','133','13w21','asaef@gmail.com','$2y$10$Jjn8ez6gRLzYD8MFJH/pie3mxsQjem/fxz6Ts7xTGxUXjRba54S5C',5),(17,'1','1','2','11@11','$2y$10$bmMFUh0UJ2L17eMruKEsSOdwjCc4tQ4FS1grBmRo6KaHypdOXt1qa',5),(21,'1123123123321321','1123123123123132123123123123131312321313123123123','212121231231231231231232312312123','11@113213213123123','$2y$10$yGTBe2YfeSFAgHYRNhKU6uBAvhF2JgI90BwukP9ojTPme1EnhyDqu',5),(22,'','','','','$2y$10$iL5LrDHe7xccOrjS/1Q1FubOv/rjzcdz1mQEVZC8ostFqef8TepGK',5),(41,'Matheus R Jesus','123456783333901222','3333','matheus33333422@gmail.com','$2b$10$eCSeRZqLy6buxug4aeTRxewqxo3GYyW7kVMRSPKa91XohLnPq23C6',5);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens`
--

LOCK TABLES `imagens` WRITE;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_pedido` datetime DEFAULT NULL,
  `pagamento` enum('Debito','Credito','Pix','Dinheiro') NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (4,NULL,'Pix',1,2),(6,NULL,'Dinheiro',3,5),(29,NULL,'Pix',NULL,2),(39,NULL,'Pix',NULL,2),(40,NULL,'Pix',NULL,2),(41,NULL,'Pix',NULL,2),(42,NULL,'Pix',NULL,2),(43,NULL,'Pix',NULL,2),(44,NULL,'Pix',NULL,2),(45,NULL,'Pix',NULL,2),(46,NULL,'Pix',NULL,2),(47,NULL,'Pix',NULL,2),(48,NULL,'Pix',NULL,2),(49,NULL,'Pix',NULL,2),(50,NULL,'Pix',NULL,2),(51,NULL,'Pix',NULL,2),(52,NULL,'Pix',NULL,2),(53,NULL,'Pix',NULL,2),(54,NULL,'Pix',NULL,2),(55,NULL,'Pix',NULL,2),(56,NULL,'Pix',NULL,2),(57,NULL,'Pix',NULL,2),(58,NULL,'Pix',NULL,2),(59,NULL,'Pix',NULL,2),(60,NULL,'Pix',NULL,2),(61,NULL,'Pix',NULL,2),(62,NULL,'Pix',NULL,2),(63,NULL,'Pix',NULL,2),(64,NULL,'Pix',NULL,2),(65,NULL,'Pix',NULL,2),(66,NULL,'Pix',NULL,2),(67,NULL,'Pix',NULL,2),(68,NULL,'Pix',NULL,2),(69,NULL,'Pix',NULL,2),(70,NULL,'Pix',NULL,2),(71,NULL,'Pix',NULL,2),(72,NULL,'Pix',NULL,2),(73,NULL,'Pix',NULL,2),(74,NULL,'Pix',NULL,2),(75,NULL,'Pix',NULL,2),(76,NULL,'Pix',NULL,2),(77,NULL,'Pix',NULL,2),(78,NULL,'Pix',NULL,2),(79,NULL,'Pix',NULL,2),(80,NULL,'Pix',NULL,2),(81,NULL,'Pix',NULL,2),(82,NULL,'Pix',NULL,2),(83,NULL,'Pix',NULL,2),(84,NULL,'Pix',NULL,2),(85,NULL,'Pix',NULL,2),(86,NULL,'Pix',NULL,2),(87,NULL,'Pix',NULL,2),(88,NULL,'Pix',NULL,2),(89,NULL,'Pix',NULL,2),(90,NULL,'Pix',NULL,2),(91,NULL,'Pix',NULL,2),(92,NULL,'Pix',NULL,2),(93,NULL,'Pix',NULL,2),(94,NULL,'Pix',NULL,2),(95,NULL,'Pix',NULL,2),(96,NULL,'Pix',NULL,2),(97,NULL,'Pix',NULL,2),(98,NULL,'Pix',NULL,2),(99,NULL,'Pix',NULL,2),(100,NULL,'Pix',NULL,2),(101,NULL,'Pix',NULL,2),(102,NULL,'Pix',NULL,2),(103,NULL,'Pix',NULL,2),(104,NULL,'Pix',NULL,2),(105,NULL,'Pix',NULL,2),(106,NULL,'Pix',NULL,2),(107,NULL,'Pix',NULL,2),(108,NULL,'Pix',NULL,2),(109,NULL,'Pix',NULL,2),(110,NULL,'Pix',NULL,2),(111,NULL,'Pix',NULL,2),(112,NULL,'Pix',NULL,2),(113,NULL,'Pix',NULL,2),(114,NULL,'Pix',NULL,2),(115,NULL,'Pix',NULL,2),(116,NULL,'Pix',NULL,2),(117,NULL,'Pix',NULL,2),(118,NULL,'Pix',NULL,2),(119,NULL,'Pix',NULL,2),(120,NULL,'Pix',NULL,2),(121,NULL,'Pix',NULL,2);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartos`
--

DROP TABLE IF EXISTS `quartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quartos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `qtd_cama_casal` int(11) NOT NULL,
  `qtd_cama_solteiro` int(11) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `disponivel` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartos`
--

LOCK TABLES `quartos` WRITE;
/*!40000 ALTER TABLE `quartos` DISABLE KEYS */;
INSERT INTO `quartos` VALUES (1,'Suíte Casal','101',1,0,200.00,1),(2,'Suíte Família','102',1,2,350.00,1),(3,'Quarto Luxo','103',2,0,400.00,1),(4,'Quarto Simples','104',0,1,120.00,1),(5,'Suíte Master','105',1,1,280.00,1),(6,'Suíte Família Plus','201',1,2,380.00,1),(7,'Quarto Premium 4 Pessoas','202',2,0,420.00,1),(8,'Apartamento Grande','203',0,4,300.00,1),(9,'Quarto Duplo Econômico','204',1,0,180.00,1),(10,'Suíte Compacta','205',0,2,150.00,1),(11,'Quarto Casal Standard','206',1,0,200.00,1),(12,'Quarto Individual Simples','207',0,1,100.00,1),(13,'Studio Individual','208',0,1,120.00,1),(14,'Quarto Single Econômico','209',0,1,90.00,1),(15,'Theus Deluxe','102',1,1,21.00,1),(16,'Suíte Casal Standard','301',1,0,220.00,1),(17,'Suíte Família','302',1,2,360.00,1),(18,'Quarto Luxo Vista Mar','303',1,1,420.00,1),(19,'Quarto Econômico','304',0,2,160.00,1),(20,'Suíte Presidencial','305',2,1,600.00,1),(21,'Quarto Individual','306',0,1,130.00,1);
/*!40000 ALTER TABLE `quartos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) DEFAULT NULL,
  `quarto_id` int(11) DEFAULT NULL,
  `adicional_id` int(11) DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `quarto_id` (`quarto_id`),
  KEY `adicional_id` (`adicional_id`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`quarto_id`) REFERENCES `quartos` (`id`),
  CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`adicional_id`) REFERENCES `adicionais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,4,1,NULL,'2025-10-05 14:00:00','2025-10-07 12:00:00'),(2,4,2,NULL,'2025-11-01 14:00:00','2025-11-05 12:00:00'),(3,4,3,NULL,'2025-12-20 14:00:00','2025-12-25 12:00:00'),(4,6,6,NULL,'2025-11-10 14:00:00','2025-11-15 12:00:00'),(5,6,8,NULL,'2025-12-05 14:00:00','2025-12-08 12:00:00'),(6,6,10,NULL,'2026-01-10 14:00:00','2026-01-12 12:00:00'),(27,80,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,80,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,81,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,82,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,83,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,83,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,84,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,84,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,85,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,85,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,86,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,86,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,87,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,87,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,88,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,88,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,89,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,89,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,90,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,90,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,91,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,91,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,92,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,92,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,93,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,93,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,94,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,94,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,95,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,95,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,96,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,96,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,97,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,97,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,98,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,98,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,99,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,99,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,120,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,120,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,121,1,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,121,2,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'gerencia'),(3,'funcionario'),(5,'cliente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upimages`
--

DROP TABLE IF EXISTS `upimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quarto_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quarto_id` (`quarto_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `upimages_ibfk_1` FOREIGN KEY (`quarto_id`) REFERENCES `quartos` (`id`),
  CONSTRAINT `upimages_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `imagens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upimages`
--

LOCK TABLES `upimages` WRITE;
/*!40000 ALTER TABLE `upimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `upimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Matheus','matheus@gmail.com','12345',5),(3,'Lucas','Lucas@gmail.com','21232f297a57a5a743894a0e4a801fc3',1),(4,'Matheus2','matheus2@gmail.com','$2y$10$WgSs309Kmr0ewSxkUQ1zfOjslXLsMsMbCZSSdxYQeq8/LTacvp1/S',3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-26 16:41:04
