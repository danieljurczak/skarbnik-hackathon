USE Skarbnik3;

-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Skarbnik3
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add class',7,'add_class'),(26,'Can change class',7,'change_class'),(27,'Can delete class',7,'delete_class'),(28,'Can view class',7,'view_class'),(29,'Can add payment',8,'add_payment'),(30,'Can change payment',8,'change_payment'),(31,'Can delete payment',8,'delete_payment'),(32,'Can view payment',8,'view_payment'),(33,'Can add payment detail',9,'add_paymentdetail'),(34,'Can change payment detail',9,'change_paymentdetail'),(35,'Can delete payment detail',9,'delete_paymentdetail'),(36,'Can view payment detail',9,'view_paymentdetail'),(37,'Can add student',10,'add_student'),(38,'Can change student',10,'change_student'),(39,'Can delete student',10,'delete_student'),(40,'Can view student',10,'view_student'),(41,'Can add user_login_activity',11,'add_userloginactivity'),(42,'Can change user_login_activity',11,'change_userloginactivity'),(43,'Can delete user_login_activity',11,'delete_userloginactivity');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `class_user_id_9e7332f9_fk_user_id_` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (8,'2b',29),(10,'3a',31),(11,'3b',32),(14,'1AA3',124),(15,'2TI3',30),(16,'3AX2',13),(17,'3BV2',19);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id_` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id_` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(7,'skarbnik','class'),(8,'skarbnik','payment'),(9,'skarbnik','paymentdetail'),(10,'skarbnik','student'),(6,'skarbnik','user'),(11,'skarbnik','userloginactivity');
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
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-25 05:53:11.034162'),(2,'contenttypes','0002_remove_content_type_name','2018-11-25 05:53:14.954160'),(3,'auth','0001_initial','2018-11-25 05:53:19.037027'),(4,'auth','0002_alter_permission_name_max_length','2018-11-25 05:53:19.545002'),(5,'auth','0003_alter_user_email_max_length','2018-11-25 05:53:21.608382'),(6,'auth','0004_alter_user_username_opts','2018-11-25 05:53:22.399047'),(7,'auth','0005_alter_user_last_login_null','2018-11-25 05:53:23.517489'),(8,'auth','0006_require_contenttypes_0002','2018-11-25 05:53:23.826362'),(9,'auth','0007_alter_validators_add_error_messages','2018-11-25 05:53:24.046739'),(10,'auth','0008_alter_user_username_max_length','2018-11-25 05:53:24.312701'),(11,'auth','0009_alter_user_last_name_max_length','2018-11-25 05:53:24.579369'),(12,'skarbnik','0001_initial','2018-11-25 05:53:31.917621'),(13,'admin','0001_initial','2018-11-25 05:53:33.246225'),(14,'admin','0002_logentry_remove_auto_add','2018-11-25 05:53:33.827987'),(15,'admin','0003_logentry_add_action_flag_choices','2018-11-25 05:53:34.116047'),(16,'sessions','0001_initial','2018-11-25 05:53:35.604577'),(17,'skarbnik','0002_auto_20181125_0332','2018-11-25 05:53:36.323645'),(18,'skarbnik','0003_auto_20181125_0334','2018-11-25 05:53:36.658792'),(19,'skarbnik','0004_auto_20181125_0337','2018-11-25 05:53:36.979409'),(20,'skarbnik','0005_auto_20181125_0347','2018-11-25 05:53:37.514972'),(21,'skarbnik','0006_auto_20181125_0348','2018-11-25 05:53:37.870174'),(22,'skarbnik','0007_auto_20181125_0349','2018-11-25 05:53:38.696426'),(23,'skarbnik','0008_auto_20181125_0358','2018-11-25 05:53:38.915885'),(24,'skarbnik','0009_auto_20181125_0359','2018-11-25 05:53:39.321946'),(25,'skarbnik','0010_auto_20181125_0400','2018-11-25 05:53:41.442031'),(26,'skarbnik','0011_auto_20181125_0604','2018-11-25 06:13:34.901736'),(27,'payu','0001_initial','2018-11-27 18:32:15.000000'),(28,'skarbnik','0002_auto_20181129_1702','2018-11-29 17:02:59.000000'),(29,'skarbnik','0002_remove_payment_image','2019-01-07 17:31:27.000000'),(30,'skarbnik','0003_payment_image','2019-01-07 17:31:28.000000'),(31,'skarbnik','0004_paymentdetail_created','2019-01-26 18:47:10.000000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('26k53ezsdby4iz6067bs9wn2md35wo5y','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-01-02 19:57:16.000000'),('2r8zp5spk6ihnnskamrdkranem3780o2','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-15 12:15:07.000000'),('2w5sftzg5elx9c2yfa0yppcydfhsbvwf','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-29 17:12:15.000000'),('39ghngkf8nykrz4baq5ecz38htbgxu6g','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-02-09 17:23:42.000000'),('3fy7mhbs6ulhq91z8a6r8m8m58xkaa5t','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-13 21:53:41.000000'),('93456odlxiw1t9ry5yjbl3sqta73lyp5','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-01-10 19:41:56.000000'),('9k55flpki75zn07q71h7w7ek6f717xvz','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-22 22:03:18.000000'),('cfsuecadjfonnf90vnlw4m0jz1qgiuif','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-01-03 11:59:55.000000'),('h0lca6cqdv2ngyzht239f24zgtalffa9','NjQ0MTVjNzFkMjFlMGRmNGYwYjBmMTZhMzE4MGQwNWVhODZkNGI1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWQzMzE5ODk1ZjM1MGEyZDk0ZWI1MGFlMGMyOTJiZGI2NjQ2NDJhIn0=','2019-01-02 19:44:59.000000'),('jn3nmm5g2ps60na2u2z8t5fvb5qcoz4u','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-27 19:14:46.000000'),('ke0o7d3lplle4u20wzzruz4lck94rhc5','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-27 19:27:40.000000'),('lsni05f70e3yn5qtfbt4qmagma4odbmj','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-24 21:10:49.000000'),('mcweghekhdxopq9jy7kv2mioq0dung9m','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-16 21:27:12.000000'),('ph6e01wii0lhqvh84foy3c8kajtlp05w','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-01-21 17:24:17.000000'),('uhof92yfw2tqleb0o20doaaxsllglcjk','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-01-20 19:00:50.000000'),('v7tjeh1oxeryn14vqm9gykoveowo63ex','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2019-01-02 17:57:16.000000'),('vk2bunv2bt38zj9bupbth0xyfu6ev1s2','YzQ5MTUwZTY0M2FlNDBjYTM3NzY4MWE4ZWU3MzI2YWNjNmZhNmU1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjk5ODI0YWI1ZmJjZjI5ZmY4ZTYxN2FlZGQwMDUxZjkwYWU0NDZiNCJ9','2018-12-13 22:11:53.000000'),('xqzpq4nvqlir9cay7626byzhb6hvcp0s','NjQ0MTVjNzFkMjFlMGRmNGYwYjBmMTZhMzE4MGQwNWVhODZkNGI1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWQzMzE5ODk1ZjM1MGEyZDk0ZWI1MGFlMGMyOTJiZGI2NjQ2NDJhIn0=','2019-01-17 11:44:11.000000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `class_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_`),
  KEY `payment_class_id_6d42dd19_fk_class_id_` (`class_id`),
  CONSTRAINT `payment_class_id_6d42dd19_fk_class_id_` FOREIGN KEY (`class_id`) REFERENCES `class` (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (12,'2018-11-29 17:19:29.000000','2018-09-02','2018-09-09',5.40,'Ksero','Składka na ksero ćwiczeń z języka polskiego',10,''),(13,'2018-11-29 17:19:29.000000','2018-12-25','2019-01-04',290.00,'Sample tittle','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et gravida ante. Etiam laoreet est vitae quam volutpat euismod. Nullam congue libero consequat, tempor arcu non, pulvinar elit.',11,''),(16,'2018-11-29 17:19:30.000000','2018-12-23','2019-01-31',982.00,'Sample tittle','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et gravida ante. Etiam laoreet est vitae quam volutpat euismod. Nullam congue libero consequat, tempor arcu non, pulvinar elit.',8,''),(18,'2018-11-29 17:19:31.000000','2018-09-17','2018-09-24',15.00,'Wyjście do kina','Uczniowe wezmę udział w lekcji kinowej w ramach, której zobaczą film Smoleńsk',10,''),(24,'2018-11-29 17:19:33.000000','2018-09-24','2018-09-28',25.30,'Ochrona','Coroczna składka na ochronę zapewniającą bezpieczeństwo w szkole',10,''),(27,'2018-11-29 17:19:34.000000','2018-12-21','2019-01-31',641.00,'Sample tittle','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et gravida ante. Etiam laoreet est vitae quam volutpat euismod. Nullam congue libero consequat, tempor arcu non, pulvinar elit.',11,''),(28,'2018-11-29 17:19:35.000000','2018-12-01','2019-01-29',230.00,'Sample tittle','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et gravida ante. Etiam laoreet est vitae quam volutpat euismod. Nullam congue libero consequat, tempor arcu non, pulvinar elit.',8,''),(38,'2018-12-24 08:32:07.000000','2019-01-01','2019-01-15',15.00,'Wyjście do kina','Uczniowe wezmę udział w wykładzie nt. kadrów filmowych na przykładzie filmu \"Nie otwieraj oczu\"',10,''),(39,'2018-12-24 08:41:04.000000','2019-01-01','2019-03-01',573.00,'Zielona szkoła','4 dniowa wycieczka w Góry Świętokrzyskie. Uczniowie będą m. in. wejdą na Łysicę i zobaczą Jaskinię Raj.',10,''),(40,'2018-12-24 08:45:43.000000','2019-01-01','2019-01-14',22.00,'Teatr','Spektakl pt. \"Szalone nożyczki\"',10,''),(47,'2018-12-26 15:28:53.000000','2018-12-29','2018-12-24',15.00,'Wycieczka na basen','Wycieczka na basenWycieczka na basen',14,''),(48,'2018-12-26 15:31:20.000000','2018-12-31','2018-12-25',560.92,'Maroko','Wyjazd autokarem do Maroko',14,''),(49,'2018-12-26 15:32:46.000000','2018-12-31','2018-12-27',12.33,'Cos innego','Cos innegoCos innegoCos innegoCos innego',14,''),(51,'2019-01-07 17:33:25.000000','2019-01-02','2019-01-27',100.00,'Zbiorka na mikołaja','Świąteczna zbiórka na dom dziecka w Pszczynie.',11,'images/zbiorka.jpg'),(52,'2019-01-14 11:02:10.000000','2019-02-28','2019-01-30',192.53,'Coś innego zupełnie','Coś innego zupełnieCoś innego zupełnieCoś innego zupełnieCoś innego zupełnieCoś innego zupełnie',14,'');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_detail`
--

DROP TABLE IF EXISTS `payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_detail` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` decimal(6,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id_`),
  KEY `payment_detail_payment_id_a604359c_fk_payment_id_` (`payment_id`),
  KEY `payment_detail_student_id_62e589eb` (`student_id`),
  CONSTRAINT `payment_detail_payment_id_a604359c_fk_payment_id_` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_detail`
--

LOCK TABLES `payment_detail` WRITE;
/*!40000 ALTER TABLE `payment_detail` DISABLE KEYS */;
INSERT INTO `payment_detail` VALUES (26,259.00,12,20,'2019-01-26 18:46:56'),(30,235.00,13,57,'2019-01-26 18:46:56'),(32,157.00,12,66,'2019-01-26 18:46:56'),(33,159.00,18,22,'2019-01-26 18:46:56'),(46,663.00,16,85,'2019-01-26 18:46:56'),(47,163.00,12,22,'2019-01-26 18:46:56'),(49,207.00,12,37,'2019-01-26 18:46:56'),(51,14.00,24,37,'2019-01-26 18:46:56'),(52,5.00,12,22,'2019-01-26 18:46:56'),(56,75.00,18,78,'2019-01-26 18:46:56'),(61,60.00,12,27,'2019-01-26 18:46:56'),(62,77.00,28,50,'2019-01-26 18:46:56'),(64,100.00,18,37,'2019-01-26 18:46:56'),(76,368.00,12,44,'2019-01-26 18:46:56'),(81,197.00,16,38,'2019-01-26 18:46:56'),(82,268.00,13,58,'2019-01-26 18:46:56'),(101,289.00,27,31,'2019-01-26 18:46:56'),(103,185.00,28,56,'2019-01-26 18:46:56'),(109,224.00,27,57,'2019-01-26 18:46:56'),(117,97.00,24,44,'2019-01-26 18:46:56'),(125,178.00,16,38,'2019-01-26 18:46:56'),(127,44.00,18,27,'2019-01-26 18:46:56'),(128,5.40,12,121,'2019-01-26 18:46:56'),(129,15.00,18,121,'2019-01-26 18:46:56'),(130,15.30,24,121,'2019-01-26 18:46:56'),(131,10.00,24,121,'2019-01-26 18:46:56'),(132,100.00,39,121,'2019-01-26 18:46:56'),(133,2.00,12,20,'2019-01-26 19:00:37'),(134,5.00,12,20,'2019-01-26 19:00:42'),(135,4.00,12,20,'2019-01-26 19:00:48'),(136,3.00,12,20,'2019-01-26 19:02:55');
/*!40000 ALTER TABLE `payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payu_cancelrefundcapturerequests`
--

DROP TABLE IF EXISTS `payu_cancelrefundcapturerequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payu_cancelrefundcapturerequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(100) COLLATE utf8_bin NOT NULL,
  `request_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` varchar(15) COLLATE utf8_bin NOT NULL,
  `message` varchar(100) COLLATE utf8_bin NOT NULL,
  `mihpayid` varchar(100) COLLATE utf8_bin NOT NULL,
  `bank_ref_num` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `error_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payu_cancelrefundcap_transaction_id_98e9a552_fk_payu_tran` (`transaction_id`),
  CONSTRAINT `payu_cancelrefundcap_transaction_id_98e9a552_fk_payu_tran` FOREIGN KEY (`transaction_id`) REFERENCES `payu_transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payu_cancelrefundcapturerequests`
--

LOCK TABLES `payu_cancelrefundcapturerequests` WRITE;
/*!40000 ALTER TABLE `payu_cancelrefundcapturerequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `payu_cancelrefundcapturerequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payu_transaction`
--

DROP TABLE IF EXISTS `payu_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payu_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) COLLATE utf8_bin NOT NULL,
  `payment_gateway_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `transaction_date_time` datetime DEFAULT NULL,
  `mode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `mihpayid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `bankcode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `bank_ref_num` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `discount` decimal(19,6) NOT NULL,
  `additional_charges` decimal(19,6) NOT NULL,
  `txn_status_on_payu` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `hash_status` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payu_transaction`
--

LOCK TABLES `payu_transaction` WRITE;
/*!40000 ALTER TABLE `payu_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payu_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skarbnik_userloginactivity`
--

DROP TABLE IF EXISTS `skarbnik_userloginactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skarbnik_userloginactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_IP` char(39) COLLATE utf8_bin DEFAULT NULL,
  `login_datetime` datetime NOT NULL,
  `login_username` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `user_agent_info` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skarbnik_userloginactivity`
--

LOCK TABLES `skarbnik_userloginactivity` WRITE;
/*!40000 ALTER TABLE `skarbnik_userloginactivity` DISABLE KEYS */;
INSERT INTO `skarbnik_userloginactivity` VALUES (1,'127.0.0.1','2018-11-28 21:20:49','elwirak','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(2,'79.184.220.157','2018-11-28 22:20:48','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(3,'83.28.103.244','2018-11-29 20:10:56','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(4,'83.28.103.244','2018-11-29 20:12:03','danielj','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(5,'83.28.103.244','2018-11-29 20:25:26','asdasd','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(6,'83.28.103.244','2018-11-29 20:28:31','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(7,'83.28.103.244','2018-11-29 20:29:27','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(8,'83.28.103.244','2018-11-29 20:33:39','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(9,'83.28.103.244','2018-11-29 20:35:25','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(10,'188.146.172.22','2018-11-29 21:27:11','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(11,'83.28.103.244','2018-11-29 21:29:52','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(12,'83.28.103.244','2018-11-29 21:30:14','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(13,'83.28.103.244','2018-11-29 21:30:26','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(14,'83.28.103.244','2018-11-29 21:31:02','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(15,'188.146.172.22','2018-11-29 21:34:11','string','F','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(16,'83.28.103.244','2018-11-29 21:48:23','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(17,'127.0.0.1','2018-11-29 21:48:30','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(18,'83.28.103.244','2018-11-29 21:49:01','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(19,'127.0.0.1','2018-11-29 21:53:41','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(20,'127.0.0.1','2018-11-29 22:05:41','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(21,'127.0.0.1','2018-11-29 22:09:45','admin','F','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(22,'127.0.0.1','2018-11-29 22:09:55','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(23,'127.0.0.1','2018-11-29 22:11:53','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(24,'5.173.152.126','2018-11-30 08:27:54','admin','S','(\'Mozilla/5.0 (iPad; CPU OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1\',)'),(25,'5.173.152.126','2018-11-30 08:27:55','admin','S','(\'Mozilla/5.0 (iPad; CPU OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1\',)'),(26,'5.173.152.126','2018-11-30 08:27:56','admin','S','(\'Mozilla/5.0 (iPad; CPU OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1\',)'),(27,'5.173.152.126','2018-11-30 08:27:57','admin','S','(\'Mozilla/5.0 (iPad; CPU OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1\',)'),(28,'5.173.152.126','2018-11-30 08:27:58','admin','S','(\'Mozilla/5.0 (iPad; CPU OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1\',)'),(29,'5.173.152.126','2018-11-30 08:27:59','admin','S','(\'Mozilla/5.0 (iPad; CPU OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1\',)'),(30,'83.28.127.84','2018-12-01 12:11:06','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(31,'83.28.127.84','2018-12-01 12:15:07','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(32,'83.28.126.17','2018-12-02 20:41:43','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(33,'188.146.49.228','2018-12-02 21:27:12','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(34,'83.28.125.188','2018-12-04 13:06:03','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(35,'83.28.241.20','2018-12-04 21:02:37','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(36,'83.28.108.138','2018-12-05 21:38:03','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(37,'192.168.122.1','2018-12-08 21:44:14','admin','F','(\'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0\',)'),(38,'192.168.122.1','2018-12-08 22:03:18','admin','S','(\'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0\',)'),(39,'192.168.122.1','2018-12-10 21:10:41','admin','S','(\'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0\',)'),(40,'192.168.122.1','2018-12-10 21:10:49','admin','S','(\'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0\',)'),(41,'83.28.219.110','2018-12-13 13:52:27','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(42,'127.0.0.1','2018-12-13 19:14:45','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(43,'192.168.122.1','2018-12-13 19:27:40','admin','S','(\'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0\',)'),(44,'83.28.106.197','2018-12-15 16:21:49','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(45,'83.28.106.197','2018-12-15 17:11:12','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(46,'83.28.106.197','2018-12-15 17:11:33','james80','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(47,'83.28.106.197','2018-12-15 17:12:15','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(48,'83.28.106.197','2018-12-15 17:13:19','elwirak','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(49,'83.28.106.197','2018-12-15 17:13:25','elwirak','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(50,'83.28.106.197','2018-12-15 17:13:46','iwilliams','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(51,'188.147.96.47','2018-12-15 17:20:59','marta9348','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(52,'83.28.128.202','2018-12-16 09:29:48','onealtony','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(53,'83.28.128.202','2018-12-16 09:29:54','onealtony','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(54,'83.28.128.202','2018-12-16 09:31:20','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(55,'83.28.128.202','2018-12-16 09:40:48','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(56,'83.28.128.202','2018-12-16 13:20:55','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(57,'83.28.128.202','2018-12-16 13:30:14','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(58,'83.28.128.202','2018-12-16 13:33:04','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(59,'79.184.55.152','2018-12-19 16:11:48','annak','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(60,'79.184.55.152','2018-12-19 16:21:24','danielj','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(61,'79.184.55.152','2018-12-19 16:21:43','annak','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(62,'79.184.55.152','2018-12-19 17:31:27','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(63,'127.0.0.1','2018-12-19 17:57:16','admin','S','(\'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)'),(64,'79.184.55.152','2018-12-19 19:44:59','danielj','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(65,'188.146.226.130','2018-12-19 19:57:15','admin','S','(\'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)'),(66,'79.184.133.218','2018-12-19 23:07:24','annak','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(67,'79.184.133.218','2018-12-19 23:07:40','annak','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(68,'79.184.133.218','2018-12-19 23:07:58','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(69,'79.184.133.218','2018-12-19 23:38:42','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(70,'83.28.118.74','2018-12-20 11:00:22','gbrock','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(71,'83.28.118.74','2018-12-20 11:00:33','gbrock','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(72,'83.28.118.74','2018-12-20 11:01:08','onealtony','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(73,'83.28.118.74','2018-12-20 11:41:29','kbeck','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(74,'83.28.118.74','2018-12-20 11:41:35','kbeck','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(75,'83.28.118.74','2018-12-20 11:41:50','david71','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(76,'83.28.118.74','2018-12-20 11:42:57','afisher','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(77,'83.28.118.74','2018-12-20 11:43:19','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(78,'188.146.226.130','2018-12-20 11:59:55','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(79,'83.28.118.74','2018-12-20 17:05:22','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(80,'83.28.118.74','2018-12-20 17:56:23','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(81,'79.184.210.254','2018-12-20 19:18:43','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(82,'79.184.210.254','2018-12-20 19:28:02','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(83,'79.184.210.254','2018-12-20 19:37:53','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(84,'79.184.210.254','2018-12-20 19:41:38','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(85,'79.184.210.254','2018-12-20 19:42:25','danielj','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(86,'79.184.210.254','2018-12-20 19:42:56','danielj','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(87,'79.184.210.254','2018-12-20 19:43:38','danielj','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(88,'79.184.210.254','2018-12-20 19:48:57','danielj','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(89,'79.184.210.254','2018-12-20 19:49:46','21423523','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(90,'79.184.210.254','2018-12-20 19:56:42','122313231','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(91,'79.184.210.254','2018-12-20 19:59:01','324234234','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(92,'79.184.210.254','2018-12-20 20:11:56','12312312','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(93,'79.184.210.254','2018-12-20 20:12:03','12312312','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(94,'79.184.210.254','2018-12-20 20:12:08','12312312','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(95,'79.184.210.254','2018-12-20 20:15:21','2432423','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(96,'79.184.210.254','2018-12-20 20:16:39','324234','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(97,'79.184.210.254','2018-12-20 20:17:31','324234','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(98,'79.184.210.254','2018-12-20 20:23:22','danielj','S','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(99,'79.184.210.254','2018-12-20 20:24:36','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(100,'79.184.210.254','2018-12-20 20:28:21','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(101,'79.184.210.254','2018-12-20 20:32:23','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(102,'79.184.210.254','2018-12-20 20:39:26','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(103,'79.184.210.254','2018-12-20 22:03:27','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(104,'83.28.132.244','2018-12-21 18:21:49','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(105,'83.28.132.244','2018-12-21 18:31:37','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(106,'83.28.132.244','2018-12-21 18:40:17','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(107,'79.184.29.216','2018-12-22 07:21:28','brandi06','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(108,'79.184.29.216','2018-12-22 07:22:00','brandi06','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(109,'79.184.29.216','2018-12-22 07:22:18','danielj','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(110,'79.184.29.216','2018-12-22 07:23:28','brandi06','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(111,'79.184.29.216','2018-12-22 07:24:26','danielj','S','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(112,'79.184.29.216','2018-12-22 07:24:57','josephandrade','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(113,'79.184.29.216','2018-12-22 07:26:00','amadeuszk','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(114,'79.184.29.216','2018-12-22 07:26:42','amadeuszk','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(115,'79.184.29.216','2018-12-22 07:26:55','amadeuszk','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(116,'178.42.116.83','2018-12-22 08:29:39','brandi06','F','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(117,'178.42.116.83','2018-12-22 12:49:01','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(118,'79.184.73.112','2018-12-23 10:21:52','amadeuszk','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(119,'79.184.73.112','2018-12-23 10:22:08','amadeuszk','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(120,'79.184.73.112','2018-12-23 10:23:32','testowytowarek','S','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(121,'79.184.73.112','2018-12-23 10:24:49','kacperj','F','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(122,'79.184.73.112','2018-12-23 10:27:04','annak','S','(\'Rested/2009 CFNetwork/975.0.3 Darwin/18.2.0 (x86_64)\',)'),(123,'79.184.148.241','2018-12-23 13:16:32','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(124,'178.42.7.43','2018-12-23 14:35:49','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(125,'79.184.148.241','2018-12-23 18:30:59','testowytowarek','S','(\'Rested/2009 CFNetwork/976 Darwin/18.2.0 (x86_64)\',)'),(126,'79.184.148.241','2018-12-23 18:31:55','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(127,'79.184.148.241','2018-12-23 18:36:07','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(128,'79.184.148.241','2018-12-23 19:03:43','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(129,'79.184.148.241','2018-12-23 19:07:47','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(130,'79.184.148.241','2018-12-23 19:17:24','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(131,'79.184.148.241','2018-12-23 19:22:22','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(132,'79.184.148.241','2018-12-23 19:25:52','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(133,'79.184.148.241','2018-12-23 19:31:55','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(134,'79.184.148.241','2018-12-23 19:35:47','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(135,'79.184.148.241','2018-12-23 19:37:59','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(136,'79.184.148.241','2018-12-23 19:40:47','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(137,'79.184.148.241','2018-12-23 19:44:08','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(138,'79.184.148.241','2018-12-23 19:46:31','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(139,'79.184.148.241','2018-12-23 19:47:41','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(140,'5.173.128.30','2018-12-23 20:01:04','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(141,'5.173.128.30','2018-12-23 23:57:53','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(142,'83.28.232.17','2018-12-24 11:46:11','admin','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(143,'83.28.232.17','2018-12-24 11:46:48','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(144,'79.184.190.246','2018-12-24 12:16:23','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(145,'79.184.190.246','2018-12-24 23:31:51','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(146,'5.173.168.167','2018-12-25 19:44:24','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(147,'5.173.168.167','2018-12-25 22:45:11','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(148,'5.173.168.167','2018-12-25 22:54:41','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(149,'79.184.18.79','2018-12-26 07:31:20','testowy towarek','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(150,'79.184.18.79','2018-12-26 07:31:33','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(151,'79.184.18.79','2018-12-26 07:31:59','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(152,'5.173.168.167','2018-12-26 07:44:39','kuba@towarek.pl','F','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(153,'83.28.108.242','2018-12-26 10:19:25','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(154,'178.42.114.188','2018-12-27 10:57:30','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(155,'127.0.0.1','2018-12-27 19:41:56','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15\',)'),(156,'178.42.110.205','2018-12-28 13:29:23','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(157,'79.184.54.148','2019-01-03 11:35:37','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(158,'79.184.54.148','2019-01-03 11:43:59','string','F','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)'),(159,'79.184.54.148','2019-01-03 11:44:11','danielj','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)'),(160,'192.168.99.1','2019-01-06 19:00:50','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)'),(161,'79.184.182.203','2019-01-06 20:22:55','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(162,'79.184.182.203','2019-01-06 20:38:03','testowytowarek','F','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(163,'79.184.182.203','2019-01-06 20:38:17','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(164,'79.184.182.203','2019-01-06 20:45:52','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(165,'127.0.0.1','2019-01-07 17:24:17','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)'),(166,'79.184.6.143','2019-01-07 22:31:53','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(167,'79.184.211.182','2019-01-09 13:22:58','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(168,'79.184.211.182','2019-01-09 14:16:24','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(169,'178.42.91.156','2019-01-11 10:48:14','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(170,'83.6.0.100','2019-01-14 10:40:00','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(171,'79.184.191.187','2019-01-14 10:46:31','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(172,'79.184.191.187','2019-01-14 11:34:21','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(173,'79.184.191.187','2019-01-14 11:44:58','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(174,'79.184.13.215','2019-01-14 13:10:44','testowytowarek','S','(\'skarbnik/1 CFNetwork/976 Darwin/18.2.0\',)'),(175,'79.184.123.116','2019-01-15 21:19:29','testowytowarek','S','(\'skarbnik/1 CFNetwork/975.0.3 Darwin/18.2.0\',)'),(176,'83.28.127.135','2019-01-26 08:31:52','nowynowy','S','(\'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\',)'),(177,'127.0.0.1','2019-01-26 17:23:42','admin','S','(\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36\',)');
/*!40000 ALTER TABLE `skarbnik_userloginactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_`),
  KEY `student_class_id_84bfbaa2_fk_class_id_` (`class_id`),
  KEY `student_user_id_dcc2526f_fk_user_id_` (`user_id`),
  CONSTRAINT `student_class_id_84bfbaa2_fk_class_id_` FOREIGN KEY (`class_id`) REFERENCES `class` (`id_`),
  CONSTRAINT `student_user_id_dcc2526f_fk_user_id_` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (11,'Stefan Maj',11,80),(20,'Willie Stith',10,115),(21,'Patricia Rainey',8,109),(22,'Robert Adams',10,100),(27,'Bernard Foreman',10,107),(31,'Sharon Kho',11,119),(37,'Dwight Lindstedt',10,94),(38,'Richard Vanhoose',8,95),(43,'Joyce Alexander',8,97),(44,'Emily Bryan',10,104),(50,'Theresa Lambertson',8,120),(53,'David Denniston',8,101),(55,'Dorothy Abdullah',11,88),(56,'Teresa Wilson',8,98),(57,'Margaret Browning',11,98),(58,'Georgianne Battista',11,116),(66,'Danny Lee',10,89),(68,'Monica Leavitt',10,116),(71,'Samuel Lennard',10,102),(74,'Randall Bay',11,105),(78,'Anthony Honga',11,78),(81,'Donald Perez',10,107),(84,'Cheryl Meadows',10,80),(85,'Susan Falcon',8,106),(88,'Julius Stidham',11,88),(93,'Jami Bliss',11,82),(95,'Micheal Gates',10,98),(98,'Randy Healy',8,89),(99,'Ross Barris',8,82),(100,'Phyllis Wood',10,78),(109,'Robert Young',8,99),(113,'Charles Cook',8,121),(115,'Aaron Fiel',14,2),(116,'Far Denzos',14,2),(117,'Selin Dijom',11,2),(118,'Ayme Whinehous',14,8),(119,'Gregor Ealo',10,11),(120,'Radek Testowy',8,131),(121,'Zosia Testowa',10,131);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id_` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(120) COLLATE utf8_bin NOT NULL,
  `password` varchar(200) COLLATE utf8_bin NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2019-01-03 11:44:10.000000',0,'','',0,1,'2018-11-25 05:55:32.000000',1,'Daniel Jagiełło','danielj','daniel@gmail.com','pbkdf2_sha256$100000$7k1WGVZrB90s$5BhMfqdP4vAp8q9KwdmE0JJQ+vzapZIdRW1meOcPsoI=',0),('2018-12-23 10:27:04.000000',0,'','',0,1,'2018-11-25 05:56:16.000000',2,'Anna Krok','annak','anna@k.com','pbkdf2_sha256$100000$3oLLpf2OLRJZ$Or2u3Uz+uGyYCnoziZAwmJM5Nuo5R2ZVdSFuAJXT1fg=',0),(NULL,0,'','',0,1,'2018-11-25 08:29:39.000000',6,'Kacper Jaszczyk','kacperj','kacper@kol.com','kacperj',0),(NULL,0,'','',0,1,'2018-11-25 08:30:47.000000',8,'Axmadeusz Konan','amadeuszk','adamedusz@git.com','pbkdf2_sha256$120000$KUqHp8faf4Zv$bap0CEqMDogesFzXEU0vCgx7C3u6uXJxV6rzIC1T1Ts=',0),('2018-11-28 21:20:49.000000',0,'','',0,1,'2018-11-25 08:31:26.000000',9,'Elwira Kozłowska','elwirak','elwira@onet.pl','pbkdf2_sha256$100000$JJe1D2yzC6EP$Ps1VBJveZQfCmniVVUGWKjDTDwXJu5m1/yvxvM39pAA=',1),(NULL,0,'','',0,1,'2018-11-25 08:37:52.305740',10,'Monika Porta','monikap','monika@pol.pl','pbkdf2_sha256$120000$LyaU9jx6O6Vw$gs6mpUHbLHBe+jrts5pwxgK6NzcWC6i5Bqm32AUWhRU=',0),(NULL,0,'','',0,1,'2018-11-25 09:02:09.611698',11,'Paweł Beldzior','pawelb','blendzior@insomnia.pl','pbkdf2_sha256$120000$zFZs3IxMo66G$7CzH2cDZMAqCCQYml6azZqrBhhwieyAkcjD3nXVy2Q0=',0),(NULL,0,'','',0,1,'2018-11-25 11:52:34.000000',13,'Dariusz Maciejszak','dtdtr','darmat@gmail.com','pbkdf2_sha256$120000$gZR6lygWcsDU$2XC/On2nbkQcTOAmZAGMt75BSS6ziHvkmbd5DLd+NTc=',1),('2019-01-26 17:23:42.000000',0,'','',0,1,'2018-11-27 21:34:25.000000',14,'Paweł Wach','admin','pawel@admin.com','pbkdf2_sha256$100000$bjHfq8XhjBlF$YVIToJFw2kTD7/dRXSy8ccRO8YocGiLklAsiLM/BplQ=',2),(NULL,0,'','',0,1,'2018-11-28 20:12:53.000000',19,'Mikołaj Janek','mikojan','mikojan@gmail.com','pbkdf2_sha256$100000$Wmk6jnr8Kx0V$9FUJdn5Ys9Tf1HBqwrnPgGuY77Q8zFWHfDBetQG/6hw=',1),(NULL,0,'','',0,1,'2018-11-29 16:21:56.000000',25,'Jaclyn James','onealtony','gomezryan@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:23.000000',26,'Jeffrey Phillips','kbeck','ebenitez@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:24.000000',27,'Carolyn Stewart','michaelshaw','zcampbell@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:24.000000',28,'Dillon Sanders','david71','juliefarmer@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:24.000000',29,'Stephen George','mauricesnow','kevingarcia@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:24.000000',30,'Sarah White','frank17','holly00@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:24.000000',31,'Charles Martinez','gbrock','beth09@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:24.000000',32,'Susan Lopez','michaelmcfarland','glovermatthew@holder.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:25.000000',33,'Latoya King','diana98','bruce88@washington.org','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:25.000000',34,'Richard Moss','phillip81','johnsonkristy@duncan.info','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:25.000000',35,'Jimmy Brown','raymond20','jason98@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:25.000000',36,'Karen Ayala','iwilliams','samanthagreer@thomas-khan.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:25.000000',37,'Johnathan Bishop','kimberlyjohnson','mitchellvirginia@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:25.000000',38,'Omar Martinez','nclark','lisahansen@conrad-anderson.info','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:26.000000',39,'Mr. Adam Nichols Jr.','susan59','ieaton@long.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:26.000000',40,'Kristen Page','jmclean','powellmichael@fox.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:26.000000',41,'Suzanne White','kevin78','orodriguez@powell-lopez.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:26.000000',42,'Nicholas Bean','jean65','andersonjennifer@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:26.000000',43,'Eric Adams','zachary51','hgiles@smith-gilbert.info','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:26.000000',44,'David Mccarthy','amandabailey','rodriguezrhonda@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:27.000000',45,'Jordan Hansen','wisekayla','melaniesanders@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:27.000000',46,'Wayne Moore','emily29','lindsayrios@steele.biz','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:27.000000',47,'Brandon Harris','james80','adamdavies@manning-johnson.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:27.000000',48,'Marcia Rodriguez','emilymcdonald','royjoyce@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:27.000000',49,'Shawn Perez','elizabeth22','sloankevin@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:28.000000',51,'Carol Diaz','david83','ingramrobert@myers-schwartz.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:28.000000',52,'Tiffany Ramos','marycraig','savagekristin@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:28.000000',53,'Robert Myers','twilson','tevans@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:28.000000',54,'Michelle Martin','alimary','richardterry@williams.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:28.000000',55,'Eric Pearson','robert54','garciatonya@brown-vasquez.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:29.000000',56,'Robert Hendricks','anthonywilkins','hchan@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:29.000000',57,'Kelli Smith','briannafry','aaron83@williams.info','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:29.000000',58,'Robert Barnes','hcombs','fjordan@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:29.000000',59,'Heather Jackson DDS','yvaughn','sjohnson@mann.net','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:29.000000',60,'Jason Rose','angelamartinez','darinalexander@knapp-wolfe.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:29.000000',61,'Lori Morrison','danderson','dorothy45@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:30.000000',62,'Frederick Johnson','fschwartz','udawson@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:30.000000',64,'Felicia Pruitt','nicolasgonzales','alicia29@cabrera.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:30.000000',65,'Christina Brown','wrightcourtney','fzavala@kelley.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:30.000000',66,'Jacqueline Bennett','xhall','sophiamoore@hotmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:30.000000',67,'Holly Bryant','cody13','mcampbell@arnold.org','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:30.000000',68,'Hayden Long','jwilliams','dawnlynch@smith.info','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:31.000000',69,'Juan Kelly','patrickenglish','csutton@williams-buchanan.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:31.000000',70,'Barbara Hood','gonzalezgloria','patriciawilson@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:31.000000',71,'Brooke Mendoza','afisher','gbell@garcia.net','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:31.000000',72,'Ellen Shields','huntjonathan','michellejenkins@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:31.000000',74,'Craig Oconnor','johnsonjason','tracey43@yahoo.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:23:32.000000',75,'Jordan Richmond','egreen','jamesrodriguez@gmail.com','zaq1@WSX',1),(NULL,0,'','',0,1,'2018-11-29 16:24:47.000000',76,'Charles Savage','fieldscynthia','anthonyhart@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:48.000000',77,'Stephanie Moore','josephknight','chasebooth@hogan.org','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:48.000000',78,'Manuel Martinez','cvance','cookryan@white.net','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:48.000000',79,'Kimberly Anderson','allison79','williamssteven@hotmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:48.000000',80,'Tom Rodriguez MD','brandi06','briannarocha@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:49.000000',82,'Kelly Mccall','josephandrade','xlawson@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:49.000000',83,'David Pace','jenniferpennington','jamesreyes@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:49.000000',84,'Matthew Miller','lpatrick','laura37@villanueva.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:49.000000',85,'Larry Wallace','cgarcia','jwallace@jimenez.info','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:49.000000',86,'Karen Barton','whanna','onavarro@martin.info','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:50.000000',88,'Brian King','williamsemily','brendastephenson@cole-calderon.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:50.000000',89,'Rebecca Harvey','turnerapril','reeseashley@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:50.000000',90,'Dale Mclaughlin','dfaulkner','hgordon@johnson-benson.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:50.000000',91,'Rebecca Lawrence','tonyapugh','sethbriggs@cummings-preston.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:50.000000',92,'Morgan Brown','bonnie88','jillianalexander@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:51.000000',93,'Stephen Gonzalez','sandragarcia','hudsonlisa@hotmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:51.000000',94,'Samuel Short','maldonadosharon','gdougherty@curry-kramer.net','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:51.000000',95,'Jennifer Love','swilson','johnsonlinda@hernandez.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:51.000000',96,'Catherine Simmons','mitchell78','nicole31@espinoza.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:51.000000',97,'Jaime Johnston','vvillarreal','fischerricky@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:51.000000',98,'Michael Henry','jriley','pmontgomery@hotmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',99,'Meghan Myers','onealglenn','brandon85@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',100,'Kimberly Cuevas','fredrivers','lauren18@wilson.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',101,'Nina Piter-parker','robert05','allenstephanie@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',102,'Chad Tucker','timchen','fhayes@farley.net','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',103,'Mary Dunn','yesenia81','singhmichael@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',104,'Melvin Horne','richardtorres','lbates@rubio.info','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:52.000000',105,'Michael Gutierrez','cortezcurtis','zparrish@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:53.000000',106,'Susan Reed','jennifer73','lisa60@rhodes.org','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:53.000000',107,'Anthony Leonard','morrisonjeffrey','emilywhite@gomez-bates.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:53.000000',108,'Carol Cortez','markscott','coopersarah@evans.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:53.000000',109,'Misty Ward','briana66','jessicadavidson@williams.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:53.000000',110,'Charles Johnson','yolandacastillo','johnsonamy@scott.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',111,'David Crawford','natalie30','scottharris@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',112,'Brianna Sims','mlarson','stricklandjill@jefferson.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',113,'Mark Garrett','thomas01','harold21@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',114,'Amanda Mayer','smithsherry','pconway@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',115,'Clinton Bonilla','danielle40','bradfordandrew@wilson.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',116,'Todd Bates','brian80','smithronald@cruz.net','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:54.000000',117,'Brian Moody','alyssamedina','monica12@callahan-edwards.info','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:55.000000',118,'Megan Caldwell','manderson','ryan51@hotmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:55.000000',119,'Jerry Medina','miguel88','usmith@yahoo.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:55.000000',120,'Monica Martin','george51','gonzalezrebekah@gmail.com','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:55.000000',121,'Cathy Smith','josemerritt','robertsonmorgan@gonzalez.org','zaq1@WSX',0),(NULL,0,'','',0,1,'2018-11-29 16:24:55.000000',122,'Amy Lopez DDS','gjohnson','vcrawford@tucker.biz','zaq1@WSX',0),('2019-01-26 08:31:51.000000',0,'','',0,1,'2018-11-29 20:45:40.000000',124,'Dariusz Nowak','nowynowy','now@now.pl','pbkdf2_sha256$100000$XTU9jMEOYbSy$zOPHEEcvinxS8ZzcLKbM7NVxpmMAcYLRGMfABa0Yasw=',1),(NULL,0,'','',0,1,'2018-11-29 21:12:12.000000',126,'Ignacy Krasicki','zdrignacy','ignazdr@gmail.com','pbkdf2_sha256$100000$XtlpRliHONvG$JtQPsSrKEtc/wVySNdfioYsfLhvHBxrzOq1eaS85KR0=',0),(NULL,0,'','',0,1,'2018-11-29 21:16:44.000000',128,'Guber Ahina','guberinho','guber@gmail.com','pbkdf2_sha256$100000$TzYpViikjuKe$i+lPM+b28teMvHL//IjE9WEFpZ8bZ7KvkL/VReJa9XA=',1),(NULL,0,'','',0,1,'2018-12-13 19:24:57.000000',129,'Zaro Daro','zaro123','zaro@op.pl','pbkdf2_sha256$100000$r0yWQYdoianP$6FnB7voA4Bhx9RFrdHWD9szWKQAZiI+EXkq/ZgT28Bo=',1),('2018-12-15 17:20:58.000000',0,'','',0,1,'2018-12-15 17:19:58.000000',130,'Marta Staniec','marta9348','mart9348@gmail.com','pbkdf2_sha256$100000$rrQh5cKHWLMX$0RDDFZpAA1eYK8Qu9ijKKnUl+eg7oMtoeRs8vl/vj10=',1),('2019-01-15 21:19:29.000000',0,'','',0,1,'2018-12-21 00:41:26.000000',131,'Janek Towarek','testowytowarek','test@test.org','pbkdf2_sha256$100000$icxHwEJYwpIJ$fmNe8AKFreN8dOhfE+B9o6p7/xu/cFHpsRWuQC5v/1k=',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id_` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id_` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-27 12:37:30
