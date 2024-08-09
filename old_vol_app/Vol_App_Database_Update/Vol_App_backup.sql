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
-- Table structure for table `EventDetails`
--

DROP TABLE IF EXISTS `EventDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventDetails` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `creatorId` int DEFAULT NULL,
  `eventName` varchar(100) DEFAULT NULL,
  `eventDescription` text,
  `orgName` varchar(100) DEFAULT NULL,
  `location` text,
  `eventStartDate` date DEFAULT NULL,
  `eventStartTime` time DEFAULT NULL,
  `eventEndDate` date DEFAULT NULL,
  `eventEndTime` time DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `spots` int DEFAULT NULL,
  `reqSkills` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `creatorId` (`creatorId`),
  CONSTRAINT `eventdetails_ibfk_1` FOREIGN KEY (`creatorId`) REFERENCES `Admins` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventDetails`
--

LOCK TABLES `EventDetails` WRITE;
/*!40000 ALTER TABLE `EventDetails` DISABLE KEYS */;
INSERT INTO `EventDetails` VALUES (1,1,'Pet Adoption Drive','Join us for a pet adoption event to find forever homes for cats and dogs.','Houston Humane Society','1234 Animal St, Houston, TX','2024-08-15','2024-08-15','09:00:00','13:00:00',4,'Medium',15,'Arts'),
(2,2,'Blood Donation Camp','Donate blood and save lives. Open to all eligible donors.','American Red Cross','5678 Medical Blvd, Houston, TX','2024-08-20','2024-08-20','10:00:00','14:00:00',4,'High',20,'Administrative & Clerical'),
(3,3,'Book Drive for Schools','Collecting books for underprivileged schools in the area.','Books-For-All','9101 Book Rd, Houston, TX','2024-08-25','2024-08-25','08:00:00','12:00:00',4,'Medium',10,'Engineering'),
(4,4,'Community Cleanup','Help clean up local parks and streets. Bring your own gloves!','Houston Cleaner-Uppers','7890 Park Ave, Houston, TX','2024-09-05','2024-09-05','07:00:00','11:00:00',4,'Low',20,'Finance'),
(5,5,'Food Distribution Event','Distributing food to those in need in our community.','Houston Food Bank','3456 Food St, Houston, TX','2024-09-10','2024-09-10','14:00:00','18:00:00',4,'High',18,'Food Service & Events'),
(6,16,'Tech for Good Hackathon','A hackathon focused on solving community issues through technology.','Tech Innovators Inc.','1234 Tech Lane, Houston, TX','2024-08-18','2024-08-18','09:00:00','17:00:00',8,'High',20,'Interactive & Web Development'),
(7,17,'Sustainability Workshop','Learn about sustainable practices and how to implement them.','Green Future Foundation','5678 Green St, Houston, TX','2024-09-12','2024-09-12','10:00:00','13:00:00',3,'Medium',12,'Business & Management'),
(8,18,'Health Awareness Fair','A fair to promote health awareness and provide free health checkups.','Community Health Network','9101 Health Blvd, Houston, TX','2024-09-18','2024-09-18','09:00:00','14:00:00',5,'Medium',20,'Legal & Advocacy'),
(9,19,'Urban Planning Forum','Discussing urban planning initiatives for the future of Houston.','Urban Development Group','7890 Urban St, Houston, TX','2024-09-22','2024-09-22','10:00:00','12:00:00',2,'Low',15,'Transportation'),
(10,20,'Education Seminar','A seminar focused on the importance of education for all.','Education for All Organization','3456 Education Ln, Houston, TX','2024-09-30','2024-09-30','11:00:00','15:00:00',4,'High',20,'Performing Arts');
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
  KEY `skillId` (`skillId`),
  CONSTRAINT `eventskills_fkey_1` FOREIGN KEY (`eventId`) REFERENCES `EventDetails` (`eventId`),
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
INSERT INTO UserProfile (userId, email, fullName, skills, address1, address2, city, state, zipcode, regDate, preferences, availability, userRole) VALUES
(1,'jdoe@example.com','John Doe','Computer & IT','123 Main St','','Houston','Texas',77001,'2024-08-01','', 'Monday 7:00am to 9:00am', 'Admin'),
(2,'asmith@example.com','Alice Smith','Education & Literacy','456 Oak St','','Sugar Land','Texas',77479,'2024-08-02','', 'Tuesday 12:00pm to 4:00pm', 'Admin'),
(3,'eclark@example.com','Eva Clark','Healthcare & Social Services','987 Cedar St','','Cypress','Texas',77433,'2024-08-03','', 'Wednesday 10:00am to 12:00pm', 'Admin'),
(4,'kmorgan@example.com','Kelly Morgan','Business & Management','753 Dogwood St','','Missouri City','Texas',77489,'2024-08-04','', 'Thursday 1:00pm to 5:00pm', 'Admin'),
(5,'jones@example.com','Jordan Jones','Marketing & Communications','852 Redwood St','','Pasadena','Texas',77506,'2024-08-05','', 'Friday 9:00am to 11:00am', 'Admin'),
(6,'bjohnson@example.com','Bob Johnson','Interactive & Web Development','789 Pine St','','Spring','Texas',77373,'2024-08-06','', 'Monday 2:00pm to 6:00pm', 'Volunteer'),
(7,'dwilson@example.com','David Wilson','Hobbies & Crafts','654 Maple St','','Katy','Texas',77494,'2024-08-07','', 'Tuesday 8:00am to 10:00am', 'Volunteer'),
(8,'fthomas@example.com','Frank Thomas','Performing Arts','159 Birch St','','Tomball','Texas',77375,'2024-08-08','', 'Wednesday 3:00pm to 7:00pm', 'Volunteer'),
(9,'hharris@example.com','Henry Harris','Sports & Recreation','951 Ash St','','Houston','Texas',77002,'2024-08-09','', 'Thursday 9:00am to 11:00am', 'Volunteer'),
(10,'ijones@example.com','Ivy Jones','Language & Culture','852 Redwood St','','Sugar Land','Texas',77478,'2024-08-10','', 'Friday 12:00pm to 2:00pm', 'Volunteer'),
(11,'jmartin@example.com','Jack Martin','Disaster Relief','654 Spruce St','','Spring','Texas',77379,'2024-08-11','', 'Monday 10:00am to 12:00pm', 'Volunteer'),
(12,'lreyes@example.com','Leo Reyes','Arts','159 Palm St','','Katy','Texas',77450,'2024-08-12','', 'Tuesday 3:00pm to 5:00pm', 'Volunteer'),
(13,'mlopez@example.com','Mona Lopez','Transportation','321 Poplar St','','Cypress','Texas',77429,'2024-08-13','', 'Wednesday 9:00am to 11:00am', 'Volunteer'),
(14,'nking@example.com','Nina King','Legal & Advocacy','456 Cherry St','','Tomball','Texas',77377,'2024-08-14','', 'Thursday 2:00pm to 4:00pm', 'Volunteer'),
(15,'omartin@example.com','Olivia Martin','Trades','753 Willow St','','Pasadena','Texas',77505,'2024-08-15','', 'Friday 7:00am to 9:00am', 'Volunteer'),
(16,'james.smith@example.com','James Smith','HR','123 Maple St','','Sugar Land','Texas',77479,'2024-08-16','', 'Monday 8:00am to 10:00am', 'Admin'),
(17,'lisa.johnson@example.com','Lisa Johnson','Finance','456 Oak Ave','','Spring','Texas',77386,'2024-08-17','', 'Tuesday 1:00pm to 3:00pm', 'Admin'),
(18,'michael.brown@example.com','Michael Brown','Food Service & Events','789 Pine Rd','','Houston','Texas',77001,'2024-08-18','', 'Wednesday 11:00am to 1:00pm', 'Admin'),
(19,'emily.wilson@example.com','Emily Wilson','Academics','101 Birch Blvd','','Katy','Texas',77450,'2024-08-19','', 'Thursday 4:00pm to 6:00pm', 'Admin');
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
  `userId` int NOT NULL,
  `hoursWorked` float DEFAULT NULL,
  `feedback` text,
  `perfomScore` float DEFAULT NULL,
  PRIMARY KEY (`eventId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Volunteer_Events_fkey_1` FOREIGN KEY (`eventId`) REFERENCES `EventDetails` (`eventId`),
  CONSTRAINT `Volunteer_Events_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Volunteers` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VolunteerEvents`
--

LOCK TABLES `VolunteerEvents` WRITE;
/*!40000 ALTER TABLE `VolunteerEvents` DISABLE KEYS */;
INSERT INTO `VolunteerEvents` VALUES (11,10005,2,NULL,NULL),(12,10005,1.5,NULL,NULL),(12,10007,1.5,NULL,NULL),(25,10006,2,NULL,NULL),(25,10014,2,NULL,NULL);
/*!40000 ALTER TABLE `VolunteerEvents` ENABLE KEYS */;
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
