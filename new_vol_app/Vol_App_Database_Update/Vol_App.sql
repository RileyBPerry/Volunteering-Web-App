-- MySQL dump 10.13  Distrib 8.0.39, for macos14 (arm64)
--
-- Host: localhost    Database: Vol_App
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
  `adminId` int NOT NULL,
  `orgName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  CONSTRAINT `fk_userIdA` FOREIGN KEY (`adminId`) REFERENCES `UserProfile` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES (1,'Houston Humane Society'),(2,'American Red Cross'),(3,'Books-For-All'),(4,'Houston Cleaner-Uppers'),(5,'Houston Food Bank'),(16,'Tech Innovators Inc.'),(17,'Green Future Foundation'),(18,'Community Health Network'),(19,'Urban Development Group'),(20,'Education for All Organization');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Availability`
--

DROP TABLE IF EXISTS `Availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Availability` (
  `availabilityId` int NOT NULL AUTO_INCREMENT,
  `volunteerId` int DEFAULT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `hour_slot` tinyint DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`availabilityId`),
  KEY `fk_volunteerId_A` (`volunteerId`),
  CONSTRAINT `fk_volunteerId_A` FOREIGN KEY (`volunteerId`) REFERENCES `Volunteers` (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Availability`
--

LOCK TABLES `Availability` WRITE;
/*!40000 ALTER TABLE `Availability` DISABLE KEYS */;
INSERT INTO `Availability` VALUES (1,21,'Monday',9,1),(2,21,'Monday',10,1),(3,21,'Monday',11,1),(4,21,'Tuesday',13,1),(5,21,'Tuesday',14,1),(6,21,'Tuesday',15,1),(7,21,'Saturday',10,1),(8,21,'Saturday',11,1),(9,21,'Saturday',12,1),(10,22,'Monday',8,1),(11,22,'Monday',9,1),(12,22,'Monday',10,1),(13,22,'Tuesday',14,1),(14,22,'Tuesday',15,1),(15,22,'Tuesday',16,1),(16,22,'Thursday',12,1),(17,22,'Thursday',13,1),(18,22,'Thursday',14,1),(19,23,'Tuesday',13,1),(20,23,'Tuesday',14,1),(21,23,'Tuesday',15,1),(22,23,'Wednesday',17,1),(23,23,'Wednesday',18,1),(24,23,'Wednesday',19,1),(25,23,'Saturday',12,1),(26,23,'Saturday',13,1),(27,23,'Saturday',14,1),(28,24,'Monday',9,1),(29,24,'Monday',10,1),(30,24,'Monday',11,1),(31,24,'Wednesday',14,1),(32,24,'Wednesday',15,1),(33,24,'Wednesday',16,1),(34,24,'Saturday',11,1),(35,24,'Saturday',12,1),(36,24,'Saturday',13,1),(37,25,'Wednesday',10,1),(38,25,'Wednesday',11,1),(39,25,'Wednesday',12,1),(40,25,'Thursday',12,1),(41,25,'Thursday',13,1),(42,25,'Thursday',14,1),(43,25,'Saturday',14,1),(44,25,'Saturday',15,1),(45,25,'Saturday',16,1),(46,26,'Monday',8,1),(47,26,'Monday',9,1),(48,26,'Monday',10,1),(49,26,'Thursday',14,1),(50,26,'Thursday',15,1),(51,26,'Thursday',16,1),(52,26,'Saturday',16,1),(53,26,'Saturday',17,1),(54,26,'Saturday',18,1),(55,27,'Tuesday',9,1),(56,27,'Tuesday',10,1),(57,27,'Tuesday',11,1),(58,27,'Wednesday',12,1),(59,27,'Wednesday',13,1),(60,27,'Wednesday',14,1),(61,27,'Saturday',13,1),(62,27,'Saturday',14,1),(63,27,'Saturday',15,1),(64,28,'Monday',10,1),(65,28,'Monday',11,1),(66,28,'Monday',12,1),(67,28,'Thursday',13,1),(68,28,'Thursday',14,1),(69,28,'Thursday',15,1),(70,28,'Saturday',11,1),(71,28,'Saturday',12,1),(72,28,'Saturday',13,1),(73,29,'Wednesday',14,1),(74,29,'Wednesday',15,1),(75,29,'Wednesday',16,1),(76,29,'Thursday',12,1),(77,29,'Thursday',13,1),(78,29,'Thursday',14,1),(79,29,'Saturday',15,1),(80,29,'Saturday',16,1),(81,29,'Saturday',17,1),(82,30,'Tuesday',11,1),(83,30,'Tuesday',12,1),(84,30,'Tuesday',13,1),(85,30,'Wednesday',16,1),(86,30,'Wednesday',17,1),(87,30,'Wednesday',18,1),(88,30,'Sunday',12,1),(89,30,'Sunday',13,1),(90,30,'Sunday',14,1),(91,6,'Monday',9,1),(92,6,'Monday',10,1),(93,6,'Monday',11,1),(94,6,'Monday',12,1),(95,6,'Monday',13,1),(96,6,'Wednesday',13,1),(97,6,'Wednesday',14,1),(98,6,'Wednesday',15,1),(99,6,'Wednesday',16,1),(100,7,'Tuesday',10,1),(101,7,'Tuesday',11,1),(102,7,'Tuesday',12,1),(103,7,'Tuesday',13,1),(104,7,'Tuesday',14,1),(105,7,'Thursday',14,1),(106,7,'Thursday',15,1),(107,7,'Thursday',16,1),(108,7,'Thursday',17,1),(109,8,'Monday',8,1),(110,8,'Monday',9,1),(111,8,'Monday',10,1),(112,8,'Monday',11,1),(113,8,'Monday',12,1),(114,8,'Friday',13,1),(115,8,'Friday',14,1),(116,8,'Friday',15,1),(117,8,'Friday',16,1),(118,8,'Friday',17,1),(119,9,'Wednesday',11,1),(120,9,'Wednesday',12,1),(121,9,'Wednesday',13,1),(122,9,'Wednesday',14,1),(123,9,'Wednesday',15,1),(124,9,'Saturday',14,1),(125,9,'Saturday',15,1),(126,9,'Saturday',16,1),(127,9,'Saturday',17,1),(128,9,'Saturday',18,1),(129,10,'Thursday',9,1),(130,10,'Thursday',10,1),(131,10,'Thursday',11,1),(132,10,'Thursday',12,1),(133,10,'Thursday',13,1),(134,10,'Sunday',10,1),(135,10,'Sunday',11,1),(136,10,'Sunday',12,1),(137,10,'Sunday',13,1),(138,10,'Sunday',14,1),(139,11,'Tuesday',12,1),(140,11,'Tuesday',13,1),(141,11,'Tuesday',14,1),(142,11,'Tuesday',15,1),(143,11,'Tuesday',16,1),(144,11,'Friday',10,1),(145,11,'Friday',11,1),(146,11,'Friday',12,1),(147,11,'Friday',13,1),(148,11,'Friday',14,1),(149,12,'Wednesday',9,1),(150,12,'Wednesday',10,1),(151,12,'Wednesday',11,1),(152,12,'Wednesday',12,1),(153,12,'Wednesday',13,1),(154,12,'Saturday',8,1),(155,12,'Saturday',9,1),(156,12,'Saturday',10,1),(157,12,'Saturday',11,1),(158,12,'Saturday',12,1),(159,13,'Monday',14,1),(160,13,'Monday',15,1),(161,13,'Monday',16,1),(162,13,'Monday',17,1),(163,13,'Monday',18,1),(164,13,'Thursday',13,1),(165,13,'Thursday',14,1),(166,13,'Thursday',15,1),(167,13,'Thursday',16,1),(168,13,'Thursday',17,1),(169,14,'Tuesday',8,1),(170,14,'Tuesday',9,1),(171,14,'Tuesday',10,1),(172,14,'Tuesday',11,1),(173,14,'Tuesday',12,1),(174,14,'Friday',14,1),(175,14,'Friday',15,1),(176,14,'Friday',16,1),(177,14,'Friday',17,1),(178,14,'Friday',18,1),(179,15,'Thursday',10,1),(180,15,'Thursday',11,1),(181,15,'Thursday',12,1),(182,15,'Thursday',13,1),(183,15,'Thursday',14,1),(184,15,'Sunday',13,1),(185,15,'Sunday',14,1),(186,15,'Sunday',15,1),(187,15,'Sunday',16,1),(188,15,'Sunday',17,1);
/*!40000 ALTER TABLE `Availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventDetails`
--

DROP TABLE IF EXISTS `EventDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventDetails` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `creatorId` int NOT NULL,
  `eventName` varchar(100) DEFAULT NULL,
  `eventDescription` text,
  `orgName` varchar(300) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `eventStartDate` date DEFAULT NULL,
  `eventEndDate` date DEFAULT NULL,
  `eventStartTime` time DEFAULT NULL,
  `eventEndTime` time DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `urgency` varchar(50) DEFAULT NULL,
  `spots` int DEFAULT NULL,
  `reqSkills` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `fk_adminId` (`creatorId`),
  CONSTRAINT `fk_adminId` FOREIGN KEY (`creatorId`) REFERENCES `Admins` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventDetails`
--

LOCK TABLES `EventDetails` WRITE;
/*!40000 ALTER TABLE `EventDetails` DISABLE KEYS */;
INSERT INTO `EventDetails` VALUES (1,1,'Pet Adoption Drive','Join us for a pet adoption event to find forever homes for cats and dogs.','Houston Humane Society','1234 Animal St, Houston, TX','2024-08-15','2024-08-15','09:00:00','13:00:00',4,'Medium',15,"art"),(2,2,'Blood Donation Camp','Donate blood and save lives. Open to all eligible donors.','American Red Cross','5678 Medical Blvd, Houston, TX','2024-08-20','2024-08-20','10:00:00','14:00:00',4,'High',20,'Admin'),(3,3,'Book Drive for Schools','Collecting books for underprivileged schools in the area.','Books-For-All','9101 Book Rd, Houston, TX','2024-08-25','2024-08-25','08:00:00','12:00:00',4,'Medium',10,'Engineering'),(4,4,'Community Cleanup','Help clean up local parks and streets. Bring your own gloves!','Houston Cleaner-Uppers','7890 Park Ave, Houston, TX','2024-09-05','2024-09-05','07:00:00','11:00:00',4,'Low',20,'Finance'),(5,5,'Food Distribution Event','Distributing food to those in need in our community.','Houston Food Bank','3456 Food St, Houston, TX','2024-09-10','2024-09-10','14:00:00','18:00:00',4,'High',18,'Food Service & Events'),(6,16,'Tech for Good Hackathon','A hackathon focused on solving community issues through technology.','Tech Innovators Inc.','1234 Tech Lane, Houston, TX','2024-08-18','2024-08-18','09:00:00','17:00:00',8,'High',20,'Interactive & Web Development'),(7,17,'Sustainability Workshop','Learn about sustainable practices and how to implement them.','Green Future Foundation','5678 Green St, Houston, TX','2024-09-12','2024-09-12','10:00:00','13:00:00',3,'Medium',12,'Business & Management'),(8,18,'Health Awareness Fair','A fair to promote health awareness and provide free health checkups.','Community Health Network','9101 Health Blvd, Houston, TX','2024-09-18','2024-09-18','09:00:00','14:00:00',5,'Medium',20,'Legal & Advocacy'),(9,19,'Urban Planning Forum','Discussing urban planning initiatives for the future of Houston.','Urban Development Group','7890 Urban St, Houston, TX','2024-09-22','2024-09-22','10:00:00','12:00:00',2,'Low',15,'Transportation'),(10,20,'Education Seminar','A seminar focused on the importance of education for all.','Education for All Organization','3456 Education Ln, Houston, TX','2024-09-30','2024-09-30','11:00:00','15:00:00',4,'High',20,'Performing Arts');
/*!40000 ALTER TABLE `EventDetails` ENABLE KEYS */;
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
  KEY `fk_skillId_ES` (`skillId`),
  CONSTRAINT `fk_eventId_ES` FOREIGN KEY (`eventId`) REFERENCES `EventDetails` (`eventId`),
  CONSTRAINT `fk_skillId_ES` FOREIGN KEY (`skillId`) REFERENCES `Skills` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventSkills`
--

LOCK TABLES `EventSkills` WRITE;
/*!40000 ALTER TABLE `EventSkills` DISABLE KEYS */;
INSERT INTO `EventSkills` VALUES (3,2),(1,3),(1,6),(6,7),(2,8),(3,9),(10,9),(9,10),(8,11),(1,12),(5,12),(2,13),(5,13),(8,13),(4,15),(7,16),(6,17),(2,18),(4,18),(5,18),(7,18),(8,18),(9,18),(10,18),(7,19),(6,20),(3,21),(10,21),(4,25),(9,25);
/*!40000 ALTER TABLE `EventSkills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventVolunteers`
--

DROP TABLE IF EXISTS `EventVolunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventVolunteers` (
  `eventId` int NOT NULL,
  `volunteerId` int NOT NULL,
  `approvalStatus` enum('Pending','Approved','Rejected') DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  PRIMARY KEY (`eventId`,`volunteerId`),
  KEY `fk_volunteerId_EV` (`volunteerId`),
  CONSTRAINT `fk_eventId_EV` FOREIGN KEY (`eventId`) REFERENCES `EventDetails` (`eventId`),
  CONSTRAINT `fk_volunteerId_EV` FOREIGN KEY (`volunteerId`) REFERENCES `Volunteers` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventVolunteers`
--

LOCK TABLES `EventVolunteers` WRITE;
/*!40000 ALTER TABLE `EventVolunteers` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventVolunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notifications` (
  `notificationId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `eventId` int DEFAULT NULL,
  `volunteerId` int DEFAULT NULL,
  `adminId` int DEFAULT NULL,
  `message` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notificationId`),
  KEY `fk_userId_N` (`userId`),
  KEY `fk_eventId_N` (`eventId`),
  KEY `fk_volunteerId_N` (`volunteerId`),
  KEY `fk_adminId_N` (`adminId`),
  CONSTRAINT `fk_adminId_N` FOREIGN KEY (`adminId`) REFERENCES `Admins` (`adminId`),
  CONSTRAINT `fk_eventId_N` FOREIGN KEY (`eventId`) REFERENCES `EventDetails` (`eventId`),
  CONSTRAINT `fk_userId_N` FOREIGN KEY (`userId`) REFERENCES `UserProfile` (`userId`),
  CONSTRAINT `fk_volunteerId_N` FOREIGN KEY (`volunteerId`) REFERENCES `Volunteers` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skills`
--

DROP TABLE IF EXISTS `Skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Skills` (
  `skillId` int NOT NULL AUTO_INCREMENT,
  `skillName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`skillId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skills`
--

LOCK TABLES `Skills` WRITE;
/*!40000 ALTER TABLE `Skills` DISABLE KEYS */;
INSERT INTO `Skills` VALUES (1,'Academics'),(2,'Administrative & Clerical'),(3,'Animals & Environment'),(4,'Arts'),(5,'Business & Management'),(6,'Children & Family'),(7,'Computer & IT'),(8,'Disaster Relief'),(9,'Education & Literacy'),(10,'Engineering'),(11,'Finance'),(12,'Food Service & Events'),(13,'Healthcare & Social Services'),(14,'Hobbies & Crafts'),(15,'Housing & Facilities'),(16,'HR'),(17,'Interactive & Web Development'),(18,'Interpersonal'),(19,'Language & Culture'),(20,'Legal & Advocacy'),(21,'Marketing & Communications'),(22,'Music'),(23,'Performing Arts'),(24,'Sports & Recreation'),(25,'Trades'),(26,'Transportation');
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
  `pssword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserCredentials`
--

LOCK TABLES `UserCredentials` WRITE;
/*!40000 ALTER TABLE `UserCredentials` DISABLE KEYS */;
INSERT INTO `UserCredentials` VALUES (1,'example1@gmail.com','Password123!'),(2,'example2@gmail.com','SecurePass!456'),(3,'example3@gmail.com','MyP@ssw0rd'),(4,'example4@gmail.com','Passw0rd!789'),(5,'example5@gmail.com','Passwords14#'),(6,'example6@gmail.com','Idontknow987&'),(7,'example7@gmail.com','HelP@2024'),(8,'example8@gmail.com','Charity$123'),(9,'example9@gmail.com','Qwerty135&'),(10,'example10@gmail.com','Olympics2024!'),(11,'example11@gmail.com','SecureP@ss90'),(12,'example12@gmail.com','TrustyP@ss12'),(13,'example13@gmail.com','Guard!an23'),(14,'example14@gmail.com','Prot3ct#456'),(15,'example15@gmail.com','Sh1eld@789'),(16,'example16@gmail.com','sunshine1!'),(17,'example17@gmail.com','blueberry2024'),(18,'example18@gmail.com','rainbow$2'),(19,'example19@gmail.com','p@ssword1234'),(20,'example20@gmail.com','welcome$2024'),(21,'example21@gmail.com','cryptic9!'),(22,'example22@gmail.com','secure*pass1'),(23,'example23@gmail.com','fastcar2024'),(24,'example24@gmail.com','myp@ssw0rd'),(25,'example25@gmail.com','newpass*2024'),(26,'example26@gmail.com','coffeeLover2024'),(27,'example27@gmail.com','mountain$peak'),(28,'example28@gmail.com','summerVibes1!'),(29,'example29@gmail.com','techGuru$2024'),(30,'example30@gmail.com','happyDance99!');
/*!40000 ALTER TABLE `UserCredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserProfile`
--

DROP TABLE IF EXISTS `UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserProfile` (
  `userId` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `userRole` varchar(50) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `UserCredentials` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProfile`
--

LOCK TABLES `UserProfile` WRITE;
/*!40000 ALTER TABLE `UserProfile` DISABLE KEYS */;
INSERT INTO `UserProfile` VALUES
(1,'jdoe@example.com','John Doe','Admin','123 Main St','','Houston','Texas',77001,'Computer & IT',''),
(2,'asmith@example.com','Alice Smith','Admin','456 Oak St','','Sugar Land','Texas',77479,'Education & Literacy',''),
(3,'eclark@example.com','Eva Clark','Admin','987 Cedar St','','Cypress','Texas',77433,'Healthcare & Social Services',''),
(4,'kmorgan@example.com','Kelly Morgan','Admin','753 Dogwood St','','Missouri City','Texas',77489,'Business & Management',''),
(5,'jones@example.com','Jordan Jones','Admin','852 Redwood St','','Pasadena','Texas',77506,'Marketing & Communications',''),
(6,'bjohnson@example.com','Bob Johnson','Volunteer','789 Pine St','','Spring','Texas',77373,'Interactive & Web Development',''),
(7,'dwilson@example.com','David Wilson','Volunteer','654 Maple St','','Katy','Texas',77494,'Hobbies & Crafts',''),
(8,'fthomas@example.com','Frank Thomas','Volunteer','159 Birch St','','Tomball','Texas',77375,'Performing Arts',''),
(9,'hharris@example.com','Henry Harris','Volunteer','951 Ash St','','Houston','Texas',77002,'Sports & Recreation',''),
(10,'ijones@example.com','Ivy Jones','Volunteer','852 Redwood St','','Sugar Land','Texas',77478,'Language & Culture',''),
(11,'jmartin@example.com','Jack Martin','Volunteer','654 Spruce St','','Spring','Texas',77379,'Disaster Relief',''),
(12,'lreyes@example.com','Leo Reyes','Volunteer','159 Palm St','','Katy','Texas',77450,'Arts',''),
(13,'mlopez@example.com','Mona Lopez','Volunteer','321 Poplar St','','Cypress','Texas',77429,'Transportation',''),
(14,'nking@example.com','Nina King','Volunteer','456 Cherry St','','Tomball','Texas',77377,'Legal & Advocacy',''),
(15,'omartin@example.com','Olivia Martin','Volunteer','753 Willow St','','Pasadena','Texas',77505,'Trades',''),
(16,'james.smith@example.com','James Smith','Admin','123 Maple St','','Sugar Land','Texas',77479,'HR',''),
(17,'lisa.johnson@example.com','Lisa Johnson','Admin','456 Oak Ave','','Spring','Texas',77386,'Finance',''),
(18,'michael.brown@example.com','Michael Brown','Admin','789 Pine Rd','','Houston','Texas',77001,'Food Service & Events',''),
(19,'emily.wilson@example.com','Emily Wilson','Admin','101 Birch Blvd','','Katy','Texas',77450,'Academics',''),
(20,'daniel.martinez@example.com','Daniel Martinez','Admin','202 Cedar Ln','','Cypress','Texas',77433,'Animals & Environment',''),
(21,'alex.thompson@example.com','Alex Thompson','Volunteer','303 Elm St','','Tomball','Texas',77375,'Legal & Advocacy',''),
(22,'samantha.miller@example.com','Samantha Miller','Volunteer','404 Willow Dr','','Missouri City','Texas',77459,'Music',''),
(23,'joshua.anderson@example.com','Joshua Anderson','Volunteer','505 Maple Ave','','Pasadena','Texas',77506,'Housing & Facilities',''),
(24,'natalie.carter@example.com','Natalie Carter','Volunteer','606 Birch St','','Spring','Texas',77373,'Administrative & Clerical',''),
(25,'ryan.jackson@example.com','Ryan Jackson','Volunteer','707 Cedar Ln','','Houston','Texas',77002,'Computer & IT',''),
(26,'olivia.wright@example.com','Olivia Wright','Volunteer','808 Oak Blvd','','Cypress','Texas',77429,'Food Service & Events',''),
(27,'matthew.lee@example.com','Matthew Lee','Volunteer','909 Pine Rd','','Katy','Texas',77494,'Healthcare & Social Services',''),
(28,'emma.harris@example.com','Emma Harris','Volunteer','1010 Elm St','','Sugar Land','Texas',77478,'Performing Arts',''),
(29,'jacob.martin@example.com','Jacob Martin','Volunteer','1111 Willow Ave','','Missouri City','Texas',77459,'Arts',''),
(30,'isabella.hernandez@example.com','Isabella Hernandez','Volunteer','1212 Maple Dr','','Tomball','Texas',77375,'Sports & Recreation','');
/*!40000 ALTER TABLE `UserProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VolunteerEvents`
--

DROP TABLE IF EXISTS `VolunteerEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VolunteerEvents` (
  `eventId` int NOT NULL,
  `volunteerId` int NOT NULL,
  `eventStatus` enum('Signed Up','Recommended','Upcoming','Completed') DEFAULT NULL,
  `hoursWorked` float DEFAULT NULL,
  `feeback` text,
  `performanceScore` float DEFAULT NULL,
  PRIMARY KEY (`eventId`,`volunteerId`),
  KEY `fk_volunteerId_VE` (`volunteerId`),
  CONSTRAINT `fk_eventId_VE` FOREIGN KEY (`eventId`) REFERENCES `EventDetails` (`eventId`),
  CONSTRAINT `fk_volunteerId_VE` FOREIGN KEY (`volunteerId`) REFERENCES `Volunteers` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerEvents`
--

LOCK TABLES `VolunteerEvents` WRITE;
/*!40000 ALTER TABLE `VolunteerEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `VolunteerEvents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notify_admin_signup` AFTER UPDATE ON `volunteerevents` FOR EACH ROW BEGIN
		IF OLD.eventStatus != "Signed Up" AND NEW.eventStatus = "Signed Up" THEN
			INSERT INTO Notifications (userId, eventId, message)
            VALUES
            (
            (SELECT creatorId
			 From EventDetails
             where eventId = NEW.eventId),
             NEW.eventId,
             CONCAT ("A volunteer has signed up for ", (SELECT eventName from EventDetails Where eventId = NEW.eventId))
             );
			END IF;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `send_to_vol_matching` AFTER UPDATE ON `volunteerevents` FOR EACH ROW BEGIN
		IF OLD.eventStatus != 'Signed Up' AND NEW.eventStatus = 'Signed Up' THEN
			INSERT INTO EventVolunteers (eventId, volunteerId, approvalStatus, signupDate)
            Values (
			new.eventId,
            new.volunteerId,
            'Pending',
            NOW()
            );
			END IF;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notify_vol_of_approval` AFTER UPDATE ON `volunteerevents` FOR EACH ROW BEGIN 
	IF NEW.eventStatus = 'Upcoming' THEN
		INSERT INTO Notifications (userId, eventId, message, `timestamp`)
        VALUES(
				new.volunteerId,
                NEW.eventId,
                CONCAT('You have been approved to volunteer at ', 
                (SELECT eventName
                FROM EventDetails
                WHERE eventId = NEW.eventId),'!', 
                NOW())
        );
    END IF;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reduce_spots` AFTER UPDATE ON `volunteerevents` FOR EACH ROW BEGIN
    -- Check if the eventStatus was updated to 'Upcoming'
    IF NEW.eventStatus = 'Upcoming' THEN
        UPDATE EventDetails 
        SET spots = CASE 
                        WHEN spots > 0 THEN spots - 1
                        ELSE 0
                    END
        WHERE eventId = NEW.eventId;
    END IF;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notify_vol_on_update` AFTER UPDATE ON `volunteerevents` FOR EACH ROW BEGIN
	INSERT INTO Notifications (userId, eventId, message, `timestamp`)
    VALUES(
    New.volunteerId, 
    new.eventId,
    CONCAT('There has been an update to event ', 
		(SELECT eventName
        FROM EventDetails
        Where eventId = NEW.eventId))
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calculate_hours_worked` AFTER UPDATE ON `volunteerevents` FOR EACH ROW BEGIN
    -- Check if the event status was updated to 'Completed'
    IF OLD.eventStatus != 'Completed' AND NEW.eventStatus = 'Completed' THEN
        -- Create a temporary table to store calculated hours
        CREATE TEMPORARY TABLE IF NOT EXISTS OverlappedHours AS
        SELECT 
            ve.volunteerId,
            ve.eventId,
            GREATEST(a.availStart, HOUR(e.eventStart)) AS overlapStart,
            LEAST(a.availEnd, HOUR(e.eventEnd)) AS overlapEnd
        FROM 
            VolunteerEvents ve
        JOIN 
            EventDetails e ON ve.eventId = e.eventId
        JOIN 
            Availability a ON ve.volunteerId = a.volunteerId
        WHERE 
            ve.eventId = NEW.eventId
            AND a.day = DAYNAME(e.eventDate)
            AND a.availStart <= HOUR(e.eventEnd)
            AND a.availEnd >= HOUR(e.eventStart);

        -- Calculate the hoursWorked for each volunteer
        UPDATE VolunteerEvents ve
        JOIN OverlappedHours oh ON ve.volunteerId = oh.volunteerId AND ve.eventId = oh.eventId
        SET ve.hoursWorked = IF(oh.overlapEnd > oh.overlapStart, oh.overlapEnd - oh.overlapStart, 0)
        WHERE ve.eventId = NEW.eventId;

        -- Drop the temporary table after use
        DROP TEMPORARY TABLE IF EXISTS OverlappedHours;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Volunteers`
--

DROP TABLE IF EXISTS `Volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Volunteers` (
  `volunteerId` int NOT NULL,
  PRIMARY KEY (`volunteerId`),
  CONSTRAINT `fk_userIdV` FOREIGN KEY (`volunteerId`) REFERENCES `UserProfile` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Volunteers`
--

LOCK TABLES `Volunteers` WRITE;
/*!40000 ALTER TABLE `Volunteers` DISABLE KEYS */;
INSERT INTO `Volunteers` VALUES (6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
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
  KEY `fk_skillId_VS` (`skillId`),
  CONSTRAINT `fk_skillId_VS` FOREIGN KEY (`skillId`) REFERENCES `Skills` (`skillId`),
  CONSTRAINT `fk_volunteerId_VS` FOREIGN KEY (`volunteerId`) REFERENCES `Volunteers` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerSkills`
--

LOCK TABLES `VolunteerSkills` WRITE;
/*!40000 ALTER TABLE `VolunteerSkills` DISABLE KEYS */;
INSERT INTO `VolunteerSkills` VALUES (6,1),(13,1),(27,1),(6,2),(14,2),(27,2),(6,3),(14,3),(27,3),(6,4),(14,4),(28,4),(7,5),(15,5),(28,5),(7,6),(15,6),(28,6),(7,7),(15,7),(29,7),(8,8),(21,8),(29,8),(8,9),(21,9),(29,9),(8,10),(21,10),(30,10),(8,11),(21,11),(30,11),(9,12),(22,12),(30,12),(9,13),(22,13),(9,14),(22,14),(10,15),(23,15),(10,16),(23,16),(10,17),(23,17),(11,18),(24,18),(11,19),(24,19),(11,20),(24,20),(11,21),(25,21),(12,22),(25,22),(12,23),(25,23),(12,24),(26,24),(13,25),(26,25),(13,26),(26,26);
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

-- Dump completed on 2024-08-09  5:58:14
