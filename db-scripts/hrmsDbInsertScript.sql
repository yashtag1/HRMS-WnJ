
-- -----------------------------------------------------
-- Data for table `hrms`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`employee` (`id`, `first_name`, `last_name`, `email_id`) VALUES (1, 'Admin', 'Admin', 'admin@aximsoft.com');

COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`user_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`user_role` (`id`, `name`) VALUES (1, 'ROLE_ADMIN');
INSERT INTO `hrms`.`user_role` (`id`, `name`) VALUES (2, 'ROLE_USER');

COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`user` (`id`, `username`, `password`, `enabled`, `role`, `emp`) VALUES (1, 'admin', 'admin', true, 1, 1 );

COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`blood_group`
-- -----------------------------------------------------

START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`blood_group` VALUES (1,'A +ve'),(2,'A -ve'),(3,'A1 -ve'),(4,'A1 +ve'),(5,'A1B -ve'),(6,'A1B +ve'),(7,'A2 -ve'),(8,'A2 +ve'),(9,'A2B -ve'),(10,'A2B +ve'),(11,'B -ve'),(12,'B +ve'),(13,'B1 -ve'),(14,'B1 +ve'),(15,'O -ve'),(16,'O +ve'),(17,'AB +ve'),(18,'AB +ve');
COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`education_type`
-- -----------------------------------------------------

START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`education_type` (`id`, `type`) VALUES (1, 'Full Time');
INSERT INTO `hrms`.`education_type` (`id`, `type`) VALUES (2, 'Part Time');
INSERT INTO `hrms`.`education_type` (`id`, `type`) VALUES (3, 'Correspondence/ Distance');

COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`country`
-- -----------------------------------------------------

START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`country` VALUES (1,'India'),(2,'USA');
COMMIT;


-- -----------------------------------------------------
-- Data for table `hrms`.`state`
-- -----------------------------------------------------

START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`state` VALUES (1,1,'Andhra Pradesh'),(2,1,'Arunachal Pradesh'),(3,1,'Assam'),(4,1,'Bihar'),(5,1,'Chhattisgarh'),(6,1,'Goa'),(7,1,'Gujarat'),(8,1,'Haryana'),(9,1,'Himachal Pradesh'),(10,1,'Jammu and Kashmir'),(11,1,'Jharkhand'),(12,1,'Karnataka'),(13,1,'Kerala'),(14,1,'Madhya Pradesh'),(15,1,'Maharashtra'),(16,1,'Manipur'),(17,1,'Meghalaya'),(18,1,'Mizoram'),(19,1,'Nagaland'),(20,1,'Orissa'),(21,1,'Punjab'),(22,1,'Rajasthan'),(23,1,'Sikkim'),(24,1,'Tamil Nadu'),(25,1,'Telangana'),(26,1,'Tripura'),(27,1,'Uttaranchal'),(28,1,'Uttar Pradesh'),(29,1,'West Bengal'),(30,1,'Andaman and Nicobar Islands'),(31,1,'Chandigarh'),(32,1,'Dadar and Nagar Haveli'),(33,1,'Daman and Diu'),(34,1,'Delhi'),(35,1,'Lakshadeep'),(36,1,'Pondicherry'),(37,2,'Alabama'),(38,2,'Alaska'),(39,2,'Arizona'),(40,2,'Arkansas'),(41,2,'California'),(42,2,'Colorado'),(43,2,'Connecticut'),(44,2,'Delaware'),(45,2,'Florida'),(46,2,'Georgia'),(47,2,'Hawaii'),(48,2,'Idaho'),(49,2,'Illinois'),(50,2,'Indiana'),(51,2,'Iowa'),(52,2,'Kansas'),(53,2,'Kentucky'),(54,2,'Louisiana'),(55,2,'Maine'),(56,2,'Maryland'),(57,2,'Massachusetts'),(58,2,'Michigan'),(59,2,'Minnesota'),(60,2,'Mississippi'),(61,2,'Missouri'),(62,2,'Montana'),(63,2,'Nebraska'),(64,2,'Nevada'),(65,2,'New Hampshire'),(66,2,'New Jersey'),(67,2,'New Mexico'),(68,2,'New York'),(69,2,'North Carolina'),(70,2,'North Dakota'),(71,2,'Ohio'),(72,2,'Oklahoma'),(73,2,'Oregon'),(74,2,'Pennsylvania'),(75,2,'Rhode Island'),(76,2,'South Carolina'),(77,2,'South Dakota'),(78,2,'Tennessee'),(79,2,'Texas'),(80,2,'Utah'),(81,2,'Vermont'),(82,2,'Virginia'),(83,2,'Washington'),(84,2,'West Virginia'),(85,2,'Wisconsin'),(86,2,'Wyoming');


-- -----------------------------------------------------
-- Data for table `hrms`.`benefit_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`benefit_category` VALUES ('1','Leave'),('2','Accessories');
COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`benefit_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`benefit_type` VALUES ('1','CL', '1', 'CASUAL LEAVE'),('2','SL', '1', 'SICK LEAVE'),('3','PL', '1', 'PATERNITY LEAVE'),('4','ML', '1', 'MATERNITY LEAVE'),('5','MOBILE', '2', 'MOBILE');
COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`benefit`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `hrms`.`benefit` VALUES ('1','1', '5',NULL, '1', '2014'),('2','2', '5',NULL, '1', '2014'),('3','3', '8',NULL, '1', '2014'),('4','4', '15',NULL, '1', '2014');
COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`band`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `band` VALUES (1,'Band1',NULL),(2,'Band2',NULL),(3,'Band3',NULL),(4,'Band4',NULL),(5,'Band5',NULL),(6,'Band6',NULL),(7,'Band7',NULL),(8,'Band8',NULL),(9,'Band9',NULL),(10,'Band10',NULL),(11,'Band11',NULL),(12,'Band12',NULL),(13,'Band13',NULL),(14,'Band14',NULL),(15,'Band15',NULL),(16,'Band16',NULL),(17,'Band17',NULL),(18,'Band18',NULL),(19,'Band19',NULL),(20,'Band20',NULL);
COMMIT;

-- -----------------------------------------------------
-- Data for table `hrms`.`leave_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `hrms`;
INSERT INTO `leave_status` VALUES (1,'Approved','Approved'),(2,'Pending','Pending'),(3,'Declined','Declined');
COMMIT;
