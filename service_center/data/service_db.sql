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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (7,1,54),(5,2,53),(6,2,54),(12,2,73);
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add client',7,'add_client'),(26,'Can change client',7,'change_client'),(27,'Can delete client',7,'delete_client'),(28,'Can view client',7,'view_client'),(29,'Can add device',8,'add_device'),(30,'Can change device',8,'change_device'),(31,'Can delete device',8,'delete_device'),(32,'Can view device',8,'view_device'),(33,'Can add device type',9,'add_devicetype'),(34,'Can change device type',9,'change_devicetype'),(35,'Can delete device type',9,'delete_devicetype'),(36,'Can view device type',9,'view_devicetype'),(37,'Can add repair',10,'add_repair'),(38,'Can change repair',10,'change_repair'),(39,'Can delete repair',10,'delete_repair'),(40,'Can view repair',10,'view_repair'),(41,'Can add repair status',11,'add_repairstatus'),(42,'Can change repair status',11,'change_repairstatus'),(43,'Can delete repair status',11,'delete_repairstatus'),(44,'Can view repair status',11,'view_repairstatus'),(45,'Can add repair type',12,'add_repairtype'),(46,'Can change repair type',12,'change_repairtype'),(47,'Can delete repair type',12,'delete_repairtype'),(48,'Can view repair type',12,'view_repairtype'),(49,'Can add vendor',13,'add_vendor'),(50,'Can change vendor',13,'change_vendor'),(51,'Can delete vendor',13,'delete_vendor'),(52,'Can view vendor',13,'view_vendor'),(53,'Can add repair order',14,'add_repairorder'),(54,'Can change repair order',14,'change_repairorder'),(55,'Can delete repair order',14,'delete_repairorder'),(56,'Can view repair order',14,'view_repairorder'),(57,'Can add employee comment',15,'add_employeecomment'),(58,'Can change employee comment',15,'change_employeecomment'),(59,'Can delete employee comment',15,'delete_employeecomment'),(60,'Can view employee comment',15,'view_employeecomment'),(61,'Can add captcha store',16,'add_captchastore'),(62,'Can change captcha store',16,'change_captchastore'),(63,'Can delete captcha store',16,'delete_captchastore'),(64,'Can view captcha store',16,'view_captchastore'),(65,'Can add django job',17,'add_djangojob'),(66,'Can change django job',17,'change_djangojob'),(67,'Can delete django job',17,'delete_djangojob'),(68,'Can view django job',17,'view_djangojob'),(69,'Can add django job execution',18,'add_djangojobexecution'),(70,'Can change django job execution',18,'change_djangojobexecution'),(71,'Can delete django job execution',18,'delete_djangojobexecution'),(72,'Can view django job execution',18,'view_djangojobexecution'),(73,'Catalog add item',19,'catalog_add_item');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$zrXqQwcm9XJ5vUWPHZMVSz$gQx3/pJJcCLoRkaa3F64u3lhrFRAdM2hWHNf16bJYfY=','2023-04-15 11:11:47.689994',1,'root','Рут','Админов','root@servicepython.ru',1,1,'2023-03-06 00:36:38.000000'),(2,'pbkdf2_sha256$390000$OMrtOldq2qkEfTnBn0vMZT$Cc5q9kA9aCCa5Op99LX2j4KoN0w09hUeRSCXx04WlNw=','2023-04-16 13:54:08.747504',0,'master1','Петр','Петров','petrov@servicepython.ru',0,1,'2023-03-06 00:38:49.000000'),(3,'pbkdf2_sha256$390000$aFAasRLcsvBbdkqN8l2ETP$jVvhQ+1cNB127bMonnnEshiNk8Dtu4zCTQFEmIQkPbc=','2023-03-28 17:27:48.520812',0,'master2','Иван','Иванов','ivanov@servicepython.ru',0,1,'2023-03-06 00:39:58.000000'),(4,'pbkdf2_sha256$390000$BkMLizS3cACeHOCv7kjKTb$8/KpX5fnnOw/8G7Fa54qDetAo1gJpGz4ujI7PgSWUQ0=','2023-03-10 12:36:50.205249',0,'master3','Сергей','Сергеев','sergeev@servicepython.ru',0,1,'2023-03-06 00:40:35.000000'),(5,'pbkdf2_sha256$390000$ODufw9ZK8Yi6SP5AQK3YMm$tPvOVx+x5uZgidx6diwkVzc+RpFqaBYlrOm7fwXx5B0=','2023-04-16 13:55:21.547117',0,'priemka1','Кирилл','Кириллов','kirillov@servicepython.ru',0,1,'2023-03-10 07:05:25.000000'),(6,'pbkdf2_sha256$390000$ZLsb9Fsj2phIFPP1TVH7wg$YqP63hXNsnPxCpg4CqZkbD2RBVyroZ0G5tsYhoU8yO0=','2023-03-12 08:38:46.810296',0,'master4','Андрей','Андреев','andreev@servicepython.ru',0,1,'2023-03-12 08:31:32.000000'),(7,'pbkdf2_sha256$390000$3BLoNZuWdfiJgKeJBDIDqb$n8yESsklrr/7e21nSRgqm/y0kg5MuiEHAGcomxqDRD8=','2023-04-16 13:48:19.570809',0,'manager1','Антон','Антонов','antonov@servicepython.ru',0,1,'2023-03-12 08:33:13.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (127,'1+8=','9','75f3bcb073f030c3c48590afdc0ca1a77ca1a312','2023-04-16 13:59:45.691885'),(129,'1+10=','11','6023e50057d433a3700500c49b683b17e234c358','2023-04-16 14:00:03.307964'),(131,'4*6=','24','3ec030fa3badc49ff56adcaa3ab6123180b6fe06','2023-04-16 14:00:33.282978');
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
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `address` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_first_name_patronymic_last_name_phone_32d46832_uniq` (`first_name`,`patronymic`,`last_name`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Степан','Степанович','Степанов','stepa@mail.ru',79142355588,'г. Якутск, пр. Ленина, 1, кв. 2'),(2,'Василий','Васильевич','Васильев','vasiliev@mail.ru',79131234567,'г. Новосибирск, ул. Анодная, д.2, кв. 3'),(3,'Федор','Федорович','Федоров','',79111234554,'г. Санкт-Петербург, ул. Морская, д.100, кв. 77'),(4,'Сидор','Сидорович','Сидоров','sss1970@yandex.ru',79245551179,'г. Иркутск, ул. Гоголя, 10, кв. 20'),(12,'Таисия','Афанасьевна','Снеткова','taisiya18121975@hotmail.com',425535,'г. Якутск, ул. Гагарина, 1, кв. 2'),(13,'Раиса','Ивановна','Кацена','raisa03091986@gmail.com',79792503443,'г. Новосибирск, ул. Краузе, 10, кв. 112'),(14,'Игнат','Севастьянович','Астафьев','ignat1992@mail.ru',79395346141,'г. Псков, Октябрьская ул., дом 15, корп. 4'),(15,'Прохор','Валерианович','Дорофеев','Prohor69@yandex.ru',73501487681,'г. Томск, Парковая ул., дом 40, корп. 4, кв. 1'),(16,'Сергей','Порфирьевич','Воронов','Sergej136@yandex.ru',75326787576,'г. Липецк, Шоссейная ул., дом 14, корп. 3, кв. 2'),(17,'Пелагея','Егоровна','Кулагина','Pelageya152@hotmail.com',76989413061,'г. Ростов-на-Дону, Садовый пер., дом 11, кв. 7'),(18,'Георгий','Панкратович','Чернов','Georgij83@gmail.com',75583726036,'г. Нальчик, Советский пер., дом 6, корп. 4, кв. 3'),(19,'Аделаида','Венедиктовна','Кулакова','Adelaida19@msn.com',77578317441,'г. Биробиджан, Школьная ул., дом 12, кв.666'),(22,'Филиппа','Ефимовна','Александрова','Filippa191@msn.com',74145653082,'Россия, г. Тюмень, Ленина В.И. ул., дом 17, кв. 3'),(23,'Степан','Антонович','Корнилов','Stepan182@yandex.ru',78475096538,'Россия, г. Смоленск, Мира ул., дом 27, корп. 2, кв. 3');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_types`
--

LOCK TABLES `device_types` WRITE;
/*!40000 ALTER TABLE `device_types` DISABLE KEYS */;
INSERT INTO `device_types` VALUES (9,'Варочная поверхность'),(16,'ИБП'),(21,'Колонки'),(12,'Кондиционер'),(3,'Микроволновая печь'),(19,'Миксер'),(17,'Мобильный телефон'),(15,'Монитор'),(14,'Музыкальный центр'),(10,'Мультиварка'),(13,'Обогреватель'),(5,'Посудомоечная машина'),(20,'Принтер'),(6,'Пылесос'),(4,'Стиральная машина'),(1,'Телевизор'),(7,'Утюг'),(18,'Фен'),(2,'Холодильник'),(8,'Электроплита'),(11,'Электрочайник');
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
  `device_type_id` smallint NOT NULL,
  `vendor_id` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `devices_model_serial_number_498a52f2_uniq` (`model`,`serial_number`),
  KEY `devices_device_type_id_a366517d_fk_device_types_id` (`device_type_id`),
  KEY `devices_vendor_id_868ea564_fk_vendors_id` (`vendor_id`),
  CONSTRAINT `devices_device_type_id_a366517d_fk_device_types_id` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`),
  CONSTRAINT `devices_vendor_id_868ea564_fk_vendors_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'B-100','B010203040',2,6),(2,'EL-125','1234567890',5,5),(3,'RD-25F','RD987654321',10,8),(4,'LGC-100','223344FGH',12,2),(12,'X-30512','33221456X',1,7),(13,'S-1516','SCX1230087',14,4),(14,'Redmi-9a','RX098123-U77',17,7),(15,'P235','0102030405',18,1),(16,'EL09-89','777888999',9,5),(17,'SMG09-XL','G2345H908',3,3),(18,'RDR-09','23098564GHF5',11,8),(19,'PNS-999','P-0088-4455G',1,1),(22,'GW2250HM','246809753',15,14),(23,'CNP-1020','23456BACD1',20,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-06 00:38:10.958875','1','Мастера',1,'[{\"added\": {}}]',3,1),(2,'2023-03-06 00:38:17.191952','2','Приемка',1,'[{\"added\": {}}]',3,1),(3,'2023-03-06 00:38:25.720113','3','Менеджеры',1,'[{\"added\": {}}]',3,1),(4,'2023-03-06 00:38:49.468069','2',' ',1,'[{\"added\": {}}]',4,1),(5,'2023-03-06 00:39:43.077546','2','Петр Петров',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(6,'2023-03-06 00:39:58.129751','3',' ',1,'[{\"added\": {}}]',4,1),(7,'2023-03-06 00:40:19.108861','3','Иван Иванов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(8,'2023-03-06 00:40:35.879873','4',' ',1,'[{\"added\": {}}]',4,1),(9,'2023-03-06 00:41:04.457198','4','Сергей Сергеев',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(10,'2023-03-06 00:42:30.152567','1','Холодильник Bosch B-100',1,'[{\"added\": {}}]',8,1),(11,'2023-03-06 00:43:11.531809','2','Посудомоечная машина Electrolux EL-125',1,'[{\"added\": {}}]',8,1),(12,'2023-03-06 00:44:08.632530','3','Мультиварка Redmond RD-25F',1,'[{\"added\": {}}]',8,1),(13,'2023-03-06 00:45:05.226139','1','Степанов Степан Степанович',1,'[{\"added\": {}}]',7,1),(14,'2023-03-06 00:46:13.571327','2','Васильев Василий Васильевич',1,'[{\"added\": {}}]',7,1),(15,'2023-03-06 00:47:28.182124','3','Федоров Федор Федорович',1,'[{\"added\": {}}]',7,1),(16,'2023-03-06 00:47:44.868363','1','Repair object (1)',1,'[{\"added\": {}}]',10,1),(17,'2023-03-06 00:48:01.749533','2','Repair object (2)',1,'[{\"added\": {}}]',10,1),(18,'2023-03-06 00:48:13.828622','3','Repair object (3)',1,'[{\"added\": {}}]',10,1),(19,'2023-03-06 00:48:34.840491','1','Ордер №1 от 2023-03-06',1,'[{\"added\": {}}]',14,1),(20,'2023-03-06 00:48:54.472305','2','Ордер №2 от 2023-03-06',1,'[{\"added\": {}}]',14,1),(21,'2023-03-06 00:49:12.493797','3','Ордер №3 от 2023-03-06',1,'[{\"added\": {}}]',14,1),(22,'2023-03-06 17:20:02.982853','1','EmployeeComment object (1)',1,'[{\"added\": {}}]',15,1),(23,'2023-03-06 17:21:25.751485','2','EmployeeComment object (2)',1,'[{\"added\": {}}]',15,1),(24,'2023-03-06 17:22:18.047211','2','EmployeeComment object (2)',2,'[{\"changed\": {\"fields\": [\"Comment\"]}}]',15,1),(25,'2023-03-09 14:55:18.283103','2','Петр Петров',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(26,'2023-03-09 14:55:59.630484','2','Петр Петров',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(27,'2023-03-09 17:44:04.744820','1','Рут Админов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(28,'2023-03-10 07:05:25.722202','5',' ',1,'[{\"added\": {}}]',4,1),(29,'2023-03-10 07:06:04.672098','5','Кирилл Кириллов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(30,'2023-03-10 12:41:21.610054','4','Кондиционер LG LGC-100',1,'[{\"added\": {}}]',8,1),(31,'2023-03-10 12:41:59.886005','4','Repair object (4)',1,'[{\"added\": {}}]',10,1),(32,'2023-03-10 12:43:30.564610','4','Сидоров Сидор Сидорович',1,'[{\"added\": {}}]',7,1),(33,'2023-03-10 12:43:50.735544','4','Наряд №4 от 2023-03-10',1,'[{\"added\": {}}]',14,1),(34,'2023-03-12 08:18:08.698520','3','2023-03-12 08:18:08.698520+00:00, Петр Петров, Запчасти заказаны.',1,'[{\"added\": {}}]',15,1),(35,'2023-03-12 08:31:32.625878','6',' ',1,'[{\"added\": {}}]',4,1),(36,'2023-03-12 08:32:15.327200','6','Андрей Андреев',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(37,'2023-03-12 08:33:13.445531','7',' ',1,'[{\"added\": {}}]',4,1),(38,'2023-03-12 08:34:17.544737','7','Анто Антонов',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(39,'2023-03-17 01:49:37.373998','5','Пугачева Алла Борисовна',3,'',7,1),(40,'2023-03-17 01:49:48.781281','5','Телевизор Xiaomi FGH-1000-XX',3,'',8,1),(41,'2023-03-17 01:50:02.246486','5','Repair object (5)',3,'',10,1),(42,'2023-03-17 01:50:31.361726','20','2023-03-16 15:31:57.995622+00:00, Кирилл Кириллов, 123',3,'',15,1),(43,'2023-03-17 01:54:11.808064','7','Антон Антонов',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(44,'2023-03-17 01:54:28.461659','5','Наряд №5 от 2023-03-16',3,'',14,1),(45,'2023-03-17 01:54:42.252904','6','a a a',3,'',7,1),(46,'2023-03-17 01:55:00.403314','6','Repair object (6)',3,'',10,1),(47,'2023-03-17 01:55:16.144909','6','Варочная поверхность Bosch 12',3,'',8,1),(48,'2023-03-25 16:09:16.555498','27','2023-03-25 14:33:50.816769+00:00, Петр Петров, 123',3,'',15,1),(49,'2023-03-25 16:09:16.559499','26','2023-03-25 14:32:42.111479+00:00, Петр Петров, ',3,'',15,1),(50,'2023-03-25 16:09:16.561499','25','2023-03-25 14:31:06.573672+00:00, Петр Петров, ',3,'',15,1),(51,'2023-03-25 16:09:16.562506','24','2023-03-25 14:30:22.857681+00:00, Петр Петров, ',3,'',15,1),(52,'2023-03-25 16:09:16.564499','23','2023-03-25 14:29:22.007663+00:00, Петр Петров, ',3,'',15,1),(53,'2023-03-25 16:09:16.566498','22','2023-03-24 16:12:27.127929+00:00, Кирилл Кириллов, www',3,'',15,1),(54,'2023-03-25 16:09:16.568500','21','2023-03-17 02:37:35.346415+00:00, Кирилл Кириллов, 3',3,'',15,1),(55,'2023-03-25 16:10:01.537745','9','Наряд №9 от 2023-03-24',3,'',14,1),(56,'2023-03-25 16:10:32.934444','8','Наряд №8 от 2023-03-17',3,'',14,1),(57,'2023-03-25 16:10:32.937846','7','Наряд №7 от 2023-03-17',3,'',14,1),(58,'2023-03-25 16:10:32.939901','6','Наряд №6 от 2023-03-17',3,'',14,1),(59,'2023-03-25 16:10:47.163843','11','Repair object (11)',3,'',10,1),(60,'2023-03-25 16:10:47.167226','10','Repair object (10)',3,'',10,1),(61,'2023-03-25 16:10:47.169099','9','Repair object (9)',3,'',10,1),(62,'2023-03-25 16:10:47.171099','8','Repair object (8)',3,'',10,1),(63,'2023-03-25 16:10:47.173100','7','Repair object (7)',3,'',10,1),(64,'2023-03-25 16:10:58.289489','11','Электрочайник Bosch ee',3,'',8,1),(65,'2023-03-25 16:10:58.291796','10','Электрочайник LG sss',3,'',8,1),(66,'2023-03-25 16:10:58.294234','9','Электроплита Electrolux 23',3,'',8,1),(67,'2023-03-25 16:10:58.296229','8','Стиральная машина Panasonic 1',3,'',8,1),(68,'2023-03-25 16:10:58.298121','7','Варочная поверхность Bosch 1',3,'',8,1),(69,'2023-03-25 16:11:10.197553','11','c a b',3,'',7,1),(70,'2023-03-25 16:11:10.200582','10','d a s',3,'',7,1),(71,'2023-03-25 16:11:10.202553','9','a a a',3,'',7,1),(72,'2023-03-25 16:11:10.204361','8','а ф в',3,'',7,1),(73,'2023-03-25 16:11:10.206114','7','Фамилия Имя Отчество',3,'',7,1),(74,'2023-03-26 11:26:45.197734','17','Мобильный телефон',1,'[{\"added\": {}}]',9,1),(75,'2023-03-26 11:26:51.248794','18','Фен',1,'[{\"added\": {}}]',9,1),(76,'2023-04-09 11:59:06.130122','18','Наряд №18 от 2023-04-09',3,'',14,1),(77,'2023-04-09 11:59:14.330156','20','Степанович Степанов Степан',3,'',7,1),(78,'2023-04-09 11:59:22.177126','20','Монитор Benq GW2250HM',3,'',8,1),(79,'2023-04-10 12:47:09.007671','1','Мастера',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(80,'2023-04-10 12:47:41.836868','1','Мастера',2,'[]',3,1),(81,'2023-04-10 16:59:19.563761','2','Приемка',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(82,'2023-04-10 17:00:05.159048','1','Мастера',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(83,'2023-04-15 09:01:42.507859','2','Приемка',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(84,'2023-04-15 09:01:50.415021','1','Мастера',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(85,'2023-04-15 09:04:56.515655','2','Приемка',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(86,'2023-04-15 09:05:19.003561','1','Мастера',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(87,'2023-04-15 09:41:33.035066','2','Приемка',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(88,'2023-04-15 11:12:43.027641','2','Приемка',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_apscheduler_djangojob`
--

DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_apscheduler_djangojob` (
  `id` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_apscheduler_djangojob`
--

LOCK TABLES `django_apscheduler_djangojob` WRITE;
/*!40000 ALTER TABLE `django_apscheduler_djangojob` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojob` VALUES ('check_overdue_repairs','2023-04-16 17:05:00.000000',_binary '��U\0\0\0\0\0\0}�(�version�K�id��check_overdue_repairs��func��0repair.scheduler.scheduler:check_overdue_repairs��trigger��apscheduler.triggers.cron��CronTrigger���)��}�(hK�timezone��pytz_deprecation_shim._impl��	wrap_zone����builtins��getattr����zoneinfo��ZoneInfo����	_unpickle���R��Asia/Novosibirsk�K��R�h��R��\nstart_date�N�end_date�N�fields�]�(� apscheduler.triggers.cron.fields��	BaseField���)��}�(�name��year��\nis_default���expressions�]��%apscheduler.triggers.cron.expressions��\rAllExpression���)��}��step�Nsbaubh\"�\nMonthField���)��}�(h\'�month�h)�h*]�h.)��}�h1Nsbaubh\"�DayOfMonthField���)��}�(h\'�day�h)�h*]�h.)��}�h1Nsbaubh\"�	WeekField���)��}�(h\'�week�h)�h*]�h.)��}�h1Nsbaubh\"�DayOfWeekField���)��}�(h\'�day_of_week�h)�h*]�h.)��}�h1Nsbaubh$)��}�(h\'�hour�h)�h*]�h,�RangeExpression���)��}�(h1N�first�K\0�last�K\0ubaubh$)��}�(h\'�minute�h)�h*]�hW)��}�(h1NhZKh[Kubaubh$)��}�(h\'�second�h)�h*]�hW)��}�(h1NhZK\0h[K\0ubaube�jitter�Nub�executor��default��args�)�kwargs�}�h\'h�misfire_grace_time�K�coalesce���\rmax_instances�K�\rnext_run_time��datetime��datetime���C\n\�\0\0\0\0\0�h��R�u.');
/*!40000 ALTER TABLE `django_apscheduler_djangojob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_apscheduler_djangojobexecution`
--

DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) DEFAULT NULL,
  `traceback` longtext,
  `job_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_job_executions` (`job_id`,`run_time`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  CONSTRAINT `django_apscheduler_djangojobexecution_job_id_daf5090a_fk` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_apscheduler_djangojobexecution`
--

LOCK TABLES `django_apscheduler_djangojobexecution` WRITE;
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (333,'Executed','2023-04-05 06:37:30.000000',0.01,1680676650.01,NULL,NULL,'check_overdue_repairs'),(334,'Executed','2023-04-05 06:38:00.000000',0.02,1680676680.02,NULL,NULL,'check_overdue_repairs'),(336,'Executed','2023-04-05 06:38:30.000000',0.01,1680676710.01,NULL,NULL,'check_overdue_repairs'),(338,'Executed','2023-04-05 06:39:00.000000',0.02,1680676740.02,NULL,NULL,'check_overdue_repairs'),(341,'Executed','2023-04-05 06:39:30.000000',0.02,1680676770.02,NULL,NULL,'check_overdue_repairs'),(342,'Executed','2023-04-05 06:43:00.000000',0.02,1680676980.02,NULL,NULL,'check_overdue_repairs'),(343,'Executed','2023-04-05 06:43:30.000000',0.02,1680677010.02,NULL,NULL,'check_overdue_repairs'),(344,'Executed','2023-04-05 06:44:00.000000',0.03,1680677040.03,NULL,NULL,'check_overdue_repairs'),(345,'Executed','2023-04-05 06:44:30.000000',0.02,1680677070.02,NULL,NULL,'check_overdue_repairs'),(346,'Executed','2023-04-05 06:45:00.000000',0.01,1680677100.01,NULL,NULL,'check_overdue_repairs'),(347,'Executed','2023-04-05 06:45:30.000000',0.02,1680677130.02,NULL,NULL,'check_overdue_repairs'),(348,'Executed','2023-04-05 06:46:00.000000',0.01,1680677160.01,NULL,NULL,'check_overdue_repairs'),(349,'Executed','2023-04-05 06:46:30.000000',0.04,1680677190.04,NULL,NULL,'check_overdue_repairs'),(350,'Executed','2023-04-05 06:47:00.000000',0.02,1680677220.02,NULL,NULL,'check_overdue_repairs'),(351,'Executed','2023-04-05 06:47:30.000000',0.01,1680677250.01,NULL,NULL,'check_overdue_repairs'),(352,'Executed','2023-04-05 06:48:00.000000',0.01,1680677280.01,NULL,NULL,'check_overdue_repairs'),(353,'Executed','2023-04-05 06:48:30.000000',0.01,1680677310.01,NULL,NULL,'check_overdue_repairs'),(354,'Executed','2023-04-05 06:49:00.000000',0.01,1680677340.01,NULL,NULL,'check_overdue_repairs'),(355,'Executed','2023-04-05 06:49:30.000000',0.01,1680677370.01,NULL,NULL,'check_overdue_repairs'),(356,'Executed','2023-04-05 06:50:00.000000',0.01,1680677400.01,NULL,NULL,'check_overdue_repairs'),(357,'Executed','2023-04-05 06:51:00.000000',0.03,1680677460.03,NULL,NULL,'check_overdue_repairs'),(358,'Executed','2023-04-05 06:52:00.000000',0.01,1680677520.01,NULL,NULL,'check_overdue_repairs'),(359,'Executed','2023-04-05 06:53:00.000000',0.02,1680677580.02,NULL,NULL,'check_overdue_repairs'),(360,'Executed','2023-04-05 06:54:00.000000',0.02,1680677640.02,NULL,NULL,'check_overdue_repairs'),(361,'Executed','2023-04-05 06:55:00.000000',0.02,1680677700.02,NULL,NULL,'check_overdue_repairs'),(362,'Executed','2023-04-05 06:56:00.000000',0.01,1680677760.01,NULL,NULL,'check_overdue_repairs'),(363,'Executed','2023-04-05 06:58:00.000000',0.03,1680677880.03,NULL,NULL,'check_overdue_repairs'),(364,'Executed','2023-04-05 06:59:00.000000',0.01,1680677940.01,NULL,NULL,'check_overdue_repairs'),(365,'Executed','2023-04-05 07:00:00.000000',0.01,1680678000.01,NULL,NULL,'check_overdue_repairs'),(366,'Executed','2023-04-05 07:01:00.000000',0.02,1680678060.02,NULL,NULL,'check_overdue_repairs'),(367,'Executed','2023-04-05 07:02:00.000000',0.01,1680678120.01,NULL,NULL,'check_overdue_repairs'),(368,'Executed','2023-04-05 07:03:00.000000',0.02,1680678180.02,NULL,NULL,'check_overdue_repairs'),(369,'Executed','2023-04-05 07:04:00.000000',0.01,1680678240.01,NULL,NULL,'check_overdue_repairs'),(370,'Executed','2023-04-05 07:05:00.000000',0.01,1680678300.01,NULL,NULL,'check_overdue_repairs'),(371,'Executed','2023-04-05 07:06:00.000000',0.03,1680678360.03,NULL,NULL,'check_overdue_repairs'),(372,'Executed','2023-04-05 07:07:00.000000',0.01,1680678420.01,NULL,NULL,'check_overdue_repairs'),(373,'Executed','2023-04-05 07:08:00.000000',0.02,1680678480.02,NULL,NULL,'check_overdue_repairs'),(374,'Executed','2023-04-05 07:09:00.000000',0.02,1680678540.02,NULL,NULL,'check_overdue_repairs'),(375,'Executed','2023-04-05 07:10:00.000000',0.03,1680678600.03,NULL,NULL,'check_overdue_repairs'),(376,'Executed','2023-04-05 07:11:00.000000',0.02,1680678660.02,NULL,NULL,'check_overdue_repairs'),(377,'Executed','2023-04-05 07:12:00.000000',0.02,1680678720.02,NULL,NULL,'check_overdue_repairs'),(378,'Executed','2023-04-05 07:13:00.000000',0.01,1680678780.01,NULL,NULL,'check_overdue_repairs'),(379,'Executed','2023-04-05 07:14:00.000000',0.01,1680678840.01,NULL,NULL,'check_overdue_repairs'),(380,'Executed','2023-04-05 07:15:00.000000',0.01,1680678900.01,NULL,NULL,'check_overdue_repairs'),(381,'Executed','2023-04-05 07:16:00.000000',0.01,1680678960.01,NULL,NULL,'check_overdue_repairs'),(382,'Executed','2023-04-05 07:17:00.000000',0.02,1680679020.02,NULL,NULL,'check_overdue_repairs'),(383,'Executed','2023-04-05 07:18:00.000000',0.01,1680679080.01,NULL,NULL,'check_overdue_repairs'),(384,'Executed','2023-04-05 07:19:00.000000',0.02,1680679140.02,NULL,NULL,'check_overdue_repairs'),(385,'Executed','2023-04-05 07:20:00.000000',0.01,1680679200.01,NULL,NULL,'check_overdue_repairs'),(386,'Executed','2023-04-05 11:05:00.000000',0.92,1680692700.92,NULL,NULL,'check_overdue_repairs'),(387,'Executed','2023-04-05 11:10:00.000000',0.05,1680693000.05,NULL,NULL,'check_overdue_repairs'),(388,'Executed','2023-04-05 11:25:00.000000',0.90,1680693900.90,NULL,NULL,'check_overdue_repairs'),(389,'Executed','2023-04-05 11:30:00.000000',0.91,1680694200.91,NULL,NULL,'check_overdue_repairs'),(390,'Executed','2023-04-05 11:35:00.000000',0.05,1680694500.05,NULL,NULL,'check_overdue_repairs'),(391,'Executed','2023-04-05 11:40:00.000000',0.05,1680694800.05,NULL,NULL,'check_overdue_repairs'),(392,'Executed','2023-04-05 12:15:00.000000',0.90,1680696900.90,NULL,NULL,'check_overdue_repairs'),(393,'Executed','2023-04-05 17:05:00.000000',0.89,1680714300.89,NULL,NULL,'check_overdue_repairs'),(394,'Executed','2023-04-06 17:05:00.000000',0.89,1680800700.89,NULL,NULL,'check_overdue_repairs'),(395,'Missed!','2023-04-07 17:05:00.000000',78516.97,1680965616.97,'Run time of job \'check_overdue_repairs\' was missed!',NULL,'check_overdue_repairs'),(396,'Executed','2023-04-08 17:05:00.000000',0.90,1680973500.90,NULL,NULL,'check_overdue_repairs'),(397,'Error!','2023-04-09 17:05:00.000000',0.93,1681059900.93,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 20, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(398,'Error!','2023-04-10 17:05:00.000000',0.97,1681146300.97,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 20, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(399,'Error!','2023-04-11 17:05:00.000000',0.93,1681232700.93,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 20, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(400,'Error!','2023-04-13 17:05:00.000000',0.92,1681405500.92,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 20, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(401,'Error!','2023-04-15 14:55:00.000000',0.93,1681570500.93,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 20, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(402,'Error!','2023-04-15 15:00:00.000000',0.05,1681570800.05,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 20, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(403,'Error!','2023-04-15 15:05:00.000000',0.88,1681571100.88,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 21, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(404,'Error!','2023-04-15 15:10:00.000000',0.05,1681571400.05,'Repair has no repairorder.','  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\service_center\\repair\\scheduler\\scheduler.py\", line 21, in check_overdue_repairs\n    if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):\n                      ^^^^^^^^^^^^^^^^^^\n  File \"D:\\Step\\python\\rep\\Muhomorov_diploma\\venv\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 463, in __get__\n    raise self.RelatedObjectDoesNotExist(\n','check_overdue_repairs'),(405,'Executed','2023-04-15 15:15:00.000000',0.05,1681571700.05,NULL,NULL,'check_overdue_repairs'),(406,'Executed','2023-04-15 15:30:00.000000',0.89,1681572600.89,NULL,NULL,'check_overdue_repairs'),(407,'Executed','2023-04-15 15:40:00.000000',0.04,1681573200.04,NULL,NULL,'check_overdue_repairs'),(408,'Executed','2023-04-15 17:05:00.000000',0.90,1681578300.90,NULL,NULL,'check_overdue_repairs'),(409,'Executed','2023-04-16 14:10:00.000000',0.91,1681654200.91,NULL,NULL,'check_overdue_repairs');
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(16,'captcha','captchastore'),(5,'contenttypes','contenttype'),(17,'django_apscheduler','djangojob'),(18,'django_apscheduler','djangojobexecution'),(19,'repair','catalogperms'),(7,'repair','client'),(8,'repair','device'),(9,'repair','devicetype'),(15,'repair','employeecomment'),(10,'repair','repair'),(14,'repair','repairorder'),(11,'repair','repairstatus'),(12,'repair','repairtype'),(13,'repair','vendor'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-06 00:35:54.402397'),(2,'auth','0001_initial','2023-03-06 00:35:54.749846'),(3,'admin','0001_initial','2023-03-06 00:35:54.873794'),(4,'admin','0002_logentry_remove_auto_add','2023-03-06 00:35:54.881306'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-06 00:35:54.890056'),(6,'contenttypes','0002_remove_content_type_name','2023-03-06 00:35:54.958804'),(7,'auth','0002_alter_permission_name_max_length','2023-03-06 00:35:54.991481'),(8,'auth','0003_alter_user_email_max_length','2023-03-06 00:35:55.011478'),(9,'auth','0004_alter_user_username_opts','2023-03-06 00:35:55.016478'),(10,'auth','0005_alter_user_last_login_null','2023-03-06 00:35:55.051479'),(11,'auth','0006_require_contenttypes_0002','2023-03-06 00:35:55.056478'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-06 00:35:55.061478'),(13,'auth','0008_alter_user_username_max_length','2023-03-06 00:35:55.094552'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-06 00:35:55.129552'),(15,'auth','0010_alter_group_name_max_length','2023-03-06 00:35:55.144553'),(16,'auth','0011_update_proxy_permissions','2023-03-06 00:35:55.149553'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-06 00:35:55.185766'),(18,'captcha','0001_initial','2023-03-06 00:35:55.205766'),(19,'captcha','0002_alter_captchastore_id','2023-03-06 00:35:55.210782'),(20,'repair','0001_initial','2023-03-06 00:35:55.724274'),(21,'sessions','0001_initial','2023-03-06 00:35:55.754630'),(22,'repair','0002_alter_client_email_alter_client_first_name_and_more','2023-03-15 14:23:04.116276'),(23,'repair','0003_alter_employeecomment_options_and_more','2023-03-27 16:04:09.795434'),(24,'repair','0004_repairorder_employee_alter_repair_estimated_duration','2023-03-27 17:16:14.353134'),(25,'repair','0005_alter_client_phone','2023-03-28 03:41:34.372850'),(26,'repair','0006_repair_defect_repairorder_kit_state_and_more','2023-03-28 07:11:24.639289'),(27,'repair','0007_remove_device_defect_remove_device_kit_state','2023-03-28 08:03:13.529514'),(28,'repair','0008_alter_repair_defect_alter_repairorder_kit_state','2023-03-28 13:06:39.592164'),(29,'repair','0009_repairorder_added_by','2023-03-28 13:24:40.438193'),(30,'repair','0010_alter_repairorder_added_by','2023-03-28 13:26:27.811724'),(31,'django_apscheduler','0001_initial','2023-04-04 15:46:02.493177'),(32,'django_apscheduler','0002_auto_20180412_0758','2023-04-04 15:46:02.540045'),(33,'django_apscheduler','0003_auto_20200716_1632','2023-04-04 15:46:02.555669'),(34,'django_apscheduler','0004_auto_20200717_1043','2023-04-04 15:46:02.662506'),(35,'django_apscheduler','0005_migrate_name_to_id','2023-04-04 15:46:02.678151'),(36,'django_apscheduler','0006_remove_djangojob_name','2023-04-04 15:46:02.709399'),(37,'django_apscheduler','0007_auto_20200717_1404','2023-04-04 15:46:02.740660'),(38,'django_apscheduler','0008_remove_djangojobexecution_started','2023-04-04 15:46:02.756275'),(39,'django_apscheduler','0009_djangojobexecution_unique_job_executions','2023-04-04 15:46:02.762779'),(40,'repair','0011_alter_repairorder_added_by','2023-04-09 12:00:48.192672'),(41,'repair','0012_alter_client_unique_together_and_more','2023-04-09 12:39:08.019933'),(42,'repair','0013_alter_client_unique_together_and_more','2023-04-09 12:39:54.603794'),(43,'repair','0014_alter_client_address','2023-04-09 18:13:01.818235'),(44,'repair','0015_alter_client_address_alter_employeecomment_comment_and_more','2023-04-11 15:42:24.874614'),(45,'repair','0016_alter_repair_estimated_duration','2023-04-12 15:50:13.133012'),(46,'repair','0017_catalogperms','2023-04-15 10:03:41.671453');
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
INSERT INTO `django_session` VALUES ('b8pu2cdaeypddxrnhfvire26aplxqtvw','.eJxVjEEOwiAQRe_C2hCgTAGX7j0DmRlQqoYmpV0Z7y5NutDtf-_9t4i4rSVuLS9xSuIsQJx-N0J-5rqD9MB6nyXPdV0mkrsiD9rkdU75dTncv4OCrfTaeUvkQ_ApOTbEekBW2gIj-sFZsKAhqJtXBkbPWXdEzmaNyYzdAPH5AtNWNxQ:1pkJ52:-AOCTBXndI0bLWCh2Cc8Ohx-fLH2qAnLpMF2xMkzj5c','2023-04-20 06:26:44.354125'),('chjqhdomq526vopd4a4598i2kgztba1f','.eJxVjEEOwiAQRe_C2hCgTAGX7j0DmRlQqoYmpV0Z7y5NutDtf-_9t4i4rSVuLS9xSuIsQJx-N0J-5rqD9MB6nyXPdV0mkrsiD9rkdU75dTncv4OCrfTaeUvkQ_ApOTbEekBW2gIj-sFZsKAhqJtXBkbPWXdEzmaNyYzdAPH5AtNWNxQ:1po2qf:gSZzQWZZtWeF2xFgXYMcgIq4zayUrNruqw60C9LzjI8','2023-04-30 13:55:21.550123'),('eas7g9g8ea4n2idvw4qw3uejd1k9yts7','.eJxVjEEOwiAQRe_C2hCgTAGX7j0DmRlQqoYmpV0Z7y5NutDtf-_9t4i4rSVuLS9xSuIsQJx-N0J-5rqD9MB6nyXPdV0mkrsiD9rkdU75dTncv4OCrfTaeUvkQ_ApOTbEekBW2gIj-sFZsKAhqJtXBkbPWXdEzmaNyYzdAPH5AtNWNxQ:1pg2a4:FOfM_35GMKTaX01Lpp7Up65YMMWIVXR3kx3vzMvaYKs','2023-04-08 12:01:08.911875'),('owealphu0kesi12zoj6vyaos5x5yp4ql','.eJxVjDsOwjAQBe_iGln-4B8lfc5g7XptHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swxU6_G0J65LYDukO7dZ56W5cZ-a7wgw4-dcrP6-H-HVQY9Vuj9hZCCFK7szNWiyKcVIg-gXAqJKG9cxaNyVpiIpJZJUG5hGI0QVHs_QG6Njel:1pf3GS:o30Bim3r5theBy2vJ-o-sic8fJC0lhLNjE1Rvoyuciw','2023-04-05 18:32:48.883782');
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
  `comment` varchar(120) NOT NULL,
  `added_by_id` int NOT NULL,
  `repair_order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_comments_added_by_id_f3ae3830_fk_auth_user_id` (`added_by_id`),
  KEY `employee_comments_repair_order_id_43afa9ad_fk_repair_orders_id` (`repair_order_id`),
  CONSTRAINT `employee_comments_added_by_id_f3ae3830_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `employee_comments_repair_order_id_43afa9ad_fk_repair_orders_id` FOREIGN KEY (`repair_order_id`) REFERENCES `repair_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_comments`
--

LOCK TABLES `employee_comments` WRITE;
/*!40000 ALTER TABLE `employee_comments` DISABLE KEYS */;
INSERT INTO `employee_comments` VALUES (1,'2023-03-15 09:54:29.685284','Требуются запчасти.',2,1),(2,'2023-03-06 17:22:18.047211','Протекает шланг.',3,2),(3,'2023-03-12 08:18:08.698520','Запчасти заказаны.',2,1),(5,'2023-03-16 05:51:12.247192','Запчасти задерживаются.',2,1),(6,'2023-03-16 06:00:07.332775','Запчасти ожидаются через неделю.',5,1),(7,'2023-03-16 08:05:30.102769','Протекает помпа.',3,2),(17,'2023-03-16 12:17:20.367911','Сгорели щетки.',3,2),(18,'2023-03-16 12:26:01.681088','Треснула крышка',3,2),(19,'2023-03-16 14:17:59.323502','Утечка фреона.',5,4),(28,'2023-03-26 10:19:13.808010','Отходит шлейф на плате.',5,10),(29,'2023-03-26 15:00:42.689307','Сгорел нагревательный элемент.',5,14),(30,'2023-03-26 17:17:38.924945','Шлейф заказан, срок 7 дней.',5,10),(31,'2023-03-27 01:14:56.759717','Проблема  с лазером.',5,11),(32,'2023-03-27 01:21:30.565102','Заклинило двигатель.',5,15),(33,'2023-03-28 17:28:14.620597','Вздулся конденсатор.',3,14);
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
  `kit_state` varchar(240) NOT NULL,
  `added_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repair_id` (`repair_id`),
  KEY `repair_orders_client_id_308d5681_fk_clients_id` (`client_id`),
  KEY `repair_orders_device_id_9580168e_fk_devices_id` (`device_id`),
  KEY `repair_orders_added_by_id_b6ebab3d_fk_auth_user_id` (`added_by_id`),
  CONSTRAINT `repair_orders_added_by_id_b6ebab3d_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `repair_orders_client_id_308d5681_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `repair_orders_device_id_9580168e_fk_devices_id` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `repair_orders_repair_id_974b57ee_fk_repairs_id` FOREIGN KEY (`repair_id`) REFERENCES `repairs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_orders`
--

LOCK TABLES `repair_orders` WRITE;
/*!40000 ALTER TABLE `repair_orders` DISABLE KEYS */;
INSERT INTO `repair_orders` VALUES (1,'2023-03-06',NULL,1000.00,0.00,1,1,1,'Гарантийный талон.',5),(2,'2023-03-06',NULL,1500.00,0.00,2,2,2,'Чек. Поцарапана.',5),(3,'2023-03-06',NULL,0.00,0.00,3,3,3,'Гарантийный талон, чек. Без шнура.',5),(4,'2023-03-10',NULL,321.00,0.00,4,4,4,'Чек.',5),(10,'2023-03-26',NULL,1500.00,0.00,12,12,12,'Без упаковки. Есть чек.',5),(11,'2023-03-26',NULL,0.00,0.00,13,13,13,'Имеется упаковка, гарантийный талон.',5),(12,'2023-03-26',NULL,0.00,0.00,14,14,14,'Гарантийный талон.',5),(13,'2023-03-26',NULL,0.00,0.00,15,15,15,'Товарный чек, упаковка.',5),(14,'2023-03-26',NULL,5000.00,0.00,16,16,16,'Только оборудование. Отколот угол варочной поверхности.',5),(15,'2023-03-27',NULL,1500.00,0.00,17,17,17,'Без коробки. Имеется чек и гарантийный талон.',5),(16,'2023-03-28',NULL,0.00,0.00,18,18,18,'Документов нет. Внешних повреждений нет.',5),(17,'2023-03-29',NULL,1000.00,0.00,19,19,19,'Без упаковки, с пультом ДУ.',5),(19,'2023-04-09',NULL,0.00,0.00,1,22,21,'Нет шнура. Видимых повреждений нет.',5),(20,'2023-04-10',NULL,0.00,0.00,22,19,22,'Без документов.',5),(21,'2023-04-10',NULL,1500.00,0.00,2,2,23,'Чек. Поцарапана.',5),(22,'2023-04-16',NULL,0.00,0.00,23,23,24,'В коробке, имеется гарантийный талон.',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_types`
--

LOCK TABLES `repair_types` WRITE;
/*!40000 ALTER TABLE `repair_types` DISABLE KEYS */;
INSERT INTO `repair_types` VALUES (1,'Гарантийный'),(4,'Дилерская гарантия'),(5,'Коммерческий'),(2,'Постгарантийный'),(3,'Расширенная гарантия');
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
  `estimated_duration` int unsigned NOT NULL,
  `defect` varchar(240) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repairs_repair_type_id_3bada170_fk_repair_types_id` (`repair_type_id`),
  KEY `repairs_status_id_2be2d67d_fk_repair_statuses_id` (`status_id`),
  KEY `repairs_employee_id_e03bf9ba_fk_auth_user_id` (`employee_id`),
  CONSTRAINT `repairs_employee_id_e03bf9ba_fk_auth_user_id` FOREIGN KEY (`employee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `repairs_repair_type_id_3bada170_fk_repair_types_id` FOREIGN KEY (`repair_type_id`) REFERENCES `repair_types` (`id`),
  CONSTRAINT `repairs_status_id_2be2d67d_fk_repair_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `repair_statuses` (`id`),
  CONSTRAINT `repairs_chk_1` CHECK ((`estimated_duration` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,1,2,1,3,7,'Не охлаждает.'),(2,0,3,2,1,7,'Не моет.'),(3,0,4,4,3,7,'Не нагревается. Не нагревается. Не нагревается. Не нагревается. Не нагревается. Не нагревается.'),(4,0,2,1,2,7,'Не охлаждает.'),(12,1,3,2,3,7,'Полосы на экране.'),(13,0,4,4,6,7,'Не воспроизводит с дисков.'),(14,0,2,3,6,7,'Поцарапан экран.'),(15,1,4,4,6,7,'Не дует.'),(16,0,3,2,6,7,'Не нагревает правая нижняя область.'),(17,0,2,4,2,7,'Не крутится подставка.'),(18,0,4,2,1,5,'Не включается.'),(19,0,4,2,3,5,'Пропал зеленый цвет.'),(21,0,3,5,6,5,'Не включается.'),(22,0,6,5,6,5,'Не включается.'),(23,0,6,2,6,5,'Снова перестала мыть.'),(24,1,2,1,1,7,'Не печатает.');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (14,'Benq'),(6,'Bosch'),(13,'Canon'),(12,'Casio'),(15,'Dexp'),(5,'Electrolux'),(10,'Haier'),(2,'LG'),(1,'Panasonic'),(8,'Redmond'),(3,'Samsung'),(4,'Sony'),(11,'Tefal'),(9,'Vitek'),(7,'Xiaomi');
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

-- Dump completed on 2023-04-16 21:31:38
