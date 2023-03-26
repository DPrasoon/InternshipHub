-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ihubdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminid` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin@123','123','Prasoon Dubey','admin123@ihub.co.in','05220522');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `contactid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `question` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
INSERT INTO `contactus` VALUES (1,'Aditya Pandey','apandey@gmail.com','9522952201','Hello ','2022-08-17'),(4,'Rohan Tiwari','rtiwari.624@rediffmail.com','875694231','How can a student login on this portal?','2022-08-20'),(5,'Shruti Chaurasiya','shruti.white.moon448@gmail.com','78561395','Please add my email to the job notification mail list.','2022-08-20');
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_ip`
--

DROP TABLE IF EXISTS `feedback_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_ip` (
  `feedbackid` int NOT NULL AUTO_INCREMENT,
  `providerid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `feedbacktext` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `providerid_idx` (`providerid`),
  CONSTRAINT `fk_providerid_fb` FOREIGN KEY (`providerid`) REFERENCES `providers` (`providerid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_ip`
--

LOCK TABLES `feedback_ip` WRITE;
/*!40000 ALTER TABLE `feedback_ip` DISABLE KEYS */;
INSERT INTO `feedback_ip` VALUES (1,'IP101','Manohar Kumar','mlal@gmail.com','2022-08-04','This IP is nice',5),(2,'IP101','Ajay Verma','aja142@gmail.com','2022-08-18','Nice Internships',4),(11,'IP103','Neha Sharma','neha432@gmail.com','2022-08-20','I think they are fraud. I paid them joining fees and they said, I did not.',5);
/*!40000 ALTER TABLE `feedback_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `jobid` int NOT NULL AUTO_INCREMENT,
  `employerid` varchar(45) NOT NULL,
  `postname` varchar(45) NOT NULL,
  `eligibility` varchar(45) NOT NULL,
  `noofseats` int NOT NULL,
  `lastdatetoapply` date NOT NULL,
  `postdate` date NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'IP101','Java Developer','Java Core + Java Advance',5,'2022-12-12','2022-08-19','We need a Java Full Stack developer with or without knowledge of Springboot'),(4,'IP102','System Admin','4 year experience in System Management',2,'2022-10-19','2022-08-20','We need a system admin for our backup server.'),(5,'IP102','Ethical Hacker','Experienced Penetration Tester',1,'2022-10-24','2022-08-20','Ethical hacker to perform VAPT'),(6,'IP102','Software Engineer','Basic knowledge of Software Development',40,'2022-09-10','2022-08-20','Working on end-to-end live projects'),(7,'IP101','Data Analyst','IBM certified Data Analyst Certificate',2,'2022-09-08','2022-08-20','To perform data analysis on our user data'),(8,'IP102','Python Developer','Python+Django',4,'2023-03-24','2023-03-26','Python Full Stack Developer with DJango'),(9,'IP101','Python Developer','Python(AI+ML)',1,'2023-03-31','2023-03-26','We need a Python student, who is well-versed in AI/ML');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `noticeid` int NOT NULL AUTO_INCREMENT,
  `providerid` varchar(45) NOT NULL,
  `noticetopic` varchar(100) NOT NULL,
  `noticecontents` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `fk_providerid_notice_idx` (`providerid`),
  CONSTRAINT `fk_providerid_notice` FOREIGN KEY (`providerid`) REFERENCES `providers` (`providerid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'IP101','Recruitment Drive','We are hosting a recruitment drive on 22-08-2022 at Indira Gandhi Pratisthan, Lucknow','2022-08-19'),(2,'IP101','Award Ceremony','For top performers in YEP training.','2022-08-19'),(3,'IP101','Job Hiring','job hiring in lucknow','2022-08-20'),(4,'IP104','Jobathon','Hiring','2022-11-17');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programdetails`
--

DROP TABLE IF EXISTS `programdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programdetails` (
  `providerid` varchar(45) NOT NULL,
  `programid` int NOT NULL AUTO_INCREMENT,
  `programname` varchar(100) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `fees` varchar(30) NOT NULL,
  `startdate` varchar(10) NOT NULL,
  `enddate` varchar(10) NOT NULL,
  `prerequisite` varchar(255) NOT NULL,
  `stipend` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`programid`),
  KEY `providerid_idx` (`providerid`),
  CONSTRAINT `fk_providerid_pd` FOREIGN KEY (`providerid`) REFERENCES `providers` (`providerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programdetails`
--

LOCK TABLES `programdetails` WRITE;
/*!40000 ALTER TABLE `programdetails` DISABLE KEYS */;
INSERT INTO `programdetails` VALUES ('IP104',3,'JS Internship','90 days','6000','03-12-22','03-02-2023','None','10000','MEVN Full Stack Developer','Noida');
/*!40000 ALTER TABLE `programdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `providerid` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `orgname` varchar(100) NOT NULL,
  `ownername` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `aboutorg` varchar(255) NOT NULL,
  PRIMARY KEY (`providerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES ('IP101','123','Precursor Info Tech','Prasoon Dubey','ip101@ihub.com','8756860444','Mahanagar','Lucknow','Web Development','Spread the joy of learning.'),('IP102','123','Microsoft','Bill Gates','bgates@msoft.com','64831597','NCR','Noida','Web Services','World\'s number 1 tech giant'),('IP103','123','Coincent Org','Vineet Garg','v.neet@coincent.com','946135782','Karnataka','Bengaluru','Consultancy Services','We help to deliver various services to other IT companies.'),('IP104','123','1stop','Himesh ','test@test.com','05220522','Mahanagar','Noida','Consultancy Services','World\'s number 1 tech giant');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 12:50:59
