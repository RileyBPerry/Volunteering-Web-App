-- MySQL dump 10.13  Distrib 8.0.39, for macos14 (arm64)
--
-- Host: localhost    Database: Vol_App2
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `Admins`
--

-- Create database
CREATE DATABASE IF NOT EXISTS vol_app;

-- Use the database
USE vol_app;

DROP TABLE IF EXISTS `Admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admins` (
  `userId` int NOT NULL,
  `orgName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `UserCredentials` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES (10000,'Project Cure'),(10002,'Books For Kids'),(10003,'Houston Humane Society'),(10004,'Helping Hands of Houston');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Availability`
--

DROP TABLE IF EXISTS `Availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Availability` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `dayOfWeek` varchar(10) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userId` (`userId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `Volunteers` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Availability`
--

LOCK TABLES `Availability` WRITE;
/*!40000 ALTER TABLE `Availability` DISABLE KEYS */;
INSERT INTO `Availability` VALUES (21,10005,'Monday','06:00:00','08:00:00'),(22,10005,'Wednesday','08:00:00','10:00:00'),(23,10006,'Tuesday','06:00:00','08:00:00'),(24,10006,'Thursday','08:00:00','10:00:00'),(25,10007,'Wednesday','06:00:00','08:00:00'),(26,10007,'Friday','08:00:00','10:00:00'),(27,10008,'Monday','06:00:00','08:00:00'),(28,10008,'Tuesday','08:00:00','10:00:00'),(29,10009,'Thursday','06:00:00','08:00:00'),(30,10009,'Saturday','08:00:00','10:00:00'),(31,10010,'Friday','06:00:00','08:00:00'),(32,10010,'Sunday','08:00:00','10:00:00'),(33,10011,'Monday','06:00:00','08:00:00'),(34,10011,'Wednesday','08:00:00','10:00:00'),(35,10012,'Tuesday','06:00:00','08:00:00'),(36,10012,'Thursday','08:00:00','10:00:00'),(37,10013,'Wednesday','06:00:00','08:00:00'),(38,10013,'Friday','08:00:00','10:00:00'),(39,10014,'Thursday','06:00:00','08:00:00'),(40,10014,'Saturday','08:00:00','10:00:00');
/*!40000 ALTER TABLE `Availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_details`
--

DROP TABLE IF EXISTS `Event_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_details` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `eventName` varchar(100) DEFAULT NULL,
  `eventDescription` text,
  `orgName` varchar(100) DEFAULT NULL,
  `location` text,
  `eventStartDate` date DEFAULT NULL,
  `eventStartTime` time DEFAULT NULL,
  `eventEndDate` date DEFAULT NULL,
  `eventEndTime` time DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `spots` int DEFAULT NULL,
  `reqSkills` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `creatorId` (`creatorId`),
  CONSTRAINT `event_details_ibfk_1` FOREIGN KEY (`creatorId`) REFERENCES `Admins` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_details`
--

LOCK TABLES `Event_details` WRITE;
/*!40000 ALTER TABLE `Event_details` DISABLE KEYS */;
INSERT INTO `Event_details` VALUES (11,'Community Cleanup','A neighborhood cleanup event to help keep our community clean.','Project Cure','Central Park','2024-08-01','06:00:00','2024-08-01','08:00:00',2,10000,'Medium',15,''),(12,'Book Drive','Collect and distribute books to local schools.','Books for Kids','Local Library','2024-08-02','07:00:00','2024-08-01','09:00:00',1.5,10002,'High',10,''),(13,'Pet Adoption Fair','Event to help find homes for pets.','Houston Humane Society','Pet Shelter','2024-08-03','08:00:00','2024-08-01','10:00:00',3,10003,'Low',20,''),(14,'Blood Donation Camp','Help save lives by donating blood.','GiveBlood','Community Center','2024-08-04','09:00:00','2024-08-01','11:00:00',2.5,10004,'Medium',12,''),(25,'Community Garden Planting','Help plant new flowers and vegetables in the community garden.','Helping Hands of Houston','Community Garden','2024-08-05','07:00:00','2024-08-01','09:00:00',2,10000,'Medium',8,''),(27,'Community Garden Planting','Help plant new flowers and vegetables in the community garden.','Helping Hands of Houston','Community Garden','2024-08-05','07:00:00','2024-08-01','09:00:00',2,10000,'Medium',8,'');
/*!40000 ALTER TABLE `Event_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventSkills`
--

DROP TABLE IF EXISTS `EventSkills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventSkills` (
  `eventId` int NOT NULL,
  `skillId` int NOT NULL,
  PRIMARY KEY (`eventId`,`skillId`),
  KEY `skillId` (`skillId`),
  CONSTRAINT `eventskills_fkey_1` FOREIGN KEY (`eventId`) REFERENCES `Event_details` (`eventId`),
  CONSTRAINT `eventskills_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `Skills` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventSkills`
--

LOCK TABLES `EventSkills` WRITE;
/*!40000 ALTER TABLE `EventSkills` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventSkills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skills`
--

DROP TABLE IF EXISTS `Skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Skills` (
  `skillId` int NOT NULL AUTO_INCREMENT,
  `skillName` varchar(100) NOT NULL,
  PRIMARY KEY (`skillId`),
  UNIQUE KEY `skillName` (`skillName`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skills`
--

LOCK TABLES `Skills` WRITE;
/*!40000 ALTER TABLE `Skills` DISABLE KEYS */;
INSERT INTO `Skills` VALUES (1,'Academics'),(9,'Administrative & Clerical'),(19,'Animals & Environment'),(2,'Arts'),(10,'Business & Management'),(20,'Children & Family'),(3,'Computer & IT'),(11,'Disaster Relief'),(21,'Education & Literacy'),(4,'Engineering'),(12,'Finance'),(22,'Food Service & Events'),(23,'Healthcare & Social Services'),(5,'Hobbies & Crafts'),(14,'Housing & Facilities'),(13,'HR'),(6,'Interactive & Web Development'),(15,'Interpersonal'),(24,'Language & Culture'),(7,'Legal & Advocacy'),(25,'Marketing & Communications'),(8,'Music'),(16,'Performing Arts'),(26,'Sports & Recreation'),(17,'Trades'),(18,'Transportation');
/*!40000 ALTER TABLE `Skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserCredentials`
--

DROP TABLE IF EXISTS `UserCredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserCredentials` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL UNIQUE,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserCredentials`
--

LOCK TABLES `UserCredentials` WRITE;
/*!40000 ALTER TABLE `UserCredentials` DISABLE KEYS */;
INSERT INTO `UserCredentials` VALUES (10000,'example1@gmail.com','password1'),(10001,'example2@gmail.com','password2'),(10002,'example3@gmail.com','password3'),(10003,'example4@gmail.com','password4'),(10004,'example5@gmail.com','password5'),(10005,'example6@gmail.com','password6'),(10006,'example7@gmail.com','password7'),(10007,'example8@gmail.com','password8'),(10008,'example9@gmail.com','password9'),(10009,'example10@gmail.com','password10'),(10010,'example11@gmail.com','password11'),(10011,'example12@gmail.com','password12'),(10012,'example13@gmail.com','password13'),(10013,'example14@gmail.com','password14'),(10014,'example15@gmail.com','password15');
/*!40000 ALTER TABLE `UserCredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserProfile`
--

DROP TABLE IF EXISTS `UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserProfile` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `regDate` date DEFAULT NULL,
  `preferences` text,
  `availability` varchar(250) DEFAULT NULL,
  `userRole` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `UserCredentials` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProfile`
--

LOCK TABLES `UserProfile` WRITE;
/*!40000 ALTER TABLE `UserProfile` DISABLE KEYS */;
INSERT INTO `UserProfile` VALUES (10000,'user10000@example.com','Alice Jonhnson','admin','123 Elm St', '','Houston','Texas',62701,'2024-07-01','','',''),(10001,'user10001@example.com','Keanu Reeves','volunteer','456 Oak St','','Katy','Texas',62701,'2024-07-02','','',''),(10002,'user10002@example.com','Scarlett Johanson','volunteer','789 Pine St','','Pasedena','Texas',62701,'2024-07-03','','',''),(10003,'user10003@example.com','Ivy Cooper','admin','101 Maple St','','Spring','Texas',62701,'2024-07-04','','',''),(10004,'user10004@example.com','Bobby Singer','volunteer','202 Birch St','','Woodlands','Texas',62701,'2024-07-05','','',''),(10005,'user10005@example.com','Emily Jackson','admin','303 Cedar St','','Spring','Texas',62701,'2024-07-06','','',''),(10006,'user10006@example.com','Olivia Harris','volunteer','404 Fir St','','Cypress','Texas',62701,'2024-07-07','','',''),(10007,'user10007@example.com','Maryanne Scout','volunteer','505 Spruce St','','Sugar Land','Texas',62701,'2024-07-08','','',''),(10008,'user10008@example.com','Margaret Thatcher','admin','606 Willow St','','Conroe','Texas',62701,'2024-07-09','','',''),(10009,'user10009@example.com','Jessica Cliff','volunteer','707 Ash St','','Cinco Ranch','Texas',62701,'2024-07-10','','',''),(10010,'user10010@example.com','Marianna Lee','volunteer','808 Pine St','','Richmond','Texas',62701,'2024-07-11','','',''),(10011,'user10011@example.com','Dallas Winston','admin','909 Oak St','','Humble','Texas',62701,'2024-07-12','','',''),(10012,'user10012@example.com','Austin Miller','volunteer','1010 Elm St','','Channelview','Texas',62701,'2024-07-13','','',''),(10013,'user10013@example.com','Sunny King','admin','1111 Maple St','','Aldine','Texas',62701,'2024-07-14','','',''),(10014,'user10014@example.com','Darris Rogers','volunteer','1212 Cedar St','','Missouri City','Texas',62701,'2024-07-15','','','');
/*!40000 ALTER TABLE `UserProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vol_History`
--

DROP TABLE IF EXISTS `Vol_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vol_History` (
  `eventId` int NOT NULL,
  `userId` int NOT NULL,
  `hoursWorked` float DEFAULT NULL,
  `feedback` text,
  `perfomScore` float DEFAULT NULL,
  PRIMARY KEY (`eventId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `vol_history_fkey_1` FOREIGN KEY (`eventId`) REFERENCES `Event_details` (`eventId`),
  CONSTRAINT `vol_history_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Volunteers` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vol_History`
--

LOCK TABLES `Vol_History` WRITE;
/*!40000 ALTER TABLE `Vol_History` DISABLE KEYS */;
INSERT INTO `Vol_History` VALUES (11,10005,2,NULL,NULL),(12,10005,1.5,NULL,NULL),(12,10007,1.5,NULL,NULL),(25,10006,2,NULL,NULL),(25,10014,2,NULL,NULL);
/*!40000 ALTER TABLE `Vol_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Volunteers`
--

DROP TABLE IF EXISTS `Volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Volunteers` (
  `userId` int NOT NULL,
  `performScore` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `volunteers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `UserCredentials` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Volunteers`
--

LOCK TABLES `Volunteers` WRITE;
/*!40000 ALTER TABLE `Volunteers` DISABLE KEYS */;
INSERT INTO `Volunteers` VALUES (10005,NULL),(10006,NULL),(10007,NULL),(10008,NULL),(10009,NULL),(10010,NULL),(10011,NULL),(10012,NULL),(10013,NULL),(10014,NULL);
/*!40000 ALTER TABLE `Volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerSkills`
--

DROP TABLE IF EXISTS `VolunteerSkills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VolunteerSkills` (
  `volunteerId` int NOT NULL,
  `skillId` int NOT NULL,
  PRIMARY KEY (`volunteerId`,`skillId`),
  KEY `skillId` (`skillId`),
  CONSTRAINT `volunteerskills_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `Volunteers` (`userId`),
  CONSTRAINT `volunteerskills_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `Skills` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerSkills`
--

LOCK TABLES `VolunteerSkills` WRITE;
/*!40000 ALTER TABLE `VolunteerSkills` DISABLE KEYS */;
/*!40000 ALTER TABLE `VolunteerSkills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-26 22:36:14
