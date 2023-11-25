CREATE DATABASE  IF NOT EXISTS `gh_location` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gh_location`;
-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: gh_locations
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_1_idx` (`region_id`),
  CONSTRAINT `fk_district_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Asunafo North Municipal',2),(2,'Asunafo South District',2),(3,'Asutifi North District',2),(4,'Asutifi South District',2),(5,'Tano North Municipal',2),(6,'Tano South Municipal',2),(7,'Adansi North District',1),(8,'Adansi South District',1),(9,'Afigya Kwabre District',1),(10,'Ahafo Ano North Municipal',1),(11,'Ahafo Ano South West District',1),(12,'Amansie Central District',1),(13,'Amansie West District',1),(14,'Asante Akim Central Municipal',1),(15,'Asante Akim North District',1),(16,'Asante Akim South Municipal',1),(17,'Asokore Mampong Municipal',1),(18,'Atwima Kwanwoma District',1),(19,'Atwima Mponua District',1),(20,'Atwima Nwabiagya Municipal',1),(21,'Bekwai Municipal',1),(22,'Bosome Freho District',1),(23,'Bosomtwe District',1),(24,'Ejisu Municipal',1),(25,'Ejura Sekyedumase Municipal',1),(26,'Kumasi Metropolitan',1),(27,'Kwabre East Municipal',1),(28,'Mampong Municipal ',1),(29,'Obuasi Municipal',1),(30,'Offinso Municipal',1),(31,'Offinso North District',1),(32,'Sekyere Afram Plains District',1),(33,'Sekyere Central District',1),(34,'Sekyere East District',1),(35,'Sekyere Kumawu District',1),(36,'Sekyere South District',1),(37,'Oforikrom Municipal',1),(38,'Kwadaso Municipal',1),(39,'Old Tafo Municipal',1),(40,'Asokwa Municipal',1),(41,'Suame Municipal',1),(42,'Juaben Municipal',1),(43,'Ahafo Ano South East District',1),(44,'Amansie South District',1),(45,'Atwima Nwabiagya North District',1),(46,'Akrofuom District',1),(47,'Adansi Asokwa District',1),(48,'Obuasi East District',1),(49,'Afigya Kwabre North District',1),(50,'Banda District',4),(51,'Berekum Municipal',4),(52,'Dormaa Central Municipal',4),(53,'Dormaa East District',4),(54,'Dormaa West District',4),(55,'Jaman North District',4),(56,'Jaman South Municipal',4),(57,'Sunyani Municipal',4),(58,'Sunyani West District',4),(59,'Tain District',4),(60,'Wenchi Municipal',4),(61,'Berekum West District',4),(62,'Atebubu Amantin Municipal',3),(63,'Kintampo North Municipal',3),(64,'Kintampo South District',3),(65,'Nkoranza South Municipal ',3),(66,'Nkoranza  North District',3),(67,'Pru East District',3),(68,'Sene East District',3),(69,'Sene West District',3),(70,'Techiman Municipal',3),(71,'Techiman North District',3),(72,'Pru West District',3),(73,'Abura Asebu Kwamankese District',5),(74,'Agona East District',5),(75,'Agona West Municipal',5),(76,'Ajumako Enyan Essiam District',5),(77,'Asikuma Odoben Brankwa District',5),(78,'Assin Central Municipal',5),(79,'Assin South District',5),(80,'Awutu Senya East Municipal',5),(81,'Awutu Senya West District',5),(82,'Cape Coast Metropolitan',5),(83,'Effutu Municipal',5),(84,'Ekumfi District',5),(85,'Gomoa Central District',5),(86,'Gomoa West District',5),(87,'Komenda Edina Eguafo Abirem Municipal',5),(88,'Mfantseman Municipal',5),(89,'Twifo Atti Morkwa District',5),(90,'Twifo Heman Lower Denkyira District',5),(91,'Upper Denkyira East Municipal',5),(92,'Upper Denkyira West District',5),(93,'Assin North District',5),(94,'Gomoa East District',5),(95,'Akuapem North Municipal',6),(96,'Akuapim South District',6),(97,'Akyemansa District',6),(98,'Asuogyaman District',6),(99,'Atiwa West District',6),(100,'Ayensuano District',6),(101,'Birim Central Municipal',6),(102,'Birim North District',6),(103,'Birim South District',6),(104,'Denkyembour District',6),(105,'Abuakwa South Municipal',6),(106,'Fanteakwa North District',6),(107,'Kwaebibirem Municipal',6),(108,'Kwahu Afram Plains North District',6),(109,'Kwahu Afram Plains South District',6),(110,'Kwahu East District',6),(111,'Kwahu South District',6),(112,'Kwahu West Municipal',6),(113,'Lower Manya Krobo Municipal',6),(114,'New Juaben South Municipal',6),(115,'Nsawam Adoagyiri Municipal',6),(116,'Suhum Municipal',6),(117,'Upper Manya Krobo District',6),(118,'Upper West Akim District',6),(119,'West Akim Municipal',6),(120,'Yilo Krobo Municipal',6),(121,'Okere District',6),(122,'Atiwa East District',6),(123,'Fanteakwa South District',6),(124,'Asene Manso Akroso District',6),(125,'Abuakwa North Municipal',6),(126,'New Juaben North Municipal',6),(127,'Achiase District',6),(128,'Accra Metropolitan',7),(129,'Ada West District',7),(130,'Ada East District',7),(131,'Adentan Municipal',7),(132,'Ashaiman Municipal',7),(133,'Ga Central Municipal',7),(134,'Ga South Municipal',7),(135,'Ga East Municipal',7),(136,'Ga West Municipal',7),(137,'La Dade Kotopon Municipal',7),(138,'Ledzekuku Municipal',7),(139,'La Nkwantanang Madina Municipal',7),(140,'Ningo Prampram District',7),(141,'Shai Osudoku District',7),(142,'Tema Metropolitan',7),(143,'Kpone Katamanso Municipal',7),(144,'Okaikwei North Municipal',7),(145,'Ablekuma North Municipal',7),(146,'Ablekuma West Municipal',7),(147,'Ayawaso East Municipal',7),(148,'Ayawaso North Municipal',7),(149,'Ayawaso West Municipal',7),(150,'Ga North Municipal',7),(151,'Weija Gbawe Municipal',7),(152,'Tema West Municipal',7),(153,'Krowor Municipal',7),(154,'Korle Klottey Municipal',7),(155,'Ablekuma Central Municipal',7),(156,'Ayawaso Central Municipal',7),(157,'Bunkpurugu Nyankpanduri District',9),(158,'Chereponi District',9),(159,'East Mamprusi Municipal',9),(160,'Mamprugu Moagduri District',9),(161,'West Mamprusi Municipal',9),(162,'Yunyoo-Nasuan District',9),(163,'Gushegu Municipal',10),(164,'Karaga District',10),(165,'Kpandai District',10),(166,'Kumbungu District',10),(167,'Mion District',10),(168,'Nanumba North Municipal',10),(169,'Nanumba South District',10),(170,'Saboba District',10),(171,'Sagnarigu Municipal',10),(172,'Savelugu Municipal',10),(173,'Tamale Metropolitan',10),(174,'Tatale/Sanguli District',10),(175,'Tolon District',10),(176,'Yendi Municipal',10),(177,'Zabzugu District',10),(178,'Nanton District',10),(179,'Biakoye District',14),(180,'Jasikan District',14),(181,'Kadjebi District',14),(182,'Krachi East Municipal',14),(183,'Krachi Nchumuru District',14),(184,'Krachi West District',14),(185,'Nkwanta North District',14),(186,'Nkwanta South Municipal',14),(187,'Bole District',8),(188,'Central Gonja District',8),(189,'East Gonja Municipal',8),(190,'North Gonja District',8),(191,'Sawla-Tuna-Kalba District',8),(192,'West Gonja District',8),(193,'North East Gonja District',8),(194,'Bawku Municipal',11),(195,'Bawku West District',11),(196,'Binduri District',11),(197,'Bolgatanga Municipal',11),(198,'Bongo District',11),(199,'Builsa North Municipal',11),(200,'Builsa South District',11),(201,'Garu District',11),(202,'Kassena Nankana Municipal',11),(203,'Kassena Nankana West District',11),(204,'Nabdam District',11),(205,'Pusiga District',11),(206,'Talensi District',11),(207,'Bolgatanga East District',11),(208,'Tempane District',11),(209,'Daffiama Bussie Issa District',12),(210,'Jirapa Municipal',12),(211,'Lambussie Karni District',12),(212,'Lawra Municipal',12),(213,'Nadowli Kaleo District',12),(214,'Nandom District',12),(215,'Sissala East Municipal',12),(216,'Sissala West District',12),(217,'Wa East District',12),(218,'Wa Municipal',12),(219,'Wa West District',12),(220,'Adaklu District',13),(221,'Afadzato South District',13),(222,'Agotime Ziope District',13),(223,'Akatsi North District',13),(224,'Akatsi South District',13),(225,'Central Tongu District',13),(226,'Ho Municipal',13),(227,'Ho West District',13),(228,'Hohoe Municipal',13),(229,'Keta Municipal',13),(230,'Ketu North Municipal',13),(231,'Ketu South Municipal',13),(232,'Kpando Municipal',13),(233,'North Dayi District',13),(234,'North Tongu District',13),(235,'South Dayi District',13),(236,'South Tongu District',13),(237,'Anloga District',13),(238,'Ahanta West Municipal',15),(239,'Amenfi Central District',15),(240,'Wassa Amenfi East Municipal',15),(241,'Amenfi West Municipal',15),(242,'Ellembelle District',15),(243,'Jomoro Municipal',15),(244,'Mpohor District',15),(245,'Nzema East Municipal',15),(246,'Prestea-Huni Valley Municipal',15),(247,'Sekondi Takoradi Metropolitan',15),(248,'Shama District',15),(249,'Tarkwa Nsuaem Municipal',15),(250,'Wassa East District',15),(251,'Effia Kwesimintsim Municipal',15),(252,'Aowin Municipal',16),(253,'Bia East District',16),(254,'Bia West District',16),(255,'Bibiani-Anhwiaso Bekwai Municipal',16),(256,'Bodi District',16),(257,'Juaboso District',16),(258,'Sefwi Akontombra District',16),(259,'Sefwi Wiawso Municipal',16),(260,'Suaman District',16);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int NOT NULL,
  `region_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Ashanti'),(2,'Ahafo'),(3,'Bono East'),(4,'Bono'),(5,'Central'),(6,'Eastern'),(7,'Greater Accra'),(8,'Savannah'),(9,'North East'),(10,'Northern'),(11,'Upper East'),(12,'Upper West'),(13,'Volta'),(14,'Oti'),(15,'Western'),(16,'Western North');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-02 22:30:34
