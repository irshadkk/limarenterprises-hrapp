-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: kabani
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `employee_salary_details`
--

DROP TABLE IF EXISTS `employee_salary_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_salary_details` (
  `employee_code` varchar(255) NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `basic` decimal(10,0) DEFAULT '0',
  `da` decimal(10,0) DEFAULT '0',
  `hra` decimal(10,0) DEFAULT '0',
  `total` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`employee_code`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_details`
--

LOCK TABLES `employee_salary_details` WRITE;
/*!40000 ALTER TABLE `employee_salary_details` DISABLE KEYS */;
INSERT INTO `employee_salary_details` VALUES ('1000',NULL,NULL,NULL,'ANSAD P',20068,9632,3300,33000),('1001',NULL,NULL,NULL,'Humayoon Kabeer',57047,27382,0,93810),('1002',NULL,NULL,NULL,'Pradeep kumar',17027,8173,2800,28000),('1003',NULL,NULL,NULL,'Aboobaker Sidique P M',17331,8319,0,28500),('1004',NULL,NULL,NULL,'Sajeer P',19155,9195,3150,31500),('1005',NULL,NULL,NULL,'Noushad Ali P',18243,8757,0,30000),('1006',NULL,NULL,NULL,'Jaison Joseph',21527,10333,0,35400),('1007',NULL,NULL,NULL,'Nidhin Roy ',10270,4930,0,15200),('1008',NULL,NULL,NULL,'Vishnu Babu',10676,5124,0,15800),('1009',NULL,NULL,NULL,'Abdul Yaser',13750,6600,0,20350),('1010',NULL,NULL,NULL,'Shanoj M K',27027,12973,0,40000),('1011',NULL,NULL,NULL,'Anu Joseph ',10270,4930,0,15200),('1012',NULL,NULL,NULL,'Bibin R',10811,5189,0,16000),('1013',NULL,NULL,NULL,'Jaimon.J.M',16892,8108,0,25000),('1014',NULL,NULL,NULL,'Sanoop K  S',12973,6227,0,19200),('1015',NULL,NULL,NULL,'Habeebulla A P',12162,5838,0,18000),('1016',NULL,NULL,NULL,'Preejith V R',10541,5059,0,15600),('1017',NULL,NULL,NULL,'Sabitha P K',10473,5027,0,15500),('1018',NULL,NULL,NULL,'Charun Kumar U K',16892,8108,0,28500),('1019',NULL,NULL,NULL,'Ismail K',12568,6032,0,18600),('1020',NULL,NULL,NULL,'Yohannan ',12162,5838,0,18000),('1021',NULL,NULL,NULL,'Lijo Samual ',12162,5838,0,18000),('1022',NULL,NULL,NULL,'Shejith V',15878,7622,0,23500),('1023',NULL,NULL,NULL,'Sreejith C',10811,5189,0,16000),('1024',NULL,NULL,NULL,'Sunny K S',7027,3373,0,10400),('1025',NULL,NULL,NULL,'Hassan Koya',8108,3892,0,12000),('1026',NULL,NULL,NULL,'Nafeesa',5270,2530,0,7800),('1027',NULL,NULL,NULL,'Raheem T M ',16892,8108,0,28500),('1028',NULL,NULL,NULL,'Rashid C P',10541,5059,0,15600),('1029',NULL,NULL,NULL,'Shihabudeen P',11216,5384,0,16600),('1030',NULL,NULL,NULL,'Pradeep kumar S',10541,5059,0,15600),('1031',NULL,NULL,NULL,'Jomis Sebastain ',10473,5027,0,15500),('1032',NULL,NULL,NULL,'Muhamed Adil C P',10203,4897,0,15100),('1033',NULL,NULL,NULL,'Shanavas S',11892,5708,0,17600),('1034',NULL,NULL,NULL,'ANEESH C',10541,5059,0,15600),('1035',NULL,NULL,NULL,'MANOJ KUMAR V',10541,5059,0,15600),('1036',NULL,NULL,NULL,'Muhammed Ashique T',11216,5384,0,16600),('1037',NULL,NULL,NULL,'Noushad  P T',8784,4216,0,13000),('1038',NULL,NULL,NULL,'Mohamed Naseer V P',10270,4930,0,15200),('1039',NULL,NULL,NULL,'Siyamudheen',15811,7589,0,26000),('1040',NULL,NULL,NULL,'Muhammed Riyas N A',10811,5189,0,16000),('1041',NULL,NULL,NULL,'Jabir K',10811,5189,0,16000),('1042',NULL,NULL,NULL,'Jurair Muhammed Koya',10811,5189,0,16000),('1043',NULL,NULL,NULL,'Ahammed Irshad',9662,4638,0,14300),('1044',NULL,NULL,NULL,'Noufal C U',10135,4865,0,15000),('1045',NULL,NULL,NULL,'Manoj K J',12838,6162,0,19000),('1046',NULL,NULL,NULL,'Subair P A',10811,5189,0,16000),('1047',NULL,NULL,NULL,'Sony CM',10811,5189,0,16000),('1048',NULL,NULL,NULL,'Sajeesh P Paul',10980,5270,0,16250),('1049',NULL,NULL,NULL,'Sajid Ali K',15541,7459,0,23000),('1050',NULL,NULL,NULL,'Shamseer C P',10811,5189,0,16000),('1051',NULL,NULL,NULL,'Abdul Azeez C P',8108,3892,0,12000),('1052',NULL,NULL,NULL,'Jancy Varghese',6419,3081,0,9500),('1053',NULL,NULL,NULL,'NASARUDEEN',10811,5189,0,16000),('1054',NULL,NULL,NULL,'PRAVEESH',9459,4541,0,14000),('1055',NULL,NULL,NULL,'BINOY',11824,5676,0,17500),('1056',NULL,NULL,NULL,'GAFOOR',10135,4865,0,15000),('1057',NULL,NULL,NULL,'ARUN',9459,4541,0,14000),('1058',NULL,NULL,NULL,'ANSHAD',6081,2919,0,9000),('1059',NULL,NULL,NULL,'HUNAIS',10135,4865,0,15000),('1060',NULL,NULL,NULL,'LATHEEF',20220,9705,0,33250),('1061',NULL,NULL,NULL,'MUSTHAFA',12500,6000,0,18500),('1062',NULL,NULL,NULL,'ABID',10135,4865,0,15000),('1063',NULL,NULL,NULL,'SAJEER',10811,5189,0,16000),('1064',NULL,NULL,NULL,'CHANDRAN',10135,4865,0,15000),('1065',NULL,NULL,NULL,'MUHAMMED',10811,5189,0,16000),('1066',NULL,NULL,NULL,'FAISAL',9459,4541,0,14000),('1067',NULL,NULL,NULL,'RAHEEM',9459,4541,0,14000),('1068',NULL,NULL,NULL,'Naveen Paul',10473,5027,0,15500),('1069',NULL,NULL,NULL,'Nithinraj',10473,5027,0,15500),('1070',NULL,NULL,NULL,'Mansoor',18243,8757,0,30000),('1071',NULL,NULL,NULL,'Latheef',10135,4865,0,15000),('1072',NULL,NULL,NULL,'Suhail',10135,4865,0,15000),('1073',NULL,NULL,NULL,'Majeed',10135,4865,0,15000),('1074',NULL,NULL,NULL,'Abin',9459,4541,0,14000),('1075',NULL,NULL,NULL,'Aslam',10135,4865,0,15000),('1076',NULL,NULL,NULL,'Mujeeb',9459,4541,0,14000),('1077',NULL,NULL,NULL,'Muhammed Fasil C T',9459,4541,0,14000),('1078',NULL,NULL,NULL,'Vineesh',8784,4216,0,13000),('1079',NULL,NULL,NULL,'RAHOOF',8784,4216,0,13000),('1080',NULL,NULL,NULL,'JITHIN',10811,5189,0,16000),('1081',NULL,NULL,NULL,'Harismon C K',12973,6227,0,19200),('1082',NULL,NULL,NULL,'Hakimsha',10135,4865,0,15000),('1083',NULL,NULL,NULL,'Rasheed ',10811,5189,0,16000),('1084',NULL,NULL,NULL,'Afsal K M',9459,4541,0,14000),('1085',NULL,NULL,NULL,'Jamshid T K',9459,4541,0,14000),('1086',NULL,NULL,NULL,'Shoukathali T K',9459,4541,0,14000),('1087',NULL,NULL,NULL,'Muhammed Akhinus',14865,7135,0,22000),('1088',NULL,NULL,NULL,'Ajil K R',9459,4541,0,14000),('1089',NULL,NULL,NULL,'Esha Thomas',6419,3081,0,9500),('1090',NULL,NULL,NULL,'Nissar  v',9459,4541,0,14000),('1091',NULL,NULL,NULL,'Muhammed',6757,3243,0,10000),('1092',NULL,NULL,NULL,'Nithin Raj T',9122,4378,0,13500),('1093',NULL,NULL,NULL,'Shafeeque',14865,7135,0,22000),('1094',NULL,NULL,NULL,'Sameer',11824,5676,0,17500),('1095',NULL,NULL,NULL,'Jithin',10811,5189,0,16000),('1096',NULL,NULL,NULL,'Saneesh',10811,5189,0,16000),('1097',NULL,NULL,NULL,'Janardhanan',8784,4216,0,13000),('1098',NULL,NULL,NULL,'Praveen',8784,4216,0,13000),('1099',NULL,NULL,NULL,'SUBIN',10811,5189,0,16000),('1100',NULL,NULL,NULL,'ANEESH',9459,4541,0,14000),('1101',NULL,NULL,NULL,'NIKHIL PV',10811,5189,0,16000),('1102',NULL,NULL,NULL,'SANTHOSH',10811,5189,0,16000),('1103',NULL,NULL,NULL,'RAFEEK KS',18243,8757,0,30000),('1104',NULL,NULL,NULL,'NOUSHAD VS',18176,8725,0,29890),('1105',NULL,NULL,NULL,'AKHIL SHIBU',6081,2919,0,9000),('1106',NULL,NULL,NULL,'ARUN T',8784,4216,0,13000),('1107',NULL,NULL,NULL,'RISVAN',10811,5189,0,16000),('1108',NULL,NULL,NULL,'JUBIN JOSEPH',9459,4541,0,14000),('1109',NULL,NULL,NULL,'SHANID',10811,5189,0,16000),('1110',NULL,NULL,NULL,'SHYAM',9459,4541,0,14000),('1111',NULL,NULL,NULL,'BINU EV',10811,5189,0,16000),('1112',NULL,NULL,NULL,'AMIR HISHAM',10811,5189,0,16000),('1113',NULL,NULL,NULL,'SHAMSUDHEEN',11486,5514,0,17000),('1114',NULL,NULL,NULL,'VIMAL',8784,4216,0,13000),('1115',NULL,NULL,NULL,'NISAR',9459,4541,0,14000),('1116',NULL,NULL,NULL,'NIHAL',9459,4541,0,14000),('1117',NULL,NULL,NULL,'YESHUDAS',9459,4541,0,14000),('1118',NULL,NULL,NULL,'MIDHUN',9459,4541,0,14000);
/*!40000 ALTER TABLE `employee_salary_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03  0:08:25
