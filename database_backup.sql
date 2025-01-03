-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: bagisto
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) NOT NULL,
  `parent_address_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postcode` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'cart_billing',NULL,NULL,2,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-10 09:58:01','2024-12-10 09:58:01'),(2,'cart_shipping',NULL,NULL,2,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-10 09:58:01','2024-12-10 09:58:01'),(15,'customer',NULL,3,NULL,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-11 03:35:37','2024-12-11 07:18:21'),(16,'cart_billing',15,2,3,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-11 03:35:49','2024-12-11 03:35:49'),(17,'cart_shipping',15,2,3,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-11 03:35:49','2024-12-11 03:35:49'),(24,'order_shipping',NULL,NULL,NULL,10,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-11 05:54:53','2024-12-11 05:54:53'),(25,'order_billing',NULL,NULL,NULL,10,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-11 05:54:53','2024-12-11 05:54:53'),(26,'cart_billing',NULL,NULL,9,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-17 08:23:51','2024-12-17 08:23:51'),(27,'cart_shipping',NULL,NULL,9,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 08:23:51','2024-12-17 08:23:51'),(28,'cart_billing',NULL,2,5,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','osama@example.com','01551005166',NULL,0,1,NULL,'2024-12-17 08:46:34','2024-12-17 08:46:34'),(29,'cart_shipping',NULL,2,5,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','osama@example.com','01551005166',NULL,0,0,NULL,'2024-12-17 08:46:34','2024-12-17 08:46:34'),(30,'order_shipping',NULL,NULL,NULL,11,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','osama@example.com','01551005166',NULL,0,0,NULL,'2024-12-17 08:46:57','2024-12-17 08:46:57'),(31,'order_billing',NULL,NULL,NULL,11,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','osama@example.com','01551005166',NULL,0,0,NULL,'2024-12-17 08:46:57','2024-12-17 08:46:57'),(32,'cart_billing',NULL,2,10,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-17 09:05:02','2024-12-17 09:05:02'),(33,'cart_shipping',NULL,2,10,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:05:02','2024-12-17 09:05:02'),(34,'order_shipping',NULL,NULL,NULL,12,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:05:31','2024-12-17 09:05:31'),(35,'order_billing',NULL,NULL,NULL,12,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:05:31','2024-12-17 09:05:31'),(36,'cart_billing',NULL,2,11,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-17 09:15:13','2024-12-17 09:15:13'),(37,'cart_shipping',NULL,2,11,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:15:13','2024-12-17 09:15:13'),(38,'order_shipping',NULL,NULL,NULL,13,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:15:42','2024-12-17 09:15:42'),(39,'order_billing',NULL,NULL,NULL,13,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:15:42','2024-12-17 09:15:42'),(40,'cart_billing',NULL,2,12,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-17 09:21:11','2024-12-17 09:21:11'),(41,'cart_shipping',NULL,2,12,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:21:12','2024-12-17 09:21:12'),(42,'order_shipping',NULL,NULL,NULL,14,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:21:50','2024-12-17 09:21:50'),(43,'order_billing',NULL,NULL,NULL,14,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:21:50','2024-12-17 09:21:50'),(44,'cart_billing',NULL,2,13,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,1,NULL,'2024-12-17 09:29:12','2024-12-17 09:29:12'),(45,'cart_shipping',NULL,2,13,NULL,'osama','sayed',NULL,'','╪┤╪د╪▒╪╣ ╪╣┘à╪▒ ╪د╪ذ┘ ╪د┘╪«╪╖╪د╪ذ','┘à╪╡╪▒','22','EG','6666666666','o.b.27112016@gmail.com','01551005166',NULL,0,0,NULL,'2024-12-17 09:29:12','2024-12-17 09:29:12');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Example','admin@example.com','$2y$10$fy89L/1dhBVZMa5pMPNqTeSs13UIPDCTyue7.nnC4ddf2S3d2F7Om','I0tkkMR66H102fzTfS4U9QF5wzXfGyJFqTKNH0eBYUIUVR62BzIEgOs0lSsEOxAprBq9CRd7qnxnjWJW',1,1,NULL,NULL,'2024-12-09 06:13:42','2024-12-09 06:13:42');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Default',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_group_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5),(5,6,1),(6,6,2),(7,6,3),(8,6,4),(9,2,1),(10,2,2),(11,4,1),(12,4,2),(13,4,3),(14,4,4),(15,4,5),(16,3,1),(17,3,2),(18,3,3),(19,5,1),(20,5,2),(21,5,3),(22,5,4),(23,1,6),(24,1,7),(25,1,8),(26,6,5),(27,1,2),(28,7,1);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `column` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'general',1,'General',1,1,0),(2,'description',1,'Description',1,2,0),(3,'meta_description',1,'Meta Description',1,3,0),(4,'price',1,'Price',2,1,0),(5,'shipping',1,'Shipping',2,2,0),(6,'settings',1,'Settings',2,3,0),(7,'inventories',1,'Inventories',2,4,0);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,1,'en','Red'),(2,2,'en','Green'),(3,3,'en','Yellow'),(4,4,'en','Black'),(5,5,'en','White'),(6,6,'en','S'),(7,7,'en','M'),(8,8,'en','L'),(9,9,'en','XL');
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `admin_name` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,23,'Red',1,NULL),(2,23,'Green',2,NULL),(3,23,'Yellow',3,NULL),(4,23,'Black',4,NULL),(5,23,'White',5,NULL),(6,24,'S',1,NULL),(7,24,'M',2,NULL),(8,24,'L',3,NULL),(9,24,'XL',4,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,1,'en','SKU'),(2,2,'en','Name'),(3,3,'en','URL Key'),(4,4,'en','Tax Category'),(5,5,'en','New'),(6,6,'en','Featured'),(7,7,'en','Visible Individually'),(8,8,'en','Status'),(9,9,'en','Short Description'),(10,10,'en','Description'),(11,11,'en','Price'),(12,12,'en','Cost'),(13,13,'en','Special Price'),(14,14,'en','Special Price From'),(15,15,'en','Special Price To'),(16,16,'en','Meta Title'),(17,17,'en','Meta Keywords'),(18,18,'en','Meta Description'),(19,19,'en','Length'),(20,20,'en','Width'),(21,21,'en','Height'),(22,22,'en','Weight'),(23,23,'en','Color'),(24,24,'en','Size'),(25,25,'en','Brand'),(26,26,'en','Guest Checkout'),(27,27,'en','Product Number'),(28,28,'en','Manage Stock');
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `admin_name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `swatch_type` varchar(191) DEFAULT NULL,
  `validation` varchar(191) DEFAULT NULL,
  `regex` varchar(191) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,NULL,NULL,1,1,1,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(2,'name','Name','text',NULL,NULL,NULL,3,1,0,0,1,0,0,0,1,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(3,'url_key','URL Key','text',NULL,NULL,NULL,4,1,1,0,0,0,0,0,1,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(4,'tax_category_id','Tax Category','select',NULL,NULL,NULL,5,0,0,0,0,0,0,0,0,1,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(5,'new','New','boolean',NULL,NULL,NULL,6,0,0,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(6,'featured','Featured','boolean',NULL,NULL,NULL,7,0,0,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(7,'visible_individually','Visible Individually','boolean',NULL,NULL,NULL,9,1,0,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(8,'status','Status','boolean',NULL,NULL,NULL,10,1,0,0,0,0,0,0,0,1,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(9,'short_description','Short Description','textarea',NULL,NULL,NULL,11,1,0,0,0,0,0,0,1,0,NULL,1,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(10,'description','Description','textarea',NULL,NULL,NULL,12,1,0,0,1,0,0,0,1,0,NULL,1,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(11,'price','Price','price',NULL,'decimal',NULL,13,1,0,1,1,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(12,'cost','Cost','price',NULL,'decimal',NULL,14,0,0,0,0,0,1,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(13,'special_price','Special Price','price',NULL,'decimal',NULL,15,0,0,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(14,'special_price_from','Special Price From','date',NULL,NULL,NULL,16,0,0,0,0,0,0,0,0,1,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(15,'special_price_to','Special Price To','date',NULL,NULL,NULL,17,0,0,0,0,0,0,0,0,1,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(16,'meta_title','Meta Title','textarea',NULL,NULL,NULL,18,0,0,0,0,0,0,0,1,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(17,'meta_keywords','Meta Keywords','textarea',NULL,NULL,NULL,20,0,0,0,0,0,0,0,1,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(18,'meta_description','Meta Description','textarea',NULL,NULL,NULL,21,0,0,0,0,0,1,0,1,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(19,'length','Length','text',NULL,'decimal',NULL,22,0,0,0,0,0,1,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(20,'width','Width','text',NULL,'decimal',NULL,23,0,0,0,0,0,1,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(21,'height','Height','text',NULL,'decimal',NULL,24,0,0,0,0,0,1,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(22,'weight','Weight','text',NULL,'decimal',NULL,25,1,0,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(23,'color','Color','select',NULL,NULL,NULL,26,0,0,1,0,1,1,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(24,'size','Size','select',NULL,NULL,NULL,27,0,0,1,0,1,1,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(25,'brand','Brand','select',NULL,NULL,NULL,28,0,0,1,0,0,1,1,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(26,'guest_checkout','Guest Checkout','boolean',NULL,NULL,NULL,8,1,0,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(27,'product_number','Product Number','text',NULL,NULL,NULL,2,0,1,0,0,0,0,0,0,0,NULL,0,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(28,'manage_stock','Manage Stock','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,1,1,0,'2024-12-09 06:13:40','2024-12-09 06:13:40');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `cart_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `tax_total` decimal(12,4) DEFAULT 0.0000,
  `base_tax_total` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `checkout_method` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','USD','USD',190.0000,190.0000,190.0000,190.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,190.0000,190.0000,NULL,1,1,NULL,NULL,1,'2024-12-09 20:51:59','2024-12-09 21:00:36'),(2,'o.b.27112016@gmail.com','osama','sayed','flatrate_flatrate',NULL,0,5,5.0000,NULL,'USD','USD','USD','USD',1375.0000,1375.0000,1325.0000,1325.0000,0.0000,0.0000,0.0000,0.0000,50.0000,50.0000,50.0000,50.0000,1325.0000,1325.0000,NULL,1,1,NULL,NULL,1,'2024-12-10 05:03:45','2024-12-10 10:20:49'),(3,'osamaa@example.com','osamaa','sayed','flatrate_flatrate',NULL,0,5,5.0000,NULL,'USD','USD','USD','USD',1732.0000,1732.0000,1682.0000,1682.0000,0.0000,0.0000,0.0000,0.0000,50.0000,50.0000,50.0000,50.0000,1682.0000,1682.0000,NULL,0,0,NULL,2,1,'2024-12-11 03:29:49','2024-12-11 05:55:03'),(4,'osamaa@example.com','osamaa','sayed',NULL,NULL,0,5,5.0000,NULL,'USD','USD','USD','USD',1682.0000,1682.0000,1682.0000,1682.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1682.0000,1682.0000,NULL,0,0,NULL,2,1,'2024-12-11 06:08:32','2024-12-11 06:08:36'),(5,'osamaa@example.com','osamaa','sayed','flatrate_flatrate',NULL,0,7,11.0000,NULL,'USD','USD','USD','USD',7628.0000,7628.0000,7518.0000,7518.0000,0.0000,0.0000,0.0000,0.0000,110.0000,110.0000,110.0000,110.0000,7518.0000,7518.0000,NULL,0,0,NULL,2,1,'2024-12-11 06:14:23','2024-12-17 08:47:13'),(6,'o.b.27112016@gmail.com','osamaaa','sayed',NULL,NULL,0,3,3.0000,NULL,'USD','USD','USD','USD',668.0000,668.0000,668.0000,668.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,668.0000,668.0000,NULL,0,1,NULL,3,1,'2024-12-11 07:17:36','2024-12-11 07:43:26'),(7,NULL,NULL,NULL,NULL,NULL,0,3,3.0000,NULL,'USD','USD','USD','USD',1959.0000,1959.0000,1959.0000,1959.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1959.0000,1959.0000,NULL,1,1,NULL,NULL,1,'2024-12-11 08:16:29','2024-12-11 08:17:38'),(8,NULL,NULL,NULL,NULL,NULL,0,3,5.0000,NULL,'USD','USD','USD','USD',2998.0000,2998.0000,2998.0000,2998.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2998.0000,2998.0000,NULL,1,1,NULL,NULL,1,'2024-12-12 06:18:10','2024-12-12 08:30:35'),(9,'o.b.27112016@gmail.com','osama','sayed','flatrate_flatrate',NULL,0,4,4.0000,NULL,'USD','USD','USD','USD',2889.0000,2889.0000,2849.0000,2849.0000,0.0000,0.0000,0.0000,0.0000,40.0000,40.0000,40.0000,40.0000,2849.0000,2849.0000,NULL,1,1,NULL,NULL,1,'2024-12-17 08:22:37','2024-12-17 08:25:23'),(10,'osamaa@example.com','osamaa','sayed','flatrate_flatrate',NULL,0,6,9.0000,NULL,'USD','USD','USD','USD',6319.0000,6319.0000,6229.0000,6229.0000,0.0000,0.0000,0.0000,0.0000,90.0000,90.0000,90.0000,90.0000,6229.0000,6229.0000,NULL,0,0,NULL,2,1,'2024-12-17 08:50:40','2024-12-17 09:05:49'),(11,'osamaa@example.com','osamaa','sayed','flatrate_flatrate',NULL,0,4,4.0000,NULL,'USD','USD','USD','USD',2889.0000,2889.0000,2849.0000,2849.0000,0.0000,0.0000,0.0000,0.0000,40.0000,40.0000,40.0000,40.0000,2849.0000,2849.0000,NULL,0,0,NULL,2,1,'2024-12-17 09:07:49','2024-12-17 09:15:52'),(12,'osamaa@example.com','osamaa','sayed','free_free',NULL,0,4,4.0000,NULL,'USD','USD','USD','USD',2849.0000,2849.0000,2849.0000,2849.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2849.0000,2849.0000,NULL,0,0,NULL,2,1,'2024-12-17 09:19:05','2024-12-17 09:21:59'),(13,'osamaa@example.com','osamaa','sayed','flatrate_flatrate',NULL,0,6,7.0000,NULL,'USD','USD','USD','USD',4788.0000,4788.0000,4718.0000,4718.0000,0.0000,0.0000,0.0000,0.0000,70.0000,70.0000,70.0000,70.0000,4718.0000,4718.0000,NULL,0,1,NULL,2,1,'2024-12-17 09:24:02','2024-12-17 09:30:07');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `cart_item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(191) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,1,'104','simple','summer clothes',NULL,2.0000,2.0000,2.0000,190.0000,190.0000,NULL,190.0000,190.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,190.0000,190.0000,190.0000,190.0000,NULL,NULL,4,1,NULL,NULL,'{\"quantity\":1,\"product_id\":4}','2024-12-09 20:51:59','2024-12-09 20:51:59'),(2,1,'105','simple','Summer clothes5',NULL,13.0000,13.0000,13.0000,300.0000,300.0000,NULL,300.0000,300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,300.0000,300.0000,300.0000,300.0000,NULL,NULL,6,2,NULL,NULL,'{\"quantity\":1,\"product_id\":6}','2024-12-10 05:03:46','2024-12-10 05:03:46'),(3,1,'112','simple','Winter clothing',NULL,2.0000,2.0000,2.0000,110.0000,110.0000,NULL,110.0000,110.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,110.0000,110.0000,110.0000,110.0000,NULL,NULL,13,2,NULL,NULL,'{\"quantity\":1,\"product_id\":13}','2024-12-10 09:54:52','2024-12-10 09:54:52'),(4,1,'115','simple','Winter clothing5',NULL,6.0000,6.0000,6.0000,410.0000,410.0000,NULL,410.0000,410.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,410.0000,410.0000,410.0000,410.0000,NULL,NULL,16,2,NULL,NULL,'{\"quantity\":1,\"product_id\":16}','2024-12-10 09:54:57','2024-12-10 09:54:57'),(5,1,'129','simple','Children\'s shoes9',NULL,0.5000,0.5000,0.5000,340.0000,340.0000,NULL,340.0000,340.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,340.0000,340.0000,340.0000,340.0000,NULL,NULL,30,2,NULL,NULL,'{\"quantity\":1,\"product_id\":30}','2024-12-10 09:55:43','2024-12-10 09:55:43'),(6,1,'131','simple','Children\'s shoes11',NULL,1.0000,1.0000,1.0000,165.0000,165.0000,NULL,165.0000,165.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,165.0000,165.0000,165.0000,165.0000,NULL,NULL,32,2,NULL,NULL,'{\"quantity\":1,\"product_id\":32}','2024-12-10 09:55:46','2024-12-10 09:55:46'),(7,1,'118','simple','Winter clothing8',NULL,7.0000,7.0000,7.0000,580.0000,580.0000,NULL,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,NULL,NULL,19,3,NULL,NULL,'{\"quantity\":1,\"product_id\":19}','2024-12-11 03:29:49','2024-12-11 03:29:49'),(8,1,'108','simple','Summer clothes8',NULL,2.5000,2.5000,2.5000,630.0000,630.0000,NULL,630.0000,630.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,630.0000,630.0000,630.0000,630.0000,NULL,NULL,9,3,NULL,NULL,'{\"quantity\":1,\"product_id\":9}','2024-12-11 03:29:55','2024-12-11 03:29:55'),(9,1,'122','simple','Children\'s shoes2',NULL,1.5000,1.5000,1.5000,160.0000,160.0000,NULL,160.0000,160.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,160.0000,160.0000,160.0000,160.0000,NULL,NULL,23,3,NULL,NULL,'{\"quantity\":1,\"product_id\":23}','2024-12-11 03:31:02','2024-12-11 03:31:02'),(10,1,'121','simple','Children\'s shoes1',NULL,1.5000,1.5000,1.5000,135.0000,135.0000,NULL,135.0000,135.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,135.0000,135.0000,135.0000,135.0000,NULL,NULL,22,3,NULL,NULL,'{\"quantity\":1,\"product_id\":22}','2024-12-11 03:31:08','2024-12-11 03:31:08'),(11,1,'111','simple','Winter clothing1',NULL,3.0000,3.0000,3.0000,177.0000,177.0000,NULL,177.0000,177.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,177.0000,177.0000,177.0000,177.0000,NULL,NULL,12,3,NULL,NULL,'{\"quantity\":1,\"product_id\":12}','2024-12-11 03:34:36','2024-12-11 03:34:36'),(12,1,'118','simple','Winter clothing8',NULL,7.0000,7.0000,7.0000,580.0000,580.0000,NULL,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,NULL,NULL,19,4,NULL,NULL,'{\"quantity\":1,\"product_id\":19,\"locale\":\"en\"}','2024-12-11 06:08:33','2024-12-11 06:08:33'),(13,1,'108','simple','Summer clothes8',NULL,2.5000,2.5000,2.5000,630.0000,630.0000,NULL,630.0000,630.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,630.0000,630.0000,630.0000,630.0000,NULL,NULL,9,4,NULL,NULL,'{\"quantity\":1,\"product_id\":9,\"locale\":\"en\"}','2024-12-11 06:08:33','2024-12-11 06:08:33'),(14,1,'122','simple','Children\'s shoes2',NULL,1.5000,1.5000,1.5000,160.0000,160.0000,NULL,160.0000,160.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,160.0000,160.0000,160.0000,160.0000,NULL,NULL,23,4,NULL,NULL,'{\"quantity\":1,\"product_id\":23,\"locale\":\"en\"}','2024-12-11 06:08:34','2024-12-11 06:08:34'),(15,1,'121','simple','Children\'s shoes1',NULL,1.5000,1.5000,1.5000,135.0000,135.0000,NULL,135.0000,135.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,135.0000,135.0000,135.0000,135.0000,NULL,NULL,22,4,NULL,NULL,'{\"quantity\":1,\"product_id\":22,\"locale\":\"en\"}','2024-12-11 06:08:34','2024-12-11 06:08:34'),(16,1,'111','simple','Winter clothing1',NULL,3.0000,3.0000,3.0000,177.0000,177.0000,NULL,177.0000,177.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,177.0000,177.0000,177.0000,177.0000,NULL,NULL,12,4,NULL,NULL,'{\"quantity\":1,\"product_id\":12,\"locale\":\"en\"}','2024-12-11 06:08:35','2024-12-11 06:08:35'),(17,2,'119','simple','Winter clothing9',NULL,7.0000,14.0000,14.0000,799.0000,799.0000,NULL,1598.0000,1598.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,1598.0000,1598.0000,NULL,NULL,20,5,NULL,NULL,'{\"quantity\":2,\"product_id\":20}','2024-12-11 06:14:23','2024-12-11 06:56:53'),(18,2,'107','simple','Summer clothes7',NULL,3.0000,6.0000,6.0000,770.0000,770.0000,NULL,1540.0000,1540.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,1540.0000,1540.0000,NULL,NULL,8,5,NULL,NULL,'{\"quantity\":2,\"product_id\":8}','2024-12-11 06:14:26','2024-12-11 06:55:40'),(19,2,'116','simple','Winter clothing6',NULL,6.0000,12.0000,12.0000,645.0000,645.0000,NULL,1290.0000,1290.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,1290.0000,1290.0000,NULL,NULL,17,5,NULL,NULL,'{\"quantity\":2,\"product_id\":17}','2024-12-11 06:14:28','2024-12-11 06:56:14'),(20,2,'109','simple','Summer clothes9',NULL,2.5000,5.0000,5.0000,635.0000,635.0000,NULL,1270.0000,1270.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,1270.0000,1270.0000,NULL,NULL,10,5,NULL,NULL,'{\"quantity\":2,\"product_id\":10}','2024-12-11 06:14:31','2024-12-11 06:56:36'),(21,1,'108','simple','Summer clothes8',NULL,2.5000,2.5000,2.5000,630.0000,630.0000,NULL,630.0000,630.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,630.0000,630.0000,630.0000,630.0000,NULL,NULL,9,5,NULL,NULL,'{\"quantity\":1,\"product_id\":9}','2024-12-11 06:14:35','2024-12-11 06:14:35'),(22,1,'120','simple','Winter clothing10',NULL,7.0000,7.0000,7.0000,610.0000,610.0000,NULL,610.0000,610.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,610.0000,610.0000,610.0000,610.0000,NULL,NULL,21,5,NULL,NULL,'{\"quantity\":1,\"product_id\":21}','2024-12-11 06:14:45','2024-12-11 06:14:45'),(23,1,'103','simple','Summer clothes4',NULL,2.0000,2.0000,2.0000,580.0000,580.0000,NULL,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,NULL,NULL,5,5,NULL,NULL,'{\"quantity\":1,\"product_id\":5}','2024-12-11 06:57:30','2024-12-11 06:57:30'),(24,1,'104','simple','summer clothes',NULL,2.0000,2.0000,2.0000,190.0000,190.0000,NULL,190.0000,190.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,190.0000,190.0000,190.0000,190.0000,NULL,NULL,4,6,NULL,NULL,'{\"quantity\":1,\"product_id\":4}','2024-12-11 07:17:37','2024-12-11 07:17:37'),(25,1,'100','simple','Summer clothes1',NULL,3.0000,3.0000,3.0000,198.0000,198.0000,NULL,198.0000,198.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,198.0000,198.0000,198.0000,198.0000,NULL,NULL,1,6,NULL,NULL,'{\"quantity\":1,\"product_id\":1}','2024-12-11 07:17:44','2024-12-11 07:17:44'),(26,1,'125','simple','Children\'s shoes5',NULL,2.0000,2.0000,2.0000,280.0000,280.0000,NULL,280.0000,280.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,280.0000,280.0000,280.0000,280.0000,NULL,NULL,26,6,NULL,NULL,'{\"quantity\":1,\"product_id\":26}','2024-12-11 07:17:54','2024-12-11 07:17:54'),(27,1,'118','simple','Winter clothing8',NULL,7.0000,7.0000,7.0000,580.0000,580.0000,NULL,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,NULL,NULL,19,7,NULL,NULL,'{\"quantity\":1,\"product_id\":19}','2024-12-11 08:16:30','2024-12-11 08:16:30'),(28,1,'103','simple','Summer clothes4',NULL,2.0000,2.0000,2.0000,580.0000,580.0000,NULL,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,NULL,NULL,5,7,NULL,NULL,'{\"quantity\":1,\"product_id\":5}','2024-12-11 08:16:40','2024-12-11 08:16:40'),(29,1,'119','simple','Winter clothing9',NULL,7.0000,7.0000,7.0000,799.0000,799.0000,NULL,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,NULL,NULL,20,7,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-11 08:17:36','2024-12-11 08:17:36'),(30,2,'119','simple','Winter clothing9',NULL,7.0000,14.0000,14.0000,799.0000,799.0000,NULL,1598.0000,1598.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,1598.0000,1598.0000,NULL,NULL,20,8,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-12 06:18:11','2024-12-12 06:20:57'),(31,2,'116','simple','Winter clothing6',NULL,6.0000,12.0000,12.0000,645.0000,645.0000,NULL,1290.0000,1290.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,1290.0000,1290.0000,NULL,NULL,17,8,NULL,NULL,'{\"quantity\":1,\"product_id\":17}','2024-12-12 06:18:18','2024-12-12 06:21:02'),(32,1,'112','simple','Winter clothing',NULL,2.0000,2.0000,2.0000,110.0000,110.0000,NULL,110.0000,110.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,110.0000,110.0000,110.0000,110.0000,NULL,NULL,13,8,NULL,NULL,'{\"quantity\":1,\"product_id\":13}','2024-12-12 06:19:11','2024-12-12 06:19:11'),(33,1,'107','simple','Summer clothes7',NULL,3.0000,3.0000,3.0000,770.0000,770.0000,NULL,770.0000,770.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,770.0000,770.0000,NULL,NULL,8,9,NULL,NULL,'{\"quantity\":1,\"product_id\":8}','2024-12-17 08:22:37','2024-12-17 08:22:37'),(34,1,'119','simple','Winter clothing9',NULL,7.0000,7.0000,7.0000,799.0000,799.0000,NULL,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,NULL,NULL,20,9,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-17 08:22:42','2024-12-17 08:22:42'),(35,1,'109','simple','Summer clothes9',NULL,2.5000,2.5000,2.5000,635.0000,635.0000,NULL,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,NULL,NULL,10,9,NULL,NULL,'{\"quantity\":1,\"product_id\":10}','2024-12-17 08:22:44','2024-12-17 08:22:44'),(36,1,'116','simple','Winter clothing6',NULL,6.0000,6.0000,6.0000,645.0000,645.0000,NULL,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,NULL,NULL,17,9,NULL,NULL,'{\"quantity\":1,\"product_id\":17}','2024-12-17 08:22:46','2024-12-17 08:22:46'),(37,1,'119','simple','Winter clothing9',NULL,7.0000,7.0000,7.0000,799.0000,799.0000,NULL,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,NULL,NULL,20,10,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-17 08:50:40','2024-12-17 08:50:40'),(38,4,'107','simple','Summer clothes7',NULL,3.0000,12.0000,12.0000,770.0000,770.0000,NULL,3080.0000,3080.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,3080.0000,3080.0000,NULL,NULL,8,10,NULL,NULL,'{\"quantity\":1,\"product_id\":8}','2024-12-17 08:50:43','2024-12-17 09:02:16'),(39,1,'116','simple','Winter clothing6',NULL,6.0000,6.0000,6.0000,645.0000,645.0000,NULL,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,NULL,NULL,17,10,NULL,NULL,'{\"quantity\":1,\"product_id\":17}','2024-12-17 08:50:45','2024-12-17 09:02:01'),(40,1,'109','simple','Summer clothes9',NULL,2.5000,2.5000,2.5000,635.0000,635.0000,NULL,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,NULL,NULL,10,10,NULL,NULL,'{\"quantity\":1,\"product_id\":10}','2024-12-17 08:50:46','2024-12-17 08:50:46'),(41,1,'106','simple','Summer clothes6',NULL,3.0000,3.0000,3.0000,550.0000,550.0000,NULL,550.0000,550.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,550.0000,550.0000,550.0000,550.0000,NULL,NULL,7,10,NULL,NULL,'{\"quantity\":1,\"product_id\":7}','2024-12-17 08:50:48','2024-12-17 08:50:48'),(42,1,'117','simple','Winter clothing7',NULL,7.0000,7.0000,7.0000,520.0000,520.0000,NULL,520.0000,520.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,520.0000,520.0000,520.0000,520.0000,NULL,NULL,18,10,NULL,NULL,'{\"quantity\":1,\"product_id\":18}','2024-12-17 08:50:50','2024-12-17 08:50:50'),(43,1,'119','simple','Winter clothing9',NULL,7.0000,7.0000,7.0000,799.0000,799.0000,NULL,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,NULL,NULL,20,11,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-17 09:07:49','2024-12-17 09:07:49'),(44,1,'107','simple','Summer clothes7',NULL,3.0000,3.0000,3.0000,770.0000,770.0000,NULL,770.0000,770.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,770.0000,770.0000,NULL,NULL,8,11,NULL,NULL,'{\"quantity\":1,\"product_id\":8}','2024-12-17 09:07:55','2024-12-17 09:07:55'),(45,1,'116','simple','Winter clothing6',NULL,6.0000,6.0000,6.0000,645.0000,645.0000,NULL,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,NULL,NULL,17,11,NULL,NULL,'{\"quantity\":1,\"product_id\":17}','2024-12-17 09:08:01','2024-12-17 09:08:01'),(46,1,'109','simple','Summer clothes9',NULL,2.5000,2.5000,2.5000,635.0000,635.0000,NULL,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,NULL,NULL,10,11,NULL,NULL,'{\"quantity\":1,\"product_id\":10}','2024-12-17 09:08:02','2024-12-17 09:08:02'),(47,1,'119','simple','Winter clothing9',NULL,7.0000,7.0000,7.0000,799.0000,799.0000,NULL,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,NULL,NULL,20,12,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-17 09:19:05','2024-12-17 09:19:05'),(48,1,'107','simple','Summer clothes7',NULL,3.0000,3.0000,3.0000,770.0000,770.0000,NULL,770.0000,770.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,770.0000,770.0000,NULL,NULL,8,12,NULL,NULL,'{\"quantity\":1,\"product_id\":8}','2024-12-17 09:19:07','2024-12-17 09:19:07'),(49,1,'116','simple','Winter clothing6',NULL,6.0000,6.0000,6.0000,645.0000,645.0000,NULL,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,NULL,NULL,17,12,NULL,NULL,'{\"quantity\":1,\"product_id\":17}','2024-12-17 09:19:09','2024-12-17 09:19:09'),(50,1,'109','simple','Summer clothes9',NULL,2.5000,2.5000,2.5000,635.0000,635.0000,NULL,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,NULL,NULL,10,12,NULL,NULL,'{\"quantity\":1,\"product_id\":10}','2024-12-17 09:19:10','2024-12-17 09:19:10'),(51,1,'109','simple','Summer clothes9',NULL,2.5000,2.5000,2.5000,635.0000,635.0000,NULL,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,NULL,NULL,10,13,NULL,NULL,'{\"quantity\":1,\"product_id\":10}','2024-12-17 09:24:03','2024-12-17 09:24:03'),(52,1,'116','simple','Winter clothing6',NULL,6.0000,6.0000,6.0000,645.0000,645.0000,NULL,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,NULL,NULL,17,13,NULL,NULL,'{\"quantity\":1,\"product_id\":17}','2024-12-17 09:24:12','2024-12-17 09:24:12'),(53,1,'107','simple','Summer clothes7',NULL,3.0000,3.0000,3.0000,770.0000,770.0000,NULL,770.0000,770.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,770.0000,770.0000,NULL,NULL,8,13,NULL,NULL,'{\"quantity\":1,\"product_id\":8}','2024-12-17 09:24:14','2024-12-17 09:24:14'),(54,2,'119','simple','Winter clothing9',NULL,7.0000,14.0000,14.0000,799.0000,799.0000,NULL,1598.0000,1598.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,1598.0000,1598.0000,NULL,NULL,20,13,NULL,NULL,'{\"quantity\":1,\"product_id\":20}','2024-12-17 09:24:16','2024-12-17 09:24:22'),(55,1,'117','simple','Winter clothing7',NULL,7.0000,7.0000,7.0000,520.0000,520.0000,NULL,520.0000,520.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,520.0000,520.0000,520.0000,520.0000,NULL,NULL,18,13,NULL,NULL,'{\"quantity\":1,\"product_id\":18}','2024-12-17 09:26:32','2024-12-17 09:26:32'),(56,1,'106','simple','Summer clothes6',NULL,3.0000,3.0000,3.0000,550.0000,550.0000,NULL,550.0000,550.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,550.0000,550.0000,550.0000,550.0000,NULL,NULL,7,13,NULL,NULL,'{\"quantity\":1,\"product_id\":7}','2024-12-17 09:26:43','2024-12-17 09:26:43');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
INSERT INTO `cart_payment` VALUES (12,'paypal_smart_button','PayPal Smart Button',2,'2024-12-10 10:20:46','2024-12-10 10:20:46'),(20,'cashondelivery','Cash On Delivery',3,'2024-12-11 05:54:46','2024-12-11 05:54:46'),(21,'cashondelivery','Cash On Delivery',9,'2024-12-17 08:24:04','2024-12-17 08:24:04'),(22,'cashondelivery','Cash On Delivery',5,'2024-12-17 08:46:51','2024-12-17 08:46:51'),(23,'cashondelivery','Cash On Delivery',10,'2024-12-17 09:05:21','2024-12-17 09:05:21'),(24,'cashondelivery','Cash On Delivery',11,'2024-12-17 09:15:33','2024-12-17 09:15:33'),(25,'cashondelivery','Cash On Delivery',12,'2024-12-17 09:21:32','2024-12-17 09:21:32'),(30,'cashondelivery','Cash On Delivery',13,'2024-12-17 09:30:06','2024-12-17 09:30:06');
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int(11) NOT NULL DEFAULT 0,
  `cart_rule_coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) DEFAULT NULL,
  `usage_limit` int(10) unsigned NOT NULL DEFAULT 0,
  `usage_per_customer` int(10) unsigned NOT NULL DEFAULT 0,
  `times_used` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint(20) unsigned NOT NULL DEFAULT 0,
  `customer_id` int(10) unsigned NOT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_type` int(11) NOT NULL DEFAULT 1,
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT 0,
  `usage_per_customer` int(11) NOT NULL DEFAULT 0,
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0,
  `times_used` int(10) unsigned NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_quantity` int(11) NOT NULL DEFAULT 1,
  `discount_step` varchar(191) NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) NOT NULL,
  `carrier_title` varchar(191) NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) NOT NULL,
  `method_description` varchar(191) DEFAULT NULL,
  `price` double DEFAULT 0,
  `base_price` double DEFAULT 0,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(191) DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` VALUES (13,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',50,50,0.0000,0.0000,0.0000,0.0000,0.0000,50.0000,50.0000,NULL,1,2,'2024-12-10 10:20:41','2024-12-10 10:20:41',2),(14,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,2,'2024-12-10 10:20:41','2024-12-10 10:20:41',2),(21,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',50,50,0.0000,0.0000,0.0000,0.0000,0.0000,50.0000,50.0000,NULL,1,17,'2024-12-11 05:54:17','2024-12-11 05:54:17',3),(22,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,17,'2024-12-11 05:54:17','2024-12-11 05:54:17',3),(25,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',40,40,0.0000,0.0000,0.0000,0.0000,0.0000,40.0000,40.0000,NULL,1,27,'2024-12-17 08:23:58','2024-12-17 08:23:58',9),(26,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,27,'2024-12-17 08:23:58','2024-12-17 08:23:58',9),(29,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',110,110,0.0000,0.0000,0.0000,0.0000,0.0000,110.0000,110.0000,NULL,1,29,'2024-12-17 08:46:41','2024-12-17 08:46:41',5),(30,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,29,'2024-12-17 08:46:41','2024-12-17 08:46:41',5),(33,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',90,90,0.0000,0.0000,0.0000,0.0000,0.0000,90.0000,90.0000,NULL,1,33,'2024-12-17 09:05:13','2024-12-17 09:05:13',10),(34,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,33,'2024-12-17 09:05:13','2024-12-17 09:05:13',10),(37,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',40,40,0.0000,0.0000,0.0000,0.0000,0.0000,40.0000,40.0000,NULL,1,37,'2024-12-17 09:15:23','2024-12-17 09:15:23',11),(38,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,37,'2024-12-17 09:15:23','2024-12-17 09:15:23',11),(41,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',40,40,0.0000,0.0000,0.0000,0.0000,0.0000,40.0000,40.0000,NULL,1,41,'2024-12-17 09:21:24','2024-12-17 09:21:24',12),(42,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,41,'2024-12-17 09:21:24','2024-12-17 09:21:24',12),(45,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',70,70,0.0000,0.0000,0.0000,0.0000,0.0000,70.0000,70.0000,NULL,1,45,'2024-12-17 09:29:28','2024-12-17 09:29:28',13),(46,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,45,'2024-12-17 09:29:28','2024-12-17 09:29:28',13);
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `_lft` int(10) unsigned NOT NULL DEFAULT 0,
  `_rgt` int(10) unsigned NOT NULL DEFAULT 0,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `banner_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'products_and_description',1,20,NULL,NULL,NULL,'2024-12-09 06:13:40','2024-12-09 06:13:40'),(2,1,'category/2/A4YMJvsM5L0OpsSGj8cZ93fJgPFsERByjGG6uDFW.webp',1,'products_and_description',14,15,1,NULL,'category/2/v55uLdGAjkqG0kgUPQJJJ4e2qRPQowFyTBwyWRO6.webp','2024-12-09 08:57:04','2024-12-10 08:28:27'),(3,2,'category/3/JnZOOYOyrJgYEbogSfiHX4GJ15CWSuFMMeA5W1da.webp',1,'products_and_description',16,17,1,NULL,'category/3/HRhSw4qKc9GV3dtYkuweBnV80QskF65Yu3reDODQ.webp','2024-12-09 09:12:06','2024-12-10 09:50:19'),(4,3,'category/4/rpZP96IsiQnQYA1nij1lYdwC1slN4fcx4wYGXw6h.webp',1,'products_and_description',18,19,1,NULL,'category/4/7yvEcELRJE5n6F9O504tEXVFkXlpoF3TSsfU6hlN.webp','2024-12-10 08:58:28','2024-12-10 09:43:42');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` VALUES (2,11),(3,11),(4,11);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `url_path` varchar(2048) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,1,'Root','root','','Root Category Description','','','',NULL,'en'),(2,2,'Winter children\'s clothes','winter-childrens-clothes','','<p>Winter clothing</p>','','','',1,'en'),(3,3,'Summer children\'s clothes','summer-childrens-clothes','','<p>Summer children\'s clothes</p>','','','',1,'en'),(4,4,'Children\'s shoes','childrens-shoes','','<p>Children\'s shoes</p>','','','',1,'en');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_locales` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_mode_text` text DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES (1,1,'en','Default',NULL,NULL,'{\"meta_title\":\"Demo store\",\"meta_description\":\"Demo store meta description\",\"meta_keywords\":\"Demo store meta keyword\"}',NULL,NULL);
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `hostname` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text DEFAULT NULL,
  `root_category_id` int(10) unsigned DEFAULT NULL,
  `default_locale_id` int(10) unsigned NOT NULL,
  `base_currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default',NULL,'default','http://localhost:8000',NULL,NULL,NULL,0,NULL,1,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) NOT NULL,
  `url_key` varchar(191) NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `cms_page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (1,'About Us','about-us','<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>','about us','','aboutus','en',1),(2,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>','return policy','','return, policy','en',2),(3,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>','Refund policy','','refund, policy','en',3),(4,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>','Terms & Conditions','','term, conditions','en',4),(5,'Terms of Use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>','Terms of use','','term, use','en',5),(6,'Customer Service','customer-service','<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>','Customer Service','','customer, service','en',7),(7,'What\'s New','whats-new','<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>','What\'s New','','new','en',8),(8,'Payment Policy','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>','Payment Policy','','payment, policy','en',9),(9,'Shipping Policy','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>','Shipping Policy','','shipping, policy','en',10),(10,'Privacy Policy','privacy-policy','<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>','Privacy Policy','','privacy, policy','en',11);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(2,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(3,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(4,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(5,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(6,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(7,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(8,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(9,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(10,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(11,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_items`
--

DROP TABLE IF EXISTS `compare_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_items`
--

LOCK TABLES `compare_items` WRITE;
/*!40000 ALTER TABLE `compare_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `channel_code` varchar(191) DEFAULT NULL,
  `locale_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'sales.checkout.shopping_cart.allow_guest_checkout','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(5,'emails.general.notifications.emails.general.notifications.new_order','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(6,'emails.general.notifications.emails.general.notifications.new_admin','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(7,'emails.general.notifications.emails.general.notifications.new_invoice','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(8,'emails.general.notifications.emails.general.notifications.new_refund','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(9,'emails.general.notifications.emails.general.notifications.new_shipment','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(10,'emails.general.notifications.emails.general.notifications.new_inventory_source','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(11,'emails.general.notifications.emails.general.notifications.cancel_order','1',NULL,NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(12,'customer.settings.social_login.enable_facebook','1','default',NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(13,'customer.settings.social_login.enable_twitter','1','default',NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(14,'customer.settings.social_login.enable_google','1','default',NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(15,'customer.settings.social_login.enable_linkedin','1','default',NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(16,'customer.settings.social_login.enable_github','1','default',NULL,'2024-12-09 06:13:41','2024-12-09 06:13:41');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','├àland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','C├┤te dظآIvoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Cura├دao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','R├رunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','S├ثo Tom├ر & Pr├صncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barth├رlemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(243,'UN','United Nations'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_state_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `default_name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `default_name` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,244,'US','AL','Alabama'),(2,244,'US','AK','Alaska'),(3,244,'US','AS','American Samoa'),(4,244,'US','AZ','Arizona'),(5,244,'US','AR','Arkansas'),(6,244,'US','AE','Armed Forces Africa'),(7,244,'US','AA','Armed Forces Americas'),(8,244,'US','AE','Armed Forces Canada'),(9,244,'US','AE','Armed Forces Europe'),(10,244,'US','AE','Armed Forces Middle East'),(11,244,'US','AP','Armed Forces Pacific'),(12,244,'US','CA','California'),(13,244,'US','CO','Colorado'),(14,244,'US','CT','Connecticut'),(15,244,'US','DE','Delaware'),(16,244,'US','DC','District of Columbia'),(17,244,'US','FM','Federated States Of Micronesia'),(18,244,'US','FL','Florida'),(19,244,'US','GA','Georgia'),(20,244,'US','GU','Guam'),(21,244,'US','HI','Hawaii'),(22,244,'US','ID','Idaho'),(23,244,'US','IL','Illinois'),(24,244,'US','IN','Indiana'),(25,244,'US','IA','Iowa'),(26,244,'US','KS','Kansas'),(27,244,'US','KY','Kentucky'),(28,244,'US','LA','Louisiana'),(29,244,'US','ME','Maine'),(30,244,'US','MH','Marshall Islands'),(31,244,'US','MD','Maryland'),(32,244,'US','MA','Massachusetts'),(33,244,'US','MI','Michigan'),(34,244,'US','MN','Minnesota'),(35,244,'US','MS','Mississippi'),(36,244,'US','MO','Missouri'),(37,244,'US','MT','Montana'),(38,244,'US','NE','Nebraska'),(39,244,'US','NV','Nevada'),(40,244,'US','NH','New Hampshire'),(41,244,'US','NJ','New Jersey'),(42,244,'US','NM','New Mexico'),(43,244,'US','NY','New York'),(44,244,'US','NC','North Carolina'),(45,244,'US','ND','North Dakota'),(46,244,'US','MP','Northern Mariana Islands'),(47,244,'US','OH','Ohio'),(48,244,'US','OK','Oklahoma'),(49,244,'US','OR','Oregon'),(50,244,'US','PW','Palau'),(51,244,'US','PA','Pennsylvania'),(52,244,'US','PR','Puerto Rico'),(53,244,'US','RI','Rhode Island'),(54,244,'US','SC','South Carolina'),(55,244,'US','SD','South Dakota'),(56,244,'US','TN','Tennessee'),(57,244,'US','TX','Texas'),(58,244,'US','UT','Utah'),(59,244,'US','VT','Vermont'),(60,244,'US','VI','Virgin Islands'),(61,244,'US','VA','Virginia'),(62,244,'US','WA','Washington'),(63,244,'US','WV','West Virginia'),(64,244,'US','WI','Wisconsin'),(65,244,'US','WY','Wyoming'),(66,40,'CA','AB','Alberta'),(67,40,'CA','BC','British Columbia'),(68,40,'CA','MB','Manitoba'),(69,40,'CA','NL','Newfoundland and Labrador'),(70,40,'CA','NB','New Brunswick'),(71,40,'CA','NS','Nova Scotia'),(72,40,'CA','NT','Northwest Territories'),(73,40,'CA','NU','Nunavut'),(74,40,'CA','ON','Ontario'),(75,40,'CA','PE','Prince Edward Island'),(76,40,'CA','QC','Quebec'),(77,40,'CA','SK','Saskatchewan'),(78,40,'CA','YT','Yukon Territory'),(79,88,'DE','NDS','Niedersachsen'),(80,88,'DE','BAW','Baden-W├╝rttemberg'),(81,88,'DE','BAY','Bayern'),(82,88,'DE','BER','Berlin'),(83,88,'DE','BRG','Brandenburg'),(84,88,'DE','BRE','Bremen'),(85,88,'DE','HAM','Hamburg'),(86,88,'DE','HES','Hessen'),(87,88,'DE','MEC','Mecklenburg-Vorpommern'),(88,88,'DE','NRW','Nordrhein-Westfalen'),(89,88,'DE','RHE','Rheinland-Pfalz'),(90,88,'DE','SAR','Saarland'),(91,88,'DE','SAS','Sachsen'),(92,88,'DE','SAC','Sachsen-Anhalt'),(93,88,'DE','SCN','Schleswig-Holstein'),(94,88,'DE','THE','Th├╝ringen'),(95,16,'AT','WI','Wien'),(96,16,'AT','NO','Nieder├╢sterreich'),(97,16,'AT','OO','Ober├╢sterreich'),(98,16,'AT','SB','Salzburg'),(99,16,'AT','KN','K├جrnten'),(100,16,'AT','ST','Steiermark'),(101,16,'AT','TI','Tirol'),(102,16,'AT','BL','Burgenland'),(103,16,'AT','VB','Vorarlberg'),(104,220,'CH','AG','Aargau'),(105,220,'CH','AI','Appenzell Innerrhoden'),(106,220,'CH','AR','Appenzell Ausserrhoden'),(107,220,'CH','BE','Bern'),(108,220,'CH','BL','Basel-Landschaft'),(109,220,'CH','BS','Basel-Stadt'),(110,220,'CH','FR','Freiburg'),(111,220,'CH','GE','Genf'),(112,220,'CH','GL','Glarus'),(113,220,'CH','GR','Graub├╝nden'),(114,220,'CH','JU','Jura'),(115,220,'CH','LU','Luzern'),(116,220,'CH','NE','Neuenburg'),(117,220,'CH','NW','Nidwalden'),(118,220,'CH','OW','Obwalden'),(119,220,'CH','SG','St. Gallen'),(120,220,'CH','SH','Schaffhausen'),(121,220,'CH','SO','Solothurn'),(122,220,'CH','SZ','Schwyz'),(123,220,'CH','TG','Thurgau'),(124,220,'CH','TI','Tessin'),(125,220,'CH','UR','Uri'),(126,220,'CH','VD','Waadt'),(127,220,'CH','VS','Wallis'),(128,220,'CH','ZG','Zug'),(129,220,'CH','ZH','Z├╝rich'),(130,206,'ES','A Coru╤a','A Coru├▒a'),(131,206,'ES','Alava','Alava'),(132,206,'ES','Albacete','Albacete'),(133,206,'ES','Alicante','Alicante'),(134,206,'ES','Almeria','Almeria'),(135,206,'ES','Asturias','Asturias'),(136,206,'ES','Avila','Avila'),(137,206,'ES','Badajoz','Badajoz'),(138,206,'ES','Baleares','Baleares'),(139,206,'ES','Barcelona','Barcelona'),(140,206,'ES','Burgos','Burgos'),(141,206,'ES','Caceres','Caceres'),(142,206,'ES','Cadiz','Cadiz'),(143,206,'ES','Cantabria','Cantabria'),(144,206,'ES','Castellon','Castellon'),(145,206,'ES','Ceuta','Ceuta'),(146,206,'ES','Ciudad Real','Ciudad Real'),(147,206,'ES','Cordoba','Cordoba'),(148,206,'ES','Cuenca','Cuenca'),(149,206,'ES','Girona','Girona'),(150,206,'ES','Granada','Granada'),(151,206,'ES','Guadalajara','Guadalajara'),(152,206,'ES','Guipuzcoa','Guipuzcoa'),(153,206,'ES','Huelva','Huelva'),(154,206,'ES','Huesca','Huesca'),(155,206,'ES','Jaen','Jaen'),(156,206,'ES','La Rioja','La Rioja'),(157,206,'ES','Las Palmas','Las Palmas'),(158,206,'ES','Leon','Leon'),(159,206,'ES','Lleida','Lleida'),(160,206,'ES','Lugo','Lugo'),(161,206,'ES','Madrid','Madrid'),(162,206,'ES','Malaga','Malaga'),(163,206,'ES','Melilla','Melilla'),(164,206,'ES','Murcia','Murcia'),(165,206,'ES','Navarra','Navarra'),(166,206,'ES','Ourense','Ourense'),(167,206,'ES','Palencia','Palencia'),(168,206,'ES','Pontevedra','Pontevedra'),(169,206,'ES','Salamanca','Salamanca'),(170,206,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,206,'ES','Segovia','Segovia'),(172,206,'ES','Sevilla','Sevilla'),(173,206,'ES','Soria','Soria'),(174,206,'ES','Tarragona','Tarragona'),(175,206,'ES','Teruel','Teruel'),(176,206,'ES','Toledo','Toledo'),(177,206,'ES','Valencia','Valencia'),(178,206,'ES','Valladolid','Valladolid'),(179,206,'ES','Vizcaya','Vizcaya'),(180,206,'ES','Zamora','Zamora'),(181,206,'ES','Zaragoza','Zaragoza'),(182,81,'FR','1','Ain'),(183,81,'FR','2','Aisne'),(184,81,'FR','3','Allier'),(185,81,'FR','4','Alpes-de-Haute-Provence'),(186,81,'FR','5','Hautes-Alpes'),(187,81,'FR','6','Alpes-Maritimes'),(188,81,'FR','7','Ard├ذche'),(189,81,'FR','8','Ardennes'),(190,81,'FR','9','Ari├ذge'),(191,81,'FR','10','Aube'),(192,81,'FR','11','Aude'),(193,81,'FR','12','Aveyron'),(194,81,'FR','13','Bouches-du-Rh├┤ne'),(195,81,'FR','14','Calvados'),(196,81,'FR','15','Cantal'),(197,81,'FR','16','Charente'),(198,81,'FR','17','Charente-Maritime'),(199,81,'FR','18','Cher'),(200,81,'FR','19','Corr├ذze'),(201,81,'FR','2A','Corse-du-Sud'),(202,81,'FR','2B','Haute-Corse'),(203,81,'FR','21','C├┤te-d\'Or'),(204,81,'FR','22','C├┤tes-d\'Armor'),(205,81,'FR','23','Creuse'),(206,81,'FR','24','Dordogne'),(207,81,'FR','25','Doubs'),(208,81,'FR','26','Dr├┤me'),(209,81,'FR','27','Eure'),(210,81,'FR','28','Eure-et-Loir'),(211,81,'FR','29','Finist├ذre'),(212,81,'FR','30','Gard'),(213,81,'FR','31','Haute-Garonne'),(214,81,'FR','32','Gers'),(215,81,'FR','33','Gironde'),(216,81,'FR','34','H├رrault'),(217,81,'FR','35','Ille-et-Vilaine'),(218,81,'FR','36','Indre'),(219,81,'FR','37','Indre-et-Loire'),(220,81,'FR','38','Is├ذre'),(221,81,'FR','39','Jura'),(222,81,'FR','40','Landes'),(223,81,'FR','41','Loir-et-Cher'),(224,81,'FR','42','Loire'),(225,81,'FR','43','Haute-Loire'),(226,81,'FR','44','Loire-Atlantique'),(227,81,'FR','45','Loiret'),(228,81,'FR','46','Lot'),(229,81,'FR','47','Lot-et-Garonne'),(230,81,'FR','48','Loz├ذre'),(231,81,'FR','49','Maine-et-Loire'),(232,81,'FR','50','Manche'),(233,81,'FR','51','Marne'),(234,81,'FR','52','Haute-Marne'),(235,81,'FR','53','Mayenne'),(236,81,'FR','54','Meurthe-et-Moselle'),(237,81,'FR','55','Meuse'),(238,81,'FR','56','Morbihan'),(239,81,'FR','57','Moselle'),(240,81,'FR','58','Ni├ذvre'),(241,81,'FR','59','Nord'),(242,81,'FR','60','Oise'),(243,81,'FR','61','Orne'),(244,81,'FR','62','Pas-de-Calais'),(245,81,'FR','63','Puy-de-D├┤me'),(246,81,'FR','64','Pyr├رn├رes-Atlantiques'),(247,81,'FR','65','Hautes-Pyr├رn├رes'),(248,81,'FR','66','Pyr├رn├رes-Orientales'),(249,81,'FR','67','Bas-Rhin'),(250,81,'FR','68','Haut-Rhin'),(251,81,'FR','69','Rh├┤ne'),(252,81,'FR','70','Haute-Sa├┤ne'),(253,81,'FR','71','Sa├┤ne-et-Loire'),(254,81,'FR','72','Sarthe'),(255,81,'FR','73','Savoie'),(256,81,'FR','74','Haute-Savoie'),(257,81,'FR','75','Paris'),(258,81,'FR','76','Seine-Maritime'),(259,81,'FR','77','Seine-et-Marne'),(260,81,'FR','78','Yvelines'),(261,81,'FR','79','Deux-S├ذvres'),(262,81,'FR','80','Somme'),(263,81,'FR','81','Tarn'),(264,81,'FR','82','Tarn-et-Garonne'),(265,81,'FR','83','Var'),(266,81,'FR','84','Vaucluse'),(267,81,'FR','85','Vend├رe'),(268,81,'FR','86','Vienne'),(269,81,'FR','87','Haute-Vienne'),(270,81,'FR','88','Vosges'),(271,81,'FR','89','Yonne'),(272,81,'FR','90','Territoire-de-Belfort'),(273,81,'FR','91','Essonne'),(274,81,'FR','92','Hauts-de-Seine'),(275,81,'FR','93','Seine-Saint-Denis'),(276,81,'FR','94','Val-de-Marne'),(277,81,'FR','95','Val-d\'Oise'),(278,185,'RO','AB','Alba'),(279,185,'RO','AR','Arad'),(280,185,'RO','AG','Arge┼ا'),(281,185,'RO','BC','Bac─âu'),(282,185,'RO','BH','Bihor'),(283,185,'RO','BN','Bistri┼ثa-N─âs─âud'),(284,185,'RO','BT','Boto┼اani'),(285,185,'RO','BV','Bra┼اov'),(286,185,'RO','BR','Br─âila'),(287,185,'RO','B','Bucure┼اti'),(288,185,'RO','BZ','Buz─âu'),(289,185,'RO','CS','Cara┼ا-Severin'),(290,185,'RO','CL','C─âl─âra┼اi'),(291,185,'RO','CJ','Cluj'),(292,185,'RO','CT','Constan┼ثa'),(293,185,'RO','CV','Covasna'),(294,185,'RO','DB','D├تmbovi┼ثa'),(295,185,'RO','DJ','Dolj'),(296,185,'RO','GL','Gala┼ثi'),(297,185,'RO','GR','Giurgiu'),(298,185,'RO','GJ','Gorj'),(299,185,'RO','HR','Harghita'),(300,185,'RO','HD','Hunedoara'),(301,185,'RO','IL','Ialomi┼ثa'),(302,185,'RO','IS','Ia┼اi'),(303,185,'RO','IF','Ilfov'),(304,185,'RO','MM','Maramure┼ا'),(305,185,'RO','MH','Mehedin┼ثi'),(306,185,'RO','MS','Mure┼ا'),(307,185,'RO','NT','Neam┼ث'),(308,185,'RO','OT','Olt'),(309,185,'RO','PH','Prahova'),(310,185,'RO','SM','Satu-Mare'),(311,185,'RO','SJ','S─âlaj'),(312,185,'RO','SB','Sibiu'),(313,185,'RO','SV','Suceava'),(314,185,'RO','TR','Teleorman'),(315,185,'RO','TM','Timi┼ا'),(316,185,'RO','TL','Tulcea'),(317,185,'RO','VS','Vaslui'),(318,185,'RO','VL','V├تlcea'),(319,185,'RO','VN','Vrancea'),(320,80,'FI','Lappi','Lappi'),(321,80,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,80,'FI','Kainuu','Kainuu'),(323,80,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,80,'FI','Pohjois-Savo','Pohjois-Savo'),(325,80,'FI','Etel├ج-Savo','Etel├ج-Savo'),(326,80,'FI','Etel├ج-Pohjanmaa','Etel├ج-Pohjanmaa'),(327,80,'FI','Pohjanmaa','Pohjanmaa'),(328,80,'FI','Pirkanmaa','Pirkanmaa'),(329,80,'FI','Satakunta','Satakunta'),(330,80,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,80,'FI','Keski-Suomi','Keski-Suomi'),(332,80,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,80,'FI','Etel├ج-Karjala','Etel├ج-Karjala'),(334,80,'FI','P├جij├جt-H├جme','P├جij├جt-H├جme'),(335,80,'FI','Kanta-H├جme','Kanta-H├جme'),(336,80,'FI','Uusimaa','Uusimaa'),(337,80,'FI','It├ج-Uusimaa','It├ج-Uusimaa'),(338,80,'FI','Kymenlaakso','Kymenlaakso'),(339,80,'FI','Ahvenanmaa','Ahvenanmaa'),(340,74,'EE','EE-37','Harjumaa'),(341,74,'EE','EE-39','Hiiumaa'),(342,74,'EE','EE-44','Ida-Virumaa'),(343,74,'EE','EE-49','J├╡gevamaa'),(344,74,'EE','EE-51','J├جrvamaa'),(345,74,'EE','EE-57','L├ج├جnemaa'),(346,74,'EE','EE-59','L├ج├جne-Virumaa'),(347,74,'EE','EE-65','P├╡lvamaa'),(348,74,'EE','EE-67','P├جrnumaa'),(349,74,'EE','EE-70','Raplamaa'),(350,74,'EE','EE-74','Saaremaa'),(351,74,'EE','EE-78','Tartumaa'),(352,74,'EE','EE-82','Valgamaa'),(353,74,'EE','EE-84','Viljandimaa'),(354,74,'EE','EE-86','V├╡rumaa'),(355,125,'LV','LV-DGV','Daugavpils'),(356,125,'LV','LV-JEL','Jelgava'),(357,125,'LV','J─ôkabpils','J─ôkabpils'),(358,125,'LV','LV-JUR','J┼سrmala'),(359,125,'LV','LV-LPX','Liep─ja'),(360,125,'LV','LV-LE','Liep─jas novads'),(361,125,'LV','LV-REZ','R─ôzekne'),(362,125,'LV','LV-RIX','R─سga'),(363,125,'LV','LV-RI','R─سgas novads'),(364,125,'LV','Valmiera','Valmiera'),(365,125,'LV','LV-VEN','Ventspils'),(366,125,'LV','Aglonas novads','Aglonas novads'),(367,125,'LV','LV-AI','Aizkraukles novads'),(368,125,'LV','Aizputes novads','Aizputes novads'),(369,125,'LV','Akn─سstes novads','Akn─سstes novads'),(370,125,'LV','Alojas novads','Alojas novads'),(371,125,'LV','Alsungas novads','Alsungas novads'),(372,125,'LV','LV-AL','Al┼سksnes novads'),(373,125,'LV','Amatas novads','Amatas novads'),(374,125,'LV','Apes novads','Apes novads'),(375,125,'LV','Auces novads','Auces novads'),(376,125,'LV','Bab─سtes novads','Bab─سtes novads'),(377,125,'LV','Baldones novads','Baldones novads'),(378,125,'LV','Baltinavas novads','Baltinavas novads'),(379,125,'LV','LV-BL','Balvu novads'),(380,125,'LV','LV-BU','Bauskas novads'),(381,125,'LV','Bever─سnas novads','Bever─سnas novads'),(382,125,'LV','Broc─ônu novads','Broc─ônu novads'),(383,125,'LV','Burtnieku novads','Burtnieku novads'),(384,125,'LV','Carnikavas novads','Carnikavas novads'),(385,125,'LV','Cesvaines novads','Cesvaines novads'),(386,125,'LV','Ciblas novads','Ciblas novads'),(387,125,'LV','LV-CE','C─ôsu novads'),(388,125,'LV','Dagdas novads','Dagdas novads'),(389,125,'LV','LV-DA','Daugavpils novads'),(390,125,'LV','LV-DO','Dobeles novads'),(391,125,'LV','Dundagas novads','Dundagas novads'),(392,125,'LV','Durbes novads','Durbes novads'),(393,125,'LV','Engures novads','Engures novads'),(394,125,'LV','Garkalnes novads','Garkalnes novads'),(395,125,'LV','Grobi┼as novads','Grobi┼as novads'),(396,125,'LV','LV-GU','Gulbenes novads'),(397,125,'LV','Iecavas novads','Iecavas novads'),(398,125,'LV','Ik┼ة─╖iles novads','Ik┼ة─╖iles novads'),(399,125,'LV','Il┼سkstes novads','Il┼سkstes novads'),(400,125,'LV','In─ukalna novads','In─ukalna novads'),(401,125,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,125,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,125,'LV','Jaunpils novads','Jaunpils novads'),(404,125,'LV','LV-JL','Jelgavas novads'),(405,125,'LV','LV-JK','J─ôkabpils novads'),(406,125,'LV','Kandavas novads','Kandavas novads'),(407,125,'LV','Kokneses novads','Kokneses novads'),(408,125,'LV','Krimuldas novads','Krimuldas novads'),(409,125,'LV','Krustpils novads','Krustpils novads'),(410,125,'LV','LV-KR','Kr─slavas novads'),(411,125,'LV','LV-KU','Kuld─سgas novads'),(412,125,'LV','K─rsavas novads','K─rsavas novads'),(413,125,'LV','Lielv─rdes novads','Lielv─rdes novads'),(414,125,'LV','LV-LM','Limba┼╛u novads'),(415,125,'LV','Lub─nas novads','Lub─nas novads'),(416,125,'LV','LV-LU','Ludzas novads'),(417,125,'LV','L─سgatnes novads','L─سgatnes novads'),(418,125,'LV','L─سv─nu novads','L─سv─nu novads'),(419,125,'LV','LV-MA','Madonas novads'),(420,125,'LV','Mazsalacas novads','Mazsalacas novads'),(421,125,'LV','M─lpils novads','M─lpils novads'),(422,125,'LV','M─rupes novads','M─rupes novads'),(423,125,'LV','Nauk┼ة─ônu novads','Nauk┼ة─ônu novads'),(424,125,'LV','Neretas novads','Neretas novads'),(425,125,'LV','N─سcas novads','N─سcas novads'),(426,125,'LV','LV-OG','Ogres novads'),(427,125,'LV','Olaines novads','Olaines novads'),(428,125,'LV','Ozolnieku novads','Ozolnieku novads'),(429,125,'LV','LV-PR','Prei─╝u novads'),(430,125,'LV','Priekules novads','Priekules novads'),(431,125,'LV','Prieku─╝u novads','Prieku─╝u novads'),(432,125,'LV','P─rgaujas novads','P─rgaujas novads'),(433,125,'LV','P─vilostas novads','P─vilostas novads'),(434,125,'LV','P─╝avi┼u novads','P─╝avi┼u novads'),(435,125,'LV','Raunas novads','Raunas novads'),(436,125,'LV','Riebi┼u novads','Riebi┼u novads'),(437,125,'LV','Rojas novads','Rojas novads'),(438,125,'LV','Ropa┼╛u novads','Ropa┼╛u novads'),(439,125,'LV','Rucavas novads','Rucavas novads'),(440,125,'LV','Rug─ju novads','Rug─ju novads'),(441,125,'LV','Rund─les novads','Rund─les novads'),(442,125,'LV','LV-RE','R─ôzeknes novads'),(443,125,'LV','R┼سjienas novads','R┼سjienas novads'),(444,125,'LV','Salacgr─سvas novads','Salacgr─سvas novads'),(445,125,'LV','Salas novads','Salas novads'),(446,125,'LV','Salaspils novads','Salaspils novads'),(447,125,'LV','LV-SA','Saldus novads'),(448,125,'LV','Saulkrastu novads','Saulkrastu novads'),(449,125,'LV','Siguldas novads','Siguldas novads'),(450,125,'LV','Skrundas novads','Skrundas novads'),(451,125,'LV','Skr─سveru novads','Skr─سveru novads'),(452,125,'LV','Smiltenes novads','Smiltenes novads'),(453,125,'LV','Stopi┼u novads','Stopi┼u novads'),(454,125,'LV','Stren─u novads','Stren─u novads'),(455,125,'LV','S─ôjas novads','S─ôjas novads'),(456,125,'LV','LV-TA','Talsu novads'),(457,125,'LV','LV-TU','Tukuma novads'),(458,125,'LV','T─ôrvetes novads','T─ôrvetes novads'),(459,125,'LV','Vai┼odes novads','Vai┼odes novads'),(460,125,'LV','LV-VK','Valkas novads'),(461,125,'LV','LV-VM','Valmieras novads'),(462,125,'LV','Varak─╝─nu novads','Varak─╝─nu novads'),(463,125,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,125,'LV','Vecumnieku novads','Vecumnieku novads'),(465,125,'LV','LV-VE','Ventspils novads'),(466,125,'LV','Vies─سtes novads','Vies─سtes novads'),(467,125,'LV','Vi─╝akas novads','Vi─╝akas novads'),(468,125,'LV','Vi─╝─nu novads','Vi─╝─nu novads'),(469,125,'LV','V─rkavas novads','V─rkavas novads'),(470,125,'LV','Zilupes novads','Zilupes novads'),(471,125,'LV','─da┼╛u novads','─da┼╛u novads'),(472,125,'LV','─ْrg─╝u novads','─ْrg─╝u novads'),(473,125,'LV','─╢eguma novads','─╢eguma novads'),(474,125,'LV','─╢ekavas novads','─╢ekavas novads'),(475,131,'LT','LT-AL','Alytaus Apskritis'),(476,131,'LT','LT-KU','Kauno Apskritis'),(477,131,'LT','LT-KL','Klaip─ùdos Apskritis'),(478,131,'LT','LT-MR','Marijampol─ùs Apskritis'),(479,131,'LT','LT-PN','Panev─ù┼╛io Apskritis'),(480,131,'LT','LT-SA','┼بiauli┼│ Apskritis'),(481,131,'LT','LT-TA','Taurag─ùs Apskritis'),(482,131,'LT','LT-TE','Tel┼ةi┼│ Apskritis'),(483,131,'LT','LT-UT','Utenos Apskritis'),(484,131,'LT','LT-VL','Vilniaus Apskritis'),(485,31,'BR','AC','Acre'),(486,31,'BR','AL','Alagoas'),(487,31,'BR','AP','Amap├ة'),(488,31,'BR','AM','Amazonas'),(489,31,'BR','BA','Bahia'),(490,31,'BR','CE','Cear├ة'),(491,31,'BR','ES','Esp├صrito Santo'),(492,31,'BR','GO','Goi├ةs'),(493,31,'BR','MA','Maranh├ثo'),(494,31,'BR','MT','Mato Grosso'),(495,31,'BR','MS','Mato Grosso do Sul'),(496,31,'BR','MG','Minas Gerais'),(497,31,'BR','PA','Par├ة'),(498,31,'BR','PB','Para├صba'),(499,31,'BR','PR','Paran├ة'),(500,31,'BR','PE','Pernambuco'),(501,31,'BR','PI','Piau├ص'),(502,31,'BR','RJ','Rio de Janeiro'),(503,31,'BR','RN','Rio Grande do Norte'),(504,31,'BR','RS','Rio Grande do Sul'),(505,31,'BR','RO','Rond├┤nia'),(506,31,'BR','RR','Roraima'),(507,31,'BR','SC','Santa Catarina'),(508,31,'BR','SP','S├ثo Paulo'),(509,31,'BR','SE','Sergipe'),(510,31,'BR','TO','Tocantins'),(511,31,'BR','DF','Distrito Federal'),(512,59,'HR','HR-01','Zagreba─ka ┼╛upanija'),(513,59,'HR','HR-02','Krapinsko-zagorska ┼╛upanija'),(514,59,'HR','HR-03','Sisa─ko-moslava─ka ┼╛upanija'),(515,59,'HR','HR-04','Karlova─ka ┼╛upanija'),(516,59,'HR','HR-05','Vara┼╛dinska ┼╛upanija'),(517,59,'HR','HR-06','Koprivni─ko-kri┼╛eva─ka ┼╛upanija'),(518,59,'HR','HR-07','Bjelovarsko-bilogorska ┼╛upanija'),(519,59,'HR','HR-08','Primorsko-goranska ┼╛upanija'),(520,59,'HR','HR-09','Li─ko-senjska ┼╛upanija'),(521,59,'HR','HR-10','Viroviti─ko-podravska ┼╛upanija'),(522,59,'HR','HR-11','Po┼╛e┼ةko-slavonska ┼╛upanija'),(523,59,'HR','HR-12','Brodsko-posavska ┼╛upanija'),(524,59,'HR','HR-13','Zadarska ┼╛upanija'),(525,59,'HR','HR-14','Osje─ko-baranjska ┼╛upanija'),(526,59,'HR','HR-15','┼بibensko-kninska ┼╛upanija'),(527,59,'HR','HR-16','Vukovarsko-srijemska ┼╛upanija'),(528,59,'HR','HR-17','Splitsko-dalmatinska ┼╛upanija'),(529,59,'HR','HR-18','Istarska ┼╛upanija'),(530,59,'HR','HR-19','Dubrova─ko-neretvanska ┼╛upanija'),(531,59,'HR','HR-20','Me─ّimurska ┼╛upanija'),(532,59,'HR','HR-21','Grad Zagreb'),(533,106,'IN','AN','Andaman and Nicobar Islands'),(534,106,'IN','AP','Andhra Pradesh'),(535,106,'IN','AR','Arunachal Pradesh'),(536,106,'IN','AS','Assam'),(537,106,'IN','BR','Bihar'),(538,106,'IN','CH','Chandigarh'),(539,106,'IN','CT','Chhattisgarh'),(540,106,'IN','DN','Dadra and Nagar Haveli'),(541,106,'IN','DD','Daman and Diu'),(542,106,'IN','DL','Delhi'),(543,106,'IN','GA','Goa'),(544,106,'IN','GJ','Gujarat'),(545,106,'IN','HR','Haryana'),(546,106,'IN','HP','Himachal Pradesh'),(547,106,'IN','JK','Jammu and Kashmir'),(548,106,'IN','JH','Jharkhand'),(549,106,'IN','KA','Karnataka'),(550,106,'IN','KL','Kerala'),(551,106,'IN','LD','Lakshadweep'),(552,106,'IN','MP','Madhya Pradesh'),(553,106,'IN','MH','Maharashtra'),(554,106,'IN','MN','Manipur'),(555,106,'IN','ML','Meghalaya'),(556,106,'IN','MZ','Mizoram'),(557,106,'IN','NL','Nagaland'),(558,106,'IN','OR','Odisha'),(559,106,'IN','PY','Puducherry'),(560,106,'IN','PB','Punjab'),(561,106,'IN','RJ','Rajasthan'),(562,106,'IN','SK','Sikkim'),(563,106,'IN','TN','Tamil Nadu'),(564,106,'IN','TG','Telangana'),(565,106,'IN','TR','Tripura'),(566,106,'IN','UP','Uttar Pradesh'),(567,106,'IN','UT','Uttarakhand'),(568,106,'IN','WB','West Bengal'),(569,176,'PY','PY-16','Alto Paraguay'),(570,176,'PY','PY-10','Alto Paran├ة'),(571,176,'PY','PY-13','Amambay'),(572,176,'PY','PY-ASU','Asunci├│n'),(573,176,'PY','PY-19','Boquer├│n'),(574,176,'PY','PY-5','Caaguaz├║'),(575,176,'PY','PY-6','Caazap├ة'),(576,176,'PY','PY-14','Canindey├║'),(577,176,'PY','PY-11','Central'),(578,176,'PY','PY-1','Concepci├│n'),(579,176,'PY','PY-3','Cordillera'),(580,176,'PY','PY-4','Guair├ة'),(581,176,'PY','PY-7','Itap├║a'),(582,176,'PY','PY-8','Misiones'),(583,176,'PY','PY-9','Paraguar├ص'),(584,176,'PY','PY-15','Presidente Hayes'),(585,176,'PY','PY-2','San Pedro'),(586,176,'PY','PY-12','├ّeembuc├║');
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `decimal` int(10) unsigned NOT NULL DEFAULT 2,
  `group_separator` varchar(191) NOT NULL DEFAULT ',',
  `decimal_separator` varchar(191) NOT NULL DEFAULT '.',
  `currency_position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','United States Dollar','$',2,',','.',NULL,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'guest','Guest',0,NULL,NULL),(2,'general','General',0,NULL,NULL),(3,'wholesale','Wholesale',0,NULL,NULL);
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notes`
--

DROP TABLE IF EXISTS `customer_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `note` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notes`
--

LOCK TABLES `customer_notes` WRITE;
/*!40000 ALTER TABLE `customer_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `provider_name` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'osama','sayed',NULL,NULL,'osama@example.com',NULL,NULL,1,'$2y$10$k04/EyO4KVZNOdjd27ZOxu4vFLb9wnPJyLzNLIi1SQafn2pJtYj06','xNsFxtbDKFgR8oB5lrXJV1Z28MpNKFT5nMLcq9pN9vr5gnTzTHqjGURFc3qcSp9nqGbikNuQgbj0Vnh1',1,1,0,1,0,'a4f61c279a7c8db014a242e65a2e85c4',NULL,'2024-12-09 06:20:00','2024-12-09 06:20:00'),(2,'osamaa','sayed',NULL,NULL,'osamaa@example.com',NULL,NULL,1,'$2y$10$lJXGDOTv87nJUMtNqquqxu9FaghrVwBCHzFrhtN3lOq6Iuzx2cilK','mgE5TqVoHVK1vRltYiu5oeDarAHSaYOiqa2rKEerpYcqiLSPjdFvtAfqn2AkNwpjHln8CCqE673Tyx92',1,1,0,1,0,'d78a7c50d76fee7d48a8f61159d1e4b9',NULL,'2024-12-11 03:09:42','2024-12-11 03:09:42'),(3,'osamaaa','sayed',NULL,NULL,'o.b.27112016@gmail.com',NULL,NULL,1,'$2y$10$oKL04MruIzaMUsPcMcX5ZeUhzeMZlg4kCAmOEhjGrVp8r0gvOqM8W','ZNJf4FKesPOrF97dVCbqFkH7J4v7RishhsbPfcfJnlY0RWPTxkjkTtUCIb1UOQ8J8KDnZjwnIxIVRKFP',1,1,0,1,0,'694813b8fb1b8f98cfcb34b838a42734',NULL,'2024-12-11 06:57:47','2024-12-11 06:57:47');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datagrid_saved_filters`
--

DROP TABLE IF EXISTS `datagrid_saved_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datagrid_saved_filters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `src` varchar(191) NOT NULL,
  `applied` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`applied`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datagrid_saved_filters`
--

LOCK TABLES `datagrid_saved_filters` WRITE;
/*!40000 ALTER TABLE `datagrid_saved_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `datagrid_saved_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT 0,
  `download_used` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned NOT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_batches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) NOT NULL DEFAULT 'pending',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `import_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(191) NOT NULL,
  `action` varchar(191) NOT NULL,
  `validation_strategy` varchar(191) NOT NULL,
  `allowed_errors` int(11) NOT NULL DEFAULT 0,
  `processed_rows_count` int(11) NOT NULL DEFAULT 0,
  `invalid_rows_count` int(11) NOT NULL DEFAULT 0,
  `errors_count` int(11) NOT NULL DEFAULT 0,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`errors`)),
  `field_separator` varchar(191) NOT NULL,
  `file_path` varchar(191) NOT NULL,
  `images_directory_path` varchar(191) DEFAULT NULL,
  `error_file_path` varchar(191) DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `contact_fax` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `street` varchar(191) NOT NULL,
  `postcode` varchar(191) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Default',NULL,'Default','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) unsigned DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English','ltr','locales/sM9nhh4yt2sRC1CWPWjdEo1GvMBONPiEOELE7gmC.png',NULL,NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `mail_to` varchar(191) NOT NULL,
  `spooling` varchar(191) DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `marketing_template_id` int(10) unsigned DEFAULT NULL,
  `marketing_event_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Birthday','Birthday',NULL,NULL,NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_templates`
--

DROP TABLE IF EXISTS `marketing_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_templates`
--

LOCK TABLES `marketing_templates` WRITE;
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_27_065727_create_products_table',1),(23,'2018_07_27_070011_create_product_attribute_values_table',1),(24,'2018_07_27_092623_create_product_reviews_table',1),(25,'2018_07_27_113941_create_product_images_table',1),(26,'2018_07_27_113956_create_product_inventories_table',1),(27,'2018_08_30_064755_create_tax_categories_table',1),(28,'2018_08_30_065042_create_tax_rates_table',1),(29,'2018_08_30_065840_create_tax_mappings_table',1),(30,'2018_09_05_150444_create_cart_table',1),(31,'2018_09_05_150915_create_cart_items_table',1),(32,'2018_09_11_064045_customer_password_resets',1),(33,'2018_09_19_093453_create_cart_payment',1),(34,'2018_09_19_093508_create_cart_shipping_rates_table',1),(35,'2018_09_20_060658_create_core_config_table',1),(36,'2018_09_27_113154_create_orders_table',1),(37,'2018_09_27_113207_create_order_items_table',1),(38,'2018_09_27_115022_create_shipments_table',1),(39,'2018_09_27_115029_create_shipment_items_table',1),(40,'2018_09_27_115135_create_invoices_table',1),(41,'2018_09_27_115144_create_invoice_items_table',1),(42,'2018_10_01_095504_create_order_payment_table',1),(43,'2018_10_03_025230_create_wishlist_table',1),(44,'2018_10_12_101803_create_country_translations_table',1),(45,'2018_10_12_101913_create_country_states_table',1),(46,'2018_10_12_101923_create_country_state_translations_table',1),(47,'2018_11_16_173504_create_subscribers_list_table',1),(48,'2018_11_21_144411_create_cart_item_inventories_table',1),(49,'2018_12_06_185202_create_product_flat_table',1),(50,'2018_12_24_123812_create_channel_inventory_sources_table',1),(51,'2018_12_26_165327_create_product_ordered_inventories_table',1),(52,'2019_05_13_024321_create_cart_rules_table',1),(53,'2019_05_13_024322_create_cart_rule_channels_table',1),(54,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(55,'2019_05_13_024324_create_cart_rule_translations_table',1),(56,'2019_05_13_024325_create_cart_rule_customers_table',1),(57,'2019_05_13_024326_create_cart_rule_coupons_table',1),(58,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(59,'2019_06_17_180258_create_product_downloadable_samples_table',1),(60,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(61,'2019_06_17_180325_create_product_downloadable_links_table',1),(62,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(63,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(64,'2019_07_30_153530_create_cms_pages_table',1),(65,'2019_07_31_143339_create_category_filterable_attributes_table',1),(66,'2019_08_02_105320_create_product_grouped_products_table',1),(67,'2019_08_20_170510_create_product_bundle_options_table',1),(68,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(69,'2019_08_20_170528_create_product_bundle_option_products_table',1),(70,'2019_09_11_184511_create_refunds_table',1),(71,'2019_09_11_184519_create_refund_items_table',1),(72,'2019_12_03_184613_create_catalog_rules_table',1),(73,'2019_12_03_184651_create_catalog_rule_channels_table',1),(74,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(75,'2019_12_06_101110_create_catalog_rule_products_table',1),(76,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(77,'2019_12_14_000001_create_personal_access_tokens_table',1),(78,'2020_01_14_191854_create_cms_page_translations_table',1),(79,'2020_01_15_130209_create_cms_page_channels_table',1),(80,'2020_04_16_185147_add_table_addresses',1),(81,'2020_05_06_171638_create_order_comments_table',1),(82,'2020_05_21_171500_create_product_customer_group_prices_table',1),(83,'2020_06_25_162154_create_customer_social_accounts_table',1),(84,'2020_11_19_112228_create_product_videos_table',1),(85,'2020_11_26_141455_create_marketing_templates_table',1),(86,'2020_11_26_150534_create_marketing_events_table',1),(87,'2020_11_26_150644_create_marketing_campaigns_table',1),(88,'2020_12_21_000200_create_channel_translations_table',1),(89,'2020_12_27_121950_create_jobs_table',1),(90,'2021_03_11_212124_create_order_transactions_table',1),(91,'2021_04_07_132010_create_product_review_images_table',1),(92,'2021_12_15_104544_notifications',1),(93,'2022_03_15_160510_create_failed_jobs_table',1),(94,'2022_04_01_094622_create_sitemaps_table',1),(95,'2022_10_03_144232_create_product_price_indices_table',1),(96,'2022_10_04_144444_create_job_batches_table',1),(97,'2022_10_08_134150_create_product_inventory_indices_table',1),(98,'2023_05_26_213105_create_wishlist_items_table',1),(99,'2023_05_26_213120_create_compare_items_table',1),(100,'2023_06_27_163529_rename_product_review_images_to_product_review_attachments',1),(101,'2023_07_06_140013_add_logo_path_column_to_locales',1),(102,'2023_07_10_184256_create_theme_customizations_table',1),(103,'2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table',1),(104,'2023_07_20_185324_add_column_column_in_attribute_groups_table',1),(105,'2023_07_25_145943_add_regex_column_in_attributes_table',1),(106,'2023_07_25_165945_drop_notes_column_from_customers_table',1),(107,'2023_07_25_171058_create_customer_notes_table',1),(108,'2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table',1),(109,'2023_09_15_170053_create_theme_customization_translations_table',1),(110,'2023_09_20_102031_add_default_value_column_in_attributes_table',1),(111,'2023_09_20_102635_add_inventories_group_in_attribute_groups_table',1),(112,'2023_09_26_155709_add_columns_to_currencies',1),(113,'2023_10_05_163612_create_visits_table',1),(114,'2023_10_12_090446_add_tax_category_id_column_in_order_items_table',1),(115,'2023_11_08_054614_add_code_column_in_attribute_groups_table',1),(116,'2023_11_08_140116_create_search_terms_table',1),(117,'2023_11_09_162805_create_url_rewrites_table',1),(118,'2023_11_17_150401_create_search_synonyms_table',1),(119,'2023_12_11_054614_add_channel_id_column_in_product_price_indices_table',1),(120,'2024_01_11_154640_create_imports_table',1),(121,'2024_01_11_154741_create_import_batches_table',1),(122,'2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table',1),(123,'2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table',1),(124,'2024_01_22_170814_add_unique_index_in_mapping_tables',1),(125,'2024_02_26_153000_add_columns_to_addresses_table',1),(126,'2024_03_07_193421_rename_address1_column_in_addresses_table',1),(127,'2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table',1),(128,'2024_04_19_102939_add_incl_tax_columns_in_orders_table',1),(129,'2024_04_19_135405_add_incl_tax_columns_in_cart_items_table',1),(130,'2024_04_19_144641_add_incl_tax_columns_in_order_items_table',1),(131,'2024_04_23_133154_add_incl_tax_columns_in_cart_table',1),(132,'2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table',1),(133,'2024_04_24_102939_add_incl_tax_columns_in_invoices_table',1),(134,'2024_04_24_102939_add_incl_tax_columns_in_refunds_table',1),(135,'2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table',1),(136,'2024_04_24_144641_add_incl_tax_columns_in_refund_items_table',1),(137,'2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table',1),(138,'2024_05_10_152848_create_saved_filters_table',1),(139,'2024_06_03_174128_create_product_channels_table',1),(140,'2024_06_04_130527_add_channel_id_column_in_customers_table',1),(141,'2024_06_04_134403_add_channel_id_column_in_visits_table',1),(142,'2024_06_13_184426_add_theme_column_into_theme_customizations_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (10,'order',1,10,'2024-12-11 05:54:59','2024-12-11 06:06:35'),(11,'order',0,11,'2024-12-17 08:47:08','2024-12-17 08:47:08'),(12,'order',0,12,'2024-12-17 09:05:45','2024-12-17 09:05:45'),(13,'order',0,13,'2024-12-17 09:15:49','2024-12-17 09:15:49'),(14,'order',0,14,'2024-12-17 09:21:55','2024-12-17 09:21:55');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
INSERT INTO `order_comments` VALUES (1,10,'ok',1,'2024-12-11 06:09:00','2024-12-11 06:09:00'),(2,10,'ok',0,'2024-12-11 08:20:55','2024-12-11 08:20:55');
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT 0.0000,
  `total_weight` decimal(12,4) DEFAULT 0.0000,
  `qty_ordered` int(11) DEFAULT 0,
  `qty_shipped` int(11) DEFAULT 0,
  `qty_invoiced` int(11) DEFAULT 0,
  `qty_canceled` int(11) DEFAULT 0,
  `qty_refunded` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (46,'118','simple','Winter clothing8',NULL,7.0000,7.0000,1,0,0,0,0,580.0000,580.0000,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,19,'Webkul\\Product\\Models\\Product',10,NULL,NULL,'{\"quantity\":1,\"product_id\":19,\"locale\":\"en\"}','2024-12-11 05:54:54','2024-12-11 05:54:54'),(47,'108','simple','Summer clothes8',NULL,2.5000,2.5000,1,0,0,0,0,630.0000,630.0000,630.0000,630.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,630.0000,630.0000,630.0000,630.0000,9,'Webkul\\Product\\Models\\Product',10,NULL,NULL,'{\"quantity\":1,\"product_id\":9,\"locale\":\"en\"}','2024-12-11 05:54:54','2024-12-11 05:54:54'),(48,'122','simple','Children\'s shoes2',NULL,1.5000,1.5000,1,0,0,0,0,160.0000,160.0000,160.0000,160.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,160.0000,160.0000,160.0000,160.0000,23,'Webkul\\Product\\Models\\Product',10,NULL,NULL,'{\"quantity\":1,\"product_id\":23,\"locale\":\"en\"}','2024-12-11 05:54:54','2024-12-11 05:54:54'),(49,'121','simple','Children\'s shoes1',NULL,1.5000,1.5000,1,0,0,0,0,135.0000,135.0000,135.0000,135.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,135.0000,135.0000,135.0000,135.0000,22,'Webkul\\Product\\Models\\Product',10,NULL,NULL,'{\"quantity\":1,\"product_id\":22,\"locale\":\"en\"}','2024-12-11 05:54:54','2024-12-11 05:54:54'),(50,'111','simple','Winter clothing1',NULL,3.0000,3.0000,1,0,0,0,0,177.0000,177.0000,177.0000,177.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,177.0000,177.0000,177.0000,177.0000,12,'Webkul\\Product\\Models\\Product',10,NULL,NULL,'{\"quantity\":1,\"product_id\":12,\"locale\":\"en\"}','2024-12-11 05:54:54','2024-12-11 05:54:54'),(51,'119','simple','Winter clothing9',NULL,7.0000,14.0000,2,0,0,0,0,799.0000,799.0000,1598.0000,1598.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,1598.0000,1598.0000,20,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":2,\"product_id\":20,\"locale\":\"en\"}','2024-12-17 08:46:57','2024-12-17 08:46:57'),(52,'107','simple','Summer clothes7',NULL,3.0000,6.0000,2,0,0,0,0,770.0000,770.0000,1540.0000,1540.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,1540.0000,1540.0000,8,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":2,\"product_id\":8,\"locale\":\"en\"}','2024-12-17 08:46:58','2024-12-17 08:46:58'),(53,'116','simple','Winter clothing6',NULL,6.0000,12.0000,2,0,0,0,0,645.0000,645.0000,1290.0000,1290.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,1290.0000,1290.0000,17,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":2,\"product_id\":17,\"locale\":\"en\"}','2024-12-17 08:46:58','2024-12-17 08:46:58'),(54,'109','simple','Summer clothes9',NULL,2.5000,5.0000,2,0,0,0,0,635.0000,635.0000,1270.0000,1270.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,1270.0000,1270.0000,10,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":2,\"product_id\":10,\"locale\":\"en\"}','2024-12-17 08:46:58','2024-12-17 08:46:58'),(55,'108','simple','Summer clothes8',NULL,2.5000,2.5000,1,0,0,0,0,630.0000,630.0000,630.0000,630.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,630.0000,630.0000,630.0000,630.0000,9,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":1,\"product_id\":9,\"locale\":\"en\"}','2024-12-17 08:46:58','2024-12-17 08:46:58'),(56,'120','simple','Winter clothing10',NULL,7.0000,7.0000,1,0,0,0,0,610.0000,610.0000,610.0000,610.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,610.0000,610.0000,610.0000,610.0000,21,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":1,\"product_id\":21,\"locale\":\"en\"}','2024-12-17 08:46:58','2024-12-17 08:46:58'),(57,'103','simple','Summer clothes4',NULL,2.0000,2.0000,1,0,0,0,0,580.0000,580.0000,580.0000,580.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,580.0000,580.0000,580.0000,580.0000,5,'Webkul\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":1,\"product_id\":5,\"locale\":\"en\"}','2024-12-17 08:46:58','2024-12-17 08:46:58'),(58,'119','simple','Winter clothing9',NULL,7.0000,7.0000,1,0,0,0,0,799.0000,799.0000,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,20,'Webkul\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":20,\"locale\":\"en\"}','2024-12-17 09:05:32','2024-12-17 09:05:32'),(59,'107','simple','Summer clothes7',NULL,3.0000,12.0000,4,0,0,0,0,770.0000,770.0000,3080.0000,3080.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,3080.0000,3080.0000,8,'Webkul\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":8,\"locale\":\"en\"}','2024-12-17 09:05:33','2024-12-17 09:05:33'),(60,'116','simple','Winter clothing6',NULL,6.0000,6.0000,1,0,0,0,0,645.0000,645.0000,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,17,'Webkul\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":17,\"locale\":\"en\"}','2024-12-17 09:05:34','2024-12-17 09:05:34'),(61,'109','simple','Summer clothes9',NULL,2.5000,2.5000,1,0,0,0,0,635.0000,635.0000,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,10,'Webkul\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":10,\"locale\":\"en\"}','2024-12-17 09:05:36','2024-12-17 09:05:36'),(62,'106','simple','Summer clothes6',NULL,3.0000,3.0000,1,0,0,0,0,550.0000,550.0000,550.0000,550.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,550.0000,550.0000,550.0000,550.0000,7,'Webkul\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":7,\"locale\":\"en\"}','2024-12-17 09:05:37','2024-12-17 09:05:37'),(63,'117','simple','Winter clothing7',NULL,7.0000,7.0000,1,0,0,0,0,520.0000,520.0000,520.0000,520.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,520.0000,520.0000,520.0000,520.0000,18,'Webkul\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":18,\"locale\":\"en\"}','2024-12-17 09:05:38','2024-12-17 09:05:38'),(64,'119','simple','Winter clothing9',NULL,7.0000,7.0000,1,0,0,0,0,799.0000,799.0000,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,20,'Webkul\\Product\\Models\\Product',13,NULL,NULL,'{\"quantity\":1,\"product_id\":20,\"locale\":\"en\"}','2024-12-17 09:15:43','2024-12-17 09:15:43'),(65,'107','simple','Summer clothes7',NULL,3.0000,3.0000,1,0,0,0,0,770.0000,770.0000,770.0000,770.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,770.0000,770.0000,8,'Webkul\\Product\\Models\\Product',13,NULL,NULL,'{\"quantity\":1,\"product_id\":8,\"locale\":\"en\"}','2024-12-17 09:15:44','2024-12-17 09:15:44'),(66,'116','simple','Winter clothing6',NULL,6.0000,6.0000,1,0,0,0,0,645.0000,645.0000,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,17,'Webkul\\Product\\Models\\Product',13,NULL,NULL,'{\"quantity\":1,\"product_id\":17,\"locale\":\"en\"}','2024-12-17 09:15:44','2024-12-17 09:15:44'),(67,'109','simple','Summer clothes9',NULL,2.5000,2.5000,1,0,0,0,0,635.0000,635.0000,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,10,'Webkul\\Product\\Models\\Product',13,NULL,NULL,'{\"quantity\":1,\"product_id\":10,\"locale\":\"en\"}','2024-12-17 09:15:44','2024-12-17 09:15:44'),(68,'119','simple','Winter clothing9',NULL,7.0000,7.0000,1,0,0,0,0,799.0000,799.0000,799.0000,799.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,799.0000,799.0000,799.0000,799.0000,20,'Webkul\\Product\\Models\\Product',14,NULL,NULL,'{\"quantity\":1,\"product_id\":20,\"locale\":\"en\"}','2024-12-17 09:21:50','2024-12-17 09:21:50'),(69,'107','simple','Summer clothes7',NULL,3.0000,3.0000,1,0,0,0,0,770.0000,770.0000,770.0000,770.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,770.0000,770.0000,770.0000,770.0000,8,'Webkul\\Product\\Models\\Product',14,NULL,NULL,'{\"quantity\":1,\"product_id\":8,\"locale\":\"en\"}','2024-12-17 09:21:51','2024-12-17 09:21:51'),(70,'116','simple','Winter clothing6',NULL,6.0000,6.0000,1,0,0,0,0,645.0000,645.0000,645.0000,645.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,645.0000,645.0000,645.0000,645.0000,17,'Webkul\\Product\\Models\\Product',14,NULL,NULL,'{\"quantity\":1,\"product_id\":17,\"locale\":\"en\"}','2024-12-17 09:21:51','2024-12-17 09:21:51'),(71,'109','simple','Summer clothes9',NULL,2.5000,2.5000,1,0,0,0,0,635.0000,635.0000,635.0000,635.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,635.0000,635.0000,635.0000,635.0000,10,'Webkul\\Product\\Models\\Product',14,NULL,NULL,'{\"quantity\":1,\"product_id\":10,\"locale\":\"en\"}','2024-12-17 09:21:51','2024-12-17 09:21:51');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
INSERT INTO `order_payment` VALUES (10,10,'cashondelivery','Cash On Delivery',NULL,'2024-12-11 05:54:53','2024-12-11 05:54:53'),(11,11,'cashondelivery','Cash On Delivery',NULL,'2024-12-17 08:46:57','2024-12-17 08:46:57'),(12,12,'cashondelivery','Cash On Delivery',NULL,'2024-12-17 09:05:31','2024-12-17 09:05:31'),(13,13,'cashondelivery','Cash On Delivery',NULL,'2024-12-17 09:15:42','2024-12-17 09:15:42'),(14,14,'cashondelivery','Cash On Delivery',NULL,'2024-12-17 09:21:50','2024-12-17 09:21:50');
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT 0.0000,
  `payment_method` varchar(191) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `invoice_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `channel_name` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `shipping_title` varchar(191) DEFAULT NULL,
  `shipping_description` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `channel_type` varchar(191) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10,'1','pending','Default',0,'osamaa@example.com','osamaa','sayed','flatrate_flatrate','Flat Rate - Flat Rate','Flat Rate Shipping',NULL,0,5,5,'USD','USD','USD',1732.0000,1732.0000,0.0000,0.0000,0.0000,0.0000,1682.0000,1682.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,50.0000,50.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1682.0000,1682.0000,50.0000,50.0000,2,'Webkul\\Customer\\Models\\Customer',1,'Webkul\\Core\\Models\\Channel',3,NULL,'2024-12-11 05:54:53','2024-12-11 05:54:53'),(11,'11','pending','Default',0,'osamaa@example.com','osamaa','sayed','flatrate_flatrate','Flat Rate - Flat Rate','Flat Rate Shipping',NULL,0,7,11,'USD','USD','USD',7628.0000,7628.0000,0.0000,0.0000,0.0000,0.0000,7518.0000,7518.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,110.0000,110.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,7518.0000,7518.0000,110.0000,110.0000,2,'Webkul\\Customer\\Models\\Customer',1,'Webkul\\Core\\Models\\Channel',5,NULL,'2024-12-17 08:46:57','2024-12-17 08:46:57'),(12,'12','pending','Default',0,'osamaa@example.com','osamaa','sayed','flatrate_flatrate','Flat Rate - Flat Rate','Flat Rate Shipping',NULL,0,6,9,'USD','USD','USD',6319.0000,6319.0000,0.0000,0.0000,0.0000,0.0000,6229.0000,6229.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,90.0000,90.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,6229.0000,6229.0000,90.0000,90.0000,2,'Webkul\\Customer\\Models\\Customer',1,'Webkul\\Core\\Models\\Channel',10,NULL,'2024-12-17 09:05:30','2024-12-17 09:05:30'),(13,'13','pending','Default',0,'osamaa@example.com','osamaa','sayed','flatrate_flatrate','Flat Rate - Flat Rate','Flat Rate Shipping',NULL,0,4,4,'USD','USD','USD',2889.0000,2889.0000,0.0000,0.0000,0.0000,0.0000,2849.0000,2849.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,40.0000,40.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2849.0000,2849.0000,40.0000,40.0000,2,'Webkul\\Customer\\Models\\Customer',1,'Webkul\\Core\\Models\\Channel',11,NULL,'2024-12-17 09:15:42','2024-12-17 09:15:42'),(14,'14','pending','Default',0,'osamaa@example.com','osamaa','sayed','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,4,4,'USD','USD','USD',2849.0000,2849.0000,0.0000,0.0000,0.0000,0.0000,2849.0000,2849.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2849.0000,2849.0000,0.0000,0.0000,2,'Webkul\\Customer\\Models\\Customer',1,'Webkul\\Core\\Models\\Channel',12,NULL,'2024-12-17 09:21:50','2024-12-17 09:21:50');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `unique_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (1,'en',NULL,'<p>Summer clothes&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,1,9,'en|1|9'),(2,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,1,10,'en|1|10'),(3,NULL,NULL,'100',NULL,NULL,NULL,NULL,NULL,NULL,1,1,'1|1'),(4,'en',NULL,'Summer clothes1',NULL,NULL,NULL,NULL,NULL,NULL,1,2,'en|1|2'),(5,'en',NULL,'summer-clothes1',NULL,NULL,NULL,NULL,NULL,NULL,1,3,'en|1|3'),(6,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,1,27,'1|27'),(7,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,1,28,'default|1|28'),(8,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,16,'en|1|16'),(9,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,17,'en|1|17'),(10,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,18,'en|1|18'),(11,NULL,NULL,NULL,NULL,NULL,200.0000,NULL,NULL,NULL,1,11,'1|11'),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,12,'1|12'),(13,NULL,NULL,NULL,NULL,NULL,198.0000,NULL,NULL,NULL,1,13,'1|13'),(14,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,14,'default|1|14'),(15,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,15,'default|1|15'),(16,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,5,'1|5'),(17,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,6,'1|6'),(18,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,7,'1|7'),(19,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,1,8,'default|1|8'),(20,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,26,'1|26'),(21,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,19,'1|19'),(22,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,20,'1|20'),(23,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,21,'1|21'),(24,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,1,22,'1|22'),(25,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,2,9,'en|2|9'),(26,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,2,10,'en|2|10'),(27,NULL,NULL,'101',NULL,NULL,NULL,NULL,NULL,NULL,2,1,'2|1'),(28,'en',NULL,'Summer  clothes2',NULL,NULL,NULL,NULL,NULL,NULL,2,2,'en|2|2'),(29,'en',NULL,'summer-clothes2',NULL,NULL,NULL,NULL,NULL,NULL,2,3,'en|2|3'),(30,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,2,27,'2|27'),(31,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,2,28,'default|2|28'),(32,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,16,'en|2|16'),(33,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,17,'en|2|17'),(34,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,18,'en|2|18'),(35,NULL,NULL,NULL,NULL,NULL,250.0000,NULL,NULL,NULL,2,11,'2|11'),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,12,'2|12'),(37,NULL,NULL,NULL,NULL,NULL,220.0000,NULL,NULL,NULL,2,13,'2|13'),(38,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,14,'default|2|14'),(39,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,15,'default|2|15'),(40,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,5,'2|5'),(41,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,6,'2|6'),(42,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,7,'2|7'),(43,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,2,8,'default|2|8'),(44,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,26,'2|26'),(45,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,19,'2|19'),(46,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,20,'2|20'),(47,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,21,'2|21'),(48,NULL,NULL,'250',NULL,NULL,NULL,NULL,NULL,NULL,2,22,'2|22'),(49,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,3,9,'en|3|9'),(50,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,3,10,'en|3|10'),(51,NULL,NULL,'102',NULL,NULL,NULL,NULL,NULL,NULL,3,1,'3|1'),(52,'en',NULL,'Summer clothes3',NULL,NULL,NULL,NULL,NULL,NULL,3,2,'en|3|2'),(53,'en',NULL,'summer-clothes3',NULL,NULL,NULL,NULL,NULL,NULL,3,3,'en|3|3'),(54,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,3,27,'3|27'),(55,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,3,28,'default|3|28'),(56,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,16,'en|3|16'),(57,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,17,'en|3|17'),(58,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,18,'en|3|18'),(59,NULL,NULL,NULL,NULL,NULL,400.0000,NULL,NULL,NULL,3,11,'3|11'),(60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,12,'3|12'),(61,NULL,NULL,NULL,NULL,NULL,385.0000,NULL,NULL,NULL,3,13,'3|13'),(62,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,14,'default|3|14'),(63,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,15,'default|3|15'),(64,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,5,'3|5'),(65,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,6,'3|6'),(66,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,7,'3|7'),(67,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,3,8,'default|3|8'),(68,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,26,'3|26'),(69,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,19,'3|19'),(70,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,20,'3|20'),(71,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,21,'3|21'),(72,NULL,NULL,'250',NULL,NULL,NULL,NULL,NULL,NULL,3,22,'3|22'),(73,'en',NULL,'<p>summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,4,9,'en|4|9'),(74,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,4,10,'en|4|10'),(75,NULL,NULL,'104',NULL,NULL,NULL,NULL,NULL,NULL,4,1,'4|1'),(76,'en',NULL,'summer clothes',NULL,NULL,NULL,NULL,NULL,NULL,4,2,'en|4|2'),(77,'en',NULL,'summer-clothes',NULL,NULL,NULL,NULL,NULL,NULL,4,3,'en|4|3'),(78,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,4,27,'4|27'),(79,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,4,28,'default|4|28'),(80,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,16,'en|4|16'),(81,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,17,'en|4|17'),(82,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,18,'en|4|18'),(83,NULL,NULL,NULL,NULL,NULL,200.0000,NULL,NULL,NULL,4,11,'4|11'),(84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,12,'4|12'),(85,NULL,NULL,NULL,NULL,NULL,190.0000,NULL,NULL,NULL,4,13,'4|13'),(86,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,14,'default|4|14'),(87,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,15,'default|4|15'),(88,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,5,'4|5'),(89,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,6,'4|6'),(90,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,7,'4|7'),(91,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,4,8,'default|4|8'),(92,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,26,'4|26'),(93,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,19,'4|19'),(94,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,20,'4|20'),(95,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,21,'4|21'),(96,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,4,22,'4|22'),(97,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,5,9,'en|5|9'),(98,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,5,10,'en|5|10'),(99,NULL,NULL,'103',NULL,NULL,NULL,NULL,NULL,NULL,5,1,'5|1'),(100,'en',NULL,'Summer clothes4',NULL,NULL,NULL,NULL,NULL,NULL,5,2,'en|5|2'),(101,'en',NULL,'summer-clothes4',NULL,NULL,NULL,NULL,NULL,NULL,5,3,'en|5|3'),(102,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,5,27,'5|27'),(103,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,5,28,'default|5|28'),(104,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,16,'en|5|16'),(105,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,17,'en|5|17'),(106,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,18,'en|5|18'),(107,NULL,NULL,NULL,NULL,NULL,600.0000,NULL,NULL,NULL,5,11,'5|11'),(108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,12,'5|12'),(109,NULL,NULL,NULL,NULL,NULL,580.0000,NULL,NULL,NULL,5,13,'5|13'),(110,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,14,'default|5|14'),(111,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,15,'default|5|15'),(112,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,5,'5|5'),(113,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,6,'5|6'),(114,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,7,'5|7'),(115,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,5,8,'default|5|8'),(116,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,26,'5|26'),(117,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,19,'5|19'),(118,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,20,'5|20'),(119,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,21,'5|21'),(120,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,5,22,'5|22'),(121,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,7,9,'en|7|9'),(122,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,7,10,'en|7|10'),(123,NULL,NULL,'106',NULL,NULL,NULL,NULL,NULL,NULL,7,1,'7|1'),(124,'en',NULL,'Summer clothes6',NULL,NULL,NULL,NULL,NULL,NULL,7,2,'en|7|2'),(125,'en',NULL,'summer-clothes6',NULL,NULL,NULL,NULL,NULL,NULL,7,3,'en|7|3'),(126,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,7,27,'7|27'),(127,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,7,28,'default|7|28'),(128,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,16,'en|7|16'),(129,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,17,'en|7|17'),(130,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,18,'en|7|18'),(131,NULL,NULL,NULL,NULL,NULL,600.0000,NULL,NULL,NULL,7,11,'7|11'),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,12,'7|12'),(133,NULL,NULL,NULL,NULL,NULL,550.0000,NULL,NULL,NULL,7,13,'7|13'),(134,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,'default|7|14'),(135,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,15,'default|7|15'),(136,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,5,'7|5'),(137,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,6,'7|6'),(138,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,7,'7|7'),(139,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,7,8,'default|7|8'),(140,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,26,'7|26'),(141,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,19,'7|19'),(142,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,20,'7|20'),(143,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,21,'7|21'),(144,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,7,22,'7|22'),(145,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,6,9,'en|6|9'),(146,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,6,10,'en|6|10'),(147,NULL,NULL,'105',NULL,NULL,NULL,NULL,NULL,NULL,6,1,'6|1'),(148,'en',NULL,'Summer clothes5',NULL,NULL,NULL,NULL,NULL,NULL,6,2,'en|6|2'),(149,'en',NULL,'summer-clothes5',NULL,NULL,NULL,NULL,NULL,NULL,6,3,'en|6|3'),(150,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,6,27,'6|27'),(151,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,6,28,'default|6|28'),(152,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,16,'en|6|16'),(153,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,17,'en|6|17'),(154,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,18,'en|6|18'),(155,NULL,NULL,NULL,NULL,NULL,330.0000,NULL,NULL,NULL,6,11,'6|11'),(156,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,12,'6|12'),(157,NULL,NULL,NULL,NULL,NULL,300.0000,NULL,NULL,NULL,6,13,'6|13'),(158,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,14,'default|6|14'),(159,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,15,'default|6|15'),(160,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,5,'6|5'),(161,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,6,'6|6'),(162,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,7,'6|7'),(163,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,6,8,'default|6|8'),(164,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,26,'6|26'),(165,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,19,'6|19'),(166,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,20,'6|20'),(167,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,21,'6|21'),(168,NULL,NULL,'13',NULL,NULL,NULL,NULL,NULL,NULL,6,22,'6|22'),(169,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,8,9,'en|8|9'),(170,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,8,10,'en|8|10'),(171,NULL,NULL,'107',NULL,NULL,NULL,NULL,NULL,NULL,8,1,'8|1'),(172,'en',NULL,'Summer clothes7',NULL,NULL,NULL,NULL,NULL,NULL,8,2,'en|8|2'),(173,'en',NULL,'summer-clothes7',NULL,NULL,NULL,NULL,NULL,NULL,8,3,'en|8|3'),(174,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,8,27,'8|27'),(175,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,8,28,'default|8|28'),(176,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,16,'en|8|16'),(177,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,17,'en|8|17'),(178,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,18,'en|8|18'),(179,NULL,NULL,NULL,NULL,NULL,800.0000,NULL,NULL,NULL,8,11,'8|11'),(180,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,12,'8|12'),(181,NULL,NULL,NULL,NULL,NULL,770.0000,NULL,NULL,NULL,8,13,'8|13'),(182,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,14,'default|8|14'),(183,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,15,'default|8|15'),(184,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,5,'8|5'),(185,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,6,'8|6'),(186,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,7,'8|7'),(187,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,8,8,'default|8|8'),(188,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,26,'8|26'),(189,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,19,'8|19'),(190,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,20,'8|20'),(191,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,21,'8|21'),(192,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,8,22,'8|22'),(193,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,9,9,'en|9|9'),(194,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,9,10,'en|9|10'),(195,NULL,NULL,'108',NULL,NULL,NULL,NULL,NULL,NULL,9,1,'9|1'),(196,'en',NULL,'Summer clothes8',NULL,NULL,NULL,NULL,NULL,NULL,9,2,'en|9|2'),(197,'en',NULL,'summer-clothes8',NULL,NULL,NULL,NULL,NULL,NULL,9,3,'en|9|3'),(198,NULL,NULL,'9',NULL,NULL,NULL,NULL,NULL,NULL,9,27,'9|27'),(199,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,9,28,'default|9|28'),(200,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,16,'en|9|16'),(201,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,17,'en|9|17'),(202,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,18,'en|9|18'),(203,NULL,NULL,NULL,NULL,NULL,660.0000,NULL,NULL,NULL,9,11,'9|11'),(204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,12,'9|12'),(205,NULL,NULL,NULL,NULL,NULL,630.0000,NULL,NULL,NULL,9,13,'9|13'),(206,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,14,'default|9|14'),(207,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,15,'default|9|15'),(208,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,5,'9|5'),(209,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,6,'9|6'),(210,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,7,'9|7'),(211,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,9,8,'default|9|8'),(212,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,26,'9|26'),(213,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,19,'9|19'),(214,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,20,'9|20'),(215,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,21,'9|21'),(216,NULL,NULL,'2.5',NULL,NULL,NULL,NULL,NULL,NULL,9,22,'9|22'),(217,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,10,9,'en|10|9'),(218,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,10,10,'en|10|10'),(219,NULL,NULL,'109',NULL,NULL,NULL,NULL,NULL,NULL,10,1,'10|1'),(220,'en',NULL,'Summer clothes9',NULL,NULL,NULL,NULL,NULL,NULL,10,2,'en|10|2'),(221,'en',NULL,'summer-clothes9',NULL,NULL,NULL,NULL,NULL,NULL,10,3,'en|10|3'),(222,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,10,27,'10|27'),(223,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,10,28,'default|10|28'),(224,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,16,'en|10|16'),(225,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,17,'en|10|17'),(226,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,18,'en|10|18'),(227,NULL,NULL,NULL,NULL,NULL,670.0000,NULL,NULL,NULL,10,11,'10|11'),(228,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,12,'10|12'),(229,NULL,NULL,NULL,NULL,NULL,635.0000,NULL,NULL,NULL,10,13,'10|13'),(230,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,14,'default|10|14'),(231,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,15,'default|10|15'),(232,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,5,'10|5'),(233,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,6,'10|6'),(234,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,7,'10|7'),(235,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,10,8,'default|10|8'),(236,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,26,'10|26'),(237,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,19,'10|19'),(238,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,20,'10|20'),(239,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,10,21,'10|21'),(240,NULL,NULL,'2.5',NULL,NULL,NULL,NULL,NULL,NULL,10,22,'10|22'),(241,'en',NULL,'<p>Summer clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,11,9,'en|11|9'),(242,'en',NULL,'<p>Summer children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,11,10,'en|11|10'),(243,NULL,NULL,'110',NULL,NULL,NULL,NULL,NULL,NULL,11,1,'11|1'),(244,'en',NULL,'summer clothes11',NULL,NULL,NULL,NULL,NULL,NULL,11,2,'en|11|2'),(245,'en',NULL,'summer-clothes11',NULL,NULL,NULL,NULL,NULL,NULL,11,3,'en|11|3'),(246,NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,11,27,'11|27'),(247,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,11,28,'default|11|28'),(248,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,11,16,'en|11|16'),(249,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,11,17,'en|11|17'),(250,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,11,18,'en|11|18'),(251,NULL,NULL,NULL,NULL,NULL,250.0000,NULL,NULL,NULL,11,11,'11|11'),(252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,12,'11|12'),(253,NULL,NULL,NULL,NULL,NULL,235.0000,NULL,NULL,NULL,11,13,'11|13'),(254,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,14,'default|11|14'),(255,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,15,'default|11|15'),(256,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,11,5,'11|5'),(257,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,11,6,'11|6'),(258,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,11,7,'11|7'),(259,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,11,8,'default|11|8'),(260,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,11,26,'11|26'),(261,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,11,19,'11|19'),(262,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,11,20,'11|20'),(263,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,11,21,'11|21'),(264,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,11,22,'11|22'),(265,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,13,9,'en|13|9'),(266,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,13,10,'en|13|10'),(267,NULL,NULL,'112',NULL,NULL,NULL,NULL,NULL,NULL,13,1,'13|1'),(268,'en',NULL,'Winter clothing',NULL,NULL,NULL,NULL,NULL,NULL,13,2,'en|13|2'),(269,'en',NULL,'winter-clothing',NULL,NULL,NULL,NULL,NULL,NULL,13,3,'en|13|3'),(270,NULL,NULL,'21',NULL,NULL,NULL,NULL,NULL,NULL,13,27,'13|27'),(271,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,13,28,'default|13|28'),(272,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,13,16,'en|13|16'),(273,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,13,17,'en|13|17'),(274,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,13,18,'en|13|18'),(275,NULL,NULL,NULL,NULL,NULL,120.0000,NULL,NULL,NULL,13,11,'13|11'),(276,NULL,NULL,NULL,NULL,NULL,90.0000,NULL,NULL,NULL,13,12,'13|12'),(277,NULL,NULL,NULL,NULL,NULL,110.0000,NULL,NULL,NULL,13,13,'13|13'),(278,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,14,'default|13|14'),(279,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,15,'default|13|15'),(280,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,13,5,'13|5'),(281,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,13,6,'13|6'),(282,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,13,7,'13|7'),(283,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,13,8,'default|13|8'),(284,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,13,26,'13|26'),(285,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,13,19,'13|19'),(286,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,13,20,'13|20'),(287,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,13,21,'13|21'),(288,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,13,22,'13|22'),(289,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,12,9,'en|12|9'),(290,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,12,10,'en|12|10'),(291,NULL,NULL,'111',NULL,NULL,NULL,NULL,NULL,NULL,12,1,'12|1'),(292,'en',NULL,'Winter clothing1',NULL,NULL,NULL,NULL,NULL,NULL,12,2,'en|12|2'),(293,'en',NULL,'winter-clothing1',NULL,NULL,NULL,NULL,NULL,NULL,12,3,'en|12|3'),(294,NULL,NULL,'22',NULL,NULL,NULL,NULL,NULL,NULL,12,27,'12|27'),(295,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,12,28,'default|12|28'),(296,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,12,16,'en|12|16'),(297,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,12,17,'en|12|17'),(298,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,12,18,'en|12|18'),(299,NULL,NULL,NULL,NULL,NULL,190.0000,NULL,NULL,NULL,12,11,'12|11'),(300,NULL,NULL,NULL,NULL,NULL,120.0000,NULL,NULL,NULL,12,12,'12|12'),(301,NULL,NULL,NULL,NULL,NULL,177.0000,NULL,NULL,NULL,12,13,'12|13'),(302,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,14,'default|12|14'),(303,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,15,'default|12|15'),(304,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,12,5,'12|5'),(305,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,12,6,'12|6'),(306,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,12,7,'12|7'),(307,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,12,8,'default|12|8'),(308,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,12,26,'12|26'),(309,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,12,19,'12|19'),(310,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,12,20,'12|20'),(311,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,12,21,'12|21'),(312,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,12,22,'12|22'),(313,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,14,9,'en|14|9'),(314,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,14,10,'en|14|10'),(315,NULL,NULL,'113',NULL,NULL,NULL,NULL,NULL,NULL,14,1,'14|1'),(316,'en',NULL,'Winter clothing2',NULL,NULL,NULL,NULL,NULL,NULL,14,2,'en|14|2'),(317,'en',NULL,'winter-clothing2',NULL,NULL,NULL,NULL,NULL,NULL,14,3,'en|14|3'),(318,NULL,NULL,'23',NULL,NULL,NULL,NULL,NULL,NULL,14,27,'14|27'),(319,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,14,28,'default|14|28'),(320,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,14,16,'en|14|16'),(321,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,14,17,'en|14|17'),(322,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,14,18,'en|14|18'),(323,NULL,NULL,NULL,NULL,NULL,330.0000,NULL,NULL,NULL,14,11,'14|11'),(324,NULL,NULL,NULL,NULL,NULL,260.0000,NULL,NULL,NULL,14,12,'14|12'),(325,NULL,NULL,NULL,NULL,NULL,300.0000,NULL,NULL,NULL,14,13,'14|13'),(326,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,14,'default|14|14'),(327,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,15,'default|14|15'),(328,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,14,5,'14|5'),(329,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,14,6,'14|6'),(330,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,14,7,'14|7'),(331,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,14,8,'default|14|8'),(332,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,14,26,'14|26'),(333,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,14,19,'14|19'),(334,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,14,20,'14|20'),(335,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,14,21,'14|21'),(336,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,14,22,'14|22'),(337,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,15,9,'en|15|9'),(338,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,15,10,'en|15|10'),(339,NULL,NULL,'114',NULL,NULL,NULL,NULL,NULL,NULL,15,1,'15|1'),(340,'en',NULL,'Winter clothing3',NULL,NULL,NULL,NULL,NULL,NULL,15,2,'en|15|2'),(341,'en',NULL,'winter-clothing3',NULL,NULL,NULL,NULL,NULL,NULL,15,3,'en|15|3'),(342,NULL,NULL,'24',NULL,NULL,NULL,NULL,NULL,NULL,15,27,'15|27'),(343,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,15,28,'default|15|28'),(344,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,15,16,'en|15|16'),(345,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,15,17,'en|15|17'),(346,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,15,18,'en|15|18'),(347,NULL,NULL,NULL,NULL,NULL,500.0000,NULL,NULL,NULL,15,11,'15|11'),(348,NULL,NULL,NULL,NULL,NULL,390.0000,NULL,NULL,NULL,15,12,'15|12'),(349,NULL,NULL,NULL,NULL,NULL,470.0000,NULL,NULL,NULL,15,13,'15|13'),(350,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,14,'default|15|14'),(351,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,15,'default|15|15'),(352,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,15,5,'15|5'),(353,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,15,6,'15|6'),(354,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,15,7,'15|7'),(355,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,15,8,'default|15|8'),(356,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,15,26,'15|26'),(357,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,15,19,'15|19'),(358,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,15,20,'15|20'),(359,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,15,21,'15|21'),(360,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,15,22,'15|22'),(361,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,16,9,'en|16|9'),(362,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,16,10,'en|16|10'),(363,NULL,NULL,'115',NULL,NULL,NULL,NULL,NULL,NULL,16,1,'16|1'),(364,'en',NULL,'Winter clothing5',NULL,NULL,NULL,NULL,NULL,NULL,16,2,'en|16|2'),(365,'en',NULL,'winter-clothing5',NULL,NULL,NULL,NULL,NULL,NULL,16,3,'en|16|3'),(366,NULL,NULL,'25',NULL,NULL,NULL,NULL,NULL,NULL,16,27,'16|27'),(367,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,16,28,'default|16|28'),(368,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,16,16,'en|16|16'),(369,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,16,17,'en|16|17'),(370,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,16,18,'en|16|18'),(371,NULL,NULL,NULL,NULL,NULL,450.0000,NULL,NULL,NULL,16,11,'16|11'),(372,NULL,NULL,NULL,NULL,NULL,330.0000,NULL,NULL,NULL,16,12,'16|12'),(373,NULL,NULL,NULL,NULL,NULL,410.0000,NULL,NULL,NULL,16,13,'16|13'),(374,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,14,'default|16|14'),(375,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,15,'default|16|15'),(376,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,16,5,'16|5'),(377,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,16,6,'16|6'),(378,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,16,7,'16|7'),(379,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,16,8,'default|16|8'),(380,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,16,26,'16|26'),(381,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,16,19,'16|19'),(382,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,16,20,'16|20'),(383,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,16,21,'16|21'),(384,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,16,22,'16|22'),(385,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,17,9,'en|17|9'),(386,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,17,10,'en|17|10'),(387,NULL,NULL,'116',NULL,NULL,NULL,NULL,NULL,NULL,17,1,'17|1'),(388,'en',NULL,'Winter clothing6',NULL,NULL,NULL,NULL,NULL,NULL,17,2,'en|17|2'),(389,'en',NULL,'winter-clothing6',NULL,NULL,NULL,NULL,NULL,NULL,17,3,'en|17|3'),(390,NULL,NULL,'26',NULL,NULL,NULL,NULL,NULL,NULL,17,27,'17|27'),(391,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,17,28,'default|17|28'),(392,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,17,16,'en|17|16'),(393,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,17,17,'en|17|17'),(394,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,17,18,'en|17|18'),(395,NULL,NULL,NULL,NULL,NULL,660.0000,NULL,NULL,NULL,17,11,'17|11'),(396,NULL,NULL,NULL,NULL,NULL,550.0000,NULL,NULL,NULL,17,12,'17|12'),(397,NULL,NULL,NULL,NULL,NULL,645.0000,NULL,NULL,NULL,17,13,'17|13'),(398,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,14,'default|17|14'),(399,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,15,'default|17|15'),(400,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,17,5,'17|5'),(401,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,17,6,'17|6'),(402,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,17,7,'17|7'),(403,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,17,8,'default|17|8'),(404,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,17,26,'17|26'),(405,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,17,19,'17|19'),(406,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,17,20,'17|20'),(407,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,17,21,'17|21'),(408,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,17,22,'17|22'),(409,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,18,9,'en|18|9'),(410,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,18,10,'en|18|10'),(411,NULL,NULL,'117',NULL,NULL,NULL,NULL,NULL,NULL,18,1,'18|1'),(412,'en',NULL,'Winter clothing7',NULL,NULL,NULL,NULL,NULL,NULL,18,2,'en|18|2'),(413,'en',NULL,'winter-clothing7',NULL,NULL,NULL,NULL,NULL,NULL,18,3,'en|18|3'),(414,NULL,NULL,'27',NULL,NULL,NULL,NULL,NULL,NULL,18,27,'18|27'),(415,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,18,28,'default|18|28'),(416,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,18,16,'en|18|16'),(417,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,18,17,'en|18|17'),(418,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,18,18,'en|18|18'),(419,NULL,NULL,NULL,NULL,NULL,560.0000,NULL,NULL,NULL,18,11,'18|11'),(420,NULL,NULL,NULL,NULL,NULL,450.0000,NULL,NULL,NULL,18,12,'18|12'),(421,NULL,NULL,NULL,NULL,NULL,520.0000,NULL,NULL,NULL,18,13,'18|13'),(422,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,14,'default|18|14'),(423,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,15,'default|18|15'),(424,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,18,5,'18|5'),(425,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,18,6,'18|6'),(426,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,18,7,'18|7'),(427,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,18,8,'default|18|8'),(428,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,18,26,'18|26'),(429,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,18,19,'18|19'),(430,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,18,20,'18|20'),(431,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,18,21,'18|21'),(432,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,18,22,'18|22'),(433,'en',NULL,'<p>Winter clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,19,9,'en|19|9'),(434,'en',NULL,'<p>Winter children\'s clothing</p>',NULL,NULL,NULL,NULL,NULL,NULL,19,10,'en|19|10'),(435,NULL,NULL,'118',NULL,NULL,NULL,NULL,NULL,NULL,19,1,'19|1'),(436,'en',NULL,'Winter clothing8',NULL,NULL,NULL,NULL,NULL,NULL,19,2,'en|19|2'),(437,'en',NULL,'winter-clothing8',NULL,NULL,NULL,NULL,NULL,NULL,19,3,'en|19|3'),(438,NULL,NULL,'28',NULL,NULL,NULL,NULL,NULL,NULL,19,27,'19|27'),(439,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,19,28,'default|19|28'),(440,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,19,16,'en|19|16'),(441,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,19,17,'en|19|17'),(442,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,19,18,'en|19|18'),(443,NULL,NULL,NULL,NULL,NULL,600.0000,NULL,NULL,NULL,19,11,'19|11'),(444,NULL,NULL,NULL,NULL,NULL,500.0000,NULL,NULL,NULL,19,12,'19|12'),(445,NULL,NULL,NULL,NULL,NULL,580.0000,NULL,NULL,NULL,19,13,'19|13'),(446,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,14,'default|19|14'),(447,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,15,'default|19|15'),(448,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,19,5,'19|5'),(449,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,19,6,'19|6'),(450,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,19,7,'19|7'),(451,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,19,8,'default|19|8'),(452,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,19,26,'19|26'),(453,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,19,19,'19|19'),(454,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,19,20,'19|20'),(455,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,19,21,'19|21'),(456,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,19,22,'19|22'),(457,'en',NULL,'<p>Winter clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,20,9,'en|20|9'),(458,'en',NULL,'<p>Winter children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,20,10,'en|20|10'),(459,NULL,NULL,'119',NULL,NULL,NULL,NULL,NULL,NULL,20,1,'20|1'),(460,'en',NULL,'Winter clothing9',NULL,NULL,NULL,NULL,NULL,NULL,20,2,'en|20|2'),(461,'en',NULL,'winter-clothing9',NULL,NULL,NULL,NULL,NULL,NULL,20,3,'en|20|3'),(462,NULL,NULL,'29',NULL,NULL,NULL,NULL,NULL,NULL,20,27,'20|27'),(463,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,20,28,'default|20|28'),(464,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,20,16,'en|20|16'),(465,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,20,17,'en|20|17'),(466,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,20,18,'en|20|18'),(467,NULL,NULL,NULL,NULL,NULL,885.0000,NULL,NULL,NULL,20,11,'20|11'),(468,NULL,NULL,NULL,NULL,NULL,690.0000,NULL,NULL,NULL,20,12,'20|12'),(469,NULL,NULL,NULL,NULL,NULL,799.0000,NULL,NULL,NULL,20,13,'20|13'),(470,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,14,'default|20|14'),(471,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,15,'default|20|15'),(472,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,20,5,'20|5'),(473,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,20,6,'20|6'),(474,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,20,7,'20|7'),(475,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,20,8,'default|20|8'),(476,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,20,26,'20|26'),(477,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,20,19,'20|19'),(478,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,20,20,'20|20'),(479,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,20,21,'20|21'),(480,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,20,22,'20|22'),(481,'en',NULL,'<p>Winter clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,21,9,'en|21|9'),(482,'en',NULL,'<p>Winter children\'s clothes</p>',NULL,NULL,NULL,NULL,NULL,NULL,21,10,'en|21|10'),(483,NULL,NULL,'120',NULL,NULL,NULL,NULL,NULL,NULL,21,1,'21|1'),(484,'en',NULL,'Winter clothing10',NULL,NULL,NULL,NULL,NULL,NULL,21,2,'en|21|2'),(485,'en',NULL,'winter-clothing10',NULL,NULL,NULL,NULL,NULL,NULL,21,3,'en|21|3'),(486,NULL,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,21,27,'21|27'),(487,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,21,28,'default|21|28'),(488,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,21,16,'en|21|16'),(489,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,21,17,'en|21|17'),(490,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,21,18,'en|21|18'),(491,NULL,NULL,NULL,NULL,NULL,654.0000,NULL,NULL,NULL,21,11,'21|11'),(492,NULL,NULL,NULL,NULL,NULL,543.0000,NULL,NULL,NULL,21,12,'21|12'),(493,NULL,NULL,NULL,NULL,NULL,610.0000,NULL,NULL,NULL,21,13,'21|13'),(494,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,14,'default|21|14'),(495,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,15,'default|21|15'),(496,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,21,5,'21|5'),(497,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,21,6,'21|6'),(498,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,21,7,'21|7'),(499,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,21,8,'default|21|8'),(500,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,21,26,'21|26'),(501,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,21,19,'21|19'),(502,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,21,20,'21|20'),(503,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,21,21,'21|21'),(504,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,21,22,'21|22'),(505,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,22,9,'en|22|9'),(506,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,22,10,'en|22|10'),(507,NULL,NULL,'121',NULL,NULL,NULL,NULL,NULL,NULL,22,1,'22|1'),(508,'en',NULL,'Children\'s shoes1',NULL,NULL,NULL,NULL,NULL,NULL,22,2,'en|22|2'),(509,'en',NULL,'childrens-shoes1',NULL,NULL,NULL,NULL,NULL,NULL,22,3,'en|22|3'),(510,NULL,NULL,'31',NULL,NULL,NULL,NULL,NULL,NULL,22,27,'22|27'),(511,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,22,28,'default|22|28'),(512,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,22,16,'en|22|16'),(513,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,22,17,'en|22|17'),(514,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,22,18,'en|22|18'),(515,NULL,NULL,NULL,NULL,NULL,150.0000,NULL,NULL,NULL,22,11,'22|11'),(516,NULL,NULL,NULL,NULL,NULL,75.0000,NULL,NULL,NULL,22,12,'22|12'),(517,NULL,NULL,NULL,NULL,NULL,135.0000,NULL,NULL,NULL,22,13,'22|13'),(518,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,14,'default|22|14'),(519,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,15,'default|22|15'),(520,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,22,5,'22|5'),(521,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,22,6,'22|6'),(522,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,22,7,'22|7'),(523,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,22,8,'default|22|8'),(524,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,22,26,'22|26'),(525,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,22,19,'22|19'),(526,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,22,20,'22|20'),(527,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,22,21,'22|21'),(528,NULL,NULL,'1.5',NULL,NULL,NULL,NULL,NULL,NULL,22,22,'22|22'),(529,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,23,9,'en|23|9'),(530,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,23,10,'en|23|10'),(531,NULL,NULL,'122',NULL,NULL,NULL,NULL,NULL,NULL,23,1,'23|1'),(532,'en',NULL,'Children\'s shoes2',NULL,NULL,NULL,NULL,NULL,NULL,23,2,'en|23|2'),(533,'en',NULL,'childrens-shoes2',NULL,NULL,NULL,NULL,NULL,NULL,23,3,'en|23|3'),(534,NULL,NULL,'32',NULL,NULL,NULL,NULL,NULL,NULL,23,27,'23|27'),(535,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,23,28,'default|23|28'),(536,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,23,16,'en|23|16'),(537,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,23,17,'en|23|17'),(538,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,23,18,'en|23|18'),(539,NULL,NULL,NULL,NULL,NULL,170.0000,NULL,NULL,NULL,23,11,'23|11'),(540,NULL,NULL,NULL,NULL,NULL,85.0000,NULL,NULL,NULL,23,12,'23|12'),(541,NULL,NULL,NULL,NULL,NULL,160.0000,NULL,NULL,NULL,23,13,'23|13'),(542,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,14,'default|23|14'),(543,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,15,'default|23|15'),(544,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,23,5,'23|5'),(545,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,23,6,'23|6'),(546,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,23,7,'23|7'),(547,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,23,8,'default|23|8'),(548,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,23,26,'23|26'),(549,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,23,19,'23|19'),(550,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,23,20,'23|20'),(551,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,23,21,'23|21'),(552,NULL,NULL,'1.5',NULL,NULL,NULL,NULL,NULL,NULL,23,22,'23|22'),(553,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,24,9,'en|24|9'),(554,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,24,10,'en|24|10'),(555,NULL,NULL,'123',NULL,NULL,NULL,NULL,NULL,NULL,24,1,'24|1'),(556,'en',NULL,'Children\'s shoes3',NULL,NULL,NULL,NULL,NULL,NULL,24,2,'en|24|2'),(557,'en',NULL,'childrens-shoes3',NULL,NULL,NULL,NULL,NULL,NULL,24,3,'en|24|3'),(558,NULL,NULL,'33',NULL,NULL,NULL,NULL,NULL,NULL,24,27,'24|27'),(559,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,24,28,'default|24|28'),(560,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,24,16,'en|24|16'),(561,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,24,17,'en|24|17'),(562,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,24,18,'en|24|18'),(563,NULL,NULL,NULL,NULL,NULL,200.0000,NULL,NULL,NULL,24,11,'24|11'),(564,NULL,NULL,NULL,NULL,NULL,115.0000,NULL,NULL,NULL,24,12,'24|12'),(565,NULL,NULL,NULL,NULL,NULL,185.0000,NULL,NULL,NULL,24,13,'24|13'),(566,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,14,'default|24|14'),(567,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,15,'default|24|15'),(568,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,24,5,'24|5'),(569,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,24,6,'24|6'),(570,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,24,7,'24|7'),(571,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,24,8,'default|24|8'),(572,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,24,26,'24|26'),(573,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,24,19,'24|19'),(574,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,24,20,'24|20'),(575,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,24,21,'24|21'),(576,NULL,NULL,'1.5',NULL,NULL,NULL,NULL,NULL,NULL,24,22,'24|22'),(577,'en',NULL,'<p>&nbsp;shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,25,9,'en|25|9'),(578,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,25,10,'en|25|10'),(579,NULL,NULL,'124',NULL,NULL,NULL,NULL,NULL,NULL,25,1,'25|1'),(580,'en',NULL,'Children\'s shoes4',NULL,NULL,NULL,NULL,NULL,NULL,25,2,'en|25|2'),(581,'en',NULL,'childrens-shoes4',NULL,NULL,NULL,NULL,NULL,NULL,25,3,'en|25|3'),(582,NULL,NULL,'34',NULL,NULL,NULL,NULL,NULL,NULL,25,27,'25|27'),(583,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,25,28,'default|25|28'),(584,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,25,16,'en|25|16'),(585,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,25,17,'en|25|17'),(586,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,25,18,'en|25|18'),(587,NULL,NULL,NULL,NULL,NULL,190.0000,NULL,NULL,NULL,25,11,'25|11'),(588,NULL,NULL,NULL,NULL,NULL,75.0000,NULL,NULL,NULL,25,12,'25|12'),(589,NULL,NULL,NULL,NULL,NULL,160.0000,NULL,NULL,NULL,25,13,'25|13'),(590,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,14,'default|25|14'),(591,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,15,'default|25|15'),(592,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,25,5,'25|5'),(593,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,25,6,'25|6'),(594,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,25,7,'25|7'),(595,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,25,8,'default|25|8'),(596,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,25,26,'25|26'),(597,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,25,19,'25|19'),(598,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,25,20,'25|20'),(599,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,25,21,'25|21'),(600,NULL,NULL,'1.5',NULL,NULL,NULL,NULL,NULL,NULL,25,22,'25|22'),(601,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,26,9,'en|26|9'),(602,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,26,10,'en|26|10'),(603,NULL,NULL,'125',NULL,NULL,NULL,NULL,NULL,NULL,26,1,'26|1'),(604,'en',NULL,'Children\'s shoes5',NULL,NULL,NULL,NULL,NULL,NULL,26,2,'en|26|2'),(605,'en',NULL,'childrens-shoes5',NULL,NULL,NULL,NULL,NULL,NULL,26,3,'en|26|3'),(606,NULL,NULL,'35',NULL,NULL,NULL,NULL,NULL,NULL,26,27,'26|27'),(607,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,26,28,'default|26|28'),(608,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,26,16,'en|26|16'),(609,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,26,17,'en|26|17'),(610,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,26,18,'en|26|18'),(611,NULL,NULL,NULL,NULL,NULL,290.0000,NULL,NULL,NULL,26,11,'26|11'),(612,NULL,NULL,NULL,NULL,NULL,160.0000,NULL,NULL,NULL,26,12,'26|12'),(613,NULL,NULL,NULL,NULL,NULL,280.0000,NULL,NULL,NULL,26,13,'26|13'),(614,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,14,'default|26|14'),(615,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,15,'default|26|15'),(616,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,26,5,'26|5'),(617,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,26,6,'26|6'),(618,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,26,7,'26|7'),(619,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,26,8,'default|26|8'),(620,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,26,26,'26|26'),(621,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,26,19,'26|19'),(622,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,26,20,'26|20'),(623,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,26,21,'26|21'),(624,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,26,22,'26|22'),(625,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,27,9,'en|27|9'),(626,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,27,10,'en|27|10'),(627,NULL,NULL,'126',NULL,NULL,NULL,NULL,NULL,NULL,27,1,'27|1'),(628,'en',NULL,'Children\'s shoes6',NULL,NULL,NULL,NULL,NULL,NULL,27,2,'en|27|2'),(629,'en',NULL,'childrens-shoes6',NULL,NULL,NULL,NULL,NULL,NULL,27,3,'en|27|3'),(630,NULL,NULL,'36',NULL,NULL,NULL,NULL,NULL,NULL,27,27,'27|27'),(631,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,27,28,'default|27|28'),(632,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,27,16,'en|27|16'),(633,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,27,17,'en|27|17'),(634,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,27,18,'en|27|18'),(635,NULL,NULL,NULL,NULL,NULL,190.0000,NULL,NULL,NULL,27,11,'27|11'),(636,NULL,NULL,NULL,NULL,NULL,68.0000,NULL,NULL,NULL,27,12,'27|12'),(637,NULL,NULL,NULL,NULL,NULL,175.0000,NULL,NULL,NULL,27,13,'27|13'),(638,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,14,'default|27|14'),(639,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,15,'default|27|15'),(640,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,27,5,'27|5'),(641,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,27,6,'27|6'),(642,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,27,7,'27|7'),(643,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,27,8,'default|27|8'),(644,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,27,26,'27|26'),(645,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,27,19,'27|19'),(646,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,27,20,'27|20'),(647,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,27,21,'27|21'),(648,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,27,22,'27|22'),(649,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,28,9,'en|28|9'),(650,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,28,10,'en|28|10'),(651,NULL,NULL,'127',NULL,NULL,NULL,NULL,NULL,NULL,28,1,'28|1'),(652,'en',NULL,'Children\'s shoes7',NULL,NULL,NULL,NULL,NULL,NULL,28,2,'en|28|2'),(653,'en',NULL,'childrens-shoes7',NULL,NULL,NULL,NULL,NULL,NULL,28,3,'en|28|3'),(654,NULL,NULL,'37',NULL,NULL,NULL,NULL,NULL,NULL,28,27,'28|27'),(655,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,28,28,'default|28|28'),(656,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,28,16,'en|28|16'),(657,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,28,17,'en|28|17'),(658,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,28,18,'en|28|18'),(659,NULL,NULL,NULL,NULL,NULL,300.0000,NULL,NULL,NULL,28,11,'28|11'),(660,NULL,NULL,NULL,NULL,NULL,180.0000,NULL,NULL,NULL,28,12,'28|12'),(661,NULL,NULL,NULL,NULL,NULL,279.0000,NULL,NULL,NULL,28,13,'28|13'),(662,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,14,'default|28|14'),(663,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,15,'default|28|15'),(664,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,28,5,'28|5'),(665,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,28,6,'28|6'),(666,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,28,7,'28|7'),(667,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,28,8,'default|28|8'),(668,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,28,26,'28|26'),(669,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,28,19,'28|19'),(670,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,28,20,'28|20'),(671,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,28,21,'28|21'),(672,NULL,NULL,'.5',NULL,NULL,NULL,NULL,NULL,NULL,28,22,'28|22'),(673,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,29,9,'en|29|9'),(674,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,29,10,'en|29|10'),(675,NULL,NULL,'128',NULL,NULL,NULL,NULL,NULL,NULL,29,1,'29|1'),(676,'en',NULL,'Children\'s shoes8',NULL,NULL,NULL,NULL,NULL,NULL,29,2,'en|29|2'),(677,'en',NULL,'childrens-shoes8',NULL,NULL,NULL,NULL,NULL,NULL,29,3,'en|29|3'),(678,NULL,NULL,'38',NULL,NULL,NULL,NULL,NULL,NULL,29,27,'29|27'),(679,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,29,28,'default|29|28'),(680,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,29,16,'en|29|16'),(681,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,29,17,'en|29|17'),(682,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,29,18,'en|29|18'),(683,NULL,NULL,NULL,NULL,NULL,252.0000,NULL,NULL,NULL,29,11,'29|11'),(684,NULL,NULL,NULL,NULL,NULL,160.0000,NULL,NULL,NULL,29,12,'29|12'),(685,NULL,NULL,NULL,NULL,NULL,245.0000,NULL,NULL,NULL,29,13,'29|13'),(686,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,14,'default|29|14'),(687,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,15,'default|29|15'),(688,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,29,5,'29|5'),(689,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,29,6,'29|6'),(690,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,29,7,'29|7'),(691,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,29,8,'default|29|8'),(692,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,29,26,'29|26'),(693,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,29,19,'29|19'),(694,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,29,20,'29|20'),(695,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,29,21,'29|21'),(696,NULL,NULL,'.5',NULL,NULL,NULL,NULL,NULL,NULL,29,22,'29|22'),(697,'en',NULL,'<p>&nbsp;shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,30,9,'en|30|9'),(698,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,30,10,'en|30|10'),(699,NULL,NULL,'129',NULL,NULL,NULL,NULL,NULL,NULL,30,1,'30|1'),(700,'en',NULL,'Children\'s shoes9',NULL,NULL,NULL,NULL,NULL,NULL,30,2,'en|30|2'),(701,'en',NULL,'childrens-shoes9',NULL,NULL,NULL,NULL,NULL,NULL,30,3,'en|30|3'),(702,NULL,NULL,'39',NULL,NULL,NULL,NULL,NULL,NULL,30,27,'30|27'),(703,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,30,28,'default|30|28'),(704,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,30,16,'en|30|16'),(705,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,30,17,'en|30|17'),(706,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,30,18,'en|30|18'),(707,NULL,NULL,NULL,NULL,NULL,356.0000,NULL,NULL,NULL,30,11,'30|11'),(708,NULL,NULL,NULL,NULL,NULL,266.0000,NULL,NULL,NULL,30,12,'30|12'),(709,NULL,NULL,NULL,NULL,NULL,340.0000,NULL,NULL,NULL,30,13,'30|13'),(710,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,14,'default|30|14'),(711,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,15,'default|30|15'),(712,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,5,'30|5'),(713,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,6,'30|6'),(714,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,7,'30|7'),(715,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,30,8,'default|30|8'),(716,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,30,26,'30|26'),(717,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,30,19,'30|19'),(718,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,30,20,'30|20'),(719,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,30,21,'30|21'),(720,NULL,NULL,'.5',NULL,NULL,NULL,NULL,NULL,NULL,30,22,'30|22'),(721,'en',NULL,'<p>1shoes1</p>',NULL,NULL,NULL,NULL,NULL,NULL,31,9,'en|31|9'),(722,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,31,10,'en|31|10'),(723,NULL,NULL,'130',NULL,NULL,NULL,NULL,NULL,NULL,31,1,'31|1'),(724,'en',NULL,'Children\'s shoes10',NULL,NULL,NULL,NULL,NULL,NULL,31,2,'en|31|2'),(725,'en',NULL,'childrens-shoes10',NULL,NULL,NULL,NULL,NULL,NULL,31,3,'en|31|3'),(726,NULL,NULL,'40',NULL,NULL,NULL,NULL,NULL,NULL,31,27,'31|27'),(727,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,31,28,'default|31|28'),(728,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,31,16,'en|31|16'),(729,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,31,17,'en|31|17'),(730,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,31,18,'en|31|18'),(731,NULL,NULL,NULL,NULL,NULL,290.0000,NULL,NULL,NULL,31,11,'31|11'),(732,NULL,NULL,NULL,NULL,NULL,170.0000,NULL,NULL,NULL,31,12,'31|12'),(733,NULL,NULL,NULL,NULL,NULL,278.0000,NULL,NULL,NULL,31,13,'31|13'),(734,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,14,'default|31|14'),(735,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,15,'default|31|15'),(736,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,31,5,'31|5'),(737,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,31,6,'31|6'),(738,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,31,7,'31|7'),(739,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,31,8,'default|31|8'),(740,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,31,26,'31|26'),(741,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,31,19,'31|19'),(742,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,31,20,'31|20'),(743,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,31,21,'31|21'),(744,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,31,22,'31|22'),(745,'en',NULL,'<p>shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,32,9,'en|32|9'),(746,'en',NULL,'<p>Children\'s shoes</p>',NULL,NULL,NULL,NULL,NULL,NULL,32,10,'en|32|10'),(747,NULL,NULL,'131',NULL,NULL,NULL,NULL,NULL,NULL,32,1,'32|1'),(748,'en',NULL,'Children\'s shoes11',NULL,NULL,NULL,NULL,NULL,NULL,32,2,'en|32|2'),(749,'en',NULL,'childrens-shoes11',NULL,NULL,NULL,NULL,NULL,NULL,32,3,'en|32|3'),(750,NULL,NULL,'41',NULL,NULL,NULL,NULL,NULL,NULL,32,27,'32|27'),(751,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,32,28,'default|32|28'),(752,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,32,16,'en|32|16'),(753,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,32,17,'en|32|17'),(754,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,32,18,'en|32|18'),(755,NULL,NULL,NULL,NULL,NULL,180.0000,NULL,NULL,NULL,32,11,'32|11'),(756,NULL,NULL,NULL,NULL,NULL,80.0000,NULL,NULL,NULL,32,12,'32|12'),(757,NULL,NULL,NULL,NULL,NULL,165.0000,NULL,NULL,NULL,32,13,'32|13'),(758,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,14,'default|32|14'),(759,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,15,'default|32|15'),(760,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,32,5,'32|5'),(761,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,32,6,'32|6'),(762,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,32,7,'32|7'),(763,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,32,8,'default|32|8'),(764,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,32,26,'32|26'),(765,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,32,19,'32|19'),(766,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,32,20,'32|20'),(767,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,32,21,'32|21'),(768,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,32,22,'32|22');
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) NOT NULL,
  `label` varchar(191) DEFAULT NULL,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(191) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,4),(32,4);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels`
--

DROP TABLE IF EXISTS `product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_channels` (
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels`
--

LOCK TABLES `product_channels` WRITE;
/*!40000 ALTER TABLE `product_channels` DISABLE KEYS */;
INSERT INTO `product_channels` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1);
/*!40000 ALTER TABLE `product_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `value_type` varchar(191) NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sample_url` varchar(191) DEFAULT NULL,
  `sample_file` varchar(191) DEFAULT NULL,
  `sample_file_name` varchar(191) DEFAULT NULL,
  `sample_type` varchar(191) DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `product_number` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_key` varchar(191) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (1,'100','simple','1','Summer clothes1','<p>Summer clothes&nbsp;</p>','<p>Summer children\'s clothes</p>','summer-clothes1',1,1,1,'','','',200.0000,198.0000,NULL,NULL,3.0000,'2024-12-09 10:49:27','en','default',1,1,'2024-12-09 22:24:29',NULL,1),(2,'101','simple','2','Summer  clothes2','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes2',1,1,1,'','','',250.0000,220.0000,NULL,NULL,250.0000,'2024-12-09 11:01:23','en','default',1,2,'2024-12-10 06:59:57',NULL,1),(3,'102','simple','3','Summer clothes3','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes3',1,1,1,'','','',400.0000,385.0000,NULL,NULL,250.0000,'2024-12-09 11:01:35','en','default',1,3,'2024-12-10 06:59:32',NULL,1),(4,'104','simple','4','summer clothes','<p>summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes',1,1,1,'','','',200.0000,190.0000,NULL,NULL,2.0000,'2024-12-09 21:10:54','en','default',1,4,'2024-12-09 21:19:33',NULL,1),(5,'103','simple','5','Summer clothes4','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes4',1,1,1,'','','',600.0000,580.0000,NULL,NULL,2.0000,'2024-12-09 21:21:49','en','default',1,5,'2024-12-09 22:21:02',NULL,1),(6,'105','simple','7','Summer clothes5','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes5',1,1,1,'','','',330.0000,300.0000,NULL,NULL,13.0000,'2024-12-09 21:22:02','en','default',1,6,'2024-12-10 06:59:17',NULL,1),(7,'106','simple','6','Summer clothes6','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes6',1,1,1,'','','',600.0000,550.0000,NULL,NULL,3.0000,'2024-12-09 21:27:24','en','default',1,7,'2024-12-09 21:28:34',NULL,1),(8,'107','simple','8','Summer clothes7','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes7',1,1,1,'','','',800.0000,770.0000,NULL,NULL,3.0000,'2024-12-09 22:25:15','en','default',1,8,'2024-12-09 22:31:43',NULL,1),(9,'108','simple','9','Summer clothes8','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes8',1,1,1,'','','',660.0000,630.0000,NULL,NULL,2.5000,'2024-12-09 22:25:29','en','default',1,9,'2024-12-09 22:28:33',NULL,1),(10,'109','simple','10','Summer clothes9','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes9',1,1,1,'','','',670.0000,635.0000,NULL,NULL,2.5000,'2024-12-09 22:25:47','en','default',1,10,'2024-12-09 22:30:14',NULL,1),(11,'110','simple','11','summer clothes11','<p>Summer clothes</p>','<p>Summer children\'s clothes</p>','summer-clothes11',1,1,1,'','','',250.0000,235.0000,NULL,NULL,3.0000,'2024-12-09 22:32:28','en','default',1,11,'2024-12-09 22:34:03',NULL,1),(12,'111','simple','22','Winter clothing1','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing1',1,1,1,'','','',190.0000,177.0000,NULL,NULL,3.0000,'2024-12-10 08:15:17','en','default',1,12,'2024-12-10 08:44:20',NULL,1),(13,'112','simple','21','Winter clothing','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing',1,1,1,'','','',120.0000,110.0000,NULL,NULL,2.0000,'2024-12-10 08:15:45','en','default',1,13,'2024-12-10 08:43:06',NULL,1),(14,'113','simple','23','Winter clothing2','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing2',1,1,1,'','','',330.0000,300.0000,NULL,NULL,7.0000,'2024-12-10 08:16:08','en','default',1,14,'2024-12-10 08:45:26',NULL,1),(15,'114','simple','24','Winter clothing3','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing3',1,1,1,'','','',500.0000,470.0000,NULL,NULL,6.0000,'2024-12-10 08:45:54','en','default',1,15,'2024-12-10 08:50:10',NULL,1),(16,'115','simple','25','Winter clothing5','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing5',1,1,1,'','','',450.0000,410.0000,NULL,NULL,6.0000,'2024-12-10 08:46:07','en','default',1,16,'2024-12-10 08:52:24',NULL,1),(17,'116','simple','26','Winter clothing6','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing6',1,1,1,'','','',660.0000,645.0000,NULL,NULL,6.0000,'2024-12-10 08:46:19','en','default',1,17,'2024-12-10 08:54:06',NULL,1),(18,'117','simple','27','Winter clothing7','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing7',1,1,1,'','','',560.0000,520.0000,NULL,NULL,7.0000,'2024-12-10 09:40:47','en','default',1,18,'2024-12-10 09:42:27',NULL,1),(19,'118','simple','28','Winter clothing8','<p>Winter clothing</p>','<p>Winter children\'s clothing</p>','winter-clothing8',1,1,1,'','','',600.0000,580.0000,NULL,NULL,7.0000,'2024-12-10 09:41:02','en','default',1,19,'2024-12-10 09:43:33',NULL,1),(20,'119','simple','29','Winter clothing9','<p>Winter clothes</p>','<p>Winter children\'s clothes</p>','winter-clothing9',1,1,1,'','','',885.0000,799.0000,NULL,NULL,7.0000,'2024-12-10 11:10:14','en','default',1,20,'2024-12-10 11:24:36',NULL,1),(21,'120','simple','30','Winter clothing10','<p>Winter clothes</p>','<p>Winter children\'s clothes</p>','winter-clothing10',1,1,1,'','','',654.0000,610.0000,NULL,NULL,7.0000,'2024-12-10 11:12:40','en','default',1,21,'2024-12-10 11:14:03',NULL,1),(22,'121','simple','31','Children\'s shoes1','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes1',1,1,1,'','','',150.0000,135.0000,NULL,NULL,1.5000,'2024-12-10 11:15:17','en','default',1,22,'2024-12-10 11:17:45',NULL,1),(23,'122','simple','32','Children\'s shoes2','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes2',1,1,1,'','','',170.0000,160.0000,NULL,NULL,1.5000,'2024-12-10 11:15:26','en','default',1,23,'2024-12-10 11:18:53',NULL,1),(24,'123','simple','33','Children\'s shoes3','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes3',1,1,1,'','','',200.0000,185.0000,NULL,NULL,1.5000,'2024-12-10 11:15:46','en','default',1,24,'2024-12-10 11:19:45',NULL,1),(25,'124','simple','34','Children\'s shoes4','<p>&nbsp;shoes</p>','<p>Children\'s shoes</p>','childrens-shoes4',1,1,1,'','','',190.0000,160.0000,NULL,NULL,1.5000,'2024-12-10 11:15:48','en','default',1,25,'2024-12-10 11:22:48',NULL,1),(26,'125','simple','35','Children\'s shoes5','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes5',1,1,1,'','','',290.0000,280.0000,NULL,NULL,2.0000,'2024-12-10 11:25:21','en','default',1,26,'2024-12-10 11:38:20',NULL,1),(27,'126','simple','36','Children\'s shoes6','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes6',1,1,1,'','','',190.0000,175.0000,NULL,NULL,2.0000,'2024-12-10 11:26:14','en','default',1,27,'2024-12-10 11:39:11',NULL,1),(28,'127','simple','37','Children\'s shoes7','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes7',1,1,1,'','','',300.0000,279.0000,NULL,NULL,0.5000,'2024-12-10 11:26:24','en','default',1,28,'2024-12-10 11:32:11',NULL,1),(29,'128','simple','38','Children\'s shoes8','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes8',1,1,1,'','','',252.0000,245.0000,NULL,NULL,0.5000,'2024-12-10 11:26:42','en','default',1,29,'2024-12-10 11:33:09',NULL,1),(30,'129','simple','39','Children\'s shoes9','<p>&nbsp;shoes</p>','<p>Children\'s shoes</p>','childrens-shoes9',1,1,1,'','','',356.0000,340.0000,NULL,NULL,0.5000,'2024-12-10 11:27:05','en','default',1,30,'2024-12-10 11:34:09',NULL,1),(31,'130','simple','40','Children\'s shoes10','<p>1shoes1</p>','<p>Children\'s shoes</p>','childrens-shoes10',1,1,1,'','','',290.0000,278.0000,NULL,NULL,1.0000,'2024-12-10 11:27:17','en','default',1,31,'2024-12-10 11:35:35',NULL,1),(32,'131','simple','41','Children\'s shoes11','<p>shoes</p>','<p>Children\'s shoes</p>','childrens-shoes11',1,1,1,'','','',180.0000,165.0000,NULL,NULL,1.0000,'2024-12-10 11:36:15','en','default',1,32,'2024-12-10 11:37:20',NULL,1);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_grouped_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `associated_product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (4,'images','product/4/EHmzHaU856Rb8SbrWtI5oLf3zgBRWNoev2WjBqzW.webp',4,1),(7,'images','product/7/dquRvZvQ9OGjj62feLixwUsLdft03JMDRhLM5rdV.webp',7,1),(8,'images','product/5/SkqUFhnRgqrQA1FCV0j8as1RtSdTvBi1qOJvTDNt.webp',5,1),(10,'images','product/1/38pitxiDIncWGEaN5omY6ZqrGWBPAkw7pE6Bp6ol.webp',1,1),(11,'images','product/9/E0HM23Bh5ttbIwSsfBbp0B74J676CJDFm3lH4QDZ.webp',9,1),(12,'images','product/10/DOxfX7ZqYhzoLVT1jNRM020VWQ7485q2kDAfMPFQ.webp',10,1),(13,'images','product/8/5i24apSbiZ0zXP5TdV4ZOmR4KTBWmAhBx0kYjCus.webp',8,1),(14,'images','product/11/55gFgLrYpS1JjQWyGyQDt6m60y10zdGw8osVo9oC.webp',11,1),(15,'images','product/6/AvslFz7IKhlC9zcNgc70Rt5qtyTEJMNKCsenXuoy.webp',6,1),(16,'images','product/3/cxt8U1SL6vxnmeazekYiQ7KmxY4DpTMmYlTEBuBP.webp',3,1),(17,'images','product/2/J6xTngfgkSBJCBydIV2wx2zkjtJojFrKi6pVk7md.webp',2,1),(18,'images','product/13/tfvwzHWFuZMC8aFMKd9KW55kY7nHx58VB0WPLHKM.webp',13,1),(19,'images','product/12/sB77wmmOSodKPNT4MURmz4O8CQTCkpHv5hRE8Vn3.webp',12,1),(20,'images','product/14/G4Ge4Cvfi39ljNNSO8SBksipkJzF37GrmiCkrPz3.webp',14,1),(21,'images','product/15/dmnqrdO8CElowpYeMXuVJtat75WJWymFOsqoyO2K.webp',15,1),(22,'images','product/16/6JRZQ5B9UgFQkw9bKuZbIi9GgWOJLnWmDUwh7MsL.webp',16,1),(23,'images','product/17/xn0qUDOlt5QEN9Zt7fjn5LFoNxby1weyhd27lRnM.webp',17,1),(24,'images','product/18/mrfxM1TfpiiwdagXTQgQei22CzpX7GtWJWAkF6pT.webp',18,1),(25,'images','product/19/4hHdXKLQlmrAuOHW06TYhc3Th28kxPROIrDwBZEz.webp',19,1),(26,'images','product/21/wVeyFfifprWY1N6S2sbnkCgBCAwmEOxz71Yis2xa.webp',21,1),(27,'images','product/22/IXwLb5J94YKL7rGL0VrpqOzkxKiZ9Q5oIn7Zf11r.webp',22,1),(28,'images','product/23/boIz3Kxx6f0AbstVfmIDcPqlfPUD3jTWzA0aqqFo.webp',23,1),(29,'images','product/24/raKHafgtzGkEdsKWh3qV8c4cHBzmOVIFNCTlx01g.webp',24,1),(30,'images','product/25/wNtTxrEPbAK6bFo9GRFvWcOTF9g6Q9t5TjuTQ3JF.webp',25,1),(31,'images','product/20/8xKMdyBrtHwHzXHyUM8TeKaK6GkwBAdWXbUezg7s.webp',20,1),(32,'images','product/28/by2PFH6dkTTOatGmCmHGOsixYGmIUR9xbnUzuzok.webp',28,1),(33,'images','product/29/d0bjjittf9YJHpGrRa9ha9FuMf65Qd9XZcktXBz0.webp',29,1),(34,'images','product/30/vxpKeHHN0mplL9NXrHfU9R5KL3dlw4HxzljCLlq4.webp',30,1),(35,'images','product/31/9Q7nrK5oS7dSqMeharN1C8WBaAPlgqGz1W6RUBD1.webp',31,1),(36,'images','product/32/KKfkmCWJZ0WJplMSdwlqPFH4T4kECPNvJjF8TMqf.webp',32,1),(37,'images','product/26/hFT9baDfUNCOjsCWLYTKpUaUq5xGvRU3P3mnBlnU.webp',26,1),(38,'images','product/27/OpmkDGzua9tsCJUgEE9EUYJvYH3RKsxHRa6KpGUU.webp',27,1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (1,20,1,0,1),(2,20,2,0,1),(3,25,3,0,1),(4,50,4,0,1),(5,30,5,0,1),(6,60,7,0,1),(7,12,6,0,1),(8,55,8,0,1),(9,33,9,0,1),(10,22,10,0,1),(11,110,11,0,1),(12,20,13,0,1),(13,30,12,0,1),(14,60,14,0,1),(15,30,15,0,1),(16,25,16,0,1),(17,30,17,0,1),(18,20,18,0,1),(19,60,19,0,1),(20,25,20,0,1),(21,55,21,0,1),(22,100,22,0,1),(23,90,23,0,1),(24,150,24,0,1),(25,120,25,0,1),(26,80,26,0,1),(27,90,27,0,1),(28,60,28,0,1),(29,30,29,0,1),(30,90,30,0,1),(31,120,31,0,1),(32,60,32,0,1);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory_indices`
--

DROP TABLE IF EXISTS `product_inventory_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventory_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory_indices`
--

LOCK TABLES `product_inventory_indices` WRITE;
/*!40000 ALTER TABLE `product_inventory_indices` DISABLE KEYS */;
INSERT INTO `product_inventory_indices` VALUES (1,20,1,1,NULL,NULL),(2,20,2,1,NULL,NULL),(3,25,3,1,NULL,'2024-12-09 19:24:20'),(4,50,4,1,NULL,NULL),(5,29,5,1,NULL,'2024-12-17 08:47:09'),(6,59,7,1,NULL,'2024-12-17 09:05:45'),(7,12,6,1,NULL,'2024-12-09 20:22:44'),(8,47,8,1,NULL,'2024-12-17 09:21:56'),(9,31,9,1,NULL,'2024-12-17 08:47:09'),(10,17,10,1,NULL,'2024-12-17 09:21:56'),(11,110,11,1,NULL,NULL),(12,20,13,1,NULL,NULL),(13,29,12,1,NULL,'2024-12-11 05:55:00'),(14,60,14,1,NULL,NULL),(15,30,15,1,NULL,NULL),(16,25,16,1,NULL,NULL),(17,25,17,1,NULL,'2024-12-17 09:21:56'),(18,19,18,1,NULL,'2024-12-17 09:05:45'),(19,59,19,1,NULL,'2024-12-11 05:54:59'),(20,20,20,1,NULL,'2024-12-17 09:21:56'),(21,54,21,1,NULL,'2024-12-17 08:47:09'),(22,99,22,1,NULL,'2024-12-11 05:54:59'),(23,89,23,1,NULL,'2024-12-11 05:54:59'),(24,150,24,1,NULL,NULL),(25,120,25,1,NULL,NULL),(26,80,26,1,NULL,'2024-12-10 09:38:20'),(27,90,27,1,NULL,'2024-12-10 09:39:11'),(28,60,28,1,NULL,NULL),(29,30,29,1,NULL,NULL),(30,90,30,1,NULL,NULL),(31,120,31,1,NULL,NULL),(32,60,32,1,NULL,NULL);
/*!40000 ALTER TABLE `product_inventory_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
INSERT INTO `product_ordered_inventories` VALUES (46,1,19,1),(47,2,9,1),(48,1,23,1),(49,1,22,1),(50,1,12,1),(51,5,20,1),(52,8,8,1),(53,5,17,1),(54,5,10,1),(55,1,21,1),(56,1,5,1),(57,1,7,1),(58,1,18,1);
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_indices`
--

DROP TABLE IF EXISTS `product_price_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL DEFAULT 1,
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_indices`
--

LOCK TABLES `product_price_indices` WRITE;
/*!40000 ALTER TABLE `product_price_indices` DISABLE KEYS */;
INSERT INTO `product_price_indices` VALUES (1,1,1,1,198.0000,200.0000,198.0000,200.0000,NULL,'2024-12-09 20:24:29'),(2,1,2,1,198.0000,200.0000,198.0000,200.0000,NULL,'2024-12-09 20:24:29'),(3,1,3,1,198.0000,200.0000,198.0000,200.0000,NULL,'2024-12-09 20:24:29'),(4,2,1,1,220.0000,250.0000,220.0000,250.0000,NULL,'2024-12-09 19:23:12'),(5,2,2,1,220.0000,250.0000,220.0000,250.0000,NULL,'2024-12-09 19:23:13'),(6,2,3,1,220.0000,250.0000,220.0000,250.0000,NULL,'2024-12-09 19:23:13'),(7,3,1,1,385.0000,400.0000,385.0000,400.0000,NULL,'2024-12-09 19:24:21'),(8,3,2,1,385.0000,400.0000,385.0000,400.0000,NULL,'2024-12-09 19:24:21'),(9,3,3,1,385.0000,400.0000,385.0000,400.0000,NULL,'2024-12-09 19:24:21'),(10,4,1,1,190.0000,200.0000,190.0000,200.0000,NULL,NULL),(11,4,2,1,190.0000,200.0000,190.0000,200.0000,NULL,NULL),(12,4,3,1,190.0000,200.0000,190.0000,200.0000,NULL,NULL),(13,5,1,1,580.0000,600.0000,580.0000,600.0000,NULL,'2024-12-09 20:21:03'),(14,5,2,1,580.0000,600.0000,580.0000,600.0000,NULL,'2024-12-09 20:21:03'),(15,5,3,1,580.0000,600.0000,580.0000,600.0000,NULL,'2024-12-09 20:21:03'),(16,7,1,1,550.0000,600.0000,550.0000,600.0000,NULL,NULL),(17,7,2,1,550.0000,600.0000,550.0000,600.0000,NULL,NULL),(18,7,3,1,550.0000,600.0000,550.0000,600.0000,NULL,NULL),(19,6,1,1,300.0000,330.0000,300.0000,330.0000,NULL,NULL),(20,6,2,1,300.0000,330.0000,300.0000,330.0000,NULL,NULL),(21,6,3,1,300.0000,330.0000,300.0000,330.0000,NULL,NULL),(22,8,1,1,770.0000,800.0000,770.0000,800.0000,NULL,'2024-12-09 20:31:44'),(23,8,2,1,770.0000,800.0000,770.0000,800.0000,NULL,'2024-12-09 20:31:44'),(24,8,3,1,770.0000,800.0000,770.0000,800.0000,NULL,'2024-12-09 20:31:44'),(25,9,1,1,630.0000,660.0000,630.0000,660.0000,NULL,NULL),(26,9,2,1,630.0000,660.0000,630.0000,660.0000,NULL,NULL),(27,9,3,1,630.0000,660.0000,630.0000,660.0000,NULL,NULL),(28,10,1,1,635.0000,670.0000,635.0000,670.0000,NULL,NULL),(29,10,2,1,635.0000,670.0000,635.0000,670.0000,NULL,NULL),(30,10,3,1,635.0000,670.0000,635.0000,670.0000,NULL,NULL),(31,11,1,1,235.0000,250.0000,235.0000,250.0000,NULL,NULL),(32,11,2,1,235.0000,250.0000,235.0000,250.0000,NULL,NULL),(33,11,3,1,235.0000,250.0000,235.0000,250.0000,NULL,NULL),(34,13,1,1,110.0000,120.0000,110.0000,120.0000,NULL,NULL),(35,13,2,1,110.0000,120.0000,110.0000,120.0000,NULL,NULL),(36,13,3,1,110.0000,120.0000,110.0000,120.0000,NULL,NULL),(37,12,1,1,177.0000,190.0000,177.0000,190.0000,NULL,NULL),(38,12,2,1,177.0000,190.0000,177.0000,190.0000,NULL,NULL),(39,12,3,1,177.0000,190.0000,177.0000,190.0000,NULL,NULL),(40,14,1,1,300.0000,330.0000,300.0000,330.0000,NULL,NULL),(41,14,2,1,300.0000,330.0000,300.0000,330.0000,NULL,NULL),(42,14,3,1,300.0000,330.0000,300.0000,330.0000,NULL,NULL),(43,15,1,1,470.0000,500.0000,470.0000,500.0000,NULL,NULL),(44,15,2,1,470.0000,500.0000,470.0000,500.0000,NULL,NULL),(45,15,3,1,470.0000,500.0000,470.0000,500.0000,NULL,NULL),(46,16,1,1,410.0000,450.0000,410.0000,450.0000,NULL,NULL),(47,16,2,1,410.0000,450.0000,410.0000,450.0000,NULL,NULL),(48,16,3,1,410.0000,450.0000,410.0000,450.0000,NULL,NULL),(49,17,1,1,645.0000,660.0000,645.0000,660.0000,NULL,NULL),(50,17,2,1,645.0000,660.0000,645.0000,660.0000,NULL,NULL),(51,17,3,1,645.0000,660.0000,645.0000,660.0000,NULL,NULL),(52,18,1,1,520.0000,560.0000,520.0000,560.0000,NULL,NULL),(53,18,2,1,520.0000,560.0000,520.0000,560.0000,NULL,NULL),(54,18,3,1,520.0000,560.0000,520.0000,560.0000,NULL,NULL),(55,19,1,1,580.0000,600.0000,580.0000,600.0000,NULL,NULL),(56,19,2,1,580.0000,600.0000,580.0000,600.0000,NULL,NULL),(57,19,3,1,580.0000,600.0000,580.0000,600.0000,NULL,NULL),(58,20,1,1,799.0000,885.0000,799.0000,885.0000,NULL,NULL),(59,20,2,1,799.0000,885.0000,799.0000,885.0000,NULL,NULL),(60,20,3,1,799.0000,885.0000,799.0000,885.0000,NULL,NULL),(61,21,1,1,610.0000,654.0000,610.0000,654.0000,NULL,NULL),(62,21,2,1,610.0000,654.0000,610.0000,654.0000,NULL,NULL),(63,21,3,1,610.0000,654.0000,610.0000,654.0000,NULL,NULL),(64,22,1,1,135.0000,150.0000,135.0000,150.0000,NULL,NULL),(65,22,2,1,135.0000,150.0000,135.0000,150.0000,NULL,NULL),(66,22,3,1,135.0000,150.0000,135.0000,150.0000,NULL,NULL),(67,23,1,1,160.0000,170.0000,160.0000,170.0000,NULL,NULL),(68,23,2,1,160.0000,170.0000,160.0000,170.0000,NULL,NULL),(69,23,3,1,160.0000,170.0000,160.0000,170.0000,NULL,NULL),(70,24,1,1,185.0000,200.0000,185.0000,200.0000,NULL,NULL),(71,24,2,1,185.0000,200.0000,185.0000,200.0000,NULL,NULL),(72,24,3,1,185.0000,200.0000,185.0000,200.0000,NULL,NULL),(73,25,1,1,160.0000,190.0000,160.0000,190.0000,NULL,NULL),(74,25,2,1,160.0000,190.0000,160.0000,190.0000,NULL,NULL),(75,25,3,1,160.0000,190.0000,160.0000,190.0000,NULL,NULL),(76,26,1,1,280.0000,290.0000,280.0000,290.0000,NULL,NULL),(77,26,2,1,280.0000,290.0000,280.0000,290.0000,NULL,NULL),(78,26,3,1,280.0000,290.0000,280.0000,290.0000,NULL,NULL),(79,27,1,1,175.0000,190.0000,175.0000,190.0000,NULL,NULL),(80,27,2,1,175.0000,190.0000,175.0000,190.0000,NULL,NULL),(81,27,3,1,175.0000,190.0000,175.0000,190.0000,NULL,NULL),(82,28,1,1,279.0000,300.0000,279.0000,300.0000,NULL,NULL),(83,28,2,1,279.0000,300.0000,279.0000,300.0000,NULL,NULL),(84,28,3,1,279.0000,300.0000,279.0000,300.0000,NULL,NULL),(85,29,1,1,245.0000,252.0000,245.0000,252.0000,NULL,NULL),(86,29,2,1,245.0000,252.0000,245.0000,252.0000,NULL,NULL),(87,29,3,1,245.0000,252.0000,245.0000,252.0000,NULL,NULL),(88,30,1,1,340.0000,356.0000,340.0000,356.0000,NULL,NULL),(89,30,2,1,340.0000,356.0000,340.0000,356.0000,NULL,NULL),(90,30,3,1,340.0000,356.0000,340.0000,356.0000,NULL,NULL),(91,31,1,1,278.0000,290.0000,278.0000,290.0000,NULL,NULL),(92,31,2,1,278.0000,290.0000,278.0000,290.0000,NULL,NULL),(93,31,3,1,278.0000,290.0000,278.0000,290.0000,NULL,NULL),(94,32,1,1,165.0000,180.0000,165.0000,180.0000,NULL,NULL),(95,32,2,1,165.0000,180.0000,165.0000,180.0000,NULL,NULL),(96,32,3,1,165.0000,180.0000,165.0000,180.0000,NULL,NULL);
/*!40000 ALTER TABLE `product_price_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_relations` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_attachments`
--

DROP TABLE IF EXISTS `product_review_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_review_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `type` varchar(191) DEFAULT 'image',
  `mime_type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_attachments`
--

LOCK TABLES `product_review_attachments` WRITE;
/*!40000 ALTER TABLE `product_review_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL DEFAULT '',
  `title` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'100','simple',NULL,1,NULL,'2024-12-09 08:49:27','2024-12-09 08:49:27'),(2,'101','simple',NULL,1,NULL,'2024-12-09 09:01:22','2024-12-09 09:01:22'),(3,'102','simple',NULL,1,NULL,'2024-12-09 09:01:35','2024-12-09 09:01:35'),(4,'104','simple',NULL,1,NULL,'2024-12-09 19:10:53','2024-12-09 19:10:53'),(5,'103','simple',NULL,1,NULL,'2024-12-09 19:21:49','2024-12-09 19:21:49'),(6,'105','simple',NULL,1,NULL,'2024-12-09 19:22:01','2024-12-09 19:22:01'),(7,'106','simple',NULL,1,NULL,'2024-12-09 19:27:24','2024-12-09 19:27:24'),(8,'107','simple',NULL,1,NULL,'2024-12-09 20:25:15','2024-12-09 20:25:15'),(9,'108','simple',NULL,1,NULL,'2024-12-09 20:25:28','2024-12-09 20:25:28'),(10,'109','simple',NULL,1,NULL,'2024-12-09 20:25:47','2024-12-09 20:25:47'),(11,'110','simple',NULL,1,NULL,'2024-12-09 20:32:27','2024-12-09 20:32:27'),(12,'111','simple',NULL,1,NULL,'2024-12-10 06:15:17','2024-12-10 06:15:17'),(13,'112','simple',NULL,1,NULL,'2024-12-10 06:15:45','2024-12-10 06:15:45'),(14,'113','simple',NULL,1,NULL,'2024-12-10 06:16:08','2024-12-10 06:16:08'),(15,'114','simple',NULL,1,NULL,'2024-12-10 06:45:54','2024-12-10 06:45:54'),(16,'115','simple',NULL,1,NULL,'2024-12-10 06:46:07','2024-12-10 06:46:07'),(17,'116','simple',NULL,1,NULL,'2024-12-10 06:46:18','2024-12-10 06:46:18'),(18,'117','simple',NULL,1,NULL,'2024-12-10 07:40:46','2024-12-10 07:40:46'),(19,'118','simple',NULL,1,NULL,'2024-12-10 07:41:02','2024-12-10 07:41:02'),(20,'119','simple',NULL,1,NULL,'2024-12-10 09:10:13','2024-12-10 09:10:13'),(21,'120','simple',NULL,1,NULL,'2024-12-10 09:12:40','2024-12-10 09:12:40'),(22,'121','simple',NULL,1,NULL,'2024-12-10 09:15:16','2024-12-10 09:15:16'),(23,'122','simple',NULL,1,NULL,'2024-12-10 09:15:25','2024-12-10 09:15:25'),(24,'123','simple',NULL,1,NULL,'2024-12-10 09:15:46','2024-12-10 09:15:46'),(25,'124','simple',NULL,1,NULL,'2024-12-10 09:15:47','2024-12-10 09:15:47'),(26,'125','simple',NULL,1,NULL,'2024-12-10 09:25:20','2024-12-10 09:25:20'),(27,'126','simple',NULL,1,NULL,'2024-12-10 09:26:13','2024-12-10 09:26:13'),(28,'127','simple',NULL,1,NULL,'2024-12-10 09:26:24','2024-12-10 09:26:24'),(29,'128','simple',NULL,1,NULL,'2024-12-10 09:26:41','2024-12-10 09:26:41'),(30,'129','simple',NULL,1,NULL,'2024-12-10 09:27:05','2024-12-10 09:27:05'),(31,'130','simple',NULL,1,NULL,'2024-12-10 09:27:17','2024-12-10 09:27:17'),(32,'131','simple',NULL,1,NULL,'2024-12-10 09:36:14','2024-12-10 09:36:14');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `refund_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `permission_type` varchar(191) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','This role users will have all the access','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_synonyms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `terms` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) NOT NULL,
  `results` int(11) NOT NULL DEFAULT 0,
  `uses` int(11) NOT NULL DEFAULT 0,
  `redirect_url` varchar(191) DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `base_price` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) DEFAULT 0.0000,
  `base_total` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) DEFAULT NULL,
  `carrier_title` varchar(191) DEFAULT NULL,
  `track_number` text DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemaps`
--

DROP TABLE IF EXISTS `sitemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemaps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemaps`
--

LOCK TABLES `sitemaps` WRITE;
/*!40000 ALTER TABLE `sitemaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(191) DEFAULT NULL,
  `zip_from` varchar(191) DEFAULT NULL,
  `zip_to` varchar(191) DEFAULT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customization_translations`
--

DROP TABLE IF EXISTS `theme_customization_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_customization_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`)),
  PRIMARY KEY (`id`),
  KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customization_translations`
--

LOCK TABLES `theme_customization_translations` WRITE;
/*!40000 ALTER TABLE `theme_customization_translations` DISABLE KEYS */;
INSERT INTO `theme_customization_translations` VALUES (2,2,'en','{\"html\":\"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW<\\/h1><\\/div>\",\"css\":\".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\"}'),(3,3,'en','{\"filters\":{\"sort\":\"asc\",\"limit\":\"10\",\"parent_id\":\"1\"}}'),(4,4,'en','{\"title\":\"New Products\",\"filters\":{\"new\":1,\"sort\":\"asc\",\"limit\":10}}'),(5,5,'en','{\"html\":\"<div class=\\\"top-collection-container\\\">\\r\\n    <div class=\\\"top-collection-header\\\">\\r\\n         <h2>The game with our new additions!<\\/h2>\\r\\n\\r\\n    <\\/div>\\r\\n    <div class=\\\"top-collection-grid container\\\">\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/4626306-222473277.jpg\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Our Collections<\\/h3>\\r\\n\\r\\n        <\\/div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/72a5e7db-f07e-428b-949b-46727a49cc7a-1000x918.81443298969-L4NGOZ2oVZlINf9Yot306Oy0aNmkMPIakP3oCA2G.jpg\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Our Collections<\\/h3>\\r\\n\\r\\n        <\\/div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/Chica Joven Leggings con camiseta con patr\\u00f3n de letra de hombros ca\\u00eddos con capucha.jpg\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Our Collections<\\/h3>\\r\\n\\r\\n        <\\/div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/6421d42dcc3dbc9b1ce0f632_-_500.jpeg\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Our Collections<\\/h3>\\r\\n\\r\\n        <\\/div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/images-46.jpeg\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Our Collections<\\/h3>\\r\\n\\r\\n        <\\/div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/41EURmrYiAL._AC_SY1000_.jpg\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Our Collections<\\/h3>\\r\\n\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}\"}'),(6,6,'en','{\"html\":\"<div class=\\\"section-gap bold-collections container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/6\\/ac-image-PW1599646479Az.jpeg\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> \\r\\n            <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!<\\/p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections<\\/button>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\"}'),(7,7,'en','{\"title\":\"Featured Products\",\"filters\":{\"featured\":1,\"sort\":\"desc\",\"limit\":10}}'),(8,8,'en','{\"html\":\"<div class=\\\"section-game\\\">\\r\\n    <div class=\\\"section-title\\\">\\r\\n         <h2>The game with our new additions!<\\/h2> \\r\\n    <\\/div>\\r\\n    <div class=\\\"section-gap container\\\">\\r\\n        <div class=\\\"collection-card-wrapper\\\">\\r\\n            <div class=\\\"single-collection-card\\\">\\r\\n                <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/l1.jpg\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\">\\r\\n                 <h3 class=\\\"overlay-text\\\">Our Collections<\\/h3> \\r\\n            <\\/div>\\r\\n            <div class=\\\"single-collection-card\\\">\\r\\n                <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/106919.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\">\\r\\n                 <h3 class=\\\"overlay-text\\\"> Our Collections <\\/h3> \\r\\n            <\\/div>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\"}'),(9,9,'en','{\"title\":\"All Products\"}'),(10,10,'en','{\"html\":\"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/10\\/FGukYQnGLxOEjQtm9BvP0rWYxwKEI4nWuduRRFOY.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!<\\/p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\"}'),(11,11,'en','{\"column_1\":[{\"url\":\"http:\\/\\/localhost:8000\\/page\\/about-us\",\"title\":\"About Us\",\"sort_order\":1},{\"url\":\"http:\\/\\/localhost:8000\\/contact-us\",\"title\":\"Contact Us\",\"sort_order\":2},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/customer-service\",\"title\":\"Customer Service\",\"sort_order\":3},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/whats-new\",\"title\":\"What\'s New\",\"sort_order\":4},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/terms-of-use\",\"title\":\"Terms of Use\",\"sort_order\":5},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/terms-conditions\",\"title\":\"Terms & Conditions\",\"sort_order\":6}],\"column_2\":[{\"url\":\"http:\\/\\/localhost:8000\\/page\\/privacy-policy\",\"title\":\"Privacy Policy\",\"sort_order\":1},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/payment-policy\",\"title\":\"Payment Policy\",\"sort_order\":2},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/shipping-policy\",\"title\":\"Shipping Policy\",\"sort_order\":3},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/refund-policy\",\"title\":\"Refund Policy\",\"sort_order\":4},{\"url\":\"http:\\/\\/localhost:8000\\/page\\/return-policy\",\"title\":\"Return Policy\",\"sort_order\":5}]}'),(12,12,'en','{\"services\":[{\"title\":\"Free Shipping\",\"description\":\"Enjoy free shipping on all orders\",\"service_icon\":\"icon-truck\"},{\"title\":\"Product Replace\",\"description\":\"Easy Product Replacement Available!\",\"service_icon\":\"icon-product\"},{\"title\":\"Emi Available\",\"description\":\"No cost EMI available on all major credit cards\",\"service_icon\":\"icon-dollar-sign\"},{\"title\":\"24\\/7 Support\",\"description\":\"Dedicated 24\\/7 support via chat and email\",\"service_icon\":\"icon-support\"}]}');
/*!40000 ALTER TABLE `theme_customization_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customizations`
--

DROP TABLE IF EXISTS `theme_customizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_customizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(191) DEFAULT 'default',
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customizations`
--

LOCK TABLES `theme_customizations` WRITE;
/*!40000 ALTER TABLE `theme_customizations` DISABLE KEYS */;
INSERT INTO `theme_customizations` VALUES (2,'default','static_content','Offer Information',2,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(3,'default','category_carousel','Categories Collections',3,0,1,'2024-12-09 06:13:41','2024-12-17 08:42:17'),(4,'default','product_carousel','New Products',4,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(5,'default','static_content','Top Collections',5,1,1,'2024-12-09 06:13:41','2024-12-12 08:24:30'),(6,'default','static_content','Bold Collections',6,1,1,'2024-12-09 06:13:41','2024-12-12 08:05:59'),(7,'default','product_carousel','Featured Collections',7,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(8,'default','static_content','Game Container',8,1,1,'2024-12-09 06:13:41','2024-12-12 07:56:11'),(9,'default','product_carousel','All Products',9,0,1,'2024-12-09 06:13:41','2024-12-17 09:08:33'),(10,'default','static_content','Bold Collections',10,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(11,'default','footer_links','Footer Links',11,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41'),(12,'default','services_content','Services Content',12,1,1,'2024-12-09 06:13:41','2024-12-09 06:13:41');
/*!40000 ALTER TABLE `theme_customizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrites`
--

DROP TABLE IF EXISTS `url_rewrites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_rewrites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) NOT NULL,
  `request_path` varchar(191) NOT NULL,
  `target_path` varchar(191) NOT NULL,
  `redirect_type` varchar(191) DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrites`
--

LOCK TABLES `url_rewrites` WRITE;
/*!40000 ALTER TABLE `url_rewrites` DISABLE KEYS */;
INSERT INTO `url_rewrites` VALUES (1,'category','┘é╪│┘à-╪د┘╪│╪ز╪د┘è╪▒','summer-childrens-clothes','301','en','2024-12-09 19:17:09','2024-12-09 19:17:09'),(2,'product','╪▒┘â┘┘ç','summer-clothes1','301','en','2024-12-09 19:21:22','2024-12-09 19:21:22'),(3,'product','╪▒┘â┘┘ç1','summer-clothes2','301','en','2024-12-09 19:23:11','2024-12-09 19:23:11'),(4,'product','╪▒┘â┘┘ç2','summer-clothes3','301','en','2024-12-09 19:24:19','2024-12-09 19:24:19'),(6,'category','winter-childrens-clothing','winter-childrens-clothes','301','en','2024-12-10 06:40:58','2024-12-10 06:40:58');
/*!40000 ALTER TABLE `url_rewrites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) DEFAULT NULL,
  `request` mediumtext DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `referer` mediumtext DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visitable_type` varchar(191) DEFAULT NULL,
  `visitable_id` bigint(20) unsigned DEFAULT NULL,
  `visitor_type` varchar(191) DEFAULT NULL,
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  KEY `visits_channel_id_foreign` (`channel_id`),
  CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-09 06:17:25','2024-12-09 06:17:25'),(2,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkJ2K0QvU3dHSkhuL2lmUGFpQUgxRGc9PSIsInZhbHVlIjoiRzZtWHNIeUMvZk9icHZZRVluNHQxbVNsWXdENmhMbVZneDQ4cWxaN1pWR3hPYkhGcjIrdEJ3YnE3UW45T2J5ZDJHYW5oZW5iS0oyVkpUb3RVMHVkU05QOXBPNllOYzR1dHFQWFlKVnc5TXJXQk1OS2ZRMzdsZEhKcmFISnJWdkwiLCJtYWMiOiI2ZDJkM2UyYWIzZDFmZjdlODQ0ZDMyYmY2NmUxYzBmZDQwYjE3OGU4ZTYzMjUzMWZhM2UwMjA3YWFjYmJhZThiIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkYxOFFOdnRSZ0F1dHo3ejczbU1wZ1E9PSIsInZhbHVlIjoiKy9OWm12SW1xRE1xRTQ5TTYxSTRab3lobEtUWkorWUwwUlFmUXU2R1NETzQzTDBybmZiQzZ0RkFQekZkTitZa0RYelRuMlRZZFZLak5id0J0M1pFNXN3TlIxckk3S0d0NHpQc05OeG0rTFVCWWE5STNGZTc5a212MmZSQlV1L28iLCJtYWMiOiI2MzcwMjZlMmJhZTIxNWNmZWRhOTYzYWQ2M2NhOWQ1NjhlZDBkZGI4ZjUwNjlhOWJlMGI5Y2I2YTRjOWY3ZDQ5IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-12-09 06:21:23','2024-12-09 06:21:23'),(3,'GET','[]','http://127.0.0.1:8000/%D9%82%D8%B3%D9%85-%D8%A7%D9%84%D8%B1%D9%83%D9%86-%D8%A7%D9%84%D8%A7%D9%81%D8%B1%D9%86%D8%AC%D9%8A','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IkNYdU1Pamc0Y2NQd3FXLzNDa0NlSUE9PSIsInZhbHVlIjoiL1NFZjFXNEVhWVRMSHBKZmcyZ3NDU1E4MkVlY0JLTzd4bU92eDJKN0JkOFdFa3l4Rlk5ZDRpQjdYZTBMRC9GSUFRelBVR09zK1p1UFNxYzV2cFRLbW5QNGhGcy8vcURVejR5UVdtSDZDcndTaXZUZ0drVDYvdHQ0Zk1kTlprYzgiLCJtYWMiOiJjZjU2MjdhMDlmZjJkZjY0MGM2YmM1NjBmYjdkMGRmMTU1MTk1ZjZjMjE1M2Q2OWM1ZjRlZTA2MTFmN2RiM2UwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InlXZFJ6THJ2akpFejhyczhJNFJQd1E9PSIsInZhbHVlIjoicElLd2pRTm92b2lrazNodFVTVHB3QnJVVXZKcHlUa0RrZnYrbDNGajFXNTBxOWJwTko3MlZMVlJub3FCdDJkRlpYRzVrNzlteHM3N2tmVzlTMDByWnJZMXE2dS8zZ0I4b0V5MTVMbDBzd1MvNHJ3ZitPaFhETithTW00cTB3am4iLCJtYWMiOiJjMjVlMDJhNzg2MWY5MjAzN2RhZjg3MjE2Nzc0ZmU0MDY5MmI4YzdjYTg4YjljMTRhY2E2M2ZkMmM2MzhmYzFjIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-12-09 08:58:39','2024-12-09 08:58:39'),(4,'GET','[]','http://127.0.0.1:8000/%D8%B1%D9%83%D9%86%D9%871','http://127.0.0.1:8000/%D9%82%D8%B3%D9%85-%D8%A7%D9%84%D8%B1%D9%83%D9%86-%D8%A7%D9%84%D8%A7%D9%81%D8%B1%D9%86%D8%AC%D9%8A','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/%D9%82%D8%B3%D9%85-%D8%A7%D9%84%D8%B1%D9%83%D9%86-%D8%A7%D9%84%D8%A7%D9%81%D8%B1%D9%86%D8%AC%D9%8A\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Ilp6UWJvb3lvV2EwR0g5N05zSThzQVE9PSIsInZhbHVlIjoiN2R6RmpVcHlSUXJNRG5LZU42UmRDc3g2RDBmSHY0Rk5BUE0wdS9GVjIvNWc2SFJ6ZlNkVWZ2QlhVTldYSHY4d1ZCQ1hWSE5WbGFZN0lqL1Yxak0vdWR5cFlBeElXWllQNWdxd1BVK3pSTThFNDh5V1FjekZTRS9mZ3JkQlR4dk8iLCJtYWMiOiJkZThiMTRmNzAwYzkzYjRhZGJjNTM0OWFjNTkyYmQwYmIxOTQyZTFlM2IyNzU5YTM5YzIyMDI3MTMyMzcxOGMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IndtckRSbWVKUFZYd09SMm5CTVJGcmc9PSIsInZhbHVlIjoibjlmYkhVRVVTV2xCalUrNFF5WWhKVXFMUEU1aXZYWWVQdmU1RGVoYTlja1QwclB4Vmk4M0pTT1RxWmc5ek4rZm9iRkVsdDNtUXI5cVdDNlZxRzlXSTZ5bUNrWWRNd2dBbWxPVDRCeXVwbmRQbjQ0SEtZdkpSS0pUcko1L2gwT0ciLCJtYWMiOiIxOThlODJiZWY4YTJmMTc0Mjc4YzUyOWUyMzg3MzMyNmU1ZTRkNDk2YWNlZTM1ZGFhOGQ4MmRkODlmMjUzNWZlIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Product\\Models\\Product',2,NULL,NULL,1,'2024-12-09 09:08:40','2024-12-09 09:08:40'),(5,'GET','[]','http://127.0.0.1:8000/%D9%82%D8%B3%D9%85-%D8%A7%D9%84%D8%B3%D8%AA%D8%A7%D9%8A%D8%B1','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjdiNFZxNlBXV3k0TmRLc2JySzhGTFE9PSIsInZhbHVlIjoic0czSkpjV0tIS0g5N1B3OVpvaldKUEtEcVBqTjdmdUxsQ0FjYldZaWMrUHluTmZPTnZLcmNXQUNleVg2SFExTFRoUDZyOWU5T1p0MFJCeWtCZ2IrYUpqWEFqR3pFalhnbGVYOHNhRmRRWlVNU1gzb2NNZ2x4ZUptZHdodE1ybkgiLCJtYWMiOiI0ZTk2NmVjYmM3NzVlY2Q1ZDE5MTk0MWU5ODQ1N2RjZGRlMGZkZjI0NzdjYzViYjExOTQwOWFjNjg1ZDRjNjEyIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkpjdnhRaWljMXFZcDJXUER3OCtzSUE9PSIsInZhbHVlIjoidmY4V0x6S1dQTGt2Vm5Id2dSdTgvelJYRVVYcEhtNm96SHluR2lkWFM2UlZ5OG5jZlM4SW1IS2xqZ2hpamxCLzJSVkFEQUI5NzhQc2trWDhibS9Ua1ZCNUYvZ0pqZzRqYWh1TkE3d1J2RSttNUt5TGN5ajhwMDViNW9VMEJKZ2siLCJtYWMiOiIwNDZlOWYyMjYyMjFkMjkxMDJkZWE0NDg4MmMzOWUzZjE4OTE4Yjc3MTllNGJiZDYwZmE4NTI4NzcyNzk2MTU1IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-12-09 19:02:23','2024-12-09 19:02:23'),(6,'GET','[]','http://127.0.0.1:8000/summer-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Ikg2aFN4ZE1nUmJ0MUlnYVZFVHdLL1E9PSIsInZhbHVlIjoiRmNkUWhEb25JZjVIMnl1Si82Y3JCR2xvamloZzhGSkxxN2ZxMlNJWHE4bTZ4ZE5wSkZkN1E0K2ZFelVBcUx2VmJSMGFTZHB6N1dVRnlWcVFhMjFyekljdVV2Tk45Zzc4NWNLY09HSTRQV2wxT3NjaVByOXo1eVhxVnAxMmpXNnQiLCJtYWMiOiIyMTk0ZjkzZTI1MTBlYTNiNzAwZTkyNjIxZWUwOGNjZjM4MTliYTUzNTE2NDE0MmVkYjQ0YTY5MzYxMDI2NmExIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjY2VzV0Szk0RHJYTUgrVDZNWFFqTUE9PSIsInZhbHVlIjoicloxZ0grUHYwZyt4U2VjUVVhWmRBNDNOWnpud053NlZmQ2FIL290UzRFOUxtN3hxb3BqUWo1aDI4SVBVUmZReG94aFdhbnRPdnBmb0ZHSkVtRkQ3RDJsMkpDVlMxTXliMWc2VkJmaUdnQ3MzdTl0YVRYSHhJVTBFbDJhTmRnSXQiLCJtYWMiOiJjMjJmODc0NDUzMWZjOWQyZDU1MWYxYmExYTRiZGIxMDgxYmVjM2FhMDQ4MTQzNmJjMjk2MzBiOWM2OWVmN2NlIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-12-09 20:40:01','2024-12-09 20:40:01'),(7,'GET','[]','http://127.0.0.1:8000/summer-clothes8','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6ImJMMFpBMzVzbHdqdnpac09MY2JuY3c9PSIsInZhbHVlIjoieW1VdGRxOVdSUjlPMDUxN0xFZ0xqL1dxRlFmZTNySG9PeEhLd0FvR21iamdicEFjOEpBTjVhTzYzMTBCL1lTcGIvQ2l4V05NWk8yM0NNZzd5WXZaK2tSZVBSaEtSdjBVcTAxL2JUMGgrVEw1Y3JmRk5LNHFzaDBmSVFMbm9rZ2oiLCJtYWMiOiIyZTQxYTUxOGRiNjkwMDMyZTRmYmVhNTY4YzE2ZjU4MGQ2Mzc1ZWU2NWIzODMwNTZhNmM1NWJlMDVhNjcwM2U2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkNZWGNrKzloVUhpVGNNWTdWQ2cvSHc9PSIsInZhbHVlIjoia1pwWFVKa3pqVU92MVM3UlprOXczVVlNWTNDMnNXUmpodXMvZ0haaURYVi9nQ0ZseGhTR1dqVEFGekVydmdNVUVtZG4vNmNHNzE0eWkrK1RuSFVzRUowVE5na2xRMlQxd2ZMYW94cXBvbEs2VDFRbnNBeHE5cU1kaWNNb085dmQiLCJtYWMiOiJlMWRkZDY5OTIxNjA0YzIwZjgxYzY5Zjk5OGZmMDZkOGRlMTI2YzU2ZmMxODM0NDk2MzQ3OWExMzcwYjNiYzI1IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Product\\Models\\Product',9,NULL,NULL,1,'2024-12-09 20:50:20','2024-12-09 20:50:20'),(8,'GET','{\"price\":\"92,770\",\"sort\":\"price-asc\"}','http://127.0.0.1:8000/summer-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjRMN1NuRElYZGlpRWhxb05tcGtoNXc9PSIsInZhbHVlIjoic1NsVytrRmpMU2hRU1FRNDNjSFU1SnVhbmlOSVdRL3F5UzVEQ2lVWVpSN25SbDE2UGFEckZkV3hvUWd6TlM3c0dZeFltTWdoSlFzVVhsekx6bTdUZzk0cWVQNVJteVVtcmVMQ25xaThCSzkxaExyU0Uya0FTOFFpaUJwc1ZuSVAiLCJtYWMiOiJlMzc1OWQ4MTViY2UzYzRhMzRlYWQyMjhhODBjOTg3NzZlNzM0YjcyYzk3ZmUwZDEzMjdmZGY1ZWJkN2RjOTE5IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlltenVRYmxrOFJwYmRQeVFuUFhBTGc9PSIsInZhbHVlIjoiRTY0dE4yU0RkU0Z0N2tJY0ZwRzJ3QVJSV1FXZWV0UnZ1L2d2S0cwTzhIYWlKVE9jV2FrTVVHNzZPbi82UU5vR216SlVSRVZEWHozU1J2Um8wL002dW1DTEYvWVpoUEFLbGZ4b3dTZWprdXFCQUllTFJ2dGVjdnF4RGJackVLNHgiLCJtYWMiOiI3MjAxZmM0NjRiMjk3ZTkwM2M5M2Q3YmM2ZGUxOWFmZGRmZjBmYzg3YWVmYzg2MDkzZWI4MDk2MWZiNWM3YWIxIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-12-10 01:26:58','2024-12-10 01:26:58'),(9,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjNuSWhGamNxNWhzVFBwODVYeXBOMkE9PSIsInZhbHVlIjoienVGL3c0d1NweDQ0YUtFWmF5eGsyMkdtaFhTY1hER2N4RjhiNVFHV2FXUjlSYUV4aWZWQStxRlE5Y25OMkp1bFRXblBzZlg2eFFwOHFRK1hBMUtQRC9LZFVaQnMxeTFjdnAzQ3liR1hTME9EVm1jS2Y3NGNsOWFGWDM0VXFsa1QiLCJtYWMiOiI3ZDg4YTcxMGFlYzVhZGM1OTE0NmJiMzA3YmMyNjU2NjFjYjA0ODczYTE0ZmU0NTdhZDg4NmFiZjE1ZDc1YjVkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im1XSnlWZGtXRm9FT3NwVWY3NmpHMHc9PSIsInZhbHVlIjoiYUhnZWVmUEFlaUxrYk5CT3BOMnJCVTVud1RHK3EwNlBhSEF6bGxIR0VBLzZ5WnRyV1Z6c1ZxTWRUWGpMTjErMWFyNUdSaE45ay8raWpKSDIxY2pISDFzYVRoMjV2UGpucEhvSUtqNlJTYncwUWQ1Ylo0TUNKN1ZSUERzb1FCQ2YiLCJtYWMiOiIzMTVkMzA4NmEyMmIwMTlhMDczMjc0M2U5OTMyZDAzNWU3NzI2YzdiZWQ3MTY2ZDRmZDhlMWMwMThmM2MwYjFiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-10 01:27:33','2024-12-10 01:27:33'),(10,'GET','[]','http://127.0.0.1:8000/summer-clothes9','http://127.0.0.1:8000/summer-childrens-clothes?mode=list','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/summer-childrens-clothes?mode=list\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6ImE1TmVXZEtuVFZzNHM3UDJTK2ZkUGc9PSIsInZhbHVlIjoiOEJsejZEdkxpczh0TFRxeU00RmZCdjZWTkJWTVlqUHU5TzVodmJpYmhnUGZ6QUdlTVJQeVowMGVDT1ZHWlA4Y3N4MjM0WDNWZWtKZXdta0tUck9SbGUzd3d0SmpSNStLODZpN3RzS1RmUUp0QldYdXdMQThqejdZZmppVUwrNFUiLCJtYWMiOiJkYjgxZDQzYWVkMzM1NzM3ZWI2YmNhNGU0YzU2M2E3ZTI4OTNiM2I3MGNjZmVlMjk4ODBiYWVlZmIyODVjYWU5IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InJ5NDBNOGl3b0I4UTc5dnV2ZDI3WUE9PSIsInZhbHVlIjoieU4vOGZvakYrekp1N1k5UmJ0SFZvc2h3UkR3Z0VtcTRSNkpkZklld2ZLOVhYa2UrWVMzK1FyTkRBMTkxOEIrK0ZnMmxpM1RpQ3kxV25GbmRNNE9URDFzQ1l3eU9jS0gwRmE2Rm1MdnRwejVKSEtIN3crcjNJQU1kd3dDeGZ2WTIiLCJtYWMiOiJjZDM0ZTQ3M2JlNmNhMmM1YmEzYTExNTNkY2UxNjI2Y2JmYzFmNWQwNDFjNjFkNjFmOTliYTdhZGYwMGZkYTc5IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Product\\Models\\Product',10,NULL,NULL,1,'2024-12-10 04:25:35','2024-12-10 04:25:35'),(11,'GET','[]','http://127.0.0.1:8000/summer-clothes5','http://127.0.0.1:8000/summer-childrens-clothes?','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/summer-childrens-clothes?\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IkgvSVBhWlRqdzlXRHZ1TE96MkxFZWc9PSIsInZhbHVlIjoiN3VJVHBBYnF4dUs1S1p3WTF3Mzdwd0RVMkNacEV1bXJaL3NXQkpXejQrUzZtK295SWNlK3dUZ0lRU1poRWNRMVBlRS9wekp0eTBwaXlRZTU0RmFoUkN2Vkh4QmNPSlhSMGE1cHUzTjBIelFUbW80M0ZsMkxucHBqTjZmeUNsM0wiLCJtYWMiOiIxYTYwYzdjZGRiMGEwOTY5NjBiMTBhMDU2Njk0YmU4ODMyY2IyNjk0YTQ4NmQ1YTBmNDE0NGQ2NGQzZTBhNTA2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlpwN2lVWG5TM2RxbHdmWGhNaTd6NlE9PSIsInZhbHVlIjoiVVNUalNMQ09FKzQyUDRzT1lsRDYwbDVma20yWTJyblFMbzJpOVZYSmdSMEJYby9uL2hLcHFsbmJ3MzRtYXYzZnFSbHNQL2RXaFV0YjUvWUE4a1BMdW5jVDZmY3ZTc05HRFlXaDBvOWVuZ0xwNjBSVGJLbTlWdmxHVG1KVEplWWQiLCJtYWMiOiIwZTRhMmFiMzk5NjY2NTM3ZWY4OGNhZWQwMmJlYzJiNzMyNDVhMzdmYThlMDZlZDRiZDg5ZTM2NjhiZjBhNjc5IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Product\\Models\\Product',6,NULL,NULL,1,'2024-12-10 05:02:56','2024-12-10 05:02:56'),(12,'GET','[]','http://127.0.0.1:8000/%D9%82%D8%B3%D9%85-%D8%A7%D9%84%D8%B1%D9%83%D9%86-%D8%A7%D9%84%D8%A7%D9%81%D8%B1%D9%86%D8%AC%D9%8A','http://127.0.0.1:8000/summer-clothes5','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/summer-clothes5\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjQyUGZLbHk4R01ENzlmOHZpbGVvSkE9PSIsInZhbHVlIjoidDNlckw2eDlTRHNPbTBUMWFjSHBzWWluaHFKcUMyUkdZd3gyVWQ3dUlmcUJjMk5BY2xjQ2Q0OVlDV2FYQmt4S0ZGNDZaZHBrUStPbmJhUDdtR0czaXQvVEYwSmhmakNLVXNNa3hoV05Hb2FiVXNtVWZ0eWRhZExpMVl0Y2N2S2QiLCJtYWMiOiJhNzNkNGIwOWZiODgzMWNkOTQ4NDgxNDZkMDI0NGJjM2YwMzAxMGIwNGUwNDBhNjc1Y2E4N2I1NzRjMGQ2NGNmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik1qQkdncndpVmc4ZXV1U0JSR2VYUXc9PSIsInZhbHVlIjoiNUlyVHhlckZvUTVSOXVleWVEQSs5Q3J2UVZocG11a0t2czg2WmhpWll2MjI3RzAvZUthejdxVVREd2Ryeml3c0FpY3p3cWdTY04rYm1keVJ3Qzh2NERTKzJ3SklqYW5mcDVoSWt6K0toMVhNR2lzSCs1QmllY1dLWGIyNEFLN0EiLCJtYWMiOiIyMjk5YjA3YWI2MjRlNDE3NzllMGM4OTY1MzRlNjEzZTNjNWNlOWJhMzI2ZWIyODE1Y2ViMDM5ZjIwYmI3OTI5IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-12-10 05:16:26','2024-12-10 05:16:26'),(13,'GET','[]','http://127.0.0.1:8000/storage/theme/1/5OEZeaavmxic2FQnCtyiWlpOUzMO48UcNFA6LlSy.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IkhvaG9UYWVpM1hZbW5SV0srSEtPTnc9PSIsInZhbHVlIjoiRjBveHFINm9WOUpWOXc1MHZGdm5CK21nL3lnOVVsR2xDOHRLZ2hHSjF1eDNaRkhUdFZPYlY2UXpqRExkUkRRcVJCT0I4VXp2eEVMQjlCZWFsbENzR2w3UUJ0eHJNT1AzK1kvbC81Q2w4VVk1WE1DS2wxelMvTXZ5SHZhbDhXbmEiLCJtYWMiOiJlNTc4M2Y3OGVmNmZmNTIxM2JiN2Q3NmEwNzZjM2MxYzY2MGQ0OGZjMGQ3MTEwNTc2MDEwYzA5ZDk5YjViMmQxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkNGaWVuNzVKT2MvL25haHkreWVMdHc9PSIsInZhbHVlIjoidTB4VWdVdmpVa0dveE5MbEhlU1NDT2RpbGQwWGdWVUN6YmtLQWxKUXhGVWNvcEREd3hGclRLaE1GWWdTdGRQK0NQcHdja1gxdFlLbGtNZHZDUUNmeFJaWUM4R2Y3bDVMbklVUXgxTlBTQnQ4dWVCWjAxMmFXakFQMHluTG94T2UiLCJtYWMiOiIxZTQxN2IxNjEyMWNmMGQ5NmVhMGNhZmZjOTVkNzJhZmZmOWM0MzViMjE3OGU2Njk1ZjVlNWIxNzNiMDRiOGI1IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-10 05:50:48','2024-12-10 05:50:48'),(14,'GET','[]','http://127.0.0.1:8000/summer-clothes','http://127.0.0.1:8000/summer-childrens-clothes?','[]','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?1\"],\"sec-ch-ua-platform\":[\"\\\"Android\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/summer-childrens-clothes?\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjF2NGQ1Y1p5Q09ldEthcmlYdVVFM3c9PSIsInZhbHVlIjoiZUk1ZWdoL3NUTGp3ZS95L0xseEhUSGJYcUpnMGVNdnYxQzd5RlRkQVNzVEZpelpDTVVFSnRZZkRRVGdJb0NVZHJpei8weUZyNEhiQTUraU13MlJKM2tDR0ZablJ1S3QrbUlZT2Q2SjNPeFZuemZsdE5pTUZiZW1Bd29GTEt2RFEiLCJtYWMiOiJjZWYzNjNkOTE5OWFkMGZkNjVkMGIwZDEyMzRhNWZlNTgwZDMzNjQxYTI4OGMyZGM2MzkyMWJmYTFkMDQwMjg2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlplaVd0R0N6bnZPbGlWN1VmcFV4aEE9PSIsInZhbHVlIjoiZ0ZFT0FNdEI4QnI0UlNNQ3RNSitUZWlENFo0b0o5Vy8vcE5QZmNtOXRGeFExdU9pN1M3dXdRNUFheDNWNlpaMlVpU0sra1JPOW5VbWRuL3NYVWs3eW1NWThRcWFUem42KytkeE12V3ZCcG0wMkpOWlhDOXZhSCtsL2NpTnhCczMiLCJtYWMiOiI1ZDVjZWE1MDExNWRlMGVhN2FlNTg0NTU5MWQ2NTNlNjdkZTcxNTY3OWU3OTk4ZWM2YzdjZjE0M2JjYjM1OTM4IiwidGFnIjoiIn0%3D\"]}','Nexus','Linux','Edge','127.0.0.1','Webkul\\Product\\Models\\Product',4,NULL,NULL,1,'2024-12-10 06:10:14','2024-12-10 06:10:14'),(15,'GET','[]','http://127.0.0.1:8000/winter-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Ii81bkttSzRhM2ZYU0UwWHBZbWJqbEE9PSIsInZhbHVlIjoiU3lYa04xTDI2YnY4R205b2hlSVZnc1RZd0NjdlFxY3A3Y3JUVlh6N2I1UWJ6cUlDblNUY0FhaXdUVWRzY2dyR0V5dUo1ZUswU2JZSUpmR1luRExwY0lzbDRJeDhxTlk5bmxBUGEyVXFxeFdlcnJBWVM4RVRRU0xyTGJCU295WlgiLCJtYWMiOiJlNjVjNmU3NzQzMTg1Y2ZmNWFmODQ3ZTQ4ZDcxMDQ2MzA4MWYxYWMzZmQ5ZjBmYjMzODkwMjVkNzI4ZDhkY2U3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InV3Mk1FSndSeWRYZXFQQlFLU1FIbkE9PSIsInZhbHVlIjoieFZMZnViZVNjazJ2SHdXNU1OMU85OWxjbmtPdVg0amVVVUViU0tWUEczdGxCSVNUYk1iTzVIWmNzL3FxanM0TytjMUVTRmNVcmZqamVtQzNIbTFsd2Y5WWRVQXN0Y2RTUVMyRWgycGZMbzFCWWlLWkxUWSthRDZ1amtEYXllTkkiLCJtYWMiOiIwZjQzYzVkMWJlMDVmM2RmODk2ZjNjZDM2MTUzMGYyYmNiMzQyNTI1Mjc4NTYxNGQ1MDJhZjhlMTIxYjk0ZmIyIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-12-10 06:55:11','2024-12-10 06:55:11'),(16,'GET','[]','http://127.0.0.1:8000/childrens-shoes','http://127.0.0.1:8000/summer-childrens-clothes','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/summer-childrens-clothes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6ImNqdWZzTkQyL0xyaVgwRnZyVE54Z3c9PSIsInZhbHVlIjoiOE9TditEWXpMNnF3V1lxZytKUjYvYitWNGNUa2tyR09mSjRxUm1yMGxYUjNaeVBrdWlHSkhLakMvSEZldURNN1ZVVGRsZlFWZlZSM0RYK3lORnZQQWtEZkZEcmNDNWo1TjdCak04NDErcEZOSnM4ZWZVWEozUTgvNUVsUGpiWkYiLCJtYWMiOiJjNGU3NTJmOTY4NzBhYTAyMDA2OWVmMzIxYTk4ZjllYzg4ZGRiYmJlNTNmZDAwZjQ3ZGRhMGQxMzA5Njk4NDI4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik13dVpuTmhONEJLZ3NhTUxoY0hPcHc9PSIsInZhbHVlIjoiS2o2d3hHeFl5WXBncnB2UGFPQktmc3J5VEkvVFNsOFEzNmdaL1RSVkVER1RESzVaRmhYYkRXemF3UkVnRzVrMXpqZm9YSGIxMmt2elprUk5PcVdLMk9JdlR5TWhWRkRQM3ZyMWdlZXgvWjgzZExzNGxjbmhaTnJKVGowQS9FN2UiLCJtYWMiOiJkYTA0ZjE2NmRkMmJiYTA4YzMyNjBlYmUyOGY2ZTdkNGFlOWE1ZmE2MDYwNTJiNjM1NGM2NjU4ODEyZDMwOGU3IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',4,NULL,NULL,1,'2024-12-10 09:06:32','2024-12-10 09:06:32'),(17,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-10 22:42:48','2024-12-10 22:42:48'),(18,'GET','[]','http://127.0.0.1:8000/winter-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjE3R3BiYTlDczhicWcraVZTbEVYUWc9PSIsInZhbHVlIjoiNk1sakVtenNzYm4xMUpzQW9hSUpuWkFEL09zTGF4bkNOaUp5OHBvbE9JOEp4NWJ6VVJvcE1PeVk0NGF0WkJyYUttUDRGTFdNMVNzbVVpWStGNDVnZzBMZ2pVMlIwbzczczF0dHAwR01IWXV6d01IMmpwSTk1cUs2R2pYMXF2V0UiLCJtYWMiOiIxNDg3YmI1NmNlODJkZGY4YjYyOGNhZDc3NjU4MjNkYjA3NDU0MTFkYjgwMjVkNDRlYTU3MjY2MmZmOTkxMWY4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlJISXNlUk1FV0pnOFZ4RVFJYXI2VlE9PSIsInZhbHVlIjoiZlRVTTZlV0lta2FjTHFDVS9RTWd0bE5rU2EwWVhJczRFTldpMUFKUU93RHg1MjN3T3Qyb1c0ZGZYa01IUTRrYjUvTTJhUkh2RFVoR0FJUFg3dVFkeC93ZjJnOWJON3BhYXcwWFF1L09mVHgvdFFjYjgwWitWU2RtRmRpbmNBMWsiLCJtYWMiOiI5ZDk0MTNhZmIyNDQxZGY4ODNmYjU0MzllYWE4ZjMyZDAyMGE5YzUwOWI5ZmY4NWRlNmZkZDBlODI1NTc1MGUxIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-12-10 22:45:03','2024-12-10 22:45:03'),(19,'GET','[]','http://127.0.0.1:8000/summer-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjE3R3BiYTlDczhicWcraVZTbEVYUWc9PSIsInZhbHVlIjoiNk1sakVtenNzYm4xMUpzQW9hSUpuWkFEL09zTGF4bkNOaUp5OHBvbE9JOEp4NWJ6VVJvcE1PeVk0NGF0WkJyYUttUDRGTFdNMVNzbVVpWStGNDVnZzBMZ2pVMlIwbzczczF0dHAwR01IWXV6d01IMmpwSTk1cUs2R2pYMXF2V0UiLCJtYWMiOiIxNDg3YmI1NmNlODJkZGY4YjYyOGNhZDc3NjU4MjNkYjA3NDU0MTFkYjgwMjVkNDRlYTU3MjY2MmZmOTkxMWY4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlJISXNlUk1FV0pnOFZ4RVFJYXI2VlE9PSIsInZhbHVlIjoiZlRVTTZlV0lta2FjTHFDVS9RTWd0bE5rU2EwWVhJczRFTldpMUFKUU93RHg1MjN3T3Qyb1c0ZGZYa01IUTRrYjUvTTJhUkh2RFVoR0FJUFg3dVFkeC93ZjJnOWJON3BhYXcwWFF1L09mVHgvdFFjYjgwWitWU2RtRmRpbmNBMWsiLCJtYWMiOiI5ZDk0MTNhZmIyNDQxZGY4ODNmYjU0MzllYWE4ZjMyZDAyMGE5YzUwOWI5ZmY4NWRlNmZkZDBlODI1NTc1MGUxIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-12-10 22:45:07','2024-12-10 22:45:07'),(20,'GET','[]','http://127.0.0.1:8000/childrens-shoes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjE3R3BiYTlDczhicWcraVZTbEVYUWc9PSIsInZhbHVlIjoiNk1sakVtenNzYm4xMUpzQW9hSUpuWkFEL09zTGF4bkNOaUp5OHBvbE9JOEp4NWJ6VVJvcE1PeVk0NGF0WkJyYUttUDRGTFdNMVNzbVVpWStGNDVnZzBMZ2pVMlIwbzczczF0dHAwR01IWXV6d01IMmpwSTk1cUs2R2pYMXF2V0UiLCJtYWMiOiIxNDg3YmI1NmNlODJkZGY4YjYyOGNhZDc3NjU4MjNkYjA3NDU0MTFkYjgwMjVkNDRlYTU3MjY2MmZmOTkxMWY4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlJISXNlUk1FV0pnOFZ4RVFJYXI2VlE9PSIsInZhbHVlIjoiZlRVTTZlV0lta2FjTHFDVS9RTWd0bE5rU2EwWVhJczRFTldpMUFKUU93RHg1MjN3T3Qyb1c0ZGZYa01IUTRrYjUvTTJhUkh2RFVoR0FJUFg3dVFkeC93ZjJnOWJON3BhYXcwWFF1L09mVHgvdFFjYjgwWitWU2RtRmRpbmNBMWsiLCJtYWMiOiI5ZDk0MTNhZmIyNDQxZGY4ODNmYjU0MzllYWE4ZjMyZDAyMGE5YzUwOWI5ZmY4NWRlNmZkZDBlODI1NTc1MGUxIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',4,NULL,NULL,1,'2024-12-10 22:45:11','2024-12-10 22:45:11'),(21,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IlNjVzNaTy8xbHV3U1U1b2xLUHkzbnc9PSIsInZhbHVlIjoidGE4SXdUblYxNWIzSDkzK2NzS04wdC9qWTNYZzRNTUp5MWJhZXhNTUY2eS9LT1RRSnduRDArTG1OTmg2bS92STdBRHhQeUtEN2xRb25pUVFOSWhZRGhaZy9EaFl6YVk2S0sraHovRkNneng5dmpPUXRDd1FXa3p4Q2VIMWxMdlQiLCJtYWMiOiJmMzg4ZTc4ZWZjZmQ0ODA5ODI5MTIyNjQwMjVkN2UxMjBmZjBkNmRiOWIxNmYxMDhjYzRhNjNhYjU4ZGI0NzdlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlhSdGlsVENaYlRSN3c2c3REMWNhV0E9PSIsInZhbHVlIjoiZUFKc09OM1JQbGZiMldOR01VbUFKQ1BMU2l5QWFjT0lQOVoyS3ZFMHFQdmsyTHFHdkxOMndDcVJqc1BiZ0h6SXhNV0FNeXpOQWJEMnVaNnltQndQVkVhd0pSaU5lQVlRSDRrT3ZWYmFxVnNyNnRiVzlhdENxcGluNUR5VnJNV3IiLCJtYWMiOiJlNWU0YTNkOGM2OGRmMGUxZmIyNTg3NWM2NGY3MjFiNTZjMGVlZjAxNGFkOGI1OThhZjFmNWEzODRhYTYzMTY3IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',2,1,'2024-12-11 03:11:03','2024-12-11 03:11:03'),(22,'GET','[]','http://127.0.0.1:8000/childrens-shoes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlUyLzZaa3RzM2RUQ0l3V1JiNzFEcUE9PSIsInZhbHVlIjoiMUt5MUZTTElhMHRCTU1lS2RwYVdmZnBDdVdIaERQdmpJelJpQ2lWbC9vaDJwMFdPOXowTkhzdGlCOSsvdWF3R2hRd0pkcU9POWxYckdwc05ObjQxM3dpMWhiaXowbEVJVG04THdXeWNPUzNSYnZyQ3E4VFVtSVJveWx0bUFKSTEiLCJtYWMiOiIxMGQ4ZjhmOTJkMDZjN2NhNWE2YTQ0YTM4ODE2NDM5MWNhZTU1YTZjY2ZiOTdiMWJlYTgyN2UyZWYyYTcxM2E0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IllWNFZmRE1DU25lMFJwR3U5MU9PbHc9PSIsInZhbHVlIjoiSTM1d3NKVmFUWldmYUxBOHljclN5bUQ4TFhHY0NiMk5la1hscGpHcDdkckZVTmg3dzNMSTJOTmM1TWdMazRNR0dhb01XY0taMzdSWE5FM09FRStKTjhJRFFBSmRmL0pjUFRNYi9SbXUydjVVcTVtYzU3d3ZUblVUbm1sUG9kSUIiLCJtYWMiOiJhYTI5NTJiYTkwM2Q5NzY4OWM2MTUyMTVlZTMyMjM4OGMyODkyOGU2NDdjOWE2MjhmZmYxMjJmNGU4N2Y4ZTFkIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',4,'Webkul\\Customer\\Models\\Customer',2,1,'2024-12-11 03:29:59','2024-12-11 03:29:59'),(23,'GET','[]','http://127.0.0.1:8000/winter-childrens-clothes','http://127.0.0.1:8000/childrens-shoes','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/childrens-shoes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjRnbFllbDduclN4NWwxeTVqOXdqVHc9PSIsInZhbHVlIjoiUC9adUE3aWRUZnJxc2N3cHJTWG1XQjdaTkdsOE9jUUtWS2xZYTBzdjFSbzBBZXZJdStCTjVwa3RxOUFnbUVQSzVVMEc4QlhPeU14OFBOY1NUeTFGd2lLTjVIVWFpNXZ6VmNKSFEzazdLSFhJaEN5NHpvemhsNTJwSHRPbmJDbzQiLCJtYWMiOiJmZjUwYWMwOWIwYmY0YWI2ODQ2NzA3YjJmYThhYmM3NWQxNGQ5YTZmNWZjYzNmZDdiODJhYTFkN2UzYzMxN2RjIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik9KMkdiK2ZZK0JMOHFEUmtxM25ZWVE9PSIsInZhbHVlIjoidG5sYWd2RGEzS1cxM28vYUNGU0huVmJ5MndTSkhPaWdhSjIwcWtIRTlRVjFaakNGS0xFbkxnQjdNMlJJTURjUFBPUEVmTVpOYk5vNlNBVSttM2twdzZzMTlUU3Y4bVhvUC8xWDlkZzl0cWtRKzlRNXhZZzNVWG0vRzQvZWJzOUciLCJtYWMiOiI3MmZmMzk2Y2YyMTFlNzE5ZjNlYTczMzZmNzMzY2Y4NTYwYjJhMGU0OTYzNDQwNDA4NTc5NTZhNmM5NDU3ZGYzIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,'Webkul\\Customer\\Models\\Customer',2,1,'2024-12-11 03:31:14','2024-12-11 03:31:14'),(24,'GET','[]','http://127.0.0.1:8000/summer-clothes5','http://127.0.0.1:8000/admin/catalog/products/edit/6','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\\/edit\\/6\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkFMRzVWeVJ3U0N2b21KejMyUHV4VFE9PSIsInZhbHVlIjoicTRDRjZOMEhZb0VZcG9YejJWVC9Vb0ZBSmd1MDA2MElrNkpJYjA4NmdtdlEzNVBJby9pMk16TFlFeHlsNmlpc3VDeGlEVkdhd0l2a3V6M0h4YmJheGN5YnRMY0JsTml2TVRIZXNFa1g4aTB1S2tXN1ZvV1dwUEZPdTlPS0NQQkYiLCJtYWMiOiI4NTdkMmZkNWZiN2QzNzRkM2YxNDY0ZWVmZTc4NGFhYmFiZWRkYzgyOTlmMmZiZjk1ODMxMDQ2Yjc5M2RlMTEwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlNUK1ZFazMwUnNTVldVWUlSMDdNQVE9PSIsInZhbHVlIjoiYllSRVM1NXR6ZzBqMWdzcUIvZXlnYVhXZGEvUzJKTjZtUjNhMm5qUnJZQ1QyajZCRjJrczEwWHp4QnE5MktxdWdCVlBTZ2x6SVJHcFlkM21GZVE1V2cyV2NiUUR0TG9URzY5R21id3k5Sk1PV2ZUaXBKamdOS29ocnZMSjZDcDYiLCJtYWMiOiI4NGIzZGI0NjNlMmE2NWU0MzVmMDJkOTgxNmRmOWI4Mjk1NGJlZGVhYzViYjhjNTg5MjJiMDI2OTI5MDE5MmIwIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Product\\Models\\Product',6,'Webkul\\Customer\\Models\\Customer',2,1,'2024-12-11 03:31:35','2024-12-11 03:31:35'),(25,'GET','[]','http://127.0.0.1:8000/summer-childrens-clothes','http://127.0.0.1:8000/winter-childrens-clothes','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/winter-childrens-clothes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlVsTWh3TEhUM0dKMFRDeXV2L2JrNVE9PSIsInZhbHVlIjoiUUVJZmR0ZWFOclEzWmYyc25VN085T3F1cmRWOHBadW4zZHFtZjNtU2h0bWZIZHhFYWVEUlV5RDk5WDBlb2FmYkhTQXZaMXdLUEd4WU9GSDdabHpNQVc3YVhtcTJTUCtDdnhrM2V6MS9nV2d2WWlpZEx2TnNnODhKcmNxWUpCMGwiLCJtYWMiOiJkYmU4ZWYxOTM1MDE5YmNmMTViZTdlMjU0Zjc0ODY5YjY5ZDg3ZTA0YWM3N2VmYTk1YzBkNjlmMmY5ZDU0MjQ3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InhsRVgwYjdmS2dXOHBuS3JvTzEyZWc9PSIsInZhbHVlIjoiWFhRanhSS2s4ZnRnWTdhTnl6cno1S2ZTR1JQamNGTnNlSXdLc2pteHJzeEo4VnVjSVJySk9ITzJoVEhjKzhMQUloMy8wQjRya1UvazlEbFNKUnE3Q1VONml3VkdTc0E5UFNpaGROQ29GTXFIQUdFOFU1R3NmNng2OEVlcEw5dFgiLCJtYWMiOiI1NGQ4Yjg3YzUyYTQxNjdjZGIwYTM4MmMzNDM4ZjM4NjE3MTA5MGNlMjYyOGQ3MWMzMTUyNGExMDViZDViNjhkIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,'Webkul\\Customer\\Models\\Customer',2,1,'2024-12-11 06:16:43','2024-12-11 06:16:43'),(26,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InlxUFZJT0ZxZDBDZ2oyRmpzRVJoaVE9PSIsInZhbHVlIjoibitTS3dWYjV4STlSL1hZZmVxUnlIU0ZvUXRmZ2tVOWxOdVhUTmthUWVYbTIyRkRRRnlEMUU2L2hXU1lUN3c3NFV6MmZxRjZrQm9qU2ZHSnVSNG5tMllrRkRnNndKbjh6SC84K1pDbnE2VWkrZ1ZaNHV1Z3Y4cU44V1RNamw3UkciLCJtYWMiOiJlYzBlY2E2ZmM3NmVkMGEwYjAxYjFmOThjMGYwYmRmNTljMmM1MjA1N2RlNGQ1ODhmMWUyMWIzMWFjZDA0N2IzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IktEMnN5UFlQS1lGL3JPWm15dkZLUUE9PSIsInZhbHVlIjoiMWdteCtqa0JIUnVqSkJKSVlheldnWXFuL29hWjJBY0laSkFDcUJ0c0kxRHR0TjZqTThIUCsxN1NaTmdudXpmRzJhZ3l2ZUNTQlpjWEZNNGE5TG91bjVaSmorT3BFdTlCOXNhdHQvN2RxV2M5c1RJcHB3am9HR3NnTmNzV28zcUsiLCJtYWMiOiIwZjAwMzM0YWYzMDNkYTVhYWIxMzk5NjM4YWZjNTM4NTFiYmQ4YWJkOTQ0MjM0Mzg4ZWZlOTE0YmEyNWJmY2E2IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',3,1,'2024-12-11 07:12:34','2024-12-11 07:12:34'),(27,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=1; XSRF-TOKEN=eyJpdiI6IjAreXlvRFUwNmc1Q0tETEhlZlJtVkE9PSIsInZhbHVlIjoiVG5hUU1BS09oSUY1UFBzMjZqYXZCTU5HQnA0SGNOcmpMTjdQRDU1eHYzanh6cjZmektsVTRFZndZbTJyQTVUS3o0Ym9aUHRQL3BOaWJyekpQZGVtanFWL3Brc0xjTmgzNEV6L0F3NnhMa0lhZzBTcmRTMWJib2h1emxTRDF2T0oiLCJtYWMiOiIyM2U1YzViODg3NjRkODJlZTlmNTBjNjRlYjQ5NmZhZThiMmM3ZTA5MzU5OWVlMjUxNWY5MGI3YWIxMjFhM2NiIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik5wMFV3cXZhWDZqQm9Yd20vQ3NJR3c9PSIsInZhbHVlIjoiYUM2TStMWkxIVXhYYkNlV2dqdHFpdk1LOGJlM0cySkg2Uy9FanZoTFQ5SVZ4ODB1cGJUMFFaRWZ6STNrNEU4eTFSSDFFMlF1Y29CeEtzS0QwWXc5a0hNQjIycHpqSXdFRy95REwrUDBJYkNEdmhPa09FU1U0VHMwdGExY3dId1giLCJtYWMiOiI1ODE1M2E3NGZlMTNiOTA4YWQxZDQwMzFhZTRlZmI3MDcwOWUxM2Y2MGVkYTBkZGU5MmU5M2FlNGM0ZmNhODY0IiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-11 23:27:01','2024-12-11 23:27:01'),(28,'GET','[]','http://localhost:8000','http://localhost:8000/page/about-us','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/page\\/about-us\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImRkZDhjMER6ZG1Ob3RRQmdaNUhWYWc9PSIsInZhbHVlIjoiYlR3QkdHWnIzaXA5eG9sdng2TmxkalM2akFBTU9FLzRlVWc3dDdOY1FoWnk3cG8zNnk3WXNIcU13Umpsakczdm1JQ3lVYy9TVXNXdXJKWHNERGdxKzVmN1RHWVJDajNzc0pIRVZYS3NRa3RmeEEvNmRYeDlnQ0VNOWR4eGsreEsiLCJtYWMiOiI2YmVmZTIzZmRkYjc3NzhhMjQ0YzhiNGE5NjA3YWUzZmIzYTk2NGY0OGNkZjVmOGI5NjNiNzZmMTBkM2I5ZThhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InhQdEQ1cE1rL3hBZTJlWExGL21NcGc9PSIsInZhbHVlIjoiSHhFemlaSHdxcjZzMUtuUlprbnhQVDFwdi9FeS8xWmZiSVFLbUluK1Q5QVR5T3QzS1dwSXhncDFFK3RRZ0NIS2k2a2Q4U2IxRnNQRDZhdURhai92TW1WNW1YU2dRN25wQy9QTzY3c1JwM3MrWDVDZHo5RU0zQ201a3VzUDlyUjQiLCJtYWMiOiI3MzIzMmE2YWI5OTk3MDlkOWJhMjRhNGIzYmIyZDc4OGI3MWIzMTQwMWM3ZGQ1MDQzYzg1NTdlN2Y4NjY0MzhjIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-11 23:51:30','2024-12-11 23:51:30'),(29,'GET','[]','http://127.0.0.1:8000/winter-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik4zdGVvcTVSbzk4dGRMTi9OK09CbFE9PSIsInZhbHVlIjoiOU1xeUJnQWZkcjRkQ3F6ZUZKOTQxQndkMXBsUjJmSTd3b3ZlVUZFcjdaWDRsV1JycDdlSVNpUHJ1bVdTL0dhcFJsdzdGamtzTlFuTkUzR1IzM2NHd0tEVExtYkFhckVXbGc1UXhjWTFCWWt0QzVjRkR4ZktwNXdLNEVWemZDNmgiLCJtYWMiOiIzNzA3Y2RmZTZlNDlhZjZlMGRkN2QzYzI2ZmExMDU3YTgwMWNiZjY5YWVkMWEwZDdmYTY4YTkyMTE5MjAyOTE0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im9abXFaN3Jkd0NaMTVlMnkvK0EzN0E9PSIsInZhbHVlIjoiY3ozcTBFRHNkMmYxcThVOFFNVUFsc2Zkd1M2TVc2akZvcy9qRERRWnk2djJ4ZVBFdjRuc05sRmRrL3pxLzUyY29uUGZNZmtsYnBkNU5hSU9DRGs5UDNSZVN6QnRmNzBLT2JJRU9hMXFRU2Y3eDNDWCt0dEpadG9LcVM0ZmNyVHAiLCJtYWMiOiIwODc4MWU4MTQ2ODNmNWM0YTJiOTIwOWYwYjNiMDY0NDdiNjhhNWRmZGM1MGFkNDE2NjQ4MWI2MTVhMDJkYWQyIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-12-12 06:14:53','2024-12-12 06:14:53'),(30,'GET','[]','http://127.0.0.1:8000/summer-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik4zdGVvcTVSbzk4dGRMTi9OK09CbFE9PSIsInZhbHVlIjoiOU1xeUJnQWZkcjRkQ3F6ZUZKOTQxQndkMXBsUjJmSTd3b3ZlVUZFcjdaWDRsV1JycDdlSVNpUHJ1bVdTL0dhcFJsdzdGamtzTlFuTkUzR1IzM2NHd0tEVExtYkFhckVXbGc1UXhjWTFCWWt0QzVjRkR4ZktwNXdLNEVWemZDNmgiLCJtYWMiOiIzNzA3Y2RmZTZlNDlhZjZlMGRkN2QzYzI2ZmExMDU3YTgwMWNiZjY5YWVkMWEwZDdmYTY4YTkyMTE5MjAyOTE0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im9abXFaN3Jkd0NaMTVlMnkvK0EzN0E9PSIsInZhbHVlIjoiY3ozcTBFRHNkMmYxcThVOFFNVUFsc2Zkd1M2TVc2akZvcy9qRERRWnk2djJ4ZVBFdjRuc05sRmRrL3pxLzUyY29uUGZNZmtsYnBkNU5hSU9DRGs5UDNSZVN6QnRmNzBLT2JJRU9hMXFRU2Y3eDNDWCt0dEpadG9LcVM0ZmNyVHAiLCJtYWMiOiIwODc4MWU4MTQ2ODNmNWM0YTJiOTIwOWYwYjNiMDY0NDdiNjhhNWRmZGM1MGFkNDE2NjQ4MWI2MTVhMDJkYWQyIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-12-12 06:15:01','2024-12-12 06:15:01'),(31,'GET','[]','http://127.0.0.1:8000/childrens-shoes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik4zdGVvcTVSbzk4dGRMTi9OK09CbFE9PSIsInZhbHVlIjoiOU1xeUJnQWZkcjRkQ3F6ZUZKOTQxQndkMXBsUjJmSTd3b3ZlVUZFcjdaWDRsV1JycDdlSVNpUHJ1bVdTL0dhcFJsdzdGamtzTlFuTkUzR1IzM2NHd0tEVExtYkFhckVXbGc1UXhjWTFCWWt0QzVjRkR4ZktwNXdLNEVWemZDNmgiLCJtYWMiOiIzNzA3Y2RmZTZlNDlhZjZlMGRkN2QzYzI2ZmExMDU3YTgwMWNiZjY5YWVkMWEwZDdmYTY4YTkyMTE5MjAyOTE0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im9abXFaN3Jkd0NaMTVlMnkvK0EzN0E9PSIsInZhbHVlIjoiY3ozcTBFRHNkMmYxcThVOFFNVUFsc2Zkd1M2TVc2akZvcy9qRERRWnk2djJ4ZVBFdjRuc05sRmRrL3pxLzUyY29uUGZNZmtsYnBkNU5hSU9DRGs5UDNSZVN6QnRmNzBLT2JJRU9hMXFRU2Y3eDNDWCt0dEpadG9LcVM0ZmNyVHAiLCJtYWMiOiIwODc4MWU4MTQ2ODNmNWM0YTJiOTIwOWYwYjNiMDY0NDdiNjhhNWRmZGM1MGFkNDE2NjQ4MWI2MTVhMDJkYWQyIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',4,NULL,NULL,1,'2024-12-12 06:15:10','2024-12-12 06:15:10'),(32,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 07:48:22','2024-12-17 07:48:22'),(33,'GET','[]','http://127.0.0.1:8000/winter-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlZZWlpzeDVheUJEWTQwdExaVHNqR2c9PSIsInZhbHVlIjoiU1EzVEFRREdVUnBuRDhYZGt0NndhMUUwc1RGcWhhTXc2S0JFWXVhQXZGY1VUN2Fpa3dMc1psUWpOdjlQVHdCUDlMOVlvQ2hoUUdmZDhHa1FUQzdkNEVDRXBIaWMrWkFxdmV1dHlnSEp0Y2p4VmYra0xMTndnTUloVEo1NUdjTmUiLCJtYWMiOiJlN2VhZGJjMGNmODQ2NjlhNWUxZDM1N2ZhZjkxODFkZjRlZmQ2MTUyOGM1ZGUxODdhYzgyNTRhODI3MzEwMTQ2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ijl5NmJZL3k5MXB0K3dpMURDQXptYXc9PSIsInZhbHVlIjoiNGhJeVkvL0pxM1pld1hYcXRra0lUeUV3d1Q0NjBBWUl2dFNHUE5NMU80aGFBbUhyOEsydmJxVVlXZUs0Rlh6NkF4L1oxQnlYWEgxWk9neTh5bHRMb3dUdXNORGc0THV0M2FELzN3MnpOWmNEOXdFYitTcCtnakJBTlg1OXRDQWQiLCJtYWMiOiIxMzExZGU3ZTdmNmM1NDM4NTBhNjM5ZDRmNTI0NDY1NzNkMDAxY2UwOTA5OGI5ZmYzZjBjYWVlYzdiZTE5YWViIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-12-17 07:50:21','2024-12-17 07:50:21'),(34,'GET','[]','http://127.0.0.1:8000/summer-childrens-clothes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlZZWlpzeDVheUJEWTQwdExaVHNqR2c9PSIsInZhbHVlIjoiU1EzVEFRREdVUnBuRDhYZGt0NndhMUUwc1RGcWhhTXc2S0JFWXVhQXZGY1VUN2Fpa3dMc1psUWpOdjlQVHdCUDlMOVlvQ2hoUUdmZDhHa1FUQzdkNEVDRXBIaWMrWkFxdmV1dHlnSEp0Y2p4VmYra0xMTndnTUloVEo1NUdjTmUiLCJtYWMiOiJlN2VhZGJjMGNmODQ2NjlhNWUxZDM1N2ZhZjkxODFkZjRlZmQ2MTUyOGM1ZGUxODdhYzgyNTRhODI3MzEwMTQ2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ijl5NmJZL3k5MXB0K3dpMURDQXptYXc9PSIsInZhbHVlIjoiNGhJeVkvL0pxM1pld1hYcXRra0lUeUV3d1Q0NjBBWUl2dFNHUE5NMU80aGFBbUhyOEsydmJxVVlXZUs0Rlh6NkF4L1oxQnlYWEgxWk9neTh5bHRMb3dUdXNORGc0THV0M2FELzN3MnpOWmNEOXdFYitTcCtnakJBTlg1OXRDQWQiLCJtYWMiOiIxMzExZGU3ZTdmNmM1NDM4NTBhNjM5ZDRmNTI0NDY1NzNkMDAxY2UwOTA5OGI5ZmYzZjBjYWVlYzdiZTE5YWViIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-12-17 07:50:41','2024-12-17 07:50:42'),(35,'GET','[]','http://127.0.0.1:8000/childrens-shoes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlZZWlpzeDVheUJEWTQwdExaVHNqR2c9PSIsInZhbHVlIjoiU1EzVEFRREdVUnBuRDhYZGt0NndhMUUwc1RGcWhhTXc2S0JFWXVhQXZGY1VUN2Fpa3dMc1psUWpOdjlQVHdCUDlMOVlvQ2hoUUdmZDhHa1FUQzdkNEVDRXBIaWMrWkFxdmV1dHlnSEp0Y2p4VmYra0xMTndnTUloVEo1NUdjTmUiLCJtYWMiOiJlN2VhZGJjMGNmODQ2NjlhNWUxZDM1N2ZhZjkxODFkZjRlZmQ2MTUyOGM1ZGUxODdhYzgyNTRhODI3MzEwMTQ2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ijl5NmJZL3k5MXB0K3dpMURDQXptYXc9PSIsInZhbHVlIjoiNGhJeVkvL0pxM1pld1hYcXRra0lUeUV3d1Q0NjBBWUl2dFNHUE5NMU80aGFBbUhyOEsydmJxVVlXZUs0Rlh6NkF4L1oxQnlYWEgxWk9neTh5bHRMb3dUdXNORGc0THV0M2FELzN3MnpOWmNEOXdFYitTcCtnakJBTlg1OXRDQWQiLCJtYWMiOiIxMzExZGU3ZTdmNmM1NDM4NTBhNjM5ZDRmNTI0NDY1NzNkMDAxY2UwOTA5OGI5ZmYzZjBjYWVlYzdiZTE5YWViIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1','Webkul\\Category\\Models\\Category',4,NULL,NULL,1,'2024-12-17 07:50:53','2024-12-17 07:50:53'),(36,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlV4U290b0toeXZUR3drREVjU1RrcHc9PSIsInZhbHVlIjoiOU5vdHN6U29aZEIvOGQxUE11b1l0cUhxRnljQkNnMVRUbDlPcHdzcTdrVmRsK0hodXV1a1FlVERqZm12SjkrMi9FdHNZYUlGMXRBbnh5dWxpWFMrV1ZmR21obG1RaWR6OXZGTmpVUlBtQkcwaGRJcHZXUUNZRG5TSnhIQzFrQloiLCJtYWMiOiIzNDRiOTBlN2FkMWVkZTQwNTljNWVlYjdmODBhMzQ4YTk2NTM2M2UyYTdlZmJlYzY2NTI5M2FjMWMzNjA0YWJlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlVSUjdQQXppSmJMeTkrVDhqY0N6MFE9PSIsInZhbHVlIjoiR3lVV3VXL2xzVytrRUFtMjVDREdGbGZsZVdNYUlSNk9JNjQ3ODNtbUtaMlpLdENqcmY3S29ZUUpxWDJMd0JoMjdVenpnaVdnd1lCS3JlMFlKZnZiWjlOQU5tc2JhLzlmQ2dCWk5hdGlRVzhNUjV1VE45aUZQN3NZSDB6Rjh1QTIiLCJtYWMiOiI5MGYwOWFiOGFhZmI4NTZmNWVjYzZkNjJjZjE0NzIxNzU0NmYwNTdhMTY0MWE3YjZkMDU4MTcyNjIzMGIxMWNmIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',2,1,'2024-12-17 08:20:52','2024-12-17 08:20:52'),(37,'GET','[]','http://127.0.0.1:8000/storage/theme/1/ChoDhmL3o6Lak4QQWHwPug8PZTsNaZPG9TbDQ4mM.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpTMDZCQ1N1alo1OUdKV2JubS9OdXc9PSIsInZhbHVlIjoiUnIraEk1TG04RUVRTWM5YjhWYVcxY25RL0dQMm9ic1hOck9tM1VtbFdqeW5DLytZVllzQk9ZVk9JTkRPLy9KdG1pK21YNXlIZ2VEc2lTTUYzcHVFKy9JVFJmMDVHbjhvK3NGTUVGb3hpTEQ3TXJUN0NEbTh2Rit6blVLTDgwLy8iLCJtYWMiOiJlZDU2NTYxNzJiOTZhNDAxOWFhYWI0ZDBhMzM4NGQzZmE3ZTJkYWViZWVjNDM3NWFiNzM1MWEyNWE2MzYxYjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjhzRkwrYSt0cldpVy9SWU8vZUNlV2c9PSIsInZhbHVlIjoiTVVrSU1tdk5pYlc1bG9yTWR1b3JsSDhtWG5PY2haME9lWGdKTzJtWGQ3elhQeGcraFlwV1MxK21xRUpKR1psRko1SHJYNjB3QzRGL0xlOVIzMFJDV1pwYk5KUjV2OHY2RnhFZUQwaWlJVWVVUGFzN3dYMVROYzlwaTFCajcrdHIiLCJtYWMiOiI4ZjQ4MzdkZDgwMmJhN2JjZmY2MjZjOGJkYmRlNDQ0YmI5NDFmZGQ0OTFkNjc5OGNhNzc1N2JjMjFiODQ1ZTRiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 08:35:03','2024-12-17 08:35:03'),(38,'GET','[]','http://127.0.0.1:8000/storage/theme/1/IIckQLPZMaSyfdFvZJSleYIOkbG4IdDIYvpKDgXa.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpTMDZCQ1N1alo1OUdKV2JubS9OdXc9PSIsInZhbHVlIjoiUnIraEk1TG04RUVRTWM5YjhWYVcxY25RL0dQMm9ic1hOck9tM1VtbFdqeW5DLytZVllzQk9ZVk9JTkRPLy9KdG1pK21YNXlIZ2VEc2lTTUYzcHVFKy9JVFJmMDVHbjhvK3NGTUVGb3hpTEQ3TXJUN0NEbTh2Rit6blVLTDgwLy8iLCJtYWMiOiJlZDU2NTYxNzJiOTZhNDAxOWFhYWI0ZDBhMzM4NGQzZmE3ZTJkYWViZWVjNDM3NWFiNzM1MWEyNWE2MzYxYjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjhzRkwrYSt0cldpVy9SWU8vZUNlV2c9PSIsInZhbHVlIjoiTVVrSU1tdk5pYlc1bG9yTWR1b3JsSDhtWG5PY2haME9lWGdKTzJtWGQ3elhQeGcraFlwV1MxK21xRUpKR1psRko1SHJYNjB3QzRGL0xlOVIzMFJDV1pwYk5KUjV2OHY2RnhFZUQwaWlJVWVVUGFzN3dYMVROYzlwaTFCajcrdHIiLCJtYWMiOiI4ZjQ4MzdkZDgwMmJhN2JjZmY2MjZjOGJkYmRlNDQ0YmI5NDFmZGQ0OTFkNjc5OGNhNzc1N2JjMjFiODQ1ZTRiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 08:35:28','2024-12-17 08:35:28'),(39,'GET','[]','http://127.0.0.1:8000/storage/theme/13/8YLSAGZLexIBbiNYBWR1a2JaxzE5UHIj3rU4JOBO.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpTMDZCQ1N1alo1OUdKV2JubS9OdXc9PSIsInZhbHVlIjoiUnIraEk1TG04RUVRTWM5YjhWYVcxY25RL0dQMm9ic1hOck9tM1VtbFdqeW5DLytZVllzQk9ZVk9JTkRPLy9KdG1pK21YNXlIZ2VEc2lTTUYzcHVFKy9JVFJmMDVHbjhvK3NGTUVGb3hpTEQ3TXJUN0NEbTh2Rit6blVLTDgwLy8iLCJtYWMiOiJlZDU2NTYxNzJiOTZhNDAxOWFhYWI0ZDBhMzM4NGQzZmE3ZTJkYWViZWVjNDM3NWFiNzM1MWEyNWE2MzYxYjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjhzRkwrYSt0cldpVy9SWU8vZUNlV2c9PSIsInZhbHVlIjoiTVVrSU1tdk5pYlc1bG9yTWR1b3JsSDhtWG5PY2haME9lWGdKTzJtWGQ3elhQeGcraFlwV1MxK21xRUpKR1psRko1SHJYNjB3QzRGL0xlOVIzMFJDV1pwYk5KUjV2OHY2RnhFZUQwaWlJVWVVUGFzN3dYMVROYzlwaTFCajcrdHIiLCJtYWMiOiI4ZjQ4MzdkZDgwMmJhN2JjZmY2MjZjOGJkYmRlNDQ0YmI5NDFmZGQ0OTFkNjc5OGNhNzc1N2JjMjFiODQ1ZTRiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 08:35:56','2024-12-17 08:35:56'),(40,'GET','[]','http://127.0.0.1:8000/storage/theme/1/bAYkqwhXUxi4Eew24XsBpr6qOaKZ0RNKxGG9ZEyJ.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpTMDZCQ1N1alo1OUdKV2JubS9OdXc9PSIsInZhbHVlIjoiUnIraEk1TG04RUVRTWM5YjhWYVcxY25RL0dQMm9ic1hOck9tM1VtbFdqeW5DLytZVllzQk9ZVk9JTkRPLy9KdG1pK21YNXlIZ2VEc2lTTUYzcHVFKy9JVFJmMDVHbjhvK3NGTUVGb3hpTEQ3TXJUN0NEbTh2Rit6blVLTDgwLy8iLCJtYWMiOiJlZDU2NTYxNzJiOTZhNDAxOWFhYWI0ZDBhMzM4NGQzZmE3ZTJkYWViZWVjNDM3NWFiNzM1MWEyNWE2MzYxYjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjhzRkwrYSt0cldpVy9SWU8vZUNlV2c9PSIsInZhbHVlIjoiTVVrSU1tdk5pYlc1bG9yTWR1b3JsSDhtWG5PY2haME9lWGdKTzJtWGQ3elhQeGcraFlwV1MxK21xRUpKR1psRko1SHJYNjB3QzRGL0xlOVIzMFJDV1pwYk5KUjV2OHY2RnhFZUQwaWlJVWVVUGFzN3dYMVROYzlwaTFCajcrdHIiLCJtYWMiOiI4ZjQ4MzdkZDgwMmJhN2JjZmY2MjZjOGJkYmRlNDQ0YmI5NDFmZGQ0OTFkNjc5OGNhNzc1N2JjMjFiODQ1ZTRiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 08:36:07','2024-12-17 08:36:07'),(41,'GET','[]','http://127.0.0.1:8000/storage/theme/1/14mXwhO0LynefAM3idDlmjzpGFoyuTtY0W89GHBw.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpTMDZCQ1N1alo1OUdKV2JubS9OdXc9PSIsInZhbHVlIjoiUnIraEk1TG04RUVRTWM5YjhWYVcxY25RL0dQMm9ic1hOck9tM1VtbFdqeW5DLytZVllzQk9ZVk9JTkRPLy9KdG1pK21YNXlIZ2VEc2lTTUYzcHVFKy9JVFJmMDVHbjhvK3NGTUVGb3hpTEQ3TXJUN0NEbTh2Rit6blVLTDgwLy8iLCJtYWMiOiJlZDU2NTYxNzJiOTZhNDAxOWFhYWI0ZDBhMzM4NGQzZmE3ZTJkYWViZWVjNDM3NWFiNzM1MWEyNWE2MzYxYjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjhzRkwrYSt0cldpVy9SWU8vZUNlV2c9PSIsInZhbHVlIjoiTVVrSU1tdk5pYlc1bG9yTWR1b3JsSDhtWG5PY2haME9lWGdKTzJtWGQ3elhQeGcraFlwV1MxK21xRUpKR1psRko1SHJYNjB3QzRGL0xlOVIzMFJDV1pwYk5KUjV2OHY2RnhFZUQwaWlJVWVVUGFzN3dYMVROYzlwaTFCajcrdHIiLCJtYWMiOiI4ZjQ4MzdkZDgwMmJhN2JjZmY2MjZjOGJkYmRlNDQ0YmI5NDFmZGQ0OTFkNjc5OGNhNzc1N2JjMjFiODQ1ZTRiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 08:36:16','2024-12-17 08:36:16'),(42,'GET','[]','http://127.0.0.1:8000/storage/theme/13/pua6MRHSSWBbQhTUXn0CJ3wq5buHHrJZ9JJ6P6K4.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"131\\\", \\\"Chromium\\\";v=\\\"131\\\", \\\"Not_A Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=1; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpTMDZCQ1N1alo1OUdKV2JubS9OdXc9PSIsInZhbHVlIjoiUnIraEk1TG04RUVRTWM5YjhWYVcxY25RL0dQMm9ic1hOck9tM1VtbFdqeW5DLytZVllzQk9ZVk9JTkRPLy9KdG1pK21YNXlIZ2VEc2lTTUYzcHVFKy9JVFJmMDVHbjhvK3NGTUVGb3hpTEQ3TXJUN0NEbTh2Rit6blVLTDgwLy8iLCJtYWMiOiJlZDU2NTYxNzJiOTZhNDAxOWFhYWI0ZDBhMzM4NGQzZmE3ZTJkYWViZWVjNDM3NWFiNzM1MWEyNWE2MzYxYjE1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjhzRkwrYSt0cldpVy9SWU8vZUNlV2c9PSIsInZhbHVlIjoiTVVrSU1tdk5pYlc1bG9yTWR1b3JsSDhtWG5PY2haME9lWGdKTzJtWGQ3elhQeGcraFlwV1MxK21xRUpKR1psRko1SHJYNjB3QzRGL0xlOVIzMFJDV1pwYk5KUjV2OHY2RnhFZUQwaWlJVWVVUGFzN3dYMVROYzlwaTFCajcrdHIiLCJtYWMiOiI4ZjQ4MzdkZDgwMmJhN2JjZmY2MjZjOGJkYmRlNDQ0YmI5NDFmZGQ0OTFkNjc5OGNhNzc1N2JjMjFiODQ1ZTRiIiwidGFnIjoiIn0%3D\"]}','','Windows','Edge','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-12-17 08:36:25','2024-12-17 08:36:25');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `item_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_options`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
INSERT INTO `wishlist_items` VALUES (1,1,21,2,NULL,NULL,NULL,'2024-12-17 09:01:40','2024-12-17 09:01:40'),(2,1,15,2,NULL,NULL,NULL,'2024-12-17 09:26:18','2024-12-17 09:26:18');
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18  6:03:51
