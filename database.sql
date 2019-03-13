-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: api-db
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `api-db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `api-db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `api-db`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$v9kA6g5llz73$lYyRxMThHgPRAORdTb0pJxS5IcPyruxpSRNiLL41c/k=','2019-03-02 14:55:39.624691',1,'admin','','','admin@admin.com',1,1,'2019-03-02 14:54:39.166418'),(2,'pbkdf2_sha256$120000$uaFNUmdhDUcX$6eKC1V7huRblcTpqA0uxnjfL2HIAqR1fBlqu7dHTIz4=',NULL,1,'shashi','Shashi','Kumar','shashijangra@gmail.com',1,1,'2019-03-03 17:02:19.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-03-03 17:02:20.322429','2','shashi',1,'[{\"added\": {}}]',3,1),(2,'2019-03-03 17:02:48.782150','2','shashi',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_superuser\", \"user_permissions\"]}}]',3,1),(3,'2019-03-03 17:02:52.146161','2','shashi',2,'[]',3,1),(4,'2019-03-03 17:03:02.875634','2','shashi',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-02 10:26:08.278641'),(2,'auth','0001_initial','2019-03-02 10:26:08.665849'),(3,'admin','0001_initial','2019-03-02 10:26:08.868214'),(4,'admin','0002_logentry_remove_auto_add','2019-03-02 10:26:08.907859'),(5,'admin','0003_logentry_add_action_flag_choices','2019-03-02 10:26:08.946640'),(6,'contenttypes','0002_remove_content_type_name','2019-03-02 10:26:09.123566'),(7,'auth','0002_alter_permission_name_max_length','2019-03-02 10:26:09.144137'),(8,'auth','0003_alter_user_email_max_length','2019-03-02 10:26:09.175818'),(9,'auth','0004_alter_user_username_opts','2019-03-02 10:26:09.205948'),(10,'auth','0005_alter_user_last_login_null','2019-03-02 10:26:09.262225'),(11,'auth','0006_require_contenttypes_0002','2019-03-02 10:26:09.268921'),(12,'auth','0007_alter_validators_add_error_messages','2019-03-02 10:26:09.296972'),(13,'auth','0008_alter_user_username_max_length','2019-03-02 10:26:09.332033'),(14,'auth','0009_alter_user_last_name_max_length','2019-03-02 10:26:09.369486'),(15,'sessions','0001_initial','2019-03-02 10:26:09.419365');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bd8252fknfosszxep8lfg7qzz4pj5pdh','ODdhNjA0ZjNhYTE3ZDY4ZDJmMGU1MmVkYzJiZjQyN2M0ZDUzMzU0MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEwNjI1YTIwY2M1ZWZjMDY0OGEyODgwZmZmY2Y4NzJiYTBlMWUyYiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-03-16 14:55:39.648925');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `poc-db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `poc-db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `poc-db`;

--
-- Table structure for table `FIELD-NAMES`
--

DROP TABLE IF EXISTS `FIELD-NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIELD-NAMES` (
  `SYSTEM-NAME` varchar(50) NOT NULL,
  `DATA-NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SYSTEM-NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD-NAMES`
--

LOCK TABLES `FIELD-NAMES` WRITE;
/*!40000 ALTER TABLE `FIELD-NAMES` DISABLE KEYS */;
INSERT INTO `FIELD-NAMES` VALUES ('TRFSBCCAF','CARD CHARGES APPLICATION FREQUENCY'),('TRFSBCCAM','CARD CHARGE APPLICATION METHOD'),('TRFSBCFCF','CARD FEES CALCULATION FREQUENCY'),('TRFSBCFCM','CARD FEES CALCULATION METHOD'),('TRFSBCFCT','CARD FEES CALCULATION TABLE'),('TRFSBCOA','CUT OFF AMOUNT'),('TRFSBCTT','CARD TRANSACTION TYPE'),('TRFSBIVC','INITIAL BONUS CODE'),('TRFSBSBNO','SUB-SER NUMBER'),('TRFSBSERNO','SERVICE NUMBER'),('TRFSBSF','SERVICE FLAG'),('TRFSBST','SERVICE TYPE'),('TRFSBTCB','TRANSACTION CHARGE BAND'),('TRFSBTCW','TRANSACTION CHARGES WAIVER'),('TRFSBWCB','WITHDRAWL CHARGES BAND'),('TRFSRACTGP','ACTION GROUP'),('TRFSRAPA','AUTOMATIC PAYMENT ALLOWED'),('TRFSRATA','AUTOMATIC TRANSFER ALLOWED'),('TRFSRCCA','CREDIT CARD ALLOWED'),('TRFSRCT','CARD TYPE'),('TRFSRDCA','DEBIT CARD ALLOWED'),('TRFSRFTA','FUNDS TRANSFER ALLOWED'),('TRFSRNAME','SERVICE NAME'),('TRFSRNO','SERVICE NUMBER'),('TRFSRPSN','PRINT SERVICE NAME'),('TRFSRSAI','SERVICE APPLICABLE INDICATOR'),('TRFSRSECT','SECTOR'),('TRFSRSEG','SEGMENT'),('TRFSRTYPE','SERVICE TYPE'),('TRFSRVETGP','VETTING GROUP');
/*!40000 ALTER TABLE `FIELD-NAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE`
--

DROP TABLE IF EXISTS `SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE` (
  `TRFSRNO` int(11) NOT NULL,
  `TRFSRTYPE` int(11) DEFAULT NULL,
  `TRFSRNAME` varchar(45) DEFAULT NULL,
  `TRFSRVETGP` int(11) DEFAULT NULL,
  `TRFSRACTGP` int(11) DEFAULT NULL,
  `TRFSRSEG` int(11) DEFAULT NULL,
  `TRFSRSECT` int(11) DEFAULT NULL,
  `TRFSRPSN` int(11) DEFAULT NULL,
  `TRFSRSAI` int(11) DEFAULT NULL,
  `TRFSRFTA` int(11) DEFAULT NULL,
  `TRFSRCCA` int(11) DEFAULT NULL,
  `TRFSRCT` int(11) DEFAULT NULL,
  `TRFSRAPA` int(11) DEFAULT NULL,
  `TRFSRDCA` int(11) DEFAULT NULL,
  `TRFSRATA` int(11) DEFAULT NULL,
  PRIMARY KEY (`TRFSRNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE`
--

LOCK TABLES `SERVICE` WRITE;
/*!40000 ALTER TABLE `SERVICE` DISABLE KEYS */;
INSERT INTO `SERVICE` VALUES (1,1,'ABC',2,1,1,1,0,0,1,0,1,1,0,1),(2,1,'DEF',3,1,1,1,1,0,0,1,0,0,1,0),(3,3,'GHI',4,1,1,1,0,0,1,0,1,1,0,1),(4,4,'JKL',2,1,1,1,0,0,0,1,0,0,1,0),(5,5,'MNO',3,1,1,1,0,0,1,0,1,1,0,1),(6,7,'PQR',4,1,1,1,1,0,0,1,0,0,1,0),(7,2,'STU',2,1,1,1,1,0,1,0,1,1,0,1),(8,3,'VWX',3,1,1,1,0,0,0,1,0,0,1,0),(9,5,'YZA',4,1,1,1,0,0,1,0,1,1,0,1),(10,2,'BCD',2,1,1,1,0,0,0,1,0,0,1,0);
/*!40000 ALTER TABLE `SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUB-SER`
--

DROP TABLE IF EXISTS `SUB-SER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUB-SER` (
  `TRFSBSERNO` int(11) NOT NULL,
  `TRFSBSBNO` int(11) NOT NULL,
  `TRFSBST` int(11) DEFAULT NULL,
  `TRFSBSF` int(11) DEFAULT NULL,
  `TRFSBIVC` int(11) DEFAULT NULL,
  `TRFSBCFCF` varchar(1) DEFAULT NULL,
  `TRFSBCFCM` varchar(1) DEFAULT NULL,
  `TRFSBCFCT` int(11) DEFAULT NULL,
  `TRFSBWCB` int(11) DEFAULT NULL,
  `TRFSBTCB` int(11) DEFAULT NULL,
  `TRFSBCTT` int(11) DEFAULT NULL,
  `TRFSBCOA` double DEFAULT NULL,
  `TRFSBCCAF` varchar(1) DEFAULT NULL,
  `TRFSBCCAM` int(11) DEFAULT NULL,
  `TRFSBTCW` double DEFAULT NULL,
  PRIMARY KEY (`TRFSBSERNO`,`TRFSBSBNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUB-SER`
--

LOCK TABLES `SUB-SER` WRITE;
/*!40000 ALTER TABLE `SUB-SER` DISABLE KEYS */;
INSERT INTO `SUB-SER` VALUES (1,1,1,3,0,'M','W',38,1,1,1,1000,'M',3,999.99),(1,2,2,3,0,'D','W',453,2,1,1,1000,'M',1,0),(2,1,3,3,0,'M','W',1,1,1,1,1000,'H',2,999),(2,2,4,3,0,'D','W',3,2,1,1,1000,'M',3,999.09),(3,3,1,3,0,'M','W',432,1,1,1,1000,'M',3,999.99),(3,4,3,3,0,'D','W',546,1,1,1,1000,'M',3,999.99),(4,98,4,3,0,'D','W',456,1,1,1,1000,'M',3,999.99),(4,99,2,3,0,'D','W',323,2,1,1,1000,'H',3,999.99),(5,1,5,3,0,'Y','W',323,1,1,1,1000,'H',3,999.99),(5,2,3,3,0,'D','W',323,1,1,1,1000,'H',1,999.99),(6,1,1,3,0,'D','W',12,1,1,1,1000,'M',1,999.99),(6,2,2,3,0,'D','W',4,2,1,1,1000,'M',2,999.99);
/*!40000 ALTER TABLE `SUB-SER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 18:14:50
