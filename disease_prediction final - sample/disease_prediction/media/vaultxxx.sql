/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - vaultx
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vaultx` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vaultx`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add account_table',7,'add_account_table'),
(26,'Can change account_table',7,'change_account_table'),
(27,'Can delete account_table',7,'delete_account_table'),
(28,'Can view account_table',7,'view_account_table'),
(29,'Can add loan_table',8,'add_loan_table'),
(30,'Can change loan_table',8,'change_loan_table'),
(31,'Can delete loan_table',8,'delete_loan_table'),
(32,'Can view loan_table',8,'view_loan_table'),
(33,'Can add login_table',9,'add_login_table'),
(34,'Can change login_table',9,'change_login_table'),
(35,'Can delete login_table',9,'delete_login_table'),
(36,'Can view login_table',9,'view_login_table'),
(37,'Can add offline_table',10,'add_offline_table'),
(38,'Can change offline_table',10,'change_offline_table'),
(39,'Can delete offline_table',10,'delete_offline_table'),
(40,'Can view offline_table',10,'view_offline_table'),
(41,'Can add branch_table',11,'add_branch_table'),
(42,'Can change branch_table',11,'change_branch_table'),
(43,'Can delete branch_table',11,'delete_branch_table'),
(44,'Can view branch_table',11,'view_branch_table'),
(45,'Can add transaction_table',12,'add_transaction_table'),
(46,'Can change transaction_table',12,'change_transaction_table'),
(47,'Can delete transaction_table',12,'delete_transaction_table'),
(48,'Can view transaction_table',12,'view_transaction_table'),
(49,'Can add user_table',13,'add_user_table'),
(50,'Can change user_table',13,'change_user_table'),
(51,'Can delete user_table',13,'delete_user_table'),
(52,'Can view user_table',13,'view_user_table'),
(53,'Can add notification_table',14,'add_notification_table'),
(54,'Can change notification_table',14,'change_notification_table'),
(55,'Can delete notification_table',14,'delete_notification_table'),
(56,'Can view notification_table',14,'view_notification_table'),
(57,'Can add feedback_table',15,'add_feedback_table'),
(58,'Can change feedback_table',15,'change_feedback_table'),
(59,'Can delete feedback_table',15,'delete_feedback_table'),
(60,'Can view feedback_table',15,'view_feedback_table'),
(61,'Can add complaint_table',16,'add_complaint_table'),
(62,'Can change complaint_table',16,'change_complaint_table'),
(63,'Can delete complaint_table',16,'delete_complaint_table'),
(64,'Can view complaint_table',16,'view_complaint_table'),
(65,'Can add application_table',17,'add_application_table'),
(66,'Can change application_table',17,'change_application_table'),
(67,'Can delete application_table',17,'delete_application_table'),
(68,'Can view application_table',17,'view_application_table'),
(69,'Can add work_table',18,'add_work_table'),
(70,'Can change work_table',18,'change_work_table'),
(71,'Can delete work_table',18,'delete_work_table'),
(72,'Can view work_table',18,'view_work_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'My_App','account_table'),
(17,'My_App','application_table'),
(11,'My_App','branch_table'),
(16,'My_App','complaint_table'),
(15,'My_App','feedback_table'),
(8,'My_App','loan_table'),
(9,'My_App','login_table'),
(14,'My_App','notification_table'),
(10,'My_App','offline_table'),
(12,'My_App','transaction_table'),
(13,'My_App','user_table'),
(18,'My_App','work_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'My_App','0001_initial','2024-12-24 06:49:54.636425'),
(2,'contenttypes','0001_initial','2024-12-24 06:49:54.680868'),
(3,'auth','0001_initial','2024-12-24 06:49:55.170852'),
(4,'admin','0001_initial','2024-12-24 06:49:55.310035'),
(5,'admin','0002_logentry_remove_auto_add','2024-12-24 06:49:55.321112'),
(6,'admin','0003_logentry_add_action_flag_choices','2024-12-24 06:49:55.332668'),
(7,'contenttypes','0002_remove_content_type_name','2024-12-24 06:49:55.413678'),
(8,'auth','0002_alter_permission_name_max_length','2024-12-24 06:49:55.463239'),
(9,'auth','0003_alter_user_email_max_length','2024-12-24 06:49:55.491992'),
(10,'auth','0004_alter_user_username_opts','2024-12-24 06:49:55.502417'),
(11,'auth','0005_alter_user_last_login_null','2024-12-24 06:49:55.552861'),
(12,'auth','0006_require_contenttypes_0002','2024-12-24 06:49:55.556358'),
(13,'auth','0007_alter_validators_add_error_messages','2024-12-24 06:49:55.567394'),
(14,'auth','0008_alter_user_username_max_length','2024-12-24 06:49:55.625842'),
(15,'auth','0009_alter_user_last_name_max_length','2024-12-24 06:49:55.684719'),
(16,'auth','0010_alter_group_name_max_length','2024-12-24 06:49:55.708811'),
(17,'auth','0011_update_proxy_permissions','2024-12-24 06:49:55.726135'),
(18,'auth','0012_alter_user_first_name_max_length','2024-12-24 06:49:55.772987'),
(19,'sessions','0001_initial','2024-12-24 06:49:55.813752'),
(20,'My_App','0002_remove_offline_table_account_no_and_more','2025-01-06 08:06:04.162740');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('9nnp4xl3rr6toa424nfh2veyhgot8vf4','eyJsaWQiOjQsImlkIjoiMSJ9:1tUhHx:kBUPXw7OnCin6qkLnbOqpWn98ELXr76sGVTGAB0SCgA','2025-01-20 07:12:37.925935'),
('b0p5pxh1q040rv2gbsfn8c8cjl58c6p2','eyJsaWQiOjUsImlkIjoiMiIsImxvYW5pZCI6Mn0:1tQ2qW:zeefxI7MFiUKxMSn6vPSp53ImbHZdMqmyR-yMDsrxxo','2025-01-07 11:13:04.582174'),
('nqj279nprwmut2l79kzll6l39yvtyycy','eyJsaWQiOjQsImlkIjoiMSJ9:1tUkEO:MR6W7hg0ThdcNf3_B73im9MG8x0E4a8jpw4Pmxw4ZkM','2025-01-20 10:21:08.119076'),
('orw5luq14cdhfkkgz9kvjlvaeryzl80t','eyJsaWQiOjQsImlkIjoiMiJ9:1tR82X:oC1gVYuQot2i_GY4tdiRrTNqU2aELe6-zg4-DmER56w','2025-01-10 10:57:57.328843');

/*Table structure for table `my_app_account_table` */

DROP TABLE IF EXISTS `my_app_account_table`;

CREATE TABLE `my_app_account_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `balance` double NOT NULL,
  `account_no` bigint NOT NULL,
  `ifsc_code` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_account_table_USER_id_f2bf14cd_fk_My_App_user_table_id` (`USER_id`),
  CONSTRAINT `My_App_account_table_USER_id_f2bf14cd_fk_My_App_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `my_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_account_table` */

insert  into `my_app_account_table`(`id`,`status`,`date`,`balance`,`account_no`,`ifsc_code`,`USER_id`) values 
(2,'accept','2024-12-12',5670,567,'7676',2),
(3,'accept','2024-12-02',5455,786,'0999',3),
(4,'accept','2024-10-11',6500,675,'9876',4);

/*Table structure for table `my_app_application_table` */

DROP TABLE IF EXISTS `my_app_application_table`;

CREATE TABLE `my_app_application_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `loan_amount` double NOT NULL,
  `loan_status` varchar(80) NOT NULL,
  `date` date NOT NULL,
  `details` varchar(80) NOT NULL,
  `LOAN_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_application_t_LOAN_id_22ee93d8_fk_My_App_lo` (`LOAN_id`),
  KEY `My_App_application_t_USER_id_7b8f8df2_fk_My_App_us` (`USER_id`),
  CONSTRAINT `My_App_application_t_LOAN_id_22ee93d8_fk_My_App_lo` FOREIGN KEY (`LOAN_id`) REFERENCES `my_app_loan_table` (`id`),
  CONSTRAINT `My_App_application_t_USER_id_7b8f8df2_fk_My_App_us` FOREIGN KEY (`USER_id`) REFERENCES `my_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_application_table` */

insert  into `my_app_application_table`(`id`,`loan_amount`,`loan_status`,`date`,`details`,`LOAN_id`,`USER_id`) values 
(1,20000,'accept','2024-12-24','jh',1,2),
(2,50000,'reject','2024-12-03','kj',4,4),
(3,54540,'accept','2024-12-01','iu',3,3);

/*Table structure for table `my_app_branch_table` */

DROP TABLE IF EXISTS `my_app_branch_table`;

CREATE TABLE `my_app_branch_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brachname` varchar(80) NOT NULL,
  `branch_type` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_branch_table_LOGIN_id_92bc382c_fk_My_App_login_table_id` (`LOGIN_id`),
  CONSTRAINT `My_App_branch_table_LOGIN_id_92bc382c_fk_My_App_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `my_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_branch_table` */

insert  into `my_app_branch_table`(`id`,`brachname`,`branch_type`,`place`,`post`,`district`,`email`,`phone`,`LOGIN_id`) values 
(2,'kbc','rural','kanookara','vadakara','calicut','sds45',8767560987,4),
(3,'sbi','nbfc','orkkateri','kanookkara','kozhikode','adas@212',8776765655,5),
(4,'canara','rural','kottakadav','neeliyath','kozhikode','ade@24',8787866532,3);

/*Table structure for table `my_app_complaint_table` */

DROP TABLE IF EXISTS `my_app_complaint_table`;

CREATE TABLE `my_app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` longtext NOT NULL,
  `date` date NOT NULL,
  `reply` longtext NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_complaint_table_USER_id_7fb84368_fk_My_App_user_table_id` (`USER_id`),
  CONSTRAINT `My_App_complaint_table_USER_id_7fb84368_fk_My_App_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `my_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_complaint_table` */

insert  into `my_app_complaint_table`(`id`,`complaint`,`date`,`reply`,`USER_id`) values 
(1,'lots','2024-11-05','asas',2);

/*Table structure for table `my_app_feedback_table` */

DROP TABLE IF EXISTS `my_app_feedback_table`;

CREATE TABLE `my_app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `feedback` varchar(50) NOT NULL,
  `review` varchar(80) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_feedback_table_USER_id_b91c0287_fk_My_App_user_table_id` (`USER_id`),
  CONSTRAINT `My_App_feedback_table_USER_id_b91c0287_fk_My_App_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `my_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_feedback_table` */

insert  into `my_app_feedback_table`(`id`,`date`,`feedback`,`review`,`USER_id`) values 
(1,'2024-12-02','not bad','gud',2);

/*Table structure for table `my_app_loan_table` */

DROP TABLE IF EXISTS `my_app_loan_table`;

CREATE TABLE `my_app_loan_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `range` double NOT NULL,
  `details` varchar(80) NOT NULL,
  `year` date NOT NULL,
  `installment` double NOT NULL,
  `type` varchar(50) NOT NULL,
  `emi` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_loan_table` */

insert  into `my_app_loan_table`(`id`,`date`,`status`,`range`,`details`,`year`,`installment`,`type`,`emi`) values 
(1,'2025-02-01 12:45:40.000000','wdwd',7000,'wewe','2024-12-12',500,'tutu',876),
(3,'2024-12-09 13:53:08.000000','see',3450,'ghghg','2024-09-02',670,'oioi',897),
(4,'2024-12-04 15:43:35.000000','hghg',8500,'popo','2024-07-18',87,'jii',986);

/*Table structure for table `my_app_login_table` */

DROP TABLE IF EXISTS `my_app_login_table`;

CREATE TABLE `my_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_login_table` */

insert  into `my_app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'user','user','user'),
(3,'suju','suju','branch'),
(4,'rai','rai','branch'),
(5,'hibu','hibu','branch');

/*Table structure for table `my_app_notification_table` */

DROP TABLE IF EXISTS `my_app_notification_table`;

CREATE TABLE `my_app_notification_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` datetime(6) NOT NULL,
  `amount` double NOT NULL,
  `details` longtext NOT NULL,
  `status` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_notification__USER_id_49a45da7_fk_My_App_us` (`USER_id`),
  CONSTRAINT `My_App_notification__USER_id_49a45da7_fk_My_App_us` FOREIGN KEY (`USER_id`) REFERENCES `my_app_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_notification_table` */

/*Table structure for table `my_app_offline_table` */

DROP TABLE IF EXISTS `my_app_offline_table`;

CREATE TABLE `my_app_offline_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `type` varchar(50) NOT NULL,
  `ACCOUNT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_offline_table_ACCOUNT_id_e0f300c6_fk_My_App_ac` (`ACCOUNT_id`),
  CONSTRAINT `My_App_offline_table_ACCOUNT_id_e0f300c6_fk_My_App_ac` FOREIGN KEY (`ACCOUNT_id`) REFERENCES `my_app_account_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_offline_table` */

insert  into `my_app_offline_table`(`id`,`amount`,`date`,`type`,`ACCOUNT_id`) values 
(1,75000,'2025-01-01','deposit',2),
(2,100,'2025-01-06','withdraw',3);

/*Table structure for table `my_app_transaction_table` */

DROP TABLE IF EXISTS `my_app_transaction_table`;

CREATE TABLE `my_app_transaction_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `account_from_id` bigint NOT NULL,
  `account_to_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_transaction_t_account_from_id_84758869_fk_My_App_ac` (`account_from_id`),
  KEY `My_App_transaction_t_account_to_id_a934f83d_fk_My_App_ac` (`account_to_id`),
  CONSTRAINT `My_App_transaction_t_account_from_id_84758869_fk_My_App_ac` FOREIGN KEY (`account_from_id`) REFERENCES `my_app_account_table` (`id`),
  CONSTRAINT `My_App_transaction_t_account_to_id_a934f83d_fk_My_App_ac` FOREIGN KEY (`account_to_id`) REFERENCES `my_app_account_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_transaction_table` */

insert  into `my_app_transaction_table`(`id`,`date`,`amount`,`status`,`account_from_id`,`account_to_id`) values 
(1,'2024-10-23 12:09:09.000000',7600,'deposit',3,2);

/*Table structure for table `my_app_user_table` */

DROP TABLE IF EXISTS `my_app_user_table`;

CREATE TABLE `my_app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `post` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `BRANCH_id` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_user_table_BRANCH_id_8e9bc97a_fk_My_App_branch_table_id` (`BRANCH_id`),
  KEY `My_App_user_table_LOGIN_id_b67bb124_fk_My_App_login_table_id` (`LOGIN_id`),
  CONSTRAINT `My_App_user_table_BRANCH_id_8e9bc97a_fk_My_App_branch_table_id` FOREIGN KEY (`BRANCH_id`) REFERENCES `my_app_branch_table` (`id`),
  CONSTRAINT `My_App_user_table_LOGIN_id_b67bb124_fk_My_App_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `my_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_user_table` */

insert  into `my_app_user_table`(`id`,`name`,`email`,`phone`,`place`,`image`,`post`,`gender`,`BRANCH_id`,`LOGIN_id`) values 
(2,'hiba','fss@65',9087765438,'garuda','nnnnn','gase','female',2,4),
(3,'sujay','gfgf@43',9876543212,'hamd','bbbb','hase','male',3,5),
(4,'sidharth','ftfd@64',9087765465,'nothing','bbjj','fase','male',4,3);

/*Table structure for table `my_app_work_table` */

DROP TABLE IF EXISTS `my_app_work_table`;

CREATE TABLE `my_app_work_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_name` varchar(50) NOT NULL,
  `details` varchar(80) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `BRANCH_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `My_App_work_table_BRANCH_id_8897822c_fk_My_App_branch_table_id` (`BRANCH_id`),
  CONSTRAINT `My_App_work_table_BRANCH_id_8897822c_fk_My_App_branch_table_id` FOREIGN KEY (`BRANCH_id`) REFERENCES `my_app_branch_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `my_app_work_table` */

insert  into `my_app_work_table`(`id`,`work_name`,`details`,`status`,`date`,`BRANCH_id`) values 
(1,'uy','gh','so interesting','2024-12-24',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
