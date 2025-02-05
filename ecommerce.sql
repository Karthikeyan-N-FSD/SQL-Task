-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rajesh Kumar','rajesh.kumar@gmail.com','No. 12, Brindavan Street, Chennai, Tamil Nadu - 600001'),(2,'Priya Selvam','priya.s@outlook.com','45/2, Gandhi Nagar, Coimbatore, Tamil Nadu - 641003'),(3,'Suresh N','suresh.n@yahoo.com','Plot 7, Anna Salai, Madurai, Tamil Nadu - 625001'),(4,'Karthikeyan N','karthi.n@gmail.com','A67, Dheeran Nagar, Trichy, Tamil Nadu - 620009'),(5,'Karthik S','karthik.sub@gmail.com','56, Nehru Street, Salem, Tamil Nadu - 636001'),(6,'Meenakshi R','meenakshi.r@outlook.com','78/3, Dr. Radhakrishnan Road, Tirunelveli, Tamil Nadu - 627001'),(7,'Arun C','arun.c@yahoo.com','34, Bharathi Street, Vellore, Tamil Nadu - 632001');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,149),(2,2,6,1,340),(3,2,5,1,129),(4,3,4,1,169),(5,4,6,1,340),(6,4,9,1,129),(7,5,1,1,149),(8,5,2,1,299),(9,6,4,1,169),(10,7,8,1,429),(11,7,2,1,299),(12,8,7,1,12),(13,8,5,1,129),(14,9,5,1,129),(15,9,9,1,129),(16,10,1,1,149),(17,10,2,1,299),(18,11,4,1,169),(19,11,5,1,129),(20,12,4,1,169),(21,12,5,1,129),(22,10,3,1,45),(23,2,3,1,45),(24,10,10,1,150),(25,2,10,1,150);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL,
  `totol_amount` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2025-01-02',149),(2,1,'2025-02-20',668),(3,1,'2025-03-10',169),(4,2,'2025-01-20',468),(5,2,'2025-02-25',448),(6,3,'2025-01-25',169),(7,4,'2025-02-01',729),(8,4,'2025-03-15',141),(9,5,'2025-02-10',258),(10,6,'2025-02-15',647),(11,6,'2025-03-20',298),(12,7,'2025-02-20',298);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `description` text,
  `discount` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Redmi Note 12',149,'Smartphone with 48MP Camera, 6GB RAM, 128GB Storage',0),(2,'Noise ColorFit Pro 4',299,'Smart Watch with Health Tracking, Multiple Sports Modes',0),(3,'Product C',45,'Standard product C',0),(4,'Realme 10',169,'6.4\" AMOLED Display, 50MP Camera, 8GB RAM',0),(5,'Boat Rockerz 255 Pro+',129,'Wireless Bluetooth in-Ear Neckband Earphones',0),(6,'Mi 5-Blade Mixer Grinder',340,'500W, 3 Jars, Rust Proof',0),(7,'Campus Walking Shoes',12,'Men\'s Comfortable Sports Shoes, Multiple Sizes',0),(8,'Prestige Mixer Grinder',429,'PKKMH 750W, 5 Jars, Stainless Steel',0),(9,'boAt Airdopes 131',129,'True Wireless Earbuds with Bluetooth 5.0',0),(10,'Product A',150,'High-quality product A',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 16:25:59
