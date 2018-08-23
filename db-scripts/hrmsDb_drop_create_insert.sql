DROP SCHEMA IF EXISTS `hrms` ;
CREATE DATABASE  IF NOT EXISTS `hrms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hrms`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 192.168.1.15    Database: hrms
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `line1` varchar(300) DEFAULT NULL,
  `line2` varchar(300) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state_idx` (`state`),
  CONSTRAINT `state` FOREIGN KEY (`state`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (6,'ppp','ppp',1,'12345','ppp'),(8,'rr','rr',24,'21354','rr'),(9,'ppp','ppp',24,'123456','ppp');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `band` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'Band1',NULL),(2,'Band2',NULL),(3,'Band3',NULL),(4,'Band4',NULL),(5,'Band5',NULL),(6,'Band6',NULL),(7,'Band7',NULL),(8,'Band8',NULL),(9,'Band9',NULL),(10,'Band10',NULL),(11,'Band11',NULL),(12,'Band12',NULL),(13,'Band13',NULL),(14,'Band14',NULL),(15,'Band15',NULL),(16,'Band16',NULL),(17,'Band17',NULL),(18,'Band18',NULL),(19,'Band19',NULL),(20,'Band20',NULL);
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefit`
--

DROP TABLE IF EXISTS `benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benefit_type_id` int(11) NOT NULL,
  `value` varchar(300) DEFAULT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `emp_id` bigint(20) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benefit_type_id_idx` (`benefit_type_id`),
  KEY `emp_id_idx` (`emp_id`),
  CONSTRAINT `benefit_type_id` FOREIGN KEY (`benefit_type_id`) REFERENCES `benefit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefit`
--

LOCK TABLES `benefit` WRITE;
/*!40000 ALTER TABLE `benefit` DISABLE KEYS */;
INSERT INTO `benefit` VALUES (9,1,'3',NULL,11,2015),(10,2,'3',NULL,11,2015),(20,4,'3',NULL,2,2015),(24,2,'10',NULL,2,2015),(27,1,'0',NULL,2,2015),(32,1,'7',NULL,25,2015),(33,6,'6',NULL,25,2015),(34,2,'5',NULL,25,2015),(35,3,'2',NULL,2,2015),(36,6,'12',NULL,2,2015),(37,2,'30',NULL,30,2015),(38,1,'30',NULL,30,2015),(39,2,'30',NULL,29,2015),(40,3,'10',NULL,29,2015),(41,7,'21',NULL,1,2015),(42,10,'0',NULL,1,2015),(43,2,'5',NULL,1,2015),(44,3,'8',NULL,1,2015),(45,4,'5',NULL,1,2015),(46,10,'20',NULL,2,2015),(48,6,'25',NULL,2,2015),(49,6,'10',NULL,2,2015),(50,6,'12',NULL,1,2015),(52,6,'3',NULL,2,2015),(53,2,'5',NULL,2,2015),(54,1,'5',NULL,1,2015);
/*!40000 ALTER TABLE `benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefit_category`
--

DROP TABLE IF EXISTS `benefit_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benefit_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefit_category`
--

LOCK TABLES `benefit_category` WRITE;
/*!40000 ALTER TABLE `benefit_category` DISABLE KEYS */;
INSERT INTO `benefit_category` VALUES (2,'Accessories'),(1,'Leave');
/*!40000 ALTER TABLE `benefit_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefit_type`
--

DROP TABLE IF EXISTS `benefit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benefit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `benefit_category_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`),
  KEY `fk_benefit_type_benefit_category1_idx` (`benefit_category_id`),
  CONSTRAINT `fk_benefit_type_benefit_category1` FOREIGN KEY (`benefit_category_id`) REFERENCES `benefit_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefit_type`
--

LOCK TABLES `benefit_type` WRITE;
/*!40000 ALTER TABLE `benefit_type` DISABLE KEYS */;
INSERT INTO `benefit_type` VALUES (1,'CL',1,'CASUAL LEAVE'),(2,'SL',1,'SICK LEAVE'),(3,'PL',1,'PATERNITY LEAVE'),(4,'ML',1,'MATERNITY LEAVE'),(5,'MOBILE',2,'MOBILE'),(6,'EL',1,'EARNED LEAVE'),(7,'LOP',1,'LOSS OF PAY'),(10,'med',1,'Medical Leave');
/*!40000 ALTER TABLE `benefit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_group`
--

DROP TABLE IF EXISTS `blood_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_group`
--

LOCK TABLES `blood_group` WRITE;
/*!40000 ALTER TABLE `blood_group` DISABLE KEYS */;
INSERT INTO `blood_group` VALUES (1,'A +ve'),(2,'A -ve'),(3,'A1 -ve'),(4,'A1 +ve'),(5,'A1B -ve'),(6,'A1B +ve'),(7,'A2 -ve'),(8,'A2 +ve'),(9,'A2B -ve'),(10,'A2B +ve'),(11,'B -ve'),(12,'B +ve'),(13,'B1 -ve'),(14,'B1 +ve'),(15,'O -ve'),(16,'O +ve'),(17,'AB +ve'),(18,'AB +ve');
/*!40000 ALTER TABLE `blood_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_feedback`
--

DROP TABLE IF EXISTS `candidate_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_feedback` (
  `candidate_id` bigint(20) NOT NULL,
  `skillset` varchar(45) NOT NULL,
  `job_ratings` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `hiring_manager` bigint(20) NOT NULL,
  PRIMARY KEY (`candidate_id`,`skillset`,`job_ratings`),
  KEY `FK_7m16cs6svpjt1q37aq5xm19aa` (`job_ratings`),
  KEY `FK_gvvw64u7o37skx3tewp14uesb` (`hiring_manager`),
  CONSTRAINT `FK_7m16cs6svpjt1q37aq5xm19aa` FOREIGN KEY (`job_ratings`) REFERENCES `job_ratings` (`id`),
  CONSTRAINT `FK_gvvw64u7o37skx3tewp14uesb` FOREIGN KEY (`hiring_manager`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_feedback`
--

LOCK TABLES `candidate_feedback` WRITE;
/*!40000 ALTER TABLE `candidate_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India'),(2,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Testing','testing');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empl_id` bigint(20) NOT NULL,
  `institution` varchar(300) DEFAULT NULL,
  `education_type` int(11) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `school_graduation` varchar(500) DEFAULT NULL,
  `year_passed` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_idx` (`empl_id`),
  KEY `educationType_idx` (`education_type`),
  CONSTRAINT `educationType` FOREIGN KEY (`education_type`) REFERENCES `education_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empl_id` FOREIGN KEY (`empl_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_type`
--

DROP TABLE IF EXISTS `education_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_type`
--

LOCK TABLES `education_type` WRITE;
/*!40000 ALTER TABLE `education_type` DISABLE KEYS */;
INSERT INTO `education_type` VALUES (1,'Full Time'),(2,'Part Time'),(3,'Correspondence/ Distance');
/*!40000 ALTER TABLE `education_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `alternate_phone` varchar(45) DEFAULT NULL,
  `avatar` blob,
  `pan_no` varchar(15) DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `blood_group` int(11) DEFAULT NULL,
  `permanent` bigint(20) DEFAULT NULL,
  `residential` bigint(20) DEFAULT NULL,
  `mailing` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  UNIQUE KEY `UK_af534w03av8srcldugewrmpbi` (`email_id`),
  KEY `blood_group_idx` (`blood_group`),
  KEY `permanent_address_idx` (`permanent`),
  KEY `residential_address_idx` (`residential`),
  KEY `mailing_address_idx` (`mailing`),
  CONSTRAINT `blood_group` FOREIGN KEY (`blood_group`) REFERENCES `blood_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mailing_address` FOREIGN KEY (`mailing`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `permanent_address` FOREIGN KEY (`permanent`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `residential_address` FOREIGN KEY (`residential`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,NULL,'rajalakshmi.s@aximsoft.com','Admin','Admin','2014-11-26','Female',NULL,'1234567890','1234565789',NULL,'1478523690','Single',4,9,9,9),(2,NULL,'rajendran.k@aximsoft.com','karthikeyan','rajendran','2014-11-05','Male',NULL,'9894669953','9894669953',NULL,'BQCPK','Single',16,NULL,NULL,NULL),(3,'test01','test@aximsoft.com','test','user','2014-11-14','Male',NULL,'9894098940','9894098940',NULL,'9894098940','Single',15,NULL,NULL,NULL),(9,NULL,'ven@aximsoft.com','Ven','Ven','2014-11-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'karthitest@aximsoft.com','karthikeyan','rajendran','2014-11-27','Male',NULL,'9894669953','9894669953',NULL,'dcc','Single',16,NULL,NULL,NULL),(11,NULL,'harishkumar.r@aximsoft.com','harish','kumar','2014-11-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'abdul@test.com','abu','rahu','2010-11-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1),(14,NULL,'abdul2@test.com','abu','rahu','2010-11-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'harishkumar1.r@aximsoft.com','harish','kumar','2014-11-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,'ganesh@aximsoft.com','ganesh','moorthy','2014-11-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,'g.@aximsoft.com','asd','def','2014-12-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'harish3@aximsoft.com','harish','harish','2014-10-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'jack1@aximsoft.com','jack','thomas','2014-08-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,'hh@aximsoft.com','jack','thomas','2014-07-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'rr@aximsoft.com','rrrrrr','rrr','2014-03-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'rrt@aximsoft.com','rrrrrr','rrr','2014-03-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,'icdnm1@test.com','hhh','hhh','1991-12-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,'testaxim@aximsoft.com','axim','soft','2014-12-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,'123@aximsoft.com','axim','soft','2014-12-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,'ka@aximsoft.com','axim','soft','2014-12-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,'1234@aximsoft.com','axim','soft','2014-12-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,'raji@aximsoft.com','raji','s','2014-12-06','Female',NULL,'1234567890','1234567890',NULL,'1234567890','Single',4,2,2,2),(30,'tse02','billgates@aximsoft.com','ravi','rahul','2014-12-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,NULL,'ganesh1@aximsoft.com','ganesh','kumar','2014-12-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,NULL,'john@aximsoft.com','john','maxwell','2014-12-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,NULL,'biiy@aximsoft.com','billy','kjohn','2014-12-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,NULL,'jane@aximsoft.com','jane','marry','2014-12-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,NULL,'shawn@aximsoft.com','shawn','shawn','2014-12-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,NULL,'tty@aximsoft.com','tty','tty','2014-12-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment`
--

DROP TABLE IF EXISTS `employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `dep_id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reporting` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) NOT NULL,
  `band_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_UNIQUE` (`employee`),
  KEY `employment_job_id_idx` (`job_id`),
  KEY `employment_emp_id_idx` (`employee`),
  KEY `employment_dep_id_idx` (`dep_id`),
  KEY `employment_reporting_idx` (`reporting`),
  KEY `employment_status_id_idx` (`status_id`),
  KEY `employment_employee_idx` (`id`,`employee`),
  CONSTRAINT `employment_dep_id` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employment_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employment_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_title` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employment_reporting` FOREIGN KEY (`reporting`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employment_status_id` FOREIGN KEY (`status_id`) REFERENCES `employment_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment`
--

LOCK TABLES `employment` WRITE;
/*!40000 ALTER TABLE `employment` DISABLE KEYS */;
INSERT INTO `employment` VALUES (1,1,1,2,'2014-11-06',NULL,3,1,0),(2,2,1,3,'2014-11-14',NULL,NULL,1,0),(3,1,1,25,'2014-12-10',NULL,3,1,0),(4,1,1,1,'2014-12-09',NULL,1,1,0),(5,1,1,30,'2014-12-17',NULL,3,1,0);
/*!40000 ALTER TABLE `employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_history`
--

DROP TABLE IF EXISTS `employment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employment_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) NOT NULL,
  `employer_name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id_idx` (`emp_id`),
  KEY `history_emp_id_idx` (`emp_id`),
  CONSTRAINT `history_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_history`
--

LOCK TABLES `employment_history` WRITE;
/*!40000 ALTER TABLE `employment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `employment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_status`
--

DROP TABLE IF EXISTS `employment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employment_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_status`
--

LOCK TABLES `employment_status` WRITE;
/*!40000 ALTER TABLE `employment_status` DISABLE KEYS */;
INSERT INTO `employment_status` VALUES (1,'Active',NULL);
/*!40000 ALTER TABLE `employment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_schedule`
--

DROP TABLE IF EXISTS `interview_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_schedule` (
  `candidate_id` bigint(20) NOT NULL,
  `hiring_manager` bigint(20) NOT NULL,
  `rounds` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`candidate_id`,`hiring_manager`,`rounds`,`date`,`time`),
  KEY `FK_bdfs2wbf1407rxy9d524urwpl` (`candidate_id`),
  KEY `FK_c2075mx0ad920xiuna1y6s6fl` (`hiring_manager`),
  KEY `FK_d4fffw9o89wqysgvvkvibraij` (`rounds`),
  CONSTRAINT `FK_bdfs2wbf1407rxy9d524urwpl` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate` (`id`),
  CONSTRAINT `FK_c2075mx0ad920xiuna1y6s6fl` FOREIGN KEY (`hiring_manager`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_d4fffw9o89wqysgvvkvibraij` FOREIGN KEY (`rounds`) REFERENCES `job_candidate_rounds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_schedule`
--

LOCK TABLES `interview_schedule` WRITE;
/*!40000 ALTER TABLE `interview_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_candidate`
--

DROP TABLE IF EXISTS `job_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_candidate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `job_title` bigint(20) DEFAULT NULL,
  `keywords` varchar(45) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  `date` date NOT NULL,
  `status` bigint(20) NOT NULL,
  `hiring_manager` bigint(20) NOT NULL,
  `mode_of_interview` varchar(45) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `job_description` varchar(60) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `experience` bigint(20) DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `scheduled_time` time DEFAULT NULL,
  `resume` tinyblob,
  `scheduled_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hiring_manager_idx` (`hiring_manager`),
  KEY `status_idx` (`status`),
  KEY `job_title` (`job_title`),
  KEY `FK_iyc3idqgdaix3x0s48rgmvxy9` (`hiring_manager`),
  CONSTRAINT `FK_iyc3idqgdaix3x0s48rgmvxy9` FOREIGN KEY (`hiring_manager`) REFERENCES `employee` (`id`),
  CONSTRAINT `hiring_manager` FOREIGN KEY (`hiring_manager`) REFERENCES `job_vacancy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `job_title` FOREIGN KEY (`job_title`) REFERENCES `job_vacancy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status` FOREIGN KEY (`status`) REFERENCES `job_candidate_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_candidate`
--

LOCK TABLES `job_candidate` WRITE;
/*!40000 ALTER TABLE `job_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_candidate_history`
--

DROP TABLE IF EXISTS `job_candidate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_candidate_history` (
  `candidate_id` bigint(20) NOT NULL,
  `rounds` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `hiring_manager_id` bigint(20) NOT NULL,
  `scheduled_date_time` datetime NOT NULL,
  PRIMARY KEY (`candidate_id`,`rounds`,`status`,`date`,`time`,`hiring_manager_id`),
  KEY `FK_gwu9mjmlwyo88awp77goc0nx8` (`status`),
  KEY `FK_ad6wvnrsbs4i6hrj91cu7cn8u` (`hiring_manager_id`),
  KEY `FK_oae7gmluvvgcx5crlm7jg0w28` (`candidate_id`),
  KEY `FK_mj4hm3o938ch1kr7rhnsputf0` (`rounds`),
  CONSTRAINT `FK_ad6wvnrsbs4i6hrj91cu7cn8u` FOREIGN KEY (`hiring_manager_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_gwu9mjmlwyo88awp77goc0nx8` FOREIGN KEY (`status`) REFERENCES `job_candidate_status` (`id`),
  CONSTRAINT `FK_mj4hm3o938ch1kr7rhnsputf0` FOREIGN KEY (`rounds`) REFERENCES `job_candidate_rounds` (`id`),
  CONSTRAINT `FK_oae7gmluvvgcx5crlm7jg0w28` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_candidate_history`
--

LOCK TABLES `job_candidate_history` WRITE;
/*!40000 ALTER TABLE `job_candidate_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_candidate_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_candidate_rounds`
--

DROP TABLE IF EXISTS `job_candidate_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_candidate_rounds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rounds` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_candidate_rounds`
--

LOCK TABLES `job_candidate_rounds` WRITE;
/*!40000 ALTER TABLE `job_candidate_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_candidate_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_candidate_status`
--

DROP TABLE IF EXISTS `job_candidate_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_candidate_status` (
  `id` bigint(20) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_candidate_status`
--

LOCK TABLES `job_candidate_status` WRITE;
/*!40000 ALTER TABLE `job_candidate_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_candidate_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_interview_feedback`
--

DROP TABLE IF EXISTS `job_interview_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_interview_feedback` (
  `candidate_id` bigint(20) NOT NULL,
  `skillset` varchar(45) NOT NULL,
  `job_ratings` bigint(20) NOT NULL,
  `scheduled_date_time` datetime NOT NULL,
  `hiring_manager` bigint(20) NOT NULL,
  PRIMARY KEY (`candidate_id`,`skillset`,`job_ratings`,`scheduled_date_time`,`hiring_manager`),
  KEY `FK_99k2lukh7tfcp8oho6t85m7t9` (`job_ratings`),
  KEY `FK_mwbri4s4tqcn8miyq6fokm6v1` (`candidate_id`),
  KEY `FK_2abyc7uj6f72bq402y922ns4x` (`hiring_manager`),
  CONSTRAINT `FK_2abyc7uj6f72bq402y922ns4x` FOREIGN KEY (`hiring_manager`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_99k2lukh7tfcp8oho6t85m7t9` FOREIGN KEY (`job_ratings`) REFERENCES `job_ratings` (`id`),
  CONSTRAINT `FK_mwbri4s4tqcn8miyq6fokm6v1` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_interview_feedback`
--

LOCK TABLES `job_interview_feedback` WRITE;
/*!40000 ALTER TABLE `job_interview_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_interview_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_interview_schedule`
--

DROP TABLE IF EXISTS `job_interview_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_interview_schedule` (
  `candidate_id` bigint(20) NOT NULL,
  `hiring_manager` bigint(20) NOT NULL,
  `rounds` bigint(20) NOT NULL,
  `scheduled_date_time` datetime NOT NULL,
  PRIMARY KEY (`candidate_id`,`hiring_manager`,`rounds`,`scheduled_date_time`),
  KEY `FK_kptaty9h4wxpigmqdiuckuqpg` (`candidate_id`),
  KEY `FK_j00tsmxk57lcwl5ebplcssdv5` (`hiring_manager`),
  KEY `FK_9577s7idlqi1d0a2n8a38qgq` (`rounds`),
  CONSTRAINT `FK_9577s7idlqi1d0a2n8a38qgq` FOREIGN KEY (`rounds`) REFERENCES `job_candidate_rounds` (`id`),
  CONSTRAINT `FK_j00tsmxk57lcwl5ebplcssdv5` FOREIGN KEY (`hiring_manager`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_kptaty9h4wxpigmqdiuckuqpg` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_interview_schedule`
--

LOCK TABLES `job_interview_schedule` WRITE;
/*!40000 ALTER TABLE `job_interview_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_interview_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_ratings`
--

DROP TABLE IF EXISTS `job_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_ratings` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_ratings`
--

LOCK TABLES `job_ratings` WRITE;
/*!40000 ALTER TABLE `job_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_title`
--

DROP TABLE IF EXISTS `job_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_title` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `band_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `job_band_id_idx` (`band_id`),
  CONSTRAINT `job_band_id` FOREIGN KEY (`band_id`) REFERENCES `band` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_title`
--

LOCK TABLES `job_title` WRITE;
/*!40000 ALTER TABLE `job_title` DISABLE KEYS */;
INSERT INTO `job_title` VALUES (1,'QA','Quality Analyst',2),(2,'QA-Lead','QA Manager',4);
/*!40000 ALTER TABLE `job_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_vacancy`
--

DROP TABLE IF EXISTS `job_vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_vacancy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(45) NOT NULL,
  `no_of_positions` bigint(20) DEFAULT NULL,
  `job_description` varchar(45) DEFAULT NULL,
  `job_experience` bigint(20) DEFAULT NULL,
  `job_timeframe` varchar(45) DEFAULT NULL,
  `emp_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobvacancy_job_title_idx` (`job_title`),
  KEY `emp_id_idx` (`emp_id`),
  CONSTRAINT `employee_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_vacancy`
--

LOCK TABLES `job_vacancy` WRITE;
/*!40000 ALTER TABLE `job_vacancy` DISABLE KEYS */;
INSERT INTO `job_vacancy` VALUES (1,'Java - Fresher',2,'Java, HTML, OOPS',6,'High',2);
/*!40000 ALTER TABLE `job_vacancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_request`
--

DROP TABLE IF EXISTS `leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) NOT NULL,
  `application_date` date DEFAULT NULL,
  `leave_from` date DEFAULT NULL,
  `leave_to` date DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `leave_status` int(11) DEFAULT NULL,
  `approved_by` varchar(45) DEFAULT NULL,
  `benefit_type` int(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `session` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id_idx` (`emp_id`),
  KEY `leave_status_idx` (`leave_status`),
  KEY `benefit_type_idx` (`benefit_type`),
  CONSTRAINT `benefit_type` FOREIGN KEY (`benefit_type`) REFERENCES `benefit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employee_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leave_status` FOREIGN KEY (`leave_status`) REFERENCES `leave_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_request`
--

LOCK TABLES `leave_request` WRITE;
/*!40000 ALTER TABLE `leave_request` DISABLE KEYS */;
INSERT INTO `leave_request` VALUES (5,2,'2014-11-14','2014-11-14','2014-11-14','personal','9894098940',1,NULL,1,'Full day','Full'),(6,2,'2014-11-14','2014-11-17','2014-11-17','s','9894098940',1,NULL,1,'Half day','Morning'),(7,2,'2014-11-14','2014-11-17','2014-11-17','ds','9894098940',2,NULL,1,'Half day','Morning'),(8,2,'2014-11-14','2014-11-18','2014-11-18','sds','9894098940',2,NULL,1,'Full day','Full'),(9,2,'2014-11-14','2014-11-19','2014-11-19','as','9894098940',1,NULL,1,'Half day','Morning'),(10,2,'2014-11-14','2014-11-19','2014-11-19','czxc','9894098940',2,NULL,1,'Half day','Morning'),(11,2,'2014-11-14','2014-11-20','2014-11-20','545','9894098940',2,NULL,1,'Full day','Full'),(12,2,'2014-11-14','2014-11-21','2014-11-21','sde','9894098940',1,NULL,1,'Half day','Morning'),(13,2,'2014-11-14','2014-11-21','2014-11-21','your leave is cancelled','9894098940',3,'test',1,'Half day','Morning'),(172,1,'2014-11-18','2014-12-18','2014-12-18','Function','1234567890',1,NULL,2,'Full day','Full day'),(173,29,'2014-11-18','2014-12-18','2014-12-18','functions','1234567890',1,NULL,2,'Full day','Full day'),(174,29,'2014-11-18','2014-12-18','2014-12-18','functions','1234567890',1,NULL,2,'Full day','Full day'),(175,1,'2014-12-19','2014-12-19','2014-12-19','the new update is the only way to get a new phone ','1234567890',1,NULL,2,'Full day','Full day'),(176,1,'2014-12-19','2014-12-19','2014-12-19','the new version ','123456',1,NULL,2,'Full day','Full day'),(177,1,'2014-12-19','2014-12-19','2014-12-19','asdfgf','12345',1,NULL,3,'Full day','Full day'),(178,1,'2014-12-19','2014-12-19','2014-12-19','lkjhj','964322',1,NULL,4,'Half day','Morning'),(179,1,'2014-12-19','2014-12-20','2014-12-20','highly','37788',1,NULL,3,'Full day','Full day'),(180,1,'2014-12-22','2014-12-22','2014-12-22','test','1234567890',3,'Admin',3,'Full day','Full day'),(181,1,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,2,'Full day','Full day'),(182,1,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,4,'Full day','Full day'),(183,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(184,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(185,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(186,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,2,'Full day','Full day'),(187,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(188,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(189,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(190,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(191,1,'2014-12-22','2014-12-22','2014-12-22','function','2233344445',1,NULL,4,'Full day','Full day'),(192,1,'2014-12-22','2014-12-22','2014-12-22','functions','2233344445',1,NULL,4,'Full day','Full day'),(193,1,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,4,'Full day','Full day'),(194,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(195,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,4,'Full day','Full day'),(196,1,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,4,'Full day','Full day'),(197,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,3,'Full day','Full day'),(198,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,3,'Full day','Full day'),(199,11,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,1,'Full day','Full day'),(200,11,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,1,'Full day','Full day'),(201,11,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,2,'Full day','Full day'),(202,1,'2014-12-22','2014-12-22','2014-12-22','functions','1234567890',1,NULL,3,'Full day','Full day'),(203,1,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,3,'Full day','Full day'),(204,1,'2014-12-22','2014-12-22','2014-12-22','function','1234567890',1,NULL,3,'Full day','Full day'),(205,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(206,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(207,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(208,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(209,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(210,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(211,30,'2014-12-23','2014-12-23','2014-12-23','','',1,NULL,1,'Full day','Full day'),(212,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(213,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(214,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(215,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(216,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(217,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(218,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(219,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(220,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(221,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(222,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(223,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(224,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(225,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(226,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(227,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(228,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(229,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(230,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(231,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(232,30,'2014-12-23','2014-12-23','2014-12-23','functions','2233344445',1,NULL,1,'Full day','Full day'),(233,30,'2014-12-23','2014-12-23','2014-12-23','functions','2233344445',1,NULL,1,'Full day','Full day'),(234,30,'2014-12-23','2014-12-23','2014-12-23','functions','2233344445',1,NULL,1,'Full day','Full day'),(235,30,'2014-12-23','2014-12-23','2014-12-23','functions','2233344445',1,NULL,2,'Full day','Full day'),(236,30,'2014-12-23','2014-12-23','2014-12-23','functions','2233344445',1,NULL,2,'Full day','Full day'),(237,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(238,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(239,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(240,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(241,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(242,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(243,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(244,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(245,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(254,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(255,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(256,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(257,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(258,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(259,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(260,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(261,30,'2014-12-23','2014-12-23','2014-12-23','function','2233344445',1,NULL,1,'Full day','Full day'),(262,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(263,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(264,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(265,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(266,29,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,2,'Full day','Full day'),(267,29,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,3,'Full day','Full day'),(268,29,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,3,'Full day','Full day'),(269,29,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,3,'Full day','Full day'),(270,29,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(271,29,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(272,29,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(273,29,'2014-12-23','2014-12-23','2014-12-23','functions','2233344445',1,NULL,2,'Full day','Full day'),(274,29,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(275,29,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,2,'Full day','Full day'),(276,29,'2014-12-23','2014-12-27','2014-12-27','test','1234567890',2,NULL,3,'Full day','Full day'),(277,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(278,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(279,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(280,30,'2014-12-23','2014-12-23','2014-12-23','function','1234567890',1,NULL,1,'Full day','Full day'),(281,30,'2014-12-23','2014-12-23','2014-12-23','functions','1234567890',1,NULL,1,'Full day','Full day'),(282,30,'2014-12-23','2014-12-28','2014-12-28','1234567890','1234567890',2,NULL,1,'Half day','Morning'),(283,30,'2014-12-23','2015-01-01','2015-01-01','function','1234567890',1,NULL,1,'Full day','Full day'),(284,1,'2014-12-24','2014-12-24','2014-12-24','the new one for the message ','1234567890',1,NULL,2,'Half day','Morning'),(285,1,'2014-12-24','2014-12-24','2014-12-24','testing the new version ','1234567890',1,NULL,2,'Full day','Full day'),(286,29,'2014-12-24','2014-12-26','2014-12-26','functions','1234567890',1,NULL,2,'Full day','Full day'),(287,29,'2014-12-24','2014-12-26','2014-12-26','function','1234567890',1,NULL,2,'Full day','Full day'),(288,29,'2014-12-24','2014-12-26','2014-12-26','function','1234567890',1,NULL,2,'Full day','Full day'),(289,29,'2014-12-25','2014-12-25','2014-12-25','function','1234567890',1,NULL,2,'Full day','Full day'),(290,29,'2014-12-25','2014-12-28','2014-12-28','functions','1234567890',1,NULL,2,'Full day','Full day'),(291,29,'2014-12-25','2014-12-29','2014-12-29','functions','2233344445',1,NULL,3,'Full day','Full day'),(292,29,'2014-12-25','2014-12-31','2014-12-31','functions','1234567890',1,NULL,3,'Full day','Full day'),(293,29,'2014-12-25','2015-01-01','2015-01-01','function','1234567890',1,NULL,2,'Full day','Full day'),(294,29,'2014-12-25','2015-01-01','2015-01-01','functions','1234567890',1,NULL,3,'Full day','Full day'),(295,29,'2014-12-25','2015-10-25','2015-10-25','functions','2233344445',1,NULL,2,'Full day','Full day'),(296,29,'2014-12-25','2015-01-26','2015-01-26','function','1234567890',1,NULL,2,'Full day','Full day'),(297,29,'2014-12-25','2015-12-25','2015-12-25','functions','1234567890',1,NULL,2,'Full day','Full day'),(298,29,'2014-12-25','2015-12-26','2015-12-26','function','1234567890',1,NULL,3,'Full day','Full day'),(299,29,'2014-12-25','2015-12-28','2015-12-28','functions','1122222222',1,NULL,3,'Full day','Full day'),(300,29,'2014-12-25','2015-01-01','2015-01-01','functions','1234567890',1,NULL,2,'Full day','Full day'),(303,1,'2014-12-30','2014-12-31','2014-12-31','ttttttttt','1234567890',2,NULL,7,'Full day','Full day'),(304,11,'2014-12-30','2014-12-30','2014-12-31','functions','3333333333',2,NULL,2,'Full day','Full day'),(305,1,'2015-01-02','2015-01-02','2015-01-02','ttttttttt','1234567890',2,NULL,2,'Half day','Morning'),(306,1,'2015-01-02','2015-01-02','2015-01-02','tttttttttt','1234567890',1,NULL,2,'Half day','Afternoon'),(310,2,'2015-01-02','2015-01-15','2015-01-16','kjsdsjakdhasjkh','9894098940',1,'test',6,'Full day','Full day'),(311,2,'2015-01-02','2015-01-19','2015-01-19','asdasda','9894098940',1,'test',2,'Full day','Full day'),(318,2,'2015-01-06','2015-01-06','2015-01-06','ttttttttttttttttt','1234567890',1,NULL,2,'Half day','Morning'),(321,11,'2015-01-06','2015-01-06','2015-01-06','testing','1234567890',2,NULL,1,'Full day','Full day'),(326,11,'2015-01-06','2015-01-07','2015-01-07','test','1234567890',2,NULL,1,'Full day','Full day'),(330,11,'2015-01-06','2015-01-08','2015-01-08','test','1234567890',2,NULL,1,'Half day','Morning'),(332,1,'2015-01-07','2015-01-08','2015-01-09','ttttttttttttttttttttt','1234567890',1,'Admin',2,'Full day','Full day'),(336,11,'2015-01-07','2015-01-10','2015-01-10','test','1234567890',2,NULL,2,'Full day','Full day'),(337,11,'2015-01-07','2015-01-10','2015-01-10','test','1234567890',2,NULL,2,'Full day','Full day'),(338,11,'2015-01-07','2015-01-11','2015-01-11','test','1234567890',2,NULL,2,'Full day','Full day'),(339,29,'2015-01-08','2015-01-08','2015-01-08','test','1234567890',2,NULL,2,'Full day','Full day'),(340,29,'2015-01-08','2015-01-09','2015-01-09','test','1234567890',2,NULL,2,'Full day','Full day'),(341,29,'2015-01-08','2015-01-10','2015-01-10','test','1234567890',2,NULL,2,'Full day','Full day'),(342,29,'2015-01-08','2015-01-08','2015-01-08','test','1234567890',2,NULL,2,'Full day','Full day'),(343,29,'2015-01-09','2015-01-11','2015-01-11','test','1234567890',2,NULL,2,'Full day','Full day'),(344,1,'2015-01-09','2015-01-11','2015-01-11','ttttttttttttt','1234567890',2,NULL,7,'Full day','Full day');
/*!40000 ALTER TABLE `leave_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_status`
--

DROP TABLE IF EXISTS `leave_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status`
--

LOCK TABLES `leave_status` WRITE;
/*!40000 ALTER TABLE `leave_status` DISABLE KEYS */;
INSERT INTO `leave_status` VALUES (1,'Approved','Approved'),(2,'Pending','Pending'),(3,'Declined','Declined');
/*!40000 ALTER TABLE `leave_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `current_benefit_year` int(4) DEFAULT NULL,
  `default_reporting_manager` varchar(100) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2015,NULL,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` int(11) NOT NULL,
  `state_name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_idx` (`country`),
  CONSTRAINT `country` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,1,'Andhra Pradesh'),(2,1,'Arunachal Pradesh'),(3,1,'Assam'),(4,1,'Bihar'),(5,1,'Chhattisgarh'),(6,1,'Goa'),(7,1,'Gujarat'),(8,1,'Haryana'),(9,1,'Himachal Pradesh'),(10,1,'Jammu and Kashmir'),(11,1,'Jharkhand'),(12,1,'Karnataka'),(13,1,'Kerala'),(14,1,'Madhya Pradesh'),(15,1,'Maharashtra'),(16,1,'Manipur'),(17,1,'Meghalaya'),(18,1,'Mizoram'),(19,1,'Nagaland'),(20,1,'Orissa'),(21,1,'Punjab'),(22,1,'Rajasthan'),(23,1,'Sikkim'),(24,1,'Tamil Nadu'),(25,1,'Telangana'),(26,1,'Tripura'),(27,1,'Uttaranchal'),(28,1,'Uttar Pradesh'),(29,1,'West Bengal'),(30,1,'Andaman and Nicobar Islands'),(31,1,'Chandigarh'),(32,1,'Dadar and Nagar Haveli'),(33,1,'Daman and Diu'),(34,1,'Delhi'),(35,1,'Lakshadeep'),(36,1,'Pondicherry'),(37,2,'Alabama'),(38,2,'Alaska'),(39,2,'Arizona'),(40,2,'Arkansas'),(41,2,'California'),(42,2,'Colorado'),(43,2,'Connecticut'),(44,2,'Delaware'),(45,2,'Florida'),(46,2,'Georgia'),(47,2,'Hawaii'),(48,2,'Idaho'),(49,2,'Illinois'),(50,2,'Indiana'),(51,2,'Iowa'),(52,2,'Kansas'),(53,2,'Kentucky'),(54,2,'Louisiana'),(55,2,'Maine'),(56,2,'Maryland'),(57,2,'Massachusetts'),(58,2,'Michigan'),(59,2,'Minnesota'),(60,2,'Mississippi'),(61,2,'Missouri'),(62,2,'Montana'),(63,2,'Nebraska'),(64,2,'Nevada'),(65,2,'New Hampshire'),(66,2,'New Jersey'),(67,2,'New Mexico'),(68,2,'New York'),(69,2,'North Carolina'),(70,2,'North Dakota'),(71,2,'Ohio'),(72,2,'Oklahoma'),(73,2,'Oregon'),(74,2,'Pennsylvania'),(75,2,'Rhode Island'),(76,2,'South Carolina'),(77,2,'South Dakota'),(78,2,'Tennessee'),(79,2,'Texas'),(80,2,'Utah'),(81,2,'Vermont'),(82,2,'Virginia'),(83,2,'Washington'),(84,2,'West Virginia'),(85,2,'Wisconsin'),(86,2,'Wyoming');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp` bigint(20) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `emps_idx` (`emp`),
  KEY `roles_idx` (`role`),
  CONSTRAINT `emps` FOREIGN KEY (`emp`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roles` FOREIGN KEY (`role`) REFERENCES `user_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,1,'admin','Aximsoft',1),(2,2,2,'karthikeyan','Aximsoft',1),(3,3,2,'test','1234',1),(9,9,2,'ven','1234',1),(10,10,2,'karthitest','1234',1),(11,11,2,'harish','1234',1),(14,14,2,'abdul2','abdul123',1),(15,15,2,'harish1','1234',1),(17,17,2,'ganesh','1234',1),(18,18,2,'a23','1234',1),(19,19,2,'harish3','1234',1),(20,20,2,'jack','1234',1),(21,21,2,'hh','1234',1),(22,22,2,'rr','1234',1),(23,23,2,'rrt','1234',1),(24,24,2,'hhh','hhhh',1),(25,25,2,'aximtest','1234',1),(26,26,2,'aximtest1','1234',1),(27,27,2,'aximtest2','1234',1),(28,28,2,'aximtest3','1234',1),(29,29,2,'raji','1234',1),(30,30,2,'ravi','1234',1),(31,31,2,'ganesh1','1234',1),(32,32,2,'john','1234',1),(33,33,2,'billy','1234',1),(34,34,2,'jane','1234',1),(35,35,2,'shawn','1234',1),(36,36,2,'tty','1234',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

