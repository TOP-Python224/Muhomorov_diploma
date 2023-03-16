CREATE DATABASE  IF NOT EXISTS `service_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `service_db`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: service_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Мастера'),(3,'Менеджеры'),(2,'Приемка');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add client',7,'add_client'),(26,'Can change client',7,'change_client'),(27,'Can delete client',7,'delete_client'),(28,'Can view client',7,'view_client'),(29,'Can add device',8,'add_device'),(30,'Can change device',8,'change_device'),(31,'Can delete device',8,'delete_device'),(32,'Can view device',8,'view_device'),(33,'Can add device type',9,'add_devicetype'),(34,'Can change device type',9,'change_devicetype'),(35,'Can delete device type',9,'delete_devicetype'),(36,'Can view device type',9,'view_devicetype'),(37,'Can add repair',10,'add_repair'),(38,'Can change repair',10,'change_repair'),(39,'Can delete repair',10,'delete_repair'),(40,'Can view repair',10,'view_repair'),(41,'Can add repair status',11,'add_repairstatus'),(42,'Can change repair status',11,'change_repairstatus'),(43,'Can delete repair status',11,'delete_repairstatus'),(44,'Can view repair status',11,'view_repairstatus'),(45,'Can add repair type',12,'add_repairtype'),(46,'Can change repair type',12,'change_repairtype'),(47,'Can delete repair type',12,'delete_repairtype'),(48,'Can view repair type',12,'view_repairtype'),(49,'Can add vendor',13,'add_vendor'),(50,'Can change vendor',13,'change_vendor'),(51,'Can delete vendor',13,'delete_vendor'),(52,'Can view vendor',13,'view_vendor'),(53,'Can add repair order',14,'add_repairorder'),(54,'Can change repair order',14,'change_repairorder'),(55,'Can delete repair order',14,'delete_repairorder'),(56,'Can view repair order',14,'view_repairorder'),(57,'Can add employee comment',15,'add_employeecomment'),(58,'Can change employee comment',15,'change_employeecomment'),(59,'Can delete employee comment',15,'delete_employeecomment'),(60,'Can view employee comment',15,'view_employeecomment'),(61,'Can add captcha store',16,'add_captchastore'),(62,'Can change captcha store',16,'change_captchastore'),(63,'Can delete captcha store',16,'delete_captchastore'),(64,'Can view captcha store',16,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$zrXqQwcm9XJ5vUWPHZMVSz$gQx3/pJJcCLoRkaa3F64u3lhrFRAdM2hWHNf16bJYfY=','2023-03-12 17:12:34.992385',1,'root','Рут','Админов','root@servicepython.ru',1,1,'2023-03-06 00:36:38.000000'),(2,'pbkdf2_sha256$390000$OMrtOldq2qkEfTnBn0vMZT$Cc5q9kA9aCCa5Op99LX2j4KoN0w09hUeRSCXx04WlNw=','2023-03-12 16:01:21.893187',0,'master1','Петр','Петров','petrov@servicepython.ru',0,1,'2023-03-06 00:38:49.000000'),(3,'pbkdf2_sha256$390000$aFAasRLcsvBbdkqN8l2ETP$jVvhQ+1cNB127bMonnnEshiNk8Dtu4zCTQFEmIQkPbc=','2023-03-12 16:02:07.852983',0,'master2','Иван','Иванов','ivanov@servicepython.ru',0,1,'2023-03-06 00:39:58.000000'),(4,'pbkdf2_sha256$390000$BkMLizS3cACeHOCv7kjKTb$8/KpX5fnnOw/8G7Fa54qDetAo1gJpGz4ujI7PgSWUQ0=','2023-03-10 12:36:50.205249',0,'master3','Сергей','Сергеев','sergeev@servicepython.ru',0,1,'2023-03-06 00:40:35.000000'),(5,'pbkdf2_sha256$390000$Ckx9ASD4yFUrlDmrBV6ljj$3PGi1l2iwlLs2Yd7MGIzOsiCfZLgN/1fXavoZBC9edQ=','2023-03-12 17:15:56.911266',0,'priemka1','Кирилл','Кириллов','kirillov@servicepython.ru',0,1,'2023-03-10 07:05:25.000000'),(6,'pbkdf2_sha256$390000$ZLsb9Fsj2phIFPP1TVH7wg$YqP63hXNsnPxCpg4CqZkbD2RBVyroZ0G5tsYhoU8yO0=','2023-03-12 08:38:46.810296',0,'master4','Андрей','Андреев','andreev@servicepython.ru',0,1,'2023-03-12 08:31:32.000000'),(7,'pbkdf2_sha256$390000$3BLoNZuWdfiJgKeJBDIDqb$n8yESsklrr/7e21nSRgqm/y0kg5MuiEHAGcomxqDRD8=','2023-03-12 08:39:16.349740',0,'manager1','Анто','Антонов','antonov@servicepython.ru',0,1,'2023-03-12 08:33:13.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,1),(3,4,1),(4,5,2),(5,6,1),(6,7,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (41,'6+5=','11','cb5f0e2164973ff28db7e59d32ce692b24665cbc','2023-03-10 18:39:35.484875');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `patronymic` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_first_name_patronymic_last_name_phone_32d46832_uniq` (`first_name`,`patronymic`,`last_name`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Степан','Степанович','Степанов','stepa@mail.ru','79142355588','г. Якутск, пр. Ленина, 1, кв. 2'),(2,'Василий','Васильевич','Васильев','vasiliev@mail.ru','79131234567','г. Новосибирск, ул. Анодная, д.2, кв. 3'),(3,'Федор','Федорович','Федоров','','79111234554','г. Санкт-Петербург, ул. Морская, д.100, кв. 77'),(4,'Сидор','Сидорович','Сидоров','sss1970@yandex.ru','79245551179','г. Иркутск, ул. Гоголя, 10, кв. 20');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_types`
--

DROP TABLE IF EXISTS `device_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_types` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_types`
--

LOCK TABLES `device_types` WRITE;
/*!40000 ALTER TABLE `device_types` DISABLE KEYS */;
INSERT INTO `device_types` VALUES (9,'Варочная поверхность'),(16,'ИБП'),(12,'Кондиционер'),(3,'Микроволновая печь'),(15,'Монитор'),(14,'Музыкальный центр'),(10,'Мультиварка'),(13,'Обогреватель'),(5,'Посудомоечная машина'),(6,'Пылесос'),(4,'Стиральная машина'),(1,'Телевизор'),(7,'Утюг'),(2,'Холодильник'),(8,'Электроплита'),(11,'Электрочайник');
/*!40000 ALTER TABLE `device_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(30) NOT NULL,
  `serial_number` varchar(30) NOT NULL,
  `kit_state` varchar(150) NOT NULL,
  `defect` varchar(300) NOT NULL,
  `device_type_id` smallint NOT NULL,
  `vendor_id` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `devices_model_serial_number_498a52f2_uniq` (`model`,`serial_number`),
  KEY `devices_device_type_id_a366517d_fk_device_types_id` (`device_type_id`),
  KEY `devices_vendor_id_868ea564_fk_vendors_id` (`vendor_id`),
  CONSTRAINT `devices_device_type_id_a366517d_fk_device_types_id` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`),
  CONSTRAINT `devices_vendor_id_868ea564_fk_vendors_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'B-100','B010203040','Гарантийный талон.','Не охлаждает.',2,6),(2,'EL-125','1234567890','Чек. Поцарапана.','Не моет.',5,5),(3,'RD-25F','RD987654321','Гарантийный талон, чек. Без шнура.','Не нагревается.',10,8),(4,'LGC-100','223344FGH','Чек.','Не охлаждает.',12,2);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-06 00:38:10.958875','1','Мастера',1,'[{\"added\": {}}]',3,1),(2,'2023-03-06 00:38:17.191952','2','Приемка',1,'[{\"added\": {}}]',3,1),(3,'2023-03-06 00:38:25.720113','3','Менеджеры',1,'[{\"added\": {}}]',3,1),(4,'2023-03-06 00:38:49.468069','2',' ',1,'[{\"added\": {}}]',4,1),(5,'2023-03-06 00:39:43.077546','2','Петр Петров',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(6,'2023-03-06 00:39:58.129751','3',' ',1,'[{\"added\": {}}]',4,1),(7,'2023-03-06 00:40:19.108861','3','Иван Иванов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(8,'2023-03-06 00:40:35.879873','4',' ',1,'[{\"added\": {}}]',4,1),(9,'2023-03-06 00:41:04.457198','4','Сергей Сергеев',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(10,'2023-03-06 00:42:30.152567','1','Холодильник Bosch B-100',1,'[{\"added\": {}}]',8,1),(11,'2023-03-06 00:43:11.531809','2','Посудомоечная машина Electrolux EL-125',1,'[{\"added\": {}}]',8,1),(12,'2023-03-06 00:44:08.632530','3','Мультиварка Redmond RD-25F',1,'[{\"added\": {}}]',8,1),(13,'2023-03-06 00:45:05.226139','1','Степанов Степан Степанович',1,'[{\"added\": {}}]',7,1),(14,'2023-03-06 00:46:13.571327','2','Васильев Василий Васильевич',1,'[{\"added\": {}}]',7,1),(15,'2023-03-06 00:47:28.182124','3','Федоров Федор Федорович',1,'[{\"added\": {}}]',7,1),(16,'2023-03-06 00:47:44.868363','1','Repair object (1)',1,'[{\"added\": {}}]',10,1),(17,'2023-03-06 00:48:01.749533','2','Repair object (2)',1,'[{\"added\": {}}]',10,1),(18,'2023-03-06 00:48:13.828622','3','Repair object (3)',1,'[{\"added\": {}}]',10,1),(19,'2023-03-06 00:48:34.840491','1','Ордер №1 от 2023-03-06',1,'[{\"added\": {}}]',14,1),(20,'2023-03-06 00:48:54.472305','2','Ордер №2 от 2023-03-06',1,'[{\"added\": {}}]',14,1),(21,'2023-03-06 00:49:12.493797','3','Ордер №3 от 2023-03-06',1,'[{\"added\": {}}]',14,1),(22,'2023-03-06 17:20:02.982853','1','EmployeeComment object (1)',1,'[{\"added\": {}}]',15,1),(23,'2023-03-06 17:21:25.751485','2','EmployeeComment object (2)',1,'[{\"added\": {}}]',15,1),(24,'2023-03-06 17:22:18.047211','2','EmployeeComment object (2)',2,'[{\"changed\": {\"fields\": [\"Comment\"]}}]',15,1),(25,'2023-03-09 14:55:18.283103','2','Петр Петров',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(26,'2023-03-09 14:55:59.630484','2','Петр Петров',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(27,'2023-03-09 17:44:04.744820','1','Рут Админов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(28,'2023-03-10 07:05:25.722202','5',' ',1,'[{\"added\": {}}]',4,1),(29,'2023-03-10 07:06:04.672098','5','Кирилл Кириллов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(30,'2023-03-10 12:41:21.610054','4','Кондиционер LG LGC-100',1,'[{\"added\": {}}]',8,1),(31,'2023-03-10 12:41:59.886005','4','Repair object (4)',1,'[{\"added\": {}}]',10,1),(32,'2023-03-10 12:43:30.564610','4','Сидоров Сидор Сидорович',1,'[{\"added\": {}}]',7,1),(33,'2023-03-10 12:43:50.735544','4','Наряд №4 от 2023-03-10',1,'[{\"added\": {}}]',14,1),(34,'2023-03-12 08:18:08.698520','3','2023-03-12 08:18:08.698520+00:00, Петр Петров, Запчасти заказаны.',1,'[{\"added\": {}}]',15,1),(35,'2023-03-12 08:31:32.625878','6',' ',1,'[{\"added\": {}}]',4,1),(36,'2023-03-12 08:32:15.327200','6','Андрей Андреев',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(37,'2023-03-12 08:33:13.445531','7',' ',1,'[{\"added\": {}}]',4,1),(38,'2023-03-12 08:34:17.544737','7','Анто Антонов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(16,'captcha','captchastore'),(5,'contenttypes','contenttype'),(7,'repair','client'),(8,'repair','device'),(9,'repair','devicetype'),(15,'repair','employeecomment'),(10,'repair','repair'),(14,'repair','repairorder'),(11,'repair','repairstatus'),(12,'repair','repairtype'),(13,'repair','vendor'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-06 00:35:54.402397'),(2,'auth','0001_initial','2023-03-06 00:35:54.749846'),(3,'admin','0001_initial','2023-03-06 00:35:54.873794'),(4,'admin','0002_logentry_remove_auto_add','2023-03-06 00:35:54.881306'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-06 00:35:54.890056'),(6,'contenttypes','0002_remove_content_type_name','2023-03-06 00:35:54.958804'),(7,'auth','0002_alter_permission_name_max_length','2023-03-06 00:35:54.991481'),(8,'auth','0003_alter_user_email_max_length','2023-03-06 00:35:55.011478'),(9,'auth','0004_alter_user_username_opts','2023-03-06 00:35:55.016478'),(10,'auth','0005_alter_user_last_login_null','2023-03-06 00:35:55.051479'),(11,'auth','0006_require_contenttypes_0002','2023-03-06 00:35:55.056478'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-06 00:35:55.061478'),(13,'auth','0008_alter_user_username_max_length','2023-03-06 00:35:55.094552'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-06 00:35:55.129552'),(15,'auth','0010_alter_group_name_max_length','2023-03-06 00:35:55.144553'),(16,'auth','0011_update_proxy_permissions','2023-03-06 00:35:55.149553'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-06 00:35:55.185766'),(18,'captcha','0001_initial','2023-03-06 00:35:55.205766'),(19,'captcha','0002_alter_captchastore_id','2023-03-06 00:35:55.210782'),(20,'repair','0001_initial','2023-03-06 00:35:55.724274'),(21,'sessions','0001_initial','2023-03-06 00:35:55.754630');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('28z9vgj4s2ohgotfzikevlhls3pizte5','.eJxVjMEOgjAQRP-lZ9O0he4Wj975hma7WyxqIKFwMv67kHDQ22Tem3mrSNta4lbzEkdRV-XV5bdLxM88HUAeNN1nzfO0LmPSh6JPWnU_S37dTvfvoFAt-xqBbfJdMFkGHtoAmYRdS40lBPTIFBgNggcfjAVngZzFxoG0sqdOfb7iJDcX:1pbPIa:LOOH0jFqlIgINyawOpqhZUYNEhn_hnalJc3OiHqpzFI','2023-03-26 17:15:56.913255');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_comments`
--

DROP TABLE IF EXISTS `employee_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `added_by_id` int NOT NULL,
  `repair_order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_comments_added_by_id_f3ae3830_fk_auth_user_id` (`added_by_id`),
  KEY `employee_comments_repair_order_id_43afa9ad_fk_repair_orders_id` (`repair_order_id`),
  CONSTRAINT `employee_comments_added_by_id_f3ae3830_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `employee_comments_repair_order_id_43afa9ad_fk_repair_orders_id` FOREIGN KEY (`repair_order_id`) REFERENCES `repair_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_comments`
--

LOCK TABLES `employee_comments` WRITE;
/*!40000 ALTER TABLE `employee_comments` DISABLE KEYS */;
INSERT INTO `employee_comments` VALUES (1,'2023-03-06 17:20:02.981844','Требуются запчасти.',2,1),(2,'2023-03-06 17:22:18.047211','Протекает шланг.',3,2),(3,'2023-03-12 08:18:08.698520','Запчасти заказаны.',2,1);
/*!40000 ALTER TABLE `employee_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_orders`
--

DROP TABLE IF EXISTS `repair_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accept_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `estimated_price` decimal(8,2) NOT NULL,
  `final_price` decimal(8,2) NOT NULL,
  `client_id` int NOT NULL,
  `device_id` int NOT NULL,
  `repair_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repair_id` (`repair_id`),
  KEY `repair_orders_client_id_308d5681_fk_clients_id` (`client_id`),
  KEY `repair_orders_device_id_9580168e_fk_devices_id` (`device_id`),
  CONSTRAINT `repair_orders_client_id_308d5681_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `repair_orders_device_id_9580168e_fk_devices_id` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `repair_orders_repair_id_974b57ee_fk_repairs_id` FOREIGN KEY (`repair_id`) REFERENCES `repairs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_orders`
--

LOCK TABLES `repair_orders` WRITE;
/*!40000 ALTER TABLE `repair_orders` DISABLE KEYS */;
INSERT INTO `repair_orders` VALUES (1,'2023-03-06',NULL,1000.00,0.00,1,1,1),(2,'2023-03-06',NULL,1500.00,0.00,2,2,2),(3,'2023-03-06',NULL,0.00,0.00,3,3,3),(4,'2023-03-10',NULL,0.00,0.00,4,4,4);
/*!40000 ALTER TABLE `repair_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_statuses`
--

DROP TABLE IF EXISTS `repair_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_statuses` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_statuses`
--

LOCK TABLES `repair_statuses` WRITE;
/*!40000 ALTER TABLE `repair_statuses` DISABLE KEYS */;
INSERT INTO `repair_statuses` VALUES (5,'Выдан клиенту'),(2,'Заказаны запчасти'),(6,'Принят на диагностику'),(1,'Ремонт в работе'),(3,'Ремонт закончен'),(4,'Ремонт невозможен');
/*!40000 ALTER TABLE `repair_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_types`
--

DROP TABLE IF EXISTS `repair_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_types` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_types`
--

LOCK TABLES `repair_types` WRITE;
/*!40000 ALTER TABLE `repair_types` DISABLE KEYS */;
INSERT INTO `repair_types` VALUES (1,'Гарантийный'),(4,'Дилерская гарантия'),(2,'Постгарантийный'),(3,'Расширенная гарантия');
/*!40000 ALTER TABLE `repair_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairs`
--

DROP TABLE IF EXISTS `repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_visiting` tinyint(1) NOT NULL,
  `employee_id` int NOT NULL,
  `repair_type_id` smallint NOT NULL,
  `status_id` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repairs_repair_type_id_3bada170_fk_repair_types_id` (`repair_type_id`),
  KEY `repairs_status_id_2be2d67d_fk_repair_statuses_id` (`status_id`),
  KEY `repairs_employee_id_e03bf9ba_fk_auth_user_id` (`employee_id`),
  CONSTRAINT `repairs_employee_id_e03bf9ba_fk_auth_user_id` FOREIGN KEY (`employee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `repairs_repair_type_id_3bada170_fk_repair_types_id` FOREIGN KEY (`repair_type_id`) REFERENCES `repair_types` (`id`),
  CONSTRAINT `repairs_status_id_2be2d67d_fk_repair_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `repair_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,1,2,1,6),(2,0,3,2,1),(3,0,4,4,3),(4,0,2,1,2);
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (6,'Bosch'),(5,'Electrolux'),(2,'LG'),(1,'Panasonic'),(8,'Redmond'),(3,'Samsung'),(4,'Sony'),(7,'Xiaomi');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13  8:40:42
