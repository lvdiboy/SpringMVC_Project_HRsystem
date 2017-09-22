# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.9)
# Database: dept_emp_proj
# Generation Time: 2017-08-03 19:30:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `code`;

CREATE TABLE `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_TYPE` varchar(45) NOT NULL,
  `VALUE` varchar(45) NOT NULL,
  `DESCB` varchar(45) DEFAULT NULL,
  `INACTIVE_IND` varchar(45) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;

INSERT INTO `code` (`id`, `CODE_TYPE`, `VALUE`, `DESCB`, `INACTIVE_IND`)
VALUES
	(1,'DEPT_STATUS','Active',NULL,'N'),
	(2,'DEPT_STATUS','Inactive',NULL,'N'),
	(3,'DEPT_STATUS','Suspend',NULL,'N'),
	(7,'EMP_STATUS','Waiting',NULL,'N'),
	(8,'EMP_STATUS','Pending',NULL,'N'),
	(9,'EMP_STATUS','In Project',NULL,'N'),
	(10,'EMP_STATUS','Marketing',NULL,'N'),
	(11,'USER_ROLE','ROLE_USER',NULL,'N'),
	(12,'USER_ROLE','ROLE_ADMIN',NULL,'N');

/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `dept_email` varchar(150) DEFAULT NULL,
  `descb` varchar(1000) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `status_fk_idx` (`statusId`),
  CONSTRAINT `status_fk` FOREIGN KEY (`statusId`) REFERENCES `code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_email`, `descb`, `statusId`, `contact`)
VALUES
	(87,'asdf',NULL,'sdf',1,'sdf');

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_fk_idx` (`dept_id`),
  KEY `status_fk_idx` (`statusId`),
  CONSTRAINT `dept_id_fk` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status_ind_fk` FOREIGN KEY (`statusId`) REFERENCES `code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(150) NOT NULL,
  `inactive_ind` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `user_name`, `password`, `inactive_ind`)
VALUES
	(1,'a','1','N'),
	(2,'dawei','1','N');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_role_assoc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role_assoc`;

CREATE TABLE `user_role_assoc` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_code_id` int(11) NOT NULL,
  `inactive_ind` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`role_id`),
  KEY `usr_role_fk_idx` (`user_id`),
  KEY `role_code_fk_idx` (`role_code_id`),
  CONSTRAINT `role_code_fk` FOREIGN KEY (`role_code_id`) REFERENCES `code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usr_role_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user_role_assoc` WRITE;
/*!40000 ALTER TABLE `user_role_assoc` DISABLE KEYS */;

INSERT INTO `user_role_assoc` (`role_id`, `user_id`, `role_code_id`, `inactive_ind`)
VALUES
	(1,1,11,'N'),
	(2,2,12,'N');

/*!40000 ALTER TABLE `user_role_assoc` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
