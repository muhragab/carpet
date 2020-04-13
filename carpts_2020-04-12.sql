# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.37-MariaDB)
# Database: carpts
# Generation Time: 2020-04-12 18:37:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_categories`;

CREATE TABLE `account_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `account_categories` WRITE;
/*!40000 ALTER TABLE `account_categories` DISABLE KEYS */;

INSERT INTO `account_categories` (`id`, `title`, `number`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'مثال لنص',3,'2020-04-01 22:44:26','2020-04-01 22:55:33','2020-04-01 22:55:33'),
	(2,'مثال لنص 2',4,'2020-04-01 22:55:21','2020-04-01 22:55:32','2020-04-01 22:55:32'),
	(3,'مثال لنص 4',5,'2020-04-01 22:55:25','2020-04-01 22:55:29','2020-04-01 22:55:29'),
	(4,'qwe qwe',1,'2020-04-01 22:55:40','2020-04-01 22:55:44','2020-04-01 22:55:44'),
	(5,'qwe qwe',1,'2020-04-01 22:56:27','2020-04-01 22:56:30','2020-04-01 22:56:30'),
	(6,'مثال لنص',1,'2020-04-01 22:57:47','2020-04-01 22:57:50','2020-04-01 22:57:50'),
	(7,'مثال لنص',1,'2020-04-01 22:58:23','2020-04-01 23:02:40','2020-04-01 23:02:40'),
	(8,'مثال لنص 3',1,'2020-04-01 23:02:46','2020-04-08 19:06:15','2020-04-08 19:06:15'),
	(9,'مثال لنص',1,'2020-04-08 19:06:20','2020-04-08 19:06:20',NULL),
	(10,'مثال لنص',2,'2020-04-08 19:14:34','2020-04-08 19:14:34',NULL);

/*!40000 ALTER TABLE `account_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_statements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_statements`;

CREATE TABLE `account_statements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `statement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statement_type` enum('creditor','debtor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_statements_account_id_index` (`account_id`),
  CONSTRAINT `account_statements_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `account_statements` WRITE;
/*!40000 ALTER TABLE `account_statements` DISABLE KEYS */;

INSERT INTO `account_statements` (`id`, `account_id`, `statement`, `statement_type`, `amount`, `created_at`, `updated_at`, `date`, `category`)
VALUES
	(3,1,'100','creditor',10000.00,'2020-04-11 11:54:08','2020-04-11 11:54:08','2020-04-13',2),
	(4,1,'100','debtor',5000.00,'2020-04-11 11:54:32','2020-04-11 11:54:32','2020-04-18',2);

/*!40000 ALTER TABLE `account_statements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('safe') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;

INSERT INTO `accounts` (`id`, `name`, `type`, `created_at`, `updated_at`)
VALUES
	(1,'خزنه الدائري','safe','2019-12-19 18:47:44','2019-12-19 18:47:44'),
	(2,'خزنه السيوف','safe','2019-12-19 18:47:56','2019-12-19 18:47:56'),
	(3,'خزنه جمال عبد الناصر','safe','2019-12-19 18:48:13','2019-12-19 18:48:13'),
	(4,'خزنه مصطفي كامل','safe','2019-12-19 18:48:31','2019-12-19 18:48:31'),
	(5,'خزنه عامة','safe','2019-12-19 18:49:49','2019-12-19 18:49:49');

/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table back_purchase_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `back_purchase_items`;

CREATE TABLE `back_purchase_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `number` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `back_purchase_items_purchase_id_index` (`purchase_id`),
  KEY `back_purchase_items_product_id_index` (`product_id`),
  CONSTRAINT `back_purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `back_purchase_items` WRITE;
/*!40000 ALTER TABLE `back_purchase_items` DISABLE KEYS */;

INSERT INTO `back_purchase_items` (`id`, `purchase_id`, `product_id`, `number`, `price`, `total_price`, `created_at`, `updated_at`)
VALUES
	(1,1,1,10,100.00,1000.00,'2020-04-12 14:32:17','2020-04-12 14:32:17');

/*!40000 ALTER TABLE `back_purchase_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table back_purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `back_purchases`;

CREATE TABLE `back_purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `inventorie_id` bigint(20) unsigned DEFAULT NULL,
  `permission_number` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `priceFinal` decimal(8,2) DEFAULT NULL,
  `finalPrice` decimal(8,2) DEFAULT NULL,
  `taxes` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `back_purchases_supplier_id_index` (`supplier_id`),
  KEY `back_purchases_inventorie_id_index` (`inventorie_id`),
  CONSTRAINT `back_purchases_inventorie_id_foreign` FOREIGN KEY (`inventorie_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `back_purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `back_purchases` WRITE;
/*!40000 ALTER TABLE `back_purchases` DISABLE KEYS */;

INSERT INTO `back_purchases` (`id`, `supplier_id`, `inventorie_id`, `permission_number`, `discount`, `price`, `priceFinal`, `finalPrice`, `taxes`, `created_at`, `updated_at`)
VALUES
	(1,3,2,1,3,1000.00,5600.00,5970.00,10,'2020-04-12 14:32:17','2020-04-12 14:32:17');

/*!40000 ALTER TABLE `back_purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_category_id_index` (`category_id`),
  CONSTRAINT `categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `category_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'سجاد','2019-09-22 13:40:20','2019-09-22 13:40:20'),
	(2,NULL,'مراتب','2019-09-22 13:40:36','2019-09-22 13:40:36'),
	(4,1,'نساجون','2019-09-22 13:45:09','2019-09-22 13:45:09'),
	(6,2,'هاي سليب','2019-09-22 13:45:47','2019-09-22 13:45:47'),
	(7,2,'الدورا','2019-09-22 13:46:00','2019-09-22 13:46:00'),
	(8,2,'هاي سنس','2019-09-22 13:46:19','2019-09-22 13:46:19'),
	(9,1,'برادو','2019-09-22 15:29:51','2019-09-22 15:29:51'),
	(15,NULL,'مفروشات','2019-12-26 16:53:43','2019-12-26 16:53:43');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table inventories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inventories`;

CREATE TABLE `inventories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;

INSERT INTO `inventories` (`id`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL),
	(2,NULL,NULL);

/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table komicho_activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `komicho_activities`;

CREATE TABLE `komicho_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `definition_flag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `definition_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `komicho_activities` WRITE;
/*!40000 ALTER TABLE `komicho_activities` DISABLE KEYS */;

INSERT INTO `komicho_activities` (`id`, `user_id`, `item_id`, `model_name`, `definition_flag`, `definition_note`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'App\\Store','store:add:value',NULL,'2019-12-19 18:33:22','2019-12-19 18:33:22'),
	(2,1,1,'App\\Store','store:add:value',NULL,'2019-12-19 18:33:34','2019-12-19 18:33:34'),
	(3,1,1,'App\\Store','store:add:value',NULL,'2019-12-19 18:33:48','2019-12-19 18:33:48'),
	(4,1,1,'App\\Store','store:add:value',NULL,'2019-12-26 16:11:43','2019-12-26 16:11:43'),
	(5,1,2,'App\\Store','store:add:value',NULL,'2019-12-28 16:51:26','2019-12-28 16:51:26'),
	(6,2,1,'App\\Store','store:add:value',NULL,'2020-03-07 12:43:11','2020-03-07 12:43:11'),
	(7,2,1,'App\\Store','store:add:value',NULL,'2020-03-16 20:28:01','2020-03-16 20:28:01'),
	(8,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:33:20','2020-03-16 20:33:20'),
	(9,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:33:20','2020-03-16 20:33:20'),
	(10,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:33:20','2020-03-16 20:33:20'),
	(11,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:33:20','2020-03-16 20:33:20'),
	(12,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:33:20','2020-03-16 20:33:20'),
	(13,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(14,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(15,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(16,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(17,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(18,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:35:13','2020-03-16 20:35:13'),
	(19,2,5,'App\\Store','store:add:value',NULL,'2020-03-16 20:35:13','2020-03-16 20:35:13');

/*!40000 ALTER TABLE `komicho_activities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2018_04_19_121841_admins',1),
	(4,'2019_09_15_131955_create_warehouses_table',1),
	(5,'2019_09_15_132015_create_inventories_table',1),
	(6,'2019_09_15_151449_create_categories_table',1),
	(7,'2019_09_17_145733_create_product_colors_table',1),
	(8,'2019_09_17_152546_create_product_types_table',1),
	(9,'2019_09_17_162316_create_product_plotters_table',1),
	(10,'2019_09_17_172316_create_products_table',1),
	(11,'2019_10_19_074308_create_suppliers_table',1),
	(12,'2019_10_19_075949_create_purchases_table',1),
	(13,'2019_10_20_161559_create_purchase_items_table',1),
	(14,'2019_12_05_142811_add_is_supplier_is_client_to_suppliers_table',1),
	(15,'2019_12_05_150642_drop_type_from_suppliers_table',1),
	(16,'2019_12_05_153722_create_sales_table',1),
	(17,'2019_12_05_154022_create_sale_items_table',1),
	(18,'2019_12_05_160014_create_supplier_accounts_table',1),
	(19,'2019_12_17_125340_create_stores_table',2),
	(20,'2019_12_17_152238_create_stores_products_table',2),
	(21,'2019_12_19_115942_create_accounts_table',2),
	(22,'2019_12_19_122325_create_account_statements_table',2),
	(23,'2019_07_26_192016_create_activities_table',3),
	(24,'2019_12_21_105534_create_product_country_origins_table',4),
	(25,'2019_12_21_105817_add_country_origin_id_to_products',4),
	(26,'2019_12_26_121820_create_store_transfer_logs_table',5),
	(27,'2020_04_01_223902_create_account_categories_table',6),
	(28,'2020_04_08_190801_create_sub_account_categories_table',7),
	(41,'2020_04_12_103008_create_back_purchases_table',8),
	(42,'2020_04_20_161559_create_back_purchase_items_table',8);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mudir_admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mudir_admins`;

CREATE TABLE `mudir_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `mudir_admins` WRITE;
/*!40000 ALTER TABLE `mudir_admins` DISABLE KEYS */;

INSERT INTO `mudir_admins` (`id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2019-10-20 20:00:36','2019-10-20 20:00:36'),
	(2,2,'2020-03-07 12:40:38','2020-03-07 12:40:38');

/*!40000 ALTER TABLE `mudir_admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_colors`;

CREATE TABLE `product_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_country_origins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_country_origins`;

CREATE TABLE `product_country_origins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_country_origins` WRITE;
/*!40000 ALTER TABLE `product_country_origins` DISABLE KEYS */;

INSERT INTO `product_country_origins` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'تركي','2019-12-22 22:57:59','2019-12-22 23:01:04'),
	(2,'مصري','2019-12-22 22:58:25','2019-12-22 22:58:25'),
	(3,'امريكي','2019-12-22 23:01:18','2019-12-22 23:01:18'),
	(4,'نساجون','2019-12-26 16:54:39','2019-12-26 16:54:39'),
	(5,'الماني','2019-12-26 16:54:58','2019-12-26 16:54:58');

/*!40000 ALTER TABLE `product_country_origins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_plotters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_plotters`;

CREATE TABLE `product_plotters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_types`;

CREATE TABLE `product_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;

INSERT INTO `product_types` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'مادلين','2019-09-22 13:46:42','2019-09-22 13:46:42'),
	(2,'بروكسل','2019-09-22 13:46:58','2019-09-22 13:46:58'),
	(3,'سلطانو','2019-09-22 13:47:14','2019-09-22 13:47:14'),
	(4,'سوبر تينا','2019-09-22 18:42:18','2019-09-22 18:42:18'),
	(5,'سوبر شام','2019-09-22 18:42:28','2019-09-22 18:42:28'),
	(6,'سوبر فرجنيا','2019-09-22 18:42:40','2019-09-22 18:42:40'),
	(7,'سوبر ليالي','2019-09-22 18:42:50','2019-09-22 18:42:50'),
	(8,'نيو كاسيل','2019-09-22 18:43:00','2019-09-22 18:43:00'),
	(9,'مياسين','2019-09-22 18:43:09','2019-09-22 18:43:09'),
	(10,'يلدز','2019-09-22 18:43:16','2019-09-22 18:43:16'),
	(11,'بليجكي','2019-09-22 18:43:24','2019-09-22 18:43:24'),
	(12,'شيراز ايراني','2019-09-22 18:43:34','2019-09-22 18:43:34'),
	(13,'ايراني','2019-09-22 18:43:48','2019-09-22 18:43:48'),
	(14,'بسمة اطفال','2019-09-22 18:43:59','2019-09-22 18:43:59'),
	(15,'فرجنيا','2019-09-22 18:44:07','2019-09-22 18:44:07'),
	(16,'الدورا','2019-09-22 18:44:16','2019-09-22 18:44:16'),
	(17,'الؤلؤة','2019-09-22 18:44:25','2019-09-22 18:44:25'),
	(18,'اميرة','2019-09-22 18:44:36','2019-09-22 18:44:36'),
	(19,'ايراني مروه','2019-09-22 18:44:46','2019-09-22 18:44:46'),
	(20,'باريس','2019-09-22 18:44:51','2019-09-22 18:44:51'),
	(21,'بدر محفور','2019-09-22 18:45:06','2019-09-22 18:45:06'),
	(22,'برشلونه','2019-09-22 18:45:28','2019-09-22 18:45:28'),
	(23,'تافت','2019-09-22 18:46:00','2019-09-22 18:46:00'),
	(24,'جودي','2019-09-22 18:46:17','2019-09-22 18:46:17'),
	(25,'جوليا','2019-09-22 18:46:25','2019-09-22 18:46:25'),
	(26,'حكاية','2019-09-22 18:46:38','2019-09-22 18:46:38'),
	(27,'روما','2019-09-22 18:46:46','2019-09-22 18:46:46'),
	(28,'روما شعبي','2019-09-22 18:46:55','2019-09-22 18:46:55'),
	(29,'زهرة','2019-09-22 18:47:03','2019-09-22 18:47:03'),
	(30,'سوبر ملك','2019-09-22 18:47:24','2019-09-22 18:47:24'),
	(31,'سوبر هانوفر','2019-09-22 18:47:36','2019-09-22 18:47:36'),
	(32,'شاج 3 دي','2019-09-22 18:47:51','2019-09-22 18:47:51'),
	(33,'شاج مريم','2019-09-22 18:47:59','2019-09-22 18:47:59'),
	(34,'شاج ملك','2019-09-22 18:48:17','2019-09-22 18:48:17'),
	(35,'شمس','2019-09-22 18:48:26','2019-09-22 18:48:26'),
	(36,'صافي','2019-09-22 18:48:32','2019-09-22 18:48:32'),
	(37,'صوفيا','2019-09-22 18:48:38','2019-09-22 18:48:38'),
	(38,'طقم حمام الفرسان','2019-09-22 18:49:21','2019-09-22 18:49:21'),
	(39,'طقم حمام الفرسان شاج','2019-09-22 18:49:33','2019-09-22 18:49:33'),
	(40,'طقم حمام توتي','2019-09-22 18:49:41','2019-09-22 18:49:41'),
	(41,'طقم حمام كاربت كبير','2019-09-22 18:49:53','2019-09-22 18:49:53'),
	(42,'طقم حمام كاربت صغير','2019-09-22 18:50:12','2019-09-22 18:50:12'),
	(43,'طقم حمام مارسليا شاج','2019-09-22 18:50:42','2019-09-22 18:50:42'),
	(44,'طقم حمام كليوباترا','2019-09-22 18:50:55','2019-09-22 18:50:55'),
	(45,'فريدة','2019-09-22 18:51:10','2019-09-22 18:51:10'),
	(46,'كرملة','2019-09-22 18:51:21','2019-09-22 18:51:21'),
	(47,'كريستال','2019-09-22 18:51:28','2019-09-22 18:51:28'),
	(48,'كريستينا','2019-09-22 18:51:36','2019-09-22 18:51:36'),
	(49,'كليوباترا','2019-09-22 18:51:47','2019-09-22 18:51:47'),
	(50,'مارينا','2019-09-22 18:52:27','2019-09-22 18:52:27'),
	(51,'مانديلا','2019-09-22 18:52:44','2019-09-22 18:52:44'),
	(52,'مدريد','2019-09-22 18:52:57','2019-09-22 18:52:57'),
	(53,'مريم','2019-09-22 18:53:18','2019-09-22 18:53:18'),
	(54,'مساجد تركي','2019-09-22 18:53:27','2019-09-22 18:53:27'),
	(55,'شاج وردة','2019-09-22 18:53:43','2019-09-22 18:53:43'),
	(56,'سليكون','2019-09-22 18:54:00','2019-09-22 18:54:00'),
	(57,'ويلكم فيروز','2019-09-22 18:54:05','2019-09-23 23:00:58'),
	(58,'ويلكم تركي','2019-09-22 18:54:15','2019-09-22 18:54:15'),
	(59,'دواسه بانيو','2019-09-22 18:54:26','2019-09-22 18:54:26'),
	(60,'جلد مخرم صغير','2019-09-22 18:54:38','2019-09-22 18:54:38'),
	(61,'جلد مخرم كبير','2019-09-22 18:54:48','2019-09-22 18:54:48'),
	(62,'بينكل','2019-09-22 18:55:00','2019-09-22 18:55:00'),
	(63,'ارينا','2019-09-22 18:55:06','2019-09-22 18:55:06'),
	(64,'مليسيا','2019-09-22 18:55:14','2019-09-22 18:55:14'),
	(65,'ميسي','2019-09-22 18:55:20','2019-09-22 18:55:20'),
	(66,'موندوا','2019-09-22 18:55:27','2019-09-22 18:55:27'),
	(67,'موناليزا','2019-09-22 18:55:36','2019-09-22 18:55:36'),
	(68,'موف اون','2019-09-22 18:55:43','2019-09-22 18:55:43'),
	(69,'موسكو','2019-09-22 18:55:48','2019-09-22 18:55:48'),
	(70,'مساجد نبيه','2019-09-22 18:55:59','2019-09-22 18:55:59'),
	(71,'مساجد حنه','2019-09-22 18:56:13','2019-09-22 18:56:13'),
	(72,'مساجد نور','2019-09-22 18:56:21','2019-09-22 18:56:21'),
	(73,'مساجد باريس','2019-09-22 18:56:30','2019-09-22 18:56:30'),
	(74,'موكت دهب','2019-09-22 18:56:48','2019-09-22 18:56:48'),
	(75,'موكت الجوهرة','2019-09-22 18:56:59','2019-09-22 18:56:59'),
	(76,'ماك روزيتا','2019-09-22 18:57:40','2019-09-22 18:57:40'),
	(77,'ماك تورينو','2019-09-22 18:58:02','2019-09-22 18:58:02'),
	(78,'شاج ماتريكس','2019-09-22 18:58:12','2019-09-22 18:58:12'),
	(79,'شاج ماجيك','2019-09-22 18:58:28','2019-09-22 18:58:28'),
	(80,'شاج فرنا','2019-09-22 18:58:35','2019-09-22 18:58:35'),
	(81,'شاج سنيوريتا','2019-09-22 18:58:44','2019-09-22 18:58:44'),
	(82,'شاج سمر','2019-09-22 18:58:51','2019-09-22 18:58:51'),
	(83,'شاج اباتشي','2019-09-22 18:59:06','2019-09-22 18:59:06'),
	(84,'شاج فينسيا','2019-09-22 18:59:18','2019-09-22 18:59:18'),
	(85,'شاج سولو','2019-09-22 18:59:26','2019-09-28 18:11:52'),
	(86,'لوران','2019-09-22 18:59:38','2019-09-22 18:59:38'),
	(87,'لايف','2019-09-22 18:59:44','2019-09-22 18:59:44'),
	(88,'لامور','2019-09-22 18:59:51','2019-09-22 18:59:51'),
	(89,'لافيستا','2019-09-22 19:00:00','2019-09-22 19:00:00'),
	(90,'كينج','2019-09-22 19:00:06','2019-09-22 19:00:06'),
	(91,'شاج كليو','2019-09-22 19:00:36','2019-09-22 19:00:36'),
	(92,'كيد زنيا','2019-09-22 19:00:48','2019-09-22 19:00:48'),
	(93,'هاي سليب','2019-09-22 19:01:01','2019-09-22 19:01:01'),
	(94,'باندا','2019-09-22 19:01:12','2019-09-22 19:01:12'),
	(95,'واقي مليتون','2019-09-22 19:01:26','2019-09-22 19:01:26'),
	(96,'ليزر','2019-09-22 19:01:41','2019-09-22 19:01:41'),
	(97,'دبل نت','2019-09-22 19:01:47','2019-09-22 19:01:47'),
	(98,'هاي سنس','2019-09-22 19:02:04','2019-09-22 19:02:04'),
	(99,'كروز','2019-09-22 19:02:17','2019-09-22 19:02:17'),
	(100,'كيروا','2019-09-22 19:02:35','2019-09-22 19:02:35'),
	(101,'كابو','2019-09-22 19:02:42','2019-09-22 19:02:42'),
	(102,'كبرايز','2019-09-22 19:02:54','2019-09-22 19:02:54'),
	(103,'قوقازي','2019-09-22 19:03:01','2019-09-22 19:03:01'),
	(104,'فيينا','2019-09-22 19:03:10','2019-09-22 19:03:10'),
	(105,'فريسكا','2019-09-22 19:03:20','2019-09-22 19:03:20'),
	(106,'فرحة','2019-09-22 19:03:26','2019-09-22 19:03:26'),
	(107,'موكت طابا','2019-09-22 19:03:50','2019-09-22 19:03:50'),
	(108,'صن ست','2019-09-22 19:04:03','2019-09-22 19:04:03'),
	(109,'سيزاروا','2019-09-22 19:04:22','2019-09-22 19:04:22'),
	(110,'سيدرا شعبي','2019-09-22 19:04:31','2019-09-22 19:04:31'),
	(111,'سيدرا','2019-09-22 19:04:39','2019-09-22 19:04:39'),
	(112,'سونمو','2019-09-22 19:05:01','2019-09-22 19:05:01'),
	(113,'سندريلا','2019-09-22 19:05:17','2019-09-22 19:05:17'),
	(114,'سكوبي','2019-09-22 19:05:28','2019-09-22 19:05:28'),
	(115,'جنات','2019-09-22 19:05:33','2019-09-22 19:05:33'),
	(116,'زان','2019-09-22 19:05:42','2019-09-22 19:05:42'),
	(117,'ريحانة','2019-09-22 19:05:49','2019-09-22 19:05:49'),
	(118,'روكا لاند','2019-09-22 19:05:58','2019-09-22 19:05:58'),
	(119,'بامبو لاند','2019-09-22 19:06:06','2019-09-22 19:06:06'),
	(120,'داماس لاند','2019-09-22 19:06:15','2019-09-22 19:06:15'),
	(121,'داكار لاند','2019-09-22 19:06:23','2019-09-22 19:06:23'),
	(122,'جلاله لاند','2019-09-22 19:06:39','2019-09-22 19:06:39'),
	(123,'جاميكا لاند','2019-09-22 19:06:47','2019-09-22 19:06:47'),
	(124,'ديزرت','2019-09-22 19:06:58','2019-09-22 19:06:58'),
	(125,'دلتا','2019-09-22 19:07:04','2019-09-22 19:07:04'),
	(126,'بانوراما','2019-09-22 19:07:26','2019-09-22 19:07:26'),
	(127,'بدر','2019-09-22 19:07:32','2019-09-22 19:07:32'),
	(128,'بورتو','2019-09-22 19:07:42','2019-09-22 19:07:42'),
	(129,'برونز','2019-09-22 19:07:51','2019-09-22 19:07:51'),
	(130,'بيانكي','2019-09-22 19:07:59','2019-09-22 19:07:59'),
	(131,'داندي','2019-09-22 19:08:09','2019-09-22 19:08:09'),
	(132,'جانيرو','2019-09-22 19:08:18','2019-09-22 19:08:18'),
	(133,'كانكون','2019-09-22 19:08:26','2019-09-22 19:08:26'),
	(134,'كولكشن','2019-09-22 19:08:36','2019-09-22 19:08:36'),
	(135,'موكت ادفو لباد','2019-09-22 19:08:50','2019-09-22 19:08:50'),
	(136,'اسكتش','2019-09-22 19:08:58','2019-09-22 19:08:58'),
	(137,'لاباما','2019-09-22 19:09:05','2019-09-22 19:09:05'),
	(138,'انتيك','2019-09-22 19:09:12','2019-09-22 19:09:12'),
	(139,'امورة','2019-09-22 19:09:24','2019-09-22 19:09:24'),
	(140,'ايفوريا','2019-09-22 19:09:35','2019-09-22 19:09:35'),
	(141,'ابوجا لاند','2019-09-22 19:09:45','2019-09-22 19:09:45'),
	(142,'بورتوريه','2019-09-22 19:09:54','2019-09-22 19:09:54'),
	(143,'كوجي','2019-09-22 19:11:43','2019-09-22 19:11:43'),
	(144,'كوجينا','2019-09-22 19:11:50','2019-09-22 19:11:50'),
	(145,'كهرمان','2019-09-22 19:11:57','2019-09-22 19:11:57'),
	(146,'القصر','2019-09-22 19:12:04','2019-09-22 19:12:04'),
	(147,'سيمبا اطفال','2019-09-22 19:12:15','2019-09-22 19:12:15'),
	(148,'جوبلان','2019-09-22 19:12:23','2019-09-22 19:12:23'),
	(149,'ماجستي','2019-09-22 19:12:32','2019-09-22 19:12:32'),
	(150,'فلورنس','2019-09-22 19:12:38','2019-09-22 19:12:38'),
	(151,'امياسادور','2019-09-22 19:12:55','2019-09-22 19:12:55'),
	(152,'3 دي','2019-09-22 19:13:11','2019-09-22 19:13:11'),
	(153,'شاج ناعم','2019-09-22 19:13:19','2019-09-22 19:13:19'),
	(154,'شاج خشن','2019-09-22 19:13:26','2019-09-22 19:13:26'),
	(155,'تافت كليو','2019-09-22 19:13:38','2019-09-22 19:13:38'),
	(156,'شاج ارنب','2019-09-22 19:13:47','2019-09-22 19:13:47'),
	(157,'تافت ناعم','2019-09-22 19:13:56','2019-09-22 19:13:56'),
	(158,'شاج جولان','2019-09-22 19:14:05','2019-09-22 19:14:05'),
	(159,'شاج ايكيا','2019-09-22 19:14:16','2019-09-22 19:14:16'),
	(160,'ميموري','2019-09-22 19:14:27','2019-09-22 19:14:27'),
	(161,'حياه','2019-09-22 19:14:34','2019-09-22 19:14:34'),
	(162,'زمرده','2019-09-22 19:14:50','2019-09-22 19:14:50'),
	(163,'مرمر','2019-09-22 19:14:55','2019-09-22 19:14:55'),
	(164,'كاشان','2019-09-22 19:15:02','2019-09-22 19:15:02'),
	(165,'كابريز','2019-09-22 19:15:10','2019-09-22 19:15:10'),
	(166,'الاباز','2019-09-22 19:15:21','2019-09-22 19:15:21'),
	(167,'روما مقلم','2019-09-22 19:15:35','2019-09-22 19:15:35'),
	(168,'سابينا','2019-09-22 19:15:42','2019-09-22 19:15:42'),
	(169,'الحمد اطفال','2019-09-22 19:15:51','2019-09-22 19:15:51'),
	(170,'نوبيلا','2019-09-22 19:16:03','2019-09-22 19:16:03'),
	(171,'فليشيا','2019-09-22 19:16:14','2019-09-22 19:16:14'),
	(172,'فلورا','2019-09-22 19:16:29','2019-09-22 19:16:29'),
	(173,'فلوبا','2019-09-22 19:16:36','2019-09-22 19:16:36'),
	(174,'تورينو','2019-09-22 19:16:45','2019-09-22 19:16:45'),
	(175,'جنيور محفور','2019-09-22 19:17:00','2019-09-22 19:17:00'),
	(176,'هاند تافت','2019-09-22 19:17:10','2019-09-22 19:17:10'),
	(177,'سرفلة','2019-09-22 19:17:23','2019-09-22 19:17:23'),
	(178,'عربون','2019-09-22 19:17:29','2019-09-22 19:17:29'),
	(179,'خيط','2019-09-22 19:17:35','2019-09-22 19:17:35'),
	(180,'بازوكا يونايتد','2019-09-22 19:18:03','2019-09-22 19:18:03'),
	(181,'بازوكا يونايتد','2019-09-22 19:18:07','2019-09-22 19:18:07'),
	(182,'ماجيك لاتكس','2019-09-22 19:18:23','2019-09-22 19:18:23'),
	(183,'نقل','2019-09-22 19:18:32','2019-09-22 19:18:32'),
	(184,'هارموني','2019-09-22 19:18:42','2019-09-22 19:18:42'),
	(185,'خيال','2019-09-22 19:18:52','2019-09-22 19:18:52'),
	(186,'موكت نجيل صناعي','2019-09-22 19:19:12','2019-09-22 19:19:12'),
	(187,'فاشون','2019-09-22 19:19:19','2019-09-22 19:19:19'),
	(188,'شانيل حرير','2019-09-22 19:20:00','2019-09-22 19:20:00'),
	(189,'قشقاي يونايتد','2019-09-22 19:20:14','2019-09-22 19:20:14'),
	(190,'سنشيري','2019-09-22 19:20:24','2019-09-22 19:20:24'),
	(191,'بريمادونا','2019-09-22 19:20:36','2019-09-22 19:20:36'),
	(192,'افنان','2019-09-22 19:20:46','2019-09-22 19:20:46'),
	(193,'شانزليزيه','2019-09-22 19:20:56','2019-09-22 19:20:56'),
	(194,'موكت هانوفر','2019-09-22 19:21:06','2019-09-22 19:21:06'),
	(195,'الفرسان','2019-09-22 19:21:12','2019-09-22 19:21:12'),
	(196,'يانسن','2019-09-22 19:21:25','2019-09-22 19:21:25'),
	(197,'خان الخليلي','2019-09-22 19:21:38','2019-09-22 19:21:38'),
	(198,'نيو كريستال','2019-09-22 19:21:46','2019-09-22 19:21:46'),
	(199,'سوفت لاين','2019-09-22 19:21:57','2019-09-22 19:21:57'),
	(200,'هوب محفور','2019-09-22 19:22:08','2019-09-22 19:22:08'),
	(201,'الوريس','2019-09-22 19:22:24','2019-09-22 19:22:24'),
	(202,'رزان','2019-09-22 19:22:30','2019-09-22 19:22:30'),
	(203,'ميرال','2019-09-22 19:22:35','2019-09-22 19:22:35'),
	(204,'دواسه سيارات','2019-09-22 19:22:49','2019-09-22 19:22:49'),
	(205,'نيس','2019-09-22 19:23:09','2019-09-22 19:23:09'),
	(206,'شامبين لاند','2019-09-22 19:23:27','2019-09-22 19:23:27'),
	(207,'مورا سيلفر','2019-09-22 19:23:36','2019-09-22 19:23:36'),
	(208,'دواسه 3 دي','2019-09-22 19:24:16','2019-09-22 19:24:16'),
	(209,'ميزو','2019-09-22 19:24:28','2019-09-22 19:24:28'),
	(210,'ماجك مطبوع فوم','2019-09-22 19:24:42','2019-09-22 19:24:42'),
	(211,'روكا تركي','2019-09-22 19:25:04','2019-09-22 19:25:04'),
	(212,'فيروز تركي','2019-09-22 19:25:11','2019-09-22 19:25:11'),
	(213,'كاربنز','2019-09-22 19:25:28','2019-09-22 19:25:28'),
	(214,'ماريوط','2019-09-22 19:25:40','2019-09-22 19:25:40'),
	(215,'هيوستن','2019-09-22 19:25:52','2019-09-22 19:25:52'),
	(216,'ديموند','2019-09-22 19:26:12','2019-09-22 19:26:12'),
	(217,'فور بد','2019-09-22 19:26:21','2019-09-22 19:26:21'),
	(218,'فلاش','2019-09-23 22:16:17','2019-09-23 22:16:17'),
	(219,'ويكم 3 دي','2019-09-23 23:07:01','2019-09-23 23:07:01'),
	(220,'مشمع','2019-09-27 01:04:30','2019-09-27 01:04:30'),
	(221,'طقم حمام شاج 3دي','2019-09-27 01:27:10','2019-09-27 01:27:10'),
	(222,'شاج سينو','2019-09-27 01:56:36','2019-09-27 01:56:36'),
	(223,'لابوتيك','2019-09-27 02:26:44','2019-09-27 02:26:44'),
	(224,'استانا','2019-09-27 02:35:22','2019-09-27 02:35:22'),
	(225,'سلطان لوران','2019-09-27 02:35:36','2019-09-27 02:35:36'),
	(226,'لاكاسا','2019-09-27 02:35:45','2019-09-27 02:35:45'),
	(227,'روكسي','2019-09-27 02:48:44','2019-09-27 02:48:44'),
	(228,'سيجما','2019-09-27 02:54:42','2019-09-27 02:54:42'),
	(229,'طقم حمام الياسمين بشبشب','2019-09-27 19:44:22','2019-09-27 19:44:22'),
	(230,'ماجيك كيدز','2019-09-27 21:56:43','2019-09-27 21:56:43'),
	(231,'طقم حمام شاج كانون','2019-09-27 22:23:32','2019-09-27 22:23:32'),
	(232,'غوايش','2019-09-27 22:27:29','2019-09-27 22:27:29'),
	(233,'بروكسل نساجون','2019-09-27 22:58:48','2019-09-27 22:58:48'),
	(234,'سوبر جاردن','2019-09-27 23:22:20','2019-09-27 23:22:20'),
	(235,'طقم حمام مارسليا','2019-09-28 16:51:45','2019-09-28 16:51:45'),
	(236,'كيدز برايت','2019-09-28 18:08:02','2019-09-28 18:08:02'),
	(237,'جابيه','2019-09-28 18:14:26','2019-09-28 18:14:26'),
	(238,'اسكوبي','2019-09-28 18:42:08','2019-09-28 18:42:08'),
	(239,'استانلي','2019-09-28 19:21:32','2019-09-28 19:21:32');

/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `sub_category_id` bigint(20) unsigned DEFAULT NULL,
  `type_id` bigint(20) unsigned DEFAULT NULL,
  `color_id` bigint(20) unsigned DEFAULT NULL,
  `plotter_id` bigint(20) unsigned DEFAULT NULL,
  `country_origin_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sizes_length` double(8,2) NOT NULL,
  `sizes_width` double(8,2) NOT NULL,
  `average_demand_limit` int(11) DEFAULT NULL,
  `maximum_demand_limit` int(11) DEFAULT NULL,
  `price_meter` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_index` (`category_id`),
  KEY `products_sub_category_id_index` (`sub_category_id`),
  KEY `products_type_id_index` (`type_id`),
  KEY `products_color_id_index` (`color_id`),
  KEY `products_plotter_id_index` (`plotter_id`),
  KEY `products_country_origin_id_index` (`country_origin_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_country_origin_id_foreign` FOREIGN KEY (`country_origin_id`) REFERENCES `product_country_origins` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_plotter_id_foreign` FOREIGN KEY (`plotter_id`) REFERENCES `product_plotters` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `type_id`, `color_id`, `plotter_id`, `country_origin_id`, `name`, `image_path`, `sizes_length`, `sizes_width`, `average_demand_limit`, `maximum_demand_limit`, `price_meter`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,1,NULL,NULL,1,'مادلين',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-22 15:25:05','2019-12-27 17:07:39'),
	(2,1,NULL,1,NULL,NULL,1,'مادلين',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-22 15:36:48','2019-12-27 17:07:48'),
	(3,1,NULL,1,NULL,NULL,1,'مادلين',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-22 17:41:28','2019-12-27 17:09:04'),
	(4,1,NULL,1,NULL,NULL,1,'مادلين',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 20:27:32','2019-12-27 17:09:14'),
	(5,1,NULL,1,NULL,NULL,1,'مادلين',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 20:28:59','2019-12-27 17:09:38'),
	(8,1,NULL,1,NULL,NULL,1,'مادلين',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 20:32:56','2019-12-27 17:09:53'),
	(9,1,NULL,1,NULL,NULL,1,'مادلين',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 20:33:37','2019-12-27 17:10:07'),
	(10,1,NULL,1,NULL,NULL,1,'مادلين',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 20:34:05','2019-12-27 17:10:17'),
	(11,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 20:36:25','2019-12-27 17:10:48'),
	(12,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 20:37:01','2019-12-27 17:11:15'),
	(13,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 20:38:09','2019-12-22 23:00:14'),
	(14,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 20:39:03','2019-12-27 17:11:43'),
	(15,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 20:39:33','2019-12-27 17:12:06'),
	(16,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 20:40:10','2019-12-27 17:12:20'),
	(17,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 20:40:39','2019-12-27 17:12:33'),
	(18,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 20:41:02','2019-12-27 17:12:47'),
	(19,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 20:41:38','2019-12-27 17:13:03'),
	(20,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-23 20:42:32','2019-12-27 17:13:16'),
	(21,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,2.00,0.80,NULL,NULL,NULL,'2019-09-23 20:43:01','2019-12-27 17:13:27'),
	(22,1,NULL,2,NULL,NULL,1,'بروكسل',NULL,2.20,0.80,NULL,NULL,NULL,'2019-09-23 20:43:26','2019-12-27 17:13:50'),
	(23,1,NULL,203,NULL,NULL,1,'ميرال',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 20:51:22','2019-12-27 17:14:08'),
	(24,1,NULL,203,NULL,NULL,1,'ميرال',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 20:53:19','2019-12-27 17:14:32'),
	(25,1,NULL,203,NULL,NULL,1,'ميرال',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 20:54:13','2019-12-27 17:14:44'),
	(26,1,NULL,203,NULL,NULL,1,'ميرال',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 20:55:20','2019-12-27 17:15:01'),
	(27,1,NULL,203,NULL,NULL,1,'ميرال',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 20:56:02','2019-12-27 17:15:17'),
	(28,1,NULL,203,NULL,NULL,1,'ميرال',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 20:56:45','2019-12-27 17:15:36'),
	(29,1,NULL,203,NULL,NULL,1,'ميرال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 20:57:22','2019-12-27 17:15:50'),
	(30,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 21:30:21','2019-12-27 17:16:02'),
	(31,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 21:31:00','2019-12-27 17:16:12'),
	(32,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 21:31:33','2019-12-27 17:16:26'),
	(33,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 21:32:02','2019-12-27 17:16:40'),
	(34,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-23 21:45:22','2019-12-27 17:16:59'),
	(35,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,2.00,0.80,NULL,NULL,NULL,'2019-09-23 21:46:06','2019-12-27 17:17:41'),
	(36,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 21:54:38','2019-12-27 17:17:27'),
	(37,1,NULL,8,NULL,NULL,1,'نيو كاسيل',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 21:54:57','2019-12-27 17:18:49'),
	(38,1,NULL,192,NULL,NULL,1,'افنان',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 21:57:27','2019-12-27 17:19:01'),
	(39,1,NULL,192,NULL,NULL,1,'افنان',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 21:58:56','2019-12-27 17:19:28'),
	(40,1,NULL,192,NULL,NULL,1,'افنان',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 21:59:30','2019-12-27 17:19:56'),
	(41,1,NULL,192,NULL,NULL,NULL,'افنان',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:00:23','2019-09-23 22:00:23'),
	(42,1,NULL,192,NULL,NULL,NULL,'افنان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:00:48','2019-09-23 22:00:48'),
	(43,1,NULL,192,NULL,NULL,NULL,'افنان',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 22:01:20','2019-09-23 22:01:20'),
	(44,1,NULL,9,NULL,NULL,NULL,'مياسين',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 22:02:12','2019-09-23 22:02:12'),
	(45,1,NULL,9,NULL,NULL,NULL,'مياسين',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 22:02:36','2019-09-23 22:02:36'),
	(46,1,NULL,9,NULL,NULL,NULL,'مياسين',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 22:02:59','2019-09-23 22:02:59'),
	(48,1,NULL,9,NULL,NULL,NULL,'مياسين',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-23 22:04:00','2019-09-23 22:04:00'),
	(49,1,NULL,9,NULL,NULL,NULL,'مياسين',NULL,2.00,0.80,NULL,NULL,NULL,'2019-09-23 22:04:26','2019-09-23 22:04:26'),
	(50,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 22:09:31','2019-09-23 22:09:31'),
	(51,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 22:10:14','2019-09-23 22:10:14'),
	(52,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-23 22:10:52','2019-12-22 22:41:27'),
	(53,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 22:11:16','2019-09-23 22:11:16'),
	(54,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 22:11:53','2019-09-23 22:11:53'),
	(55,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:12:21','2019-09-23 22:12:21'),
	(56,1,NULL,216,NULL,NULL,NULL,'ديموند',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:13:18','2019-09-23 22:13:18'),
	(57,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 22:17:30','2019-09-23 22:17:30'),
	(58,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 22:17:55','2019-09-23 22:17:55'),
	(59,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 22:18:28','2019-09-23 22:18:28'),
	(60,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-23 22:19:07','2019-09-23 22:19:07'),
	(61,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 22:19:26','2019-09-23 22:19:26'),
	(62,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:19:53','2019-09-23 22:19:53'),
	(63,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:20:13','2019-09-23 22:20:13'),
	(64,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 22:21:16','2019-09-23 22:21:16'),
	(65,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 22:21:47','2019-09-23 22:21:47'),
	(66,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 22:22:20','2019-09-23 22:22:20'),
	(67,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 22:23:01','2019-09-23 22:23:01'),
	(68,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-23 22:23:55','2019-09-23 22:23:55'),
	(69,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,2.00,0.80,NULL,NULL,NULL,'2019-09-23 22:24:20','2019-09-23 22:24:20'),
	(70,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:24:39','2019-09-23 22:24:39'),
	(71,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:25:04','2019-09-23 22:25:04'),
	(72,1,NULL,198,NULL,NULL,NULL,'نيو كريستال',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-23 22:26:42','2019-09-23 22:26:42'),
	(74,1,NULL,198,NULL,NULL,NULL,'نيو كريستال',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 22:29:46','2019-09-23 22:29:46'),
	(75,1,NULL,198,NULL,NULL,NULL,'نيو كريستال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:30:32','2019-09-23 22:30:32'),
	(76,1,NULL,198,NULL,NULL,NULL,'نيو كريستال',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:30:59','2019-09-23 22:30:59'),
	(77,1,NULL,198,NULL,NULL,NULL,'نيو كريستال',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 22:31:31','2019-09-23 22:31:31'),
	(78,1,NULL,47,NULL,NULL,NULL,'كريستال',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-23 22:32:13','2019-09-23 22:32:13'),
	(79,1,NULL,47,NULL,NULL,NULL,'كريستال',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 22:32:53','2019-09-23 22:32:53'),
	(80,1,NULL,47,NULL,NULL,NULL,'كريستال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:33:21','2019-09-23 22:33:21'),
	(81,1,NULL,47,NULL,NULL,NULL,'كريستال',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:33:50','2019-09-23 22:33:50'),
	(82,1,NULL,47,NULL,NULL,NULL,'كريستال',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 22:34:18','2019-09-23 22:34:18'),
	(83,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 22:42:05','2019-09-23 22:42:05'),
	(84,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,2.40,1.75,NULL,NULL,NULL,'2019-09-23 22:50:43','2019-09-23 22:50:43'),
	(85,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 22:54:52','2019-09-23 22:54:52'),
	(86,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 22:55:14','2019-09-23 22:55:14'),
	(87,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 22:55:50','2019-09-23 22:55:50'),
	(88,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 22:56:13','2019-09-23 22:56:13'),
	(89,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 22:56:41','2019-09-23 22:56:41'),
	(90,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 22:57:19','2019-09-23 22:57:19'),
	(91,1,NULL,57,NULL,NULL,NULL,'ويلكم فيروز',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:02:19','2019-09-23 23:02:19'),
	(93,1,NULL,58,NULL,NULL,NULL,'ويلكم لوكس تركي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:03:36','2019-09-23 23:03:36'),
	(94,1,NULL,56,NULL,NULL,NULL,'دواسه سيلكون',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:04:18','2019-09-23 23:04:18'),
	(95,1,NULL,219,NULL,NULL,NULL,'ويكم 3 دي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:09:19','2019-09-23 23:09:19'),
	(96,1,NULL,60,NULL,NULL,NULL,'جلد مخرم صغير',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:09:57','2019-09-23 23:09:57'),
	(97,1,NULL,61,NULL,NULL,NULL,'جلد مخرم كبير',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:10:25','2019-09-23 23:10:25'),
	(98,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 23:11:08','2019-09-23 23:11:08'),
	(99,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 23:11:31','2019-09-23 23:11:31'),
	(100,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 23:11:55','2019-09-23 23:11:55'),
	(101,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 23:12:16','2019-09-23 23:12:16'),
	(102,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 23:12:39','2019-09-23 23:12:39'),
	(103,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-23 23:13:11','2019-09-23 23:13:11'),
	(104,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 23:13:40','2019-09-23 23:13:40'),
	(105,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:14:03','2019-09-23 23:14:03'),
	(106,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 23:14:26','2019-09-23 23:14:26'),
	(107,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 23:14:54','2019-09-23 23:14:54'),
	(108,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-23 23:15:24','2019-09-23 23:15:24'),
	(109,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 23:16:48','2019-09-23 23:16:48'),
	(110,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 23:17:07','2019-09-23 23:17:07'),
	(111,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 23:17:32','2019-09-23 23:17:32'),
	(112,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 23:17:52','2019-09-23 23:17:52'),
	(113,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 23:18:10','2019-09-23 23:18:10'),
	(114,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-23 23:18:30','2019-09-23 23:18:30'),
	(115,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 23:18:49','2019-09-23 23:18:49'),
	(116,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:19:05','2019-09-23 23:19:05'),
	(117,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 23:19:25','2019-09-23 23:19:25'),
	(118,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 23:19:47','2019-09-23 23:19:47'),
	(119,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 23:23:54','2019-09-23 23:23:54'),
	(120,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 23:24:16','2019-09-23 23:24:16'),
	(121,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 23:24:39','2019-09-23 23:24:39'),
	(122,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 23:25:01','2019-09-23 23:25:01'),
	(123,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 23:25:20','2019-09-23 23:25:20'),
	(124,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-23 23:25:39','2019-09-23 23:25:39'),
	(125,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 23:26:04','2019-09-23 23:26:04'),
	(126,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:26:28','2019-09-23 23:26:28'),
	(127,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 23:26:44','2019-09-23 23:26:44'),
	(128,1,NULL,7,NULL,NULL,NULL,'سوبرليالي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 23:27:04','2019-09-23 23:27:04'),
	(129,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 23:27:42','2019-09-23 23:27:42'),
	(130,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 23:28:03','2019-09-23 23:28:03'),
	(131,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 23:28:24','2019-09-23 23:28:24'),
	(132,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 23:28:45','2019-09-23 23:28:45'),
	(133,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 23:29:09','2019-09-23 23:29:09'),
	(134,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 23:29:27','2019-09-23 23:29:27'),
	(135,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:29:49','2019-09-23 23:29:49'),
	(136,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 23:30:28','2019-09-23 23:30:28'),
	(137,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 23:30:50','2019-09-23 23:30:50'),
	(138,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-23 23:31:33','2019-09-23 23:31:33'),
	(139,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-23 23:31:52','2019-09-23 23:31:52'),
	(140,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-23 23:32:11','2019-09-23 23:32:11'),
	(141,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-23 23:32:35','2019-09-23 23:32:35'),
	(142,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-23 23:32:55','2019-09-23 23:32:55'),
	(143,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-23 23:33:17','2019-09-23 23:33:17'),
	(144,1,NULL,5,NULL,NULL,1,'سوبرشام',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:33:36','2019-12-28 16:48:41'),
	(145,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-23 23:33:51','2019-09-23 23:33:51'),
	(146,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-23 23:34:11','2019-09-23 23:34:11'),
	(147,1,NULL,41,NULL,NULL,NULL,'طقم حمام كاربت مول كبير',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:35:48','2019-09-23 23:35:48'),
	(148,1,NULL,42,NULL,NULL,NULL,'طقم حمام كاربت مول صغير',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:36:22','2019-09-23 23:36:22'),
	(149,1,NULL,38,NULL,NULL,NULL,'طقم حمام الفرسان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:36:59','2019-09-23 23:36:59'),
	(150,1,NULL,39,NULL,NULL,NULL,'طقم حمام الفرسان شاج',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:37:33','2019-09-23 23:37:33'),
	(151,1,NULL,40,NULL,NULL,NULL,'طقم حمام توتي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:38:12','2019-09-23 23:38:12'),
	(152,1,NULL,44,NULL,NULL,NULL,'طقم حمام كليوباترا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:38:50','2019-09-23 23:38:50'),
	(153,1,NULL,43,NULL,NULL,NULL,'طقم حمام مارسليا شاج',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-23 23:39:24','2019-09-23 23:39:24'),
	(155,1,NULL,192,NULL,NULL,NULL,'افنان',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-24 15:41:29','2019-09-24 15:41:29'),
	(156,1,NULL,220,NULL,NULL,NULL,'مشمع هولندي',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-27 01:05:37','2019-09-27 01:05:37'),
	(157,1,NULL,59,NULL,NULL,NULL,'دواسه بانيو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 01:07:36','2019-09-27 01:07:36'),
	(158,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 01:08:47','2019-09-27 01:08:47'),
	(159,1,4,133,NULL,NULL,NULL,'كانكون',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 01:15:30','2019-09-27 01:15:30'),
	(160,1,4,213,NULL,NULL,NULL,'كارينز',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 01:17:17','2019-09-27 01:17:17'),
	(161,1,4,213,NULL,NULL,NULL,'كارينز',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 01:17:50','2019-09-27 01:17:50'),
	(162,1,4,213,NULL,NULL,NULL,'كارينز',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 01:19:22','2019-09-27 01:19:22'),
	(163,1,4,214,NULL,NULL,NULL,'ماريوط',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 01:20:06','2019-09-27 01:20:06'),
	(164,1,4,214,NULL,NULL,NULL,'ماريوط',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 01:20:38','2019-09-27 01:20:38'),
	(165,1,4,214,NULL,NULL,NULL,'ماريوط',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-27 01:21:29','2019-09-27 01:21:29'),
	(166,1,4,214,NULL,NULL,NULL,'ماريوط',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 01:22:22','2019-09-27 01:22:22'),
	(167,1,4,205,NULL,NULL,NULL,'نيس',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 01:23:02','2019-09-27 01:23:02'),
	(168,1,4,215,NULL,NULL,NULL,'هيوستن',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 01:23:57','2019-09-27 01:23:57'),
	(169,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 01:24:39','2019-09-27 01:24:39'),
	(170,1,NULL,218,NULL,NULL,NULL,'فلاش',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 01:25:16','2019-09-27 01:25:16'),
	(171,1,NULL,221,NULL,NULL,NULL,'طقم حمام شاج 3دي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 01:29:31','2019-09-27 01:29:31'),
	(172,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 01:30:06','2019-09-27 01:30:06'),
	(173,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-27 01:30:56','2019-09-27 01:30:56'),
	(174,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 01:31:26','2019-09-27 01:31:26'),
	(175,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 01:32:32','2019-09-27 01:32:32'),
	(176,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,0.90,0.60,NULL,NULL,NULL,'2019-09-27 01:34:12','2019-09-27 01:34:12'),
	(177,1,4,182,NULL,NULL,NULL,'ماجيك لاتكس',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 01:35:54','2019-09-27 01:35:54'),
	(178,1,4,90,NULL,NULL,NULL,'كينج',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 01:37:46','2019-09-27 01:37:46'),
	(179,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 01:39:05','2019-09-27 01:39:05'),
	(180,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,3.00,1.00,NULL,NULL,NULL,'2019-09-27 01:40:34','2019-09-27 01:40:34'),
	(181,1,4,210,NULL,NULL,NULL,'ماجيك فوم',NULL,0.60,0.40,NULL,NULL,NULL,'2019-09-27 01:42:05','2019-09-27 01:42:05'),
	(182,1,4,210,NULL,NULL,NULL,'ماجيك فوم',NULL,0.75,0.45,NULL,NULL,NULL,'2019-09-27 01:42:54','2019-09-27 01:42:54'),
	(183,1,4,210,NULL,NULL,NULL,'ماجيك فوم',NULL,0.50,0.40,NULL,NULL,NULL,'2019-09-27 01:43:54','2019-09-27 01:43:54'),
	(184,1,4,210,NULL,NULL,NULL,'ماجيك فوم',NULL,0.70,0.40,NULL,NULL,NULL,'2019-09-27 01:44:51','2019-09-27 01:44:51'),
	(185,1,4,210,NULL,NULL,NULL,'ماجيك فوم',NULL,0.70,0.50,NULL,NULL,NULL,'2019-09-27 01:45:31','2019-09-27 01:45:31'),
	(186,1,4,210,NULL,NULL,NULL,'ماجيك فوم',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 01:46:06','2019-09-27 01:46:06'),
	(187,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 01:46:56','2019-09-27 01:46:56'),
	(188,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 01:47:47','2019-09-27 01:47:47'),
	(189,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 01:48:50','2019-09-27 01:48:50'),
	(190,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,0.75,0.50,NULL,NULL,NULL,'2019-09-27 01:49:34','2019-09-27 01:49:34'),
	(191,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 01:50:03','2019-09-27 01:50:03'),
	(192,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 01:50:29','2019-09-27 01:50:29'),
	(193,1,NULL,211,NULL,NULL,NULL,'روكا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 01:50:53','2019-09-27 01:50:53'),
	(194,1,NULL,212,NULL,NULL,NULL,'فيروز',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 01:51:45','2019-09-27 01:51:45'),
	(195,1,NULL,212,NULL,NULL,NULL,'فيروز',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 01:52:12','2019-09-27 01:52:12'),
	(196,1,NULL,212,NULL,NULL,NULL,'فيروز',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 01:52:51','2019-09-27 01:52:51'),
	(197,1,NULL,212,NULL,NULL,NULL,'فيروز',NULL,0.75,0.50,NULL,NULL,NULL,'2019-09-27 01:53:29','2019-09-27 01:53:29'),
	(198,1,NULL,212,NULL,NULL,NULL,'فيروز',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 01:53:53','2019-09-27 01:53:53'),
	(199,1,NULL,212,NULL,NULL,NULL,'فيروز',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 01:54:24','2019-09-27 01:54:24'),
	(200,1,4,222,NULL,NULL,NULL,'شاج سينو',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 01:59:28','2019-09-27 01:59:28'),
	(201,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 02:03:50','2019-09-27 02:03:50'),
	(202,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:04:09','2019-09-27 02:04:09'),
	(203,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:04:37','2019-09-27 02:04:37'),
	(204,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:04:58','2019-09-27 02:04:58'),
	(205,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 02:05:24','2019-09-27 02:05:24'),
	(206,1,NULL,204,NULL,NULL,NULL,'طقم دواسه سياره',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:06:29','2019-09-27 02:06:29'),
	(207,1,4,205,NULL,NULL,NULL,'نيس',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 02:07:51','2019-09-27 02:07:51'),
	(208,1,4,205,NULL,NULL,NULL,'نيس',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 02:08:38','2019-09-27 02:08:38'),
	(209,1,4,205,NULL,NULL,NULL,'نيس',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:09:17','2019-09-27 02:09:17'),
	(210,1,4,205,NULL,NULL,NULL,'نيس',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:09:39','2019-09-27 02:09:39'),
	(211,1,4,137,NULL,NULL,NULL,'الاباما',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:11:04','2019-09-27 02:11:04'),
	(212,1,4,206,NULL,NULL,NULL,'شامبين لاند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:11:47','2019-09-27 02:11:47'),
	(213,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-27 02:12:48','2019-09-27 02:12:48'),
	(214,1,4,137,NULL,NULL,NULL,'الاباما',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:13:29','2019-09-27 02:13:29'),
	(215,1,4,207,NULL,NULL,NULL,'مورا سيلفر',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 02:14:05','2019-09-27 02:14:05'),
	(216,1,4,207,NULL,NULL,NULL,'مورا سيلفر',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:14:49','2019-09-27 02:14:49'),
	(217,1,NULL,195,NULL,NULL,NULL,'الفرسان',NULL,2.00,1.00,NULL,NULL,NULL,'2019-09-27 02:18:13','2019-09-27 02:18:13'),
	(218,1,4,191,NULL,NULL,NULL,'شاج بريمادونا',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 02:21:22','2019-09-27 02:21:22'),
	(219,1,4,103,NULL,NULL,NULL,'قوقازي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:22:07','2019-09-27 02:22:07'),
	(220,1,9,174,NULL,NULL,NULL,'تورينو',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:22:59','2019-09-27 02:22:59'),
	(221,1,4,200,NULL,NULL,NULL,'هوب محفور',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 02:23:45','2019-09-27 02:23:45'),
	(222,1,4,168,NULL,NULL,NULL,'سابينا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:24:21','2019-09-27 02:24:21'),
	(223,1,4,223,NULL,NULL,NULL,'لابوتيك',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 02:27:28','2019-09-27 02:27:28'),
	(224,1,4,103,NULL,NULL,NULL,'قوقازي',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-27 02:28:30','2019-09-27 02:28:30'),
	(225,1,4,89,NULL,NULL,NULL,'شاج لافيستيا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 02:29:45','2019-09-27 02:29:45'),
	(226,1,NULL,201,NULL,NULL,NULL,'الوريس',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 02:30:27','2019-09-27 02:30:27'),
	(227,1,NULL,201,NULL,NULL,NULL,'الوريس',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 02:30:55','2019-09-27 02:30:55'),
	(228,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-27 02:31:28','2019-09-27 02:31:28'),
	(229,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 02:31:45','2019-09-27 02:31:45'),
	(230,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:32:18','2019-09-27 02:32:18'),
	(231,1,NULL,202,NULL,NULL,NULL,'رزان',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 02:32:51','2019-09-27 02:32:51'),
	(232,1,NULL,225,NULL,NULL,NULL,'سلطان لوران',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:36:41','2019-09-27 02:36:41'),
	(233,1,NULL,224,NULL,NULL,NULL,'استانا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:37:51','2019-09-27 02:37:51'),
	(234,1,NULL,226,NULL,NULL,NULL,'لاكاسا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:38:25','2019-09-27 02:38:25'),
	(235,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-27 02:39:20','2019-09-27 02:39:20'),
	(236,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 02:39:44','2019-09-27 02:39:44'),
	(237,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:40:15','2019-09-27 02:40:15'),
	(238,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:40:38','2019-09-27 02:40:38'),
	(239,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:40:57','2019-09-27 02:40:57'),
	(240,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 02:41:35','2019-09-27 02:41:35'),
	(241,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:42:00','2019-09-27 02:42:00'),
	(242,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:42:38','2019-09-27 02:42:38'),
	(243,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:42:59','2019-09-27 02:42:59'),
	(244,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,1.20,0.60,NULL,NULL,NULL,'2019-09-27 02:43:39','2019-09-27 02:43:39'),
	(245,1,4,197,NULL,NULL,NULL,'خان الخليلي',NULL,1.95,0.60,NULL,NULL,NULL,'2019-09-27 02:44:12','2019-09-27 02:44:12'),
	(246,1,4,182,NULL,NULL,NULL,'ماجيك لاتكس',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 02:46:52','2019-09-27 02:46:52'),
	(247,1,4,227,NULL,NULL,NULL,'روكسي',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 02:49:28','2019-09-27 02:49:28'),
	(248,1,4,227,NULL,NULL,NULL,'روكسي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:50:16','2019-09-27 02:50:16'),
	(249,1,4,227,NULL,NULL,NULL,'روكسي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:51:07','2019-09-27 02:51:07'),
	(250,1,4,227,NULL,NULL,NULL,'روكسي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:51:08','2019-09-27 02:51:08'),
	(251,1,4,227,NULL,NULL,NULL,'روكسي',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 02:53:20','2019-09-27 02:53:20'),
	(252,1,4,228,NULL,NULL,NULL,'سيجما',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 02:55:21','2019-09-27 02:55:21'),
	(253,1,4,228,NULL,NULL,NULL,'سيجما',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 02:55:49','2019-09-27 02:55:49'),
	(254,1,4,228,NULL,NULL,NULL,'سيجما',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 02:56:16','2019-09-27 02:56:16'),
	(255,1,4,228,NULL,NULL,NULL,'سيجما',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 02:57:40','2019-09-27 02:57:40'),
	(256,1,4,228,NULL,NULL,NULL,'سيجما',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 02:58:09','2019-09-27 02:58:09'),
	(257,1,4,228,NULL,NULL,NULL,'سيجما',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-27 02:58:41','2019-09-27 02:58:41'),
	(258,1,4,228,NULL,NULL,NULL,'سيجما',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 02:59:13','2019-09-27 02:59:13'),
	(259,1,4,228,NULL,NULL,NULL,'سيجما',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 02:59:45','2019-09-27 02:59:45'),
	(260,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 09:47:23','2019-09-27 09:47:23'),
	(261,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-27 09:48:29','2019-09-27 09:48:29'),
	(262,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,4.00,3.00,NULL,NULL,NULL,'2019-09-27 09:49:09','2019-09-27 09:49:09'),
	(264,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 09:53:27','2019-09-27 09:53:27'),
	(265,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-27 09:56:16','2019-09-27 09:56:16'),
	(266,1,4,195,NULL,NULL,NULL,'الفرسان',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-27 09:57:21','2019-09-27 09:57:21'),
	(267,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:54:27','2019-09-27 18:54:27'),
	(268,1,NULL,8,NULL,NULL,NULL,'نيو كاسيل',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:55:21','2019-09-27 18:55:21'),
	(269,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:56:34','2019-09-27 18:56:34'),
	(270,1,4,99,NULL,NULL,NULL,'كروز',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:57:21','2019-09-27 18:57:21'),
	(271,1,NULL,7,NULL,NULL,NULL,'سوبر ليالي',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:58:14','2019-09-27 18:58:14'),
	(272,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:59:08','2019-09-27 18:59:08'),
	(273,1,NULL,153,NULL,NULL,NULL,'شاج ناعم',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 18:59:53','2019-09-27 18:59:53'),
	(274,1,NULL,6,NULL,NULL,NULL,'سوبر فرجنيا',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 19:01:13','2019-09-27 19:01:13'),
	(275,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 19:01:42','2019-09-27 19:01:42'),
	(276,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,2.10,1.50,NULL,NULL,NULL,'2019-09-27 19:03:07','2019-09-27 19:03:07'),
	(277,1,NULL,2,NULL,NULL,NULL,'بروكسل',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 19:04:13','2019-09-27 19:04:13'),
	(278,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 19:04:55','2019-09-27 19:04:55'),
	(279,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,2.40,1.75,NULL,NULL,NULL,'2019-09-27 19:06:06','2019-09-27 19:06:06'),
	(280,1,NULL,4,NULL,NULL,NULL,'سوبر تينا',NULL,1.00,1.40,NULL,NULL,NULL,'2019-09-27 19:06:35','2019-09-27 19:06:35'),
	(281,1,NULL,12,NULL,NULL,NULL,'شيراز ايراني',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 19:08:09','2019-09-27 19:08:09'),
	(282,1,NULL,12,NULL,NULL,NULL,'شيراز ايراني',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 19:08:50','2019-09-27 19:08:50'),
	(283,1,NULL,12,NULL,NULL,NULL,'شيراز ايراني',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 19:09:24','2019-09-27 19:09:24'),
	(284,1,NULL,12,NULL,NULL,NULL,'شيراز ايراني',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 19:09:58','2019-09-27 19:09:58'),
	(285,1,NULL,12,NULL,NULL,NULL,'شيراز ايراني',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 19:10:31','2019-09-27 19:10:31'),
	(286,1,NULL,12,NULL,NULL,NULL,'شيراز ايراني',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 19:11:01','2019-09-27 19:11:01'),
	(287,1,NULL,8,NULL,NULL,NULL,'نيو كاسيل',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 19:12:03','2019-09-27 19:12:03'),
	(288,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-27 19:12:56','2019-09-27 19:12:56'),
	(289,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 19:13:28','2019-09-27 19:13:28'),
	(290,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 19:13:58','2019-09-27 19:13:58'),
	(291,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 19:14:32','2019-09-27 19:14:32'),
	(292,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 19:15:23','2019-09-27 19:15:23'),
	(293,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 19:15:54','2019-09-27 19:15:54'),
	(294,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 19:16:20','2019-09-27 19:16:20'),
	(295,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 19:16:54','2019-09-27 19:16:54'),
	(296,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 19:17:25','2019-09-27 19:17:25'),
	(297,1,NULL,47,NULL,NULL,NULL,'كريستال',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 19:18:16','2019-09-27 19:18:16'),
	(298,1,NULL,36,NULL,NULL,NULL,'صافي',NULL,2.40,3.25,NULL,NULL,NULL,'2019-09-27 19:19:16','2019-09-27 19:19:16'),
	(299,1,NULL,46,NULL,NULL,NULL,'كرمله',NULL,2.40,3.25,NULL,NULL,NULL,'2019-09-27 19:20:17','2019-09-27 19:20:17'),
	(300,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,3.30,2.25,NULL,NULL,NULL,'2019-09-27 19:22:23','2019-09-27 19:22:23'),
	(301,1,NULL,54,NULL,NULL,NULL,'مساجد تركي',NULL,1.00,1.33,NULL,NULL,NULL,'2019-09-27 19:25:05','2019-09-27 19:25:05'),
	(302,1,NULL,26,NULL,NULL,NULL,'حكاية',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 19:27:53','2019-09-27 19:27:53'),
	(303,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 19:28:46','2019-09-27 19:28:46'),
	(304,1,NULL,27,NULL,NULL,NULL,'روما',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 19:29:16','2019-09-27 19:29:16'),
	(305,1,NULL,27,NULL,NULL,NULL,'روما',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 19:29:53','2019-09-27 19:29:53'),
	(306,1,NULL,27,NULL,NULL,NULL,'روما',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-27 19:30:37','2019-09-27 19:30:37'),
	(307,1,NULL,27,NULL,NULL,NULL,'روما',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 19:31:12','2019-09-27 19:31:12'),
	(308,1,NULL,27,NULL,NULL,NULL,'روما',NULL,2.40,1.75,NULL,NULL,NULL,'2019-09-27 19:31:59','2019-09-27 19:31:59'),
	(309,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 19:32:26','2019-09-27 19:32:26'),
	(310,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 19:32:54','2019-09-27 19:32:54'),
	(311,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 19:33:25','2019-09-27 19:33:25'),
	(312,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 19:33:50','2019-09-27 19:33:50'),
	(313,1,NULL,27,NULL,NULL,NULL,'روما',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 19:34:30','2019-09-27 19:34:30'),
	(314,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 19:35:21','2019-09-27 19:35:21'),
	(315,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 19:35:46','2019-09-27 19:35:46'),
	(316,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 19:36:47','2019-09-27 19:36:47'),
	(317,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-27 19:37:35','2019-09-27 19:37:35'),
	(318,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-27 19:37:57','2019-09-27 19:37:57'),
	(319,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 19:38:28','2019-09-27 19:38:28'),
	(320,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 19:38:50','2019-09-27 19:38:50'),
	(321,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 19:39:20','2019-09-27 19:39:20'),
	(322,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 19:39:42','2019-09-27 19:39:42'),
	(323,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 19:40:27','2019-09-27 19:40:27'),
	(324,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 19:40:55','2019-09-27 19:40:55'),
	(325,1,NULL,19,NULL,NULL,NULL,'إيراني مروه',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-27 19:41:41','2019-09-27 19:41:41'),
	(326,1,NULL,14,NULL,NULL,NULL,'بسمة اطفال',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-27 19:42:24','2019-09-27 19:42:24'),
	(327,1,NULL,229,NULL,NULL,NULL,'طقم حمام الياسمين بشبشب',NULL,1.00,1.00,10,5,40.00,'2019-09-27 19:45:57','2019-09-27 19:45:57'),
	(328,1,NULL,154,NULL,NULL,NULL,'شاج خشن',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-27 20:12:06','2019-09-27 20:12:06'),
	(329,1,NULL,154,NULL,NULL,NULL,'شاج خشن',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 20:12:49','2019-09-27 20:12:49'),
	(330,1,NULL,155,NULL,NULL,NULL,'تافت كليو',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-27 20:14:41','2019-09-27 20:14:41'),
	(331,1,NULL,153,NULL,NULL,NULL,'شاج ناعم',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 20:15:29','2019-09-27 20:15:29'),
	(332,1,NULL,153,NULL,NULL,NULL,'شاج ناعم',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-27 20:16:12','2019-09-27 20:16:12'),
	(333,1,NULL,158,NULL,NULL,NULL,'شاج جوبلان',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-27 20:16:59','2019-09-27 20:16:59'),
	(334,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 20:18:02','2019-09-27 20:18:02'),
	(335,1,NULL,10,NULL,NULL,NULL,'يلدز',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 20:18:49','2019-09-27 20:18:49'),
	(336,1,NULL,11,NULL,NULL,NULL,'بلجيكي',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 20:19:15','2019-09-27 20:19:15'),
	(337,1,4,193,NULL,NULL,NULL,'شانزليزيه',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 20:20:06','2019-09-27 20:20:06'),
	(338,1,4,193,NULL,NULL,NULL,'شانزليزيه',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 20:22:48','2019-09-27 20:22:48'),
	(339,1,4,193,NULL,NULL,NULL,'شانزليزيه',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 20:23:16','2019-09-27 20:23:16'),
	(340,1,4,193,NULL,NULL,NULL,'شانزليزيه',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 20:24:01','2019-09-27 20:24:01'),
	(341,1,4,193,NULL,NULL,NULL,'شانزليزيه',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 20:24:36','2019-09-27 20:24:36'),
	(342,1,4,193,NULL,NULL,NULL,'شانزليزيه',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 20:25:13','2019-09-27 20:25:13'),
	(343,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 20:25:53','2019-09-27 20:25:53'),
	(344,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 20:26:35','2019-09-27 20:26:35'),
	(345,1,4,74,NULL,NULL,NULL,'موكت دهب',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-27 20:27:27','2019-09-27 20:27:27'),
	(346,1,4,194,NULL,NULL,NULL,'موكت هانوفر',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-27 20:28:18','2019-09-27 20:28:18'),
	(347,1,4,23,NULL,NULL,NULL,'سولو تافت',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 20:29:33','2019-09-27 20:29:33'),
	(349,1,4,23,NULL,NULL,NULL,'لوب تافت',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 20:32:18','2019-09-27 20:32:18'),
	(350,1,4,184,NULL,NULL,NULL,'صوف',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-27 20:33:48','2019-09-27 20:33:48'),
	(351,1,NULL,1,NULL,NULL,NULL,'مادلين',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 20:35:18','2019-09-27 20:35:18'),
	(352,1,NULL,188,NULL,NULL,NULL,'شانيل حرير',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 20:36:18','2019-09-27 20:36:18'),
	(353,1,NULL,48,NULL,NULL,NULL,'كريستينا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 20:37:23','2019-09-27 20:37:23'),
	(354,1,NULL,36,NULL,NULL,NULL,'صافي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 20:37:55','2019-09-27 20:37:55'),
	(355,1,NULL,29,NULL,NULL,NULL,'زهره',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 20:39:29','2019-09-27 20:39:29'),
	(356,1,4,133,NULL,NULL,NULL,'كانكون',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 20:40:04','2019-09-27 20:40:04'),
	(357,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-27 20:41:03','2019-09-27 20:41:03'),
	(358,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 20:41:38','2019-09-27 20:41:38'),
	(359,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 20:42:19','2019-09-27 20:42:19'),
	(360,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 20:42:47','2019-09-27 20:42:47'),
	(361,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 20:43:13','2019-09-27 20:43:13'),
	(362,1,4,189,NULL,NULL,NULL,'قشقاي يونايتد',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 20:43:35','2019-09-27 20:43:35'),
	(363,1,9,146,NULL,NULL,NULL,'القصر',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 20:45:28','2019-09-27 20:45:28'),
	(364,1,9,147,NULL,NULL,NULL,'سيمبا اطفال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 20:46:05','2019-09-27 20:46:05'),
	(365,1,9,147,NULL,NULL,NULL,'سيمبا اطفال',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 20:46:36','2019-09-27 20:46:36'),
	(366,1,9,147,NULL,NULL,NULL,'سيمبا اطفال',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 20:47:07','2019-09-27 20:47:07'),
	(367,1,9,148,NULL,NULL,NULL,'جوبلان',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 20:47:39','2019-09-27 20:47:39'),
	(368,1,9,87,NULL,NULL,NULL,'لايف',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 20:48:11','2019-09-27 20:48:11'),
	(369,1,9,87,NULL,NULL,NULL,'لايف',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 20:48:37','2019-09-27 20:48:37'),
	(370,1,9,151,NULL,NULL,NULL,'امياسادور',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 20:49:39','2019-09-27 20:49:39'),
	(371,1,9,151,NULL,NULL,NULL,'امياسادور',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 20:50:13','2019-09-27 20:50:13'),
	(372,1,9,150,NULL,NULL,NULL,'فلورنس',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 20:50:50','2019-09-27 20:50:50'),
	(373,1,9,150,NULL,NULL,NULL,'فلورنس',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-27 20:51:17','2019-09-27 20:51:17'),
	(374,1,9,150,NULL,NULL,NULL,'فلورنس',NULL,2.20,0.80,NULL,NULL,NULL,'2019-09-27 20:51:56','2019-09-27 20:51:56'),
	(375,1,9,150,NULL,NULL,NULL,'فلورنس',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-27 20:52:22','2019-09-27 20:52:22'),
	(376,1,9,150,NULL,NULL,NULL,'فلورنس',NULL,1.90,1.00,NULL,NULL,NULL,'2019-09-27 20:52:59','2019-09-27 20:52:59'),
	(377,1,9,150,NULL,NULL,NULL,'فلورنس',NULL,2.90,1.00,NULL,NULL,NULL,'2019-09-27 20:58:02','2019-09-27 20:58:02'),
	(378,1,NULL,7,NULL,NULL,NULL,'سوبر ليالي',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-27 21:17:00','2019-09-27 21:17:00'),
	(379,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-27 21:18:31','2019-09-27 21:18:31'),
	(380,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-27 21:19:25','2019-09-27 21:19:25'),
	(381,1,NULL,35,NULL,NULL,NULL,'شمس',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 21:20:02','2019-09-27 21:20:02'),
	(382,1,4,160,NULL,NULL,NULL,'ميموري',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 21:20:42','2019-09-27 21:20:42'),
	(383,1,4,160,NULL,NULL,NULL,'ميموري',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 21:21:15','2019-09-27 21:21:15'),
	(384,1,9,161,NULL,NULL,NULL,'حياه',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:21:52','2019-09-27 21:21:52'),
	(385,1,NULL,50,NULL,NULL,NULL,'مارينا اطفال',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-27 21:22:41','2019-09-27 21:22:41'),
	(386,1,4,108,NULL,NULL,NULL,'صن ست',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:23:12','2019-09-27 21:23:12'),
	(387,1,4,108,NULL,NULL,NULL,'صن ست',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-27 21:23:53','2019-09-27 21:23:53'),
	(388,1,NULL,13,NULL,NULL,NULL,'سلمي ايراني',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 21:24:50','2019-09-27 21:24:50'),
	(389,1,NULL,13,NULL,NULL,NULL,'سلمي ايراني',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:25:23','2019-09-27 21:25:23'),
	(390,1,4,162,NULL,NULL,NULL,'زمرده',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:26:14','2019-09-27 21:26:14'),
	(391,1,4,163,NULL,NULL,NULL,'مرمر','photos/CAm6umkWu7fLlK80Eifr2NvOIo4NjwJa.jpg',2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:27:45','2019-09-27 21:27:45'),
	(392,1,NULL,164,NULL,NULL,NULL,'كاشان',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 21:28:16','2019-09-27 21:28:16'),
	(393,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:28:51','2019-09-27 21:28:51'),
	(394,1,4,165,NULL,NULL,NULL,'كابريز',NULL,2.20,1.55,NULL,NULL,NULL,'2019-09-27 21:29:34','2019-09-27 21:29:34'),
	(395,1,NULL,36,NULL,NULL,NULL,'صافي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:30:10','2019-09-27 21:30:10'),
	(396,1,NULL,20,NULL,NULL,NULL,'باريس',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 21:30:51','2019-09-27 21:30:51'),
	(397,1,NULL,36,NULL,NULL,NULL,'صافي',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 21:33:00','2019-09-27 21:33:00'),
	(398,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 21:33:37','2019-09-27 21:33:37'),
	(399,1,4,68,NULL,NULL,NULL,'موف اون',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 21:34:12','2019-09-27 21:34:12'),
	(400,1,9,166,NULL,NULL,NULL,'الاباز',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 21:34:48','2019-09-27 21:34:48'),
	(401,1,4,108,NULL,NULL,NULL,'صن ست',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 21:35:52','2019-09-27 21:35:52'),
	(402,1,4,108,NULL,NULL,NULL,'صن ست',NULL,1.70,1.10,NULL,NULL,NULL,'2019-09-27 21:36:29','2019-09-27 21:36:29'),
	(403,1,NULL,17,NULL,NULL,NULL,'لؤلؤه',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 21:36:55','2019-09-27 21:36:55'),
	(404,1,NULL,17,NULL,NULL,NULL,'لؤلؤه',NULL,2.00,2.00,NULL,NULL,NULL,'2019-09-27 21:37:33','2019-09-27 21:37:33'),
	(405,1,4,76,NULL,NULL,NULL,'ماك',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 21:38:18','2019-09-27 21:38:18'),
	(406,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 21:39:26','2019-09-27 21:39:26'),
	(407,1,NULL,50,NULL,NULL,NULL,'مارينا اطفال',NULL,1.80,1.10,NULL,NULL,NULL,'2019-09-27 21:40:59','2019-09-27 21:40:59'),
	(408,1,4,167,NULL,NULL,NULL,'روما مقلم',NULL,2.00,0.65,NULL,NULL,NULL,'2019-09-27 21:43:13','2019-09-27 21:43:13'),
	(409,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:43:44','2019-09-27 21:43:44'),
	(410,1,NULL,18,NULL,NULL,NULL,'اميرة',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:44:39','2019-09-27 21:44:39'),
	(411,1,NULL,29,NULL,NULL,NULL,'زهره',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:45:29','2019-09-27 21:45:29'),
	(412,1,NULL,48,NULL,NULL,NULL,'كريستينا',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:46:11','2019-09-27 21:46:11'),
	(413,1,NULL,27,NULL,NULL,NULL,'روما',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:46:45','2019-09-27 21:46:45'),
	(414,1,NULL,36,NULL,NULL,NULL,'صافي',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:47:13','2019-09-27 21:47:13'),
	(415,1,4,109,NULL,NULL,NULL,'سيزارو',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 21:47:57','2019-09-27 21:47:57'),
	(416,1,4,168,NULL,NULL,NULL,'سابينا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:48:29','2019-09-27 21:48:29'),
	(417,1,4,103,NULL,NULL,NULL,'قوقازي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:48:58','2019-09-27 21:48:58'),
	(418,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:49:26','2019-09-27 21:49:26'),
	(419,1,9,169,NULL,NULL,NULL,'الحمد اطفال',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:50:20','2019-09-27 21:50:20'),
	(420,1,9,169,NULL,NULL,NULL,'الحمد اطفال',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:50:20','2019-09-27 21:50:20'),
	(421,1,4,89,NULL,NULL,NULL,'لافيستا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:51:05','2019-09-27 21:51:05'),
	(422,1,4,36,NULL,NULL,NULL,'صافي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:51:54','2019-09-27 21:51:54'),
	(423,1,NULL,46,NULL,NULL,NULL,'كرمله',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:52:28','2019-09-27 21:52:28'),
	(424,1,4,108,NULL,NULL,NULL,'صن ست',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 21:52:52','2019-09-27 21:52:52'),
	(425,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 21:53:27','2019-09-27 21:53:27'),
	(426,1,NULL,13,NULL,NULL,NULL,'سلمي ايراني',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 21:53:58','2019-09-27 21:53:58'),
	(427,1,4,230,NULL,NULL,NULL,'ماجيك كيدز',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 21:58:03','2019-09-27 21:58:03'),
	(428,1,4,171,NULL,NULL,NULL,'فليشيا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 21:59:01','2019-09-27 21:59:01'),
	(429,1,9,169,NULL,NULL,NULL,'الحمد اطفال',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 21:59:34','2019-09-27 21:59:34'),
	(430,1,NULL,46,NULL,NULL,NULL,'كرمله',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 22:00:07','2019-09-27 22:00:07'),
	(431,1,9,169,NULL,NULL,NULL,'الحمد اطفال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:01:55','2019-09-27 22:01:55'),
	(432,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:02:24','2019-09-27 22:02:24'),
	(433,1,NULL,13,NULL,NULL,NULL,'سلمي ايراني',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:03:12','2019-09-27 22:03:12'),
	(434,1,4,103,NULL,NULL,NULL,'قوقازي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:03:45','2019-09-27 22:03:45'),
	(435,1,NULL,31,NULL,NULL,NULL,'سوبر هانوفر',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:04:49','2019-09-27 22:04:49'),
	(436,1,NULL,46,NULL,NULL,NULL,'كرمله',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:05:26','2019-09-27 22:05:26'),
	(437,1,9,172,NULL,NULL,NULL,'فلورا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:05:59','2019-09-27 22:05:59'),
	(438,1,4,108,NULL,NULL,NULL,'صن ست',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 22:06:44','2019-09-27 22:06:44'),
	(439,1,NULL,46,NULL,NULL,NULL,'كرمله',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 22:07:16','2019-09-27 22:07:16'),
	(440,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 22:07:48','2019-09-27 22:07:48'),
	(441,1,4,76,NULL,NULL,NULL,'ماك',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 22:08:41','2019-09-27 22:08:41'),
	(442,1,4,76,NULL,NULL,NULL,'ماك',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:09:22','2019-09-27 22:09:22'),
	(443,1,4,76,NULL,NULL,NULL,'ماك',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 22:10:12','2019-09-27 22:10:12'),
	(444,1,NULL,46,NULL,NULL,NULL,'كرمله',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:10:41','2019-09-27 22:10:41'),
	(445,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:11:09','2019-09-27 22:11:09'),
	(446,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,0.60,0.50,NULL,NULL,NULL,'2019-09-27 22:12:01','2019-09-27 22:12:01'),
	(447,1,NULL,29,NULL,NULL,NULL,'زهره',NULL,0.75,0.50,NULL,NULL,NULL,'2019-09-27 22:12:36','2019-09-27 22:12:36'),
	(448,1,9,174,NULL,NULL,NULL,'تورينو',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 22:13:04','2019-09-27 22:13:04'),
	(449,1,4,174,NULL,NULL,NULL,'ماك تورينو',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 22:13:34','2019-09-27 22:13:34'),
	(450,1,NULL,177,NULL,NULL,NULL,'سرفله',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:15:40','2019-09-27 22:15:40'),
	(451,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 22:16:59','2019-09-27 22:16:59'),
	(452,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-27 22:18:27','2019-09-27 22:18:27'),
	(453,1,NULL,50,NULL,NULL,NULL,'مارينا اطفال',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-27 22:19:22','2019-09-27 22:19:22'),
	(454,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-27 22:19:49','2019-09-27 22:19:49'),
	(455,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:20:16','2019-09-27 22:20:16'),
	(456,1,NULL,13,NULL,NULL,NULL,'سلمي ايراني',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:20:41','2019-09-27 22:20:41'),
	(457,1,4,103,NULL,NULL,NULL,'قوقازي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:21:14','2019-09-27 22:21:14'),
	(458,1,4,210,NULL,NULL,NULL,'ماجيك شعبي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:22:49','2019-09-27 22:22:49'),
	(459,1,NULL,231,NULL,NULL,NULL,'طقم حمام شاج كانون',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:24:28','2019-09-27 22:24:28'),
	(460,1,4,209,NULL,NULL,NULL,'دواسه ميزو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:25:11','2019-09-27 22:25:11'),
	(461,1,4,175,NULL,NULL,NULL,'جنيور محفور',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:25:49','2019-09-27 22:25:49'),
	(462,1,9,174,NULL,NULL,NULL,'ماك تورينو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:26:30','2019-09-27 22:26:30'),
	(463,1,4,232,NULL,NULL,NULL,'غوايش',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 22:28:05','2019-09-27 22:28:05'),
	(464,1,NULL,18,NULL,NULL,NULL,'اميرة',NULL,0.75,0.50,NULL,NULL,NULL,'2019-09-27 22:28:56','2019-09-27 22:28:56'),
	(465,1,NULL,23,NULL,NULL,NULL,'تافت تركي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 22:29:51','2019-09-27 22:29:51'),
	(466,1,4,176,NULL,NULL,NULL,'هاند تافت',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 22:30:24','2019-09-27 22:30:24'),
	(467,1,4,176,NULL,NULL,NULL,'هاند تافت',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 22:30:56','2019-09-27 22:30:56'),
	(468,1,4,176,NULL,NULL,NULL,'هاند تافت',NULL,1.60,0.80,NULL,NULL,NULL,'2019-09-27 22:31:49','2019-09-27 22:31:49'),
	(469,1,4,176,NULL,NULL,NULL,'هاند تافت',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:32:13','2019-09-27 22:32:13'),
	(470,1,4,176,NULL,NULL,NULL,'هاند تافت',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 22:33:20','2019-09-27 22:33:20'),
	(471,1,NULL,25,NULL,NULL,NULL,'جوليا',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-27 22:46:25','2019-09-27 22:46:25'),
	(472,1,NULL,183,NULL,NULL,NULL,'نقل ومشال',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:47:32','2019-09-27 22:47:32'),
	(473,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 22:49:01','2019-09-27 22:49:01'),
	(474,1,NULL,25,NULL,NULL,NULL,'جوليا',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 22:49:41','2019-09-27 22:49:41'),
	(475,1,4,103,NULL,NULL,NULL,'قوقازي',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-27 22:50:19','2019-09-27 22:50:19'),
	(476,1,4,92,NULL,NULL,NULL,'كيد زينيا',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-27 22:51:14','2019-09-27 22:51:14'),
	(477,1,NULL,35,NULL,NULL,NULL,'شمس',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 22:51:59','2019-09-27 22:51:59'),
	(478,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 22:55:09','2019-09-27 22:55:09'),
	(479,1,4,108,NULL,NULL,NULL,'صن ست',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:56:39','2019-09-27 22:56:39'),
	(480,1,9,173,NULL,NULL,NULL,'فلوبا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:57:16','2019-09-27 22:57:16'),
	(481,1,4,233,NULL,NULL,NULL,'بروكسل نساجون',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 22:59:32','2019-09-27 22:59:32'),
	(482,1,9,174,NULL,NULL,NULL,'تورينو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:00:56','2019-09-27 23:00:56'),
	(483,1,4,187,NULL,NULL,NULL,'فاشون',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:01:40','2019-09-27 23:01:40'),
	(484,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:02:17','2019-09-27 23:02:17'),
	(485,1,4,187,NULL,NULL,NULL,'فاشون',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 23:02:46','2019-09-27 23:02:46'),
	(486,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 23:03:20','2019-09-27 23:03:20'),
	(487,1,4,184,NULL,NULL,NULL,'هارموني',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-27 23:04:42','2019-09-27 23:04:42'),
	(488,1,NULL,185,NULL,NULL,NULL,'خيال',NULL,3.20,2.20,NULL,NULL,NULL,'2019-09-27 23:05:45','2019-09-27 23:05:45'),
	(489,1,4,184,NULL,NULL,NULL,'هارموني',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 23:06:32','2019-09-27 23:06:32'),
	(490,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-27 23:07:02','2019-09-27 23:07:02'),
	(491,1,4,72,NULL,NULL,NULL,'مساجد نور',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-27 23:07:42','2019-09-27 23:07:42'),
	(492,1,9,92,NULL,NULL,NULL,'جولدن كيدز',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 23:08:53','2019-09-27 23:08:53'),
	(493,1,9,92,NULL,NULL,NULL,'جولدن كيدز',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:09:33','2019-09-27 23:09:33'),
	(494,1,NULL,23,NULL,NULL,NULL,'تافت تركي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:10:06','2019-09-27 23:10:06'),
	(495,1,NULL,36,NULL,NULL,NULL,'صافي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:10:41','2019-09-27 23:10:41'),
	(496,1,NULL,17,NULL,NULL,NULL,'لؤلؤه',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-27 23:16:42','2019-09-27 23:16:42'),
	(497,1,NULL,17,NULL,NULL,NULL,'لؤلؤه',NULL,2.90,1.00,NULL,NULL,NULL,'2019-09-27 23:17:20','2019-09-27 23:17:20'),
	(498,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,2.60,1.80,NULL,NULL,NULL,'2019-09-27 23:18:19','2019-09-27 23:18:19'),
	(499,1,NULL,35,NULL,NULL,NULL,'شمس',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-27 23:18:44','2019-09-27 23:18:44'),
	(500,1,NULL,23,NULL,NULL,NULL,'تافت تركي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 23:19:26','2019-09-27 23:19:26'),
	(501,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 23:19:56','2019-09-27 23:19:56'),
	(502,1,NULL,159,NULL,NULL,NULL,'جوبلان ايكيا',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-27 23:21:10','2019-09-27 23:21:10'),
	(503,1,NULL,17,NULL,NULL,NULL,'لؤلؤه',NULL,2.20,0.80,NULL,NULL,NULL,'2019-09-27 23:21:36','2019-09-27 23:21:36'),
	(504,1,4,234,NULL,NULL,NULL,'سوبر جاردن',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-27 23:23:24','2019-09-27 23:23:24'),
	(505,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-27 23:24:10','2019-09-27 23:24:10'),
	(506,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-27 23:25:10','2019-09-27 23:25:10'),
	(507,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-27 23:25:34','2019-09-27 23:25:34'),
	(508,1,4,182,NULL,NULL,NULL,'ماجيك لاتكس',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 23:26:06','2019-09-27 23:26:06'),
	(509,1,4,182,NULL,NULL,NULL,'ماجيك لاتكس',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:26:32','2019-09-27 23:26:32'),
	(510,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,2.80,1.85,NULL,NULL,NULL,'2019-09-27 23:28:06','2019-09-27 23:28:06'),
	(511,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,2.40,1.70,NULL,NULL,NULL,'2019-09-27 23:28:42','2019-09-27 23:28:42'),
	(512,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,2.15,1.45,NULL,NULL,NULL,'2019-09-27 23:29:26','2019-09-27 23:29:26'),
	(513,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:30:04','2019-09-27 23:30:04'),
	(514,1,4,180,NULL,NULL,NULL,'بازوكا يونايتد',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-27 23:30:31','2019-09-27 23:30:31'),
	(515,1,NULL,179,NULL,NULL,NULL,'خيط',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-27 23:32:48','2019-09-27 23:32:48'),
	(516,1,4,186,NULL,NULL,NULL,'نجيل صناعي',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-27 23:33:48','2019-09-27 23:33:48'),
	(517,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 23:34:17','2019-09-27 23:34:17'),
	(518,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 23:34:36','2019-09-27 23:34:36'),
	(519,1,NULL,5,NULL,NULL,NULL,'سوبرشام',NULL,3.00,2.00,NULL,NULL,NULL,'2019-09-27 23:35:09','2019-09-27 23:35:09'),
	(520,1,4,118,NULL,NULL,NULL,'روكا لاند',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 23:35:57','2019-09-27 23:35:57'),
	(521,1,NULL,17,NULL,NULL,NULL,'لؤلؤه',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 23:36:24','2019-09-27 23:36:24'),
	(522,1,9,174,NULL,NULL,NULL,'تورينو',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 23:37:19','2019-09-27 23:37:19'),
	(523,1,4,190,NULL,NULL,NULL,'سنشيري',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-27 23:38:03','2019-09-27 23:38:03'),
	(524,1,4,190,NULL,NULL,NULL,'سنشيري',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-27 23:38:37','2019-09-27 23:38:37'),
	(525,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 23:39:08','2019-09-27 23:39:08'),
	(526,1,4,191,NULL,NULL,NULL,'شاج بريمادونا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 23:39:47','2019-09-27 23:39:47'),
	(527,1,4,118,NULL,NULL,NULL,'روكا لاند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-27 23:40:29','2019-09-27 23:40:29'),
	(528,1,9,149,NULL,NULL,NULL,'ماجستي',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-27 23:41:09','2019-09-27 23:41:09'),
	(529,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 23:41:38','2019-09-27 23:41:38'),
	(530,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-27 23:41:43','2019-09-27 23:41:43'),
	(531,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,4.00,1.00,NULL,NULL,NULL,'2019-09-27 23:42:13','2019-09-27 23:42:13'),
	(532,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,3.00,1.00,NULL,NULL,NULL,'2019-09-27 23:42:35','2019-09-27 23:42:35'),
	(533,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,2.10,1.55,NULL,NULL,NULL,'2019-09-27 23:43:30','2019-09-27 23:43:30'),
	(534,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,2.60,1.70,NULL,NULL,NULL,'2019-09-27 23:44:19','2019-09-27 23:44:19'),
	(535,1,NULL,49,NULL,NULL,NULL,'كليوباترا تركي',NULL,2.20,1.50,NULL,NULL,NULL,'2019-09-27 23:44:59','2019-09-27 23:44:59'),
	(536,1,NULL,32,NULL,NULL,NULL,'شاج 3دي',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 16:16:52','2019-09-28 16:16:52'),
	(537,1,NULL,32,NULL,NULL,NULL,'شاج 3دي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:17:38','2019-09-28 16:17:38'),
	(538,1,NULL,32,NULL,NULL,NULL,'شاج 3دي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 16:18:18','2019-09-28 16:18:18'),
	(539,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 16:19:14','2019-09-28 16:19:14'),
	(540,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:20:38','2019-09-28 16:20:38'),
	(541,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-28 16:21:18','2019-09-28 16:21:18'),
	(542,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 16:22:11','2019-09-28 16:22:11'),
	(543,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:22:46','2019-09-28 16:22:46'),
	(544,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 16:23:22','2019-09-28 16:23:22'),
	(545,1,NULL,55,NULL,NULL,NULL,'شاج ورده',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 16:24:00','2019-09-28 16:24:00'),
	(546,1,NULL,24,NULL,NULL,NULL,'جودي تركي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 16:25:45','2019-09-28 16:25:45'),
	(547,1,NULL,24,NULL,NULL,NULL,'جودي تركي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:26:15','2019-09-28 16:26:15'),
	(548,1,NULL,24,NULL,NULL,NULL,'جودي تركي',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-28 16:26:56','2019-09-28 16:26:56'),
	(549,1,NULL,24,NULL,NULL,NULL,'جودي تركي',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-28 16:27:23','2019-09-28 16:27:23'),
	(550,1,NULL,20,NULL,NULL,1,'باريس',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 16:27:55','2019-12-27 18:51:19'),
	(551,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-28 16:30:36','2019-09-28 16:30:36'),
	(552,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 16:31:02','2019-09-28 16:31:02'),
	(553,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:31:26','2019-09-28 16:31:26'),
	(554,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-28 16:32:06','2019-09-28 16:32:06'),
	(555,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 16:32:38','2019-09-28 16:32:38'),
	(556,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:33:03','2019-09-28 16:33:03'),
	(557,1,NULL,45,NULL,NULL,NULL,'فريده',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 16:33:54','2019-09-28 16:33:54'),
	(558,1,NULL,52,NULL,NULL,NULL,'مدريد',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-28 16:34:30','2019-09-28 16:34:30'),
	(559,1,NULL,52,NULL,NULL,NULL,'مدريد',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:35:14','2019-09-28 16:35:14'),
	(560,1,NULL,52,NULL,NULL,NULL,'مدريد',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-28 16:35:49','2019-09-28 16:35:49'),
	(561,1,NULL,52,NULL,NULL,NULL,'مدريد',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:36:14','2019-09-28 16:36:14'),
	(562,1,NULL,52,NULL,NULL,NULL,'مدريد',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 16:36:41','2019-09-28 16:36:41'),
	(563,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-28 16:37:40','2019-09-28 16:37:40'),
	(564,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,1.50,1.50,NULL,NULL,NULL,'2019-09-28 16:38:52','2019-09-28 16:38:52'),
	(565,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 16:39:26','2019-09-28 16:39:26'),
	(566,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:40:00','2019-09-28 16:40:00'),
	(567,1,NULL,30,NULL,NULL,NULL,'شاج سوبر ملك',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 16:40:30','2019-09-28 16:40:30'),
	(568,1,NULL,25,NULL,NULL,NULL,'جوليا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 16:45:19','2019-09-28 16:45:19'),
	(569,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:47:03','2019-09-28 16:47:03'),
	(570,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:48:01','2019-09-28 16:48:01'),
	(571,1,NULL,50,NULL,NULL,NULL,'مارينا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 16:48:31','2019-09-28 16:48:31'),
	(572,1,NULL,29,NULL,NULL,NULL,'زهره',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:49:01','2019-09-28 16:49:01'),
	(573,1,NULL,29,NULL,NULL,NULL,'زهره',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 16:49:30','2019-09-28 16:49:30'),
	(574,1,NULL,48,NULL,NULL,NULL,'كريستينا',NULL,3.25,2.40,NULL,NULL,NULL,'2019-09-28 16:50:22','2019-09-28 16:50:22'),
	(575,1,NULL,48,NULL,NULL,NULL,'كريستينا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:51:15','2019-09-28 16:51:15'),
	(576,1,NULL,235,NULL,NULL,NULL,'طقم حمام مارسليا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:53:20','2019-09-28 16:53:20'),
	(577,1,NULL,35,NULL,NULL,NULL,'شمس',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 16:53:58','2019-09-28 16:53:58'),
	(578,1,NULL,35,NULL,NULL,NULL,'شمس',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:54:21','2019-09-28 16:54:21'),
	(579,1,NULL,35,NULL,NULL,NULL,'شمس',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 16:54:57','2019-09-28 16:54:57'),
	(580,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,3.20,2.30,NULL,NULL,NULL,'2019-09-28 16:56:22','2019-09-28 16:56:22'),
	(581,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 16:56:50','2019-09-28 16:56:50'),
	(582,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 16:57:18','2019-09-28 16:57:18'),
	(583,1,NULL,37,NULL,NULL,NULL,'صوفيا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 16:57:18','2019-09-28 16:57:18'),
	(584,1,NULL,152,NULL,NULL,NULL,'3دي',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 16:58:11','2019-09-28 16:58:11'),
	(585,1,NULL,152,NULL,NULL,NULL,'3دي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 16:58:38','2019-09-28 16:58:38'),
	(586,1,NULL,152,NULL,NULL,NULL,'3دي',NULL,2.20,0.80,NULL,NULL,NULL,'2019-09-28 16:59:13','2019-09-28 16:59:13'),
	(587,1,NULL,152,NULL,NULL,NULL,'3دي',NULL,2.20,0.80,NULL,NULL,NULL,'2019-09-28 16:59:13','2019-09-28 16:59:13'),
	(588,1,NULL,53,NULL,NULL,NULL,'مريم',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-28 16:59:47','2019-09-28 16:59:47'),
	(589,1,NULL,53,NULL,NULL,NULL,'مريم',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:00:09','2019-09-28 17:00:09'),
	(590,1,NULL,28,NULL,NULL,NULL,'روما شعبي',NULL,2.10,1.55,NULL,NULL,NULL,'2019-09-28 17:01:47','2019-09-28 17:01:47'),
	(591,1,NULL,28,NULL,NULL,NULL,'روما شعبي',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 17:02:22','2019-09-28 17:02:22'),
	(592,1,NULL,28,NULL,NULL,NULL,'روما شعبي',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 17:02:22','2019-09-28 17:02:22'),
	(593,1,NULL,28,NULL,NULL,NULL,'روما شعبي',NULL,2.10,1.50,NULL,NULL,NULL,'2019-09-28 17:03:34','2019-09-28 17:03:34'),
	(594,1,NULL,28,NULL,NULL,NULL,'روما شعبي',NULL,3.50,2.50,NULL,NULL,NULL,'2019-09-28 17:04:26','2019-09-28 17:04:26'),
	(595,1,NULL,153,NULL,NULL,NULL,'شاج ناعم',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 17:05:21','2019-09-28 17:05:21'),
	(596,1,NULL,153,NULL,NULL,NULL,'شاج ناعم',NULL,1.50,0.80,NULL,NULL,NULL,'2019-09-28 17:05:48','2019-09-28 17:05:48'),
	(597,1,NULL,153,NULL,NULL,NULL,'شاج ناعم',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 17:06:13','2019-09-28 17:06:13'),
	(598,1,NULL,154,NULL,NULL,NULL,'شاج خشن',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 17:06:48','2019-09-28 17:06:48'),
	(599,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 17:14:34','2019-09-28 17:14:34'),
	(600,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 17:15:01','2019-09-28 17:15:01'),
	(601,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:15:39','2019-09-28 17:15:39'),
	(602,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 17:16:40','2019-09-28 17:16:40'),
	(603,1,NULL,34,NULL,NULL,NULL,'شاج ملك',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:17:12','2019-09-28 17:17:12'),
	(604,1,NULL,51,NULL,NULL,NULL,'مانديلا',NULL,0.90,0.60,NULL,NULL,NULL,'2019-09-28 17:17:55','2019-09-28 17:17:55'),
	(605,1,NULL,51,NULL,NULL,NULL,'مانديلا',NULL,0.60,0.40,NULL,NULL,NULL,'2019-09-28 17:18:28','2019-09-28 17:18:28'),
	(606,1,NULL,51,NULL,NULL,NULL,'مانديلا',NULL,2.00,1.80,NULL,NULL,NULL,'2019-09-28 17:19:17','2019-09-28 17:19:17'),
	(607,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 17:19:57','2019-09-28 17:19:57'),
	(608,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 17:20:24','2019-09-28 17:20:24'),
	(609,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,0.60,0.60,NULL,NULL,NULL,'2019-09-28 17:21:03','2019-09-28 17:21:03'),
	(610,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-28 17:21:29','2019-09-28 17:21:29'),
	(611,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,1.90,1.30,NULL,NULL,NULL,'2019-09-28 17:22:10','2019-09-28 17:22:10'),
	(612,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:22:46','2019-09-28 17:22:46'),
	(613,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:23:21','2019-09-28 17:23:21'),
	(614,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 17:23:42','2019-09-28 17:23:42'),
	(615,1,NULL,33,NULL,NULL,NULL,'شاج مريم',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 17:24:03','2019-09-28 17:24:03'),
	(616,1,NULL,32,NULL,NULL,NULL,'شاج 3دي',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 17:24:46','2019-09-28 17:24:46'),
	(617,1,NULL,32,NULL,NULL,NULL,'شاج 3دي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 17:25:07','2019-09-28 17:25:07'),
	(618,1,NULL,32,NULL,NULL,NULL,'شاج 3دي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 17:25:40','2019-09-28 17:25:40'),
	(619,1,4,124,NULL,NULL,NULL,'ديزرت',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:42:35','2019-09-28 17:42:35'),
	(620,1,4,124,NULL,NULL,NULL,'ديزرت',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 17:42:56','2019-09-28 17:42:56'),
	(621,1,4,124,NULL,NULL,NULL,'ديزرت',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 17:43:17','2019-09-28 17:43:17'),
	(622,1,4,117,NULL,NULL,NULL,'ريحانه',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 17:44:00','2019-09-28 17:44:00'),
	(623,1,4,117,NULL,NULL,NULL,'ريحانه',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:44:24','2019-09-28 17:44:24'),
	(624,1,4,116,NULL,NULL,NULL,'زان',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 17:44:50','2019-09-28 17:44:50'),
	(625,1,4,116,NULL,NULL,NULL,'زان',NULL,3.20,2.20,NULL,NULL,NULL,'2019-09-28 17:45:25','2019-09-28 17:45:25'),
	(626,1,4,116,NULL,NULL,NULL,'زان',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 17:45:47','2019-09-28 17:45:47'),
	(627,1,4,116,NULL,NULL,NULL,'زان',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 17:46:19','2019-09-28 17:46:19'),
	(628,1,4,116,NULL,NULL,NULL,'زان',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-28 17:46:40','2019-09-28 17:46:40'),
	(629,1,4,116,NULL,NULL,NULL,'زان',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-28 17:47:34','2019-09-28 17:47:34'),
	(630,1,4,116,NULL,NULL,NULL,'زان',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:47:57','2019-09-28 17:47:57'),
	(631,1,4,116,NULL,NULL,NULL,'زان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:48:24','2019-09-28 17:48:24'),
	(632,1,4,116,NULL,NULL,NULL,'زان',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 17:48:42','2019-09-28 17:48:42'),
	(633,1,4,116,NULL,NULL,NULL,'زان',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 17:49:38','2019-09-28 17:49:38'),
	(634,1,4,115,NULL,NULL,NULL,'جنات',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:50:15','2019-09-28 17:50:15'),
	(635,1,4,115,NULL,NULL,NULL,'جنات',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:50:35','2019-09-28 17:50:35'),
	(636,1,4,115,NULL,NULL,NULL,'جنات',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 17:50:52','2019-09-28 17:50:52'),
	(637,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,2.15,1.45,NULL,NULL,NULL,'2019-09-28 17:52:07','2019-09-28 17:52:07'),
	(638,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,2.40,1.70,NULL,NULL,NULL,'2019-09-28 17:52:40','2019-09-28 17:52:40'),
	(639,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-28 17:53:05','2019-09-28 17:53:05'),
	(640,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:53:28','2019-09-28 17:53:28'),
	(641,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:53:50','2019-09-28 17:53:50'),
	(642,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 17:54:10','2019-09-28 17:54:10'),
	(643,1,4,110,NULL,NULL,NULL,'سيدرة شعبي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 17:54:29','2019-09-28 17:54:29'),
	(644,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 17:58:13','2019-09-28 17:58:13'),
	(645,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 17:58:33','2019-09-28 17:58:33'),
	(646,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 17:59:30','2019-09-28 17:59:30'),
	(647,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:59:50','2019-09-28 17:59:50'),
	(648,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 17:59:50','2019-09-28 17:59:50'),
	(649,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:00:14','2019-09-28 18:00:14'),
	(650,1,4,62,NULL,NULL,NULL,'بينكل',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 18:00:52','2019-09-28 18:00:52'),
	(651,1,4,62,NULL,NULL,NULL,'بينكل',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 18:01:16','2019-09-28 18:01:16'),
	(652,1,4,3,NULL,NULL,NULL,'سلطانوا',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 18:01:39','2019-09-28 18:01:39'),
	(653,1,4,62,NULL,NULL,NULL,'بينكل',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 18:02:00','2019-09-28 18:02:00'),
	(654,1,4,62,NULL,NULL,NULL,'بينكل',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:02:29','2019-09-28 18:02:29'),
	(655,1,4,62,NULL,NULL,NULL,'بينكل',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:02:45','2019-09-28 18:02:45'),
	(656,1,4,63,NULL,NULL,NULL,'ارينا',NULL,3.30,2.30,NULL,NULL,NULL,'2019-09-28 18:03:35','2019-09-28 18:03:35'),
	(657,1,4,63,NULL,NULL,NULL,'ارينا',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 18:03:59','2019-09-28 18:03:59'),
	(658,1,4,63,NULL,NULL,NULL,'ارينا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:04:26','2019-09-28 18:04:26'),
	(659,1,4,65,NULL,NULL,NULL,'ميسي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:04:49','2019-09-28 18:04:49'),
	(660,1,4,70,NULL,NULL,NULL,'مساجد نبيه',NULL,1.00,1.30,NULL,NULL,NULL,'2019-09-28 18:05:29','2019-09-28 18:05:29'),
	(661,1,4,71,NULL,NULL,NULL,'مساجد جنه',NULL,1.00,1.30,NULL,NULL,NULL,'2019-09-28 18:06:17','2019-09-28 18:06:17'),
	(662,1,4,236,NULL,NULL,NULL,'كيدز برايت',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 18:08:36','2019-09-28 18:08:36'),
	(663,1,4,83,NULL,NULL,NULL,'شاج اباتشي',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 18:09:10','2019-09-28 18:09:10'),
	(664,1,4,83,NULL,NULL,NULL,'شاج اباتشي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:09:59','2019-09-28 18:09:59'),
	(665,1,4,85,NULL,NULL,NULL,'شاج سولو',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 18:12:54','2019-09-28 18:12:54'),
	(666,1,4,85,NULL,NULL,NULL,'شاج سولو',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 18:13:22','2019-09-28 18:13:22'),
	(667,1,4,85,NULL,NULL,NULL,'شاج سولو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:13:44','2019-09-28 18:13:44'),
	(668,1,4,74,NULL,NULL,NULL,'موكت دهب',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-28 18:15:07','2019-09-28 18:15:07'),
	(669,1,4,107,NULL,NULL,NULL,'موكت طابا',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-28 18:15:52','2019-09-28 18:15:52'),
	(670,1,4,135,NULL,NULL,NULL,'موكت ادفو لباد',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-28 18:16:25','2019-09-28 18:16:25'),
	(671,1,4,80,NULL,NULL,NULL,'شاج فرنا',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 18:16:51','2019-09-28 18:16:51'),
	(672,1,4,80,NULL,NULL,NULL,'شاج فرنا',NULL,1.70,1.20,NULL,NULL,NULL,'2019-09-28 18:17:23','2019-09-28 18:17:23'),
	(673,1,4,78,NULL,NULL,NULL,'شاج ماتريكس',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 18:17:58','2019-09-28 18:17:58'),
	(674,1,4,78,NULL,NULL,NULL,'شاج ماتريكس',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:18:20','2019-09-28 18:18:20'),
	(675,1,4,78,NULL,NULL,NULL,'شاج ماتريكس',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 18:18:46','2019-09-28 18:18:46'),
	(676,1,4,78,NULL,NULL,NULL,'شاج ماتريكس',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:19:09','2019-09-28 18:19:09'),
	(677,1,4,78,NULL,NULL,NULL,'شاج ماتريكس',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:19:32','2019-09-28 18:19:32'),
	(678,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:20:10','2019-09-28 18:20:10'),
	(679,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-28 18:20:35','2019-09-28 18:20:35'),
	(680,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:20:57','2019-09-28 18:20:57'),
	(681,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:21:17','2019-09-28 18:21:17'),
	(682,1,4,84,NULL,NULL,NULL,'شاج فينسيا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 18:21:38','2019-09-28 18:21:38'),
	(683,1,4,64,NULL,NULL,NULL,'مليسيا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:22:22','2019-09-28 18:22:22'),
	(684,1,4,67,NULL,NULL,NULL,'موناليزا',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 18:22:46','2019-09-28 18:22:46'),
	(685,1,4,67,NULL,NULL,NULL,'موناليزا',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 18:23:17','2019-09-28 18:23:17'),
	(686,1,4,66,NULL,NULL,NULL,'موندو',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 18:24:19','2019-09-28 18:24:19'),
	(687,1,4,66,NULL,NULL,NULL,'موندو',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 18:24:41','2019-09-28 18:24:41'),
	(688,1,4,82,NULL,NULL,NULL,'شاج سمر',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 18:25:10','2019-09-28 18:25:10'),
	(689,1,4,82,NULL,NULL,NULL,'شاج سمر',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:25:36','2019-09-28 18:25:36'),
	(690,1,4,237,NULL,NULL,NULL,'جابيه',NULL,0.90,0.60,NULL,NULL,NULL,'2019-09-28 18:26:01','2019-09-28 18:26:01'),
	(691,1,4,75,NULL,NULL,NULL,'موكت الجوهره',NULL,1.00,4.00,NULL,NULL,NULL,'2019-09-28 18:41:19','2019-09-28 18:41:19'),
	(692,1,4,238,NULL,NULL,NULL,'اسكوبي',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-28 18:43:35','2019-09-28 18:43:35'),
	(693,1,4,88,NULL,NULL,NULL,'لامور',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:43:56','2019-09-28 18:43:56'),
	(694,1,4,88,NULL,NULL,NULL,'لامور',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:44:21','2019-09-28 18:44:21'),
	(695,1,4,88,NULL,NULL,NULL,'لامور',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 18:44:56','2019-09-28 18:44:56'),
	(696,1,4,86,NULL,NULL,NULL,'لوران',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 18:45:36','2019-09-28 18:45:36'),
	(697,1,4,86,NULL,NULL,NULL,'لوران',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 18:46:01','2019-09-28 18:46:01'),
	(698,1,4,86,NULL,NULL,NULL,'لوران',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:46:21','2019-09-28 18:46:21'),
	(699,1,4,86,NULL,NULL,NULL,'لوران',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:46:42','2019-09-28 18:46:42'),
	(700,1,4,90,NULL,NULL,NULL,'كينج',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 18:47:23','2019-09-28 18:47:23'),
	(701,1,4,90,NULL,NULL,NULL,'كينج',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-28 18:47:49','2019-09-28 18:47:49'),
	(702,1,4,90,NULL,NULL,NULL,'كينج',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 18:48:14','2019-09-28 18:48:14'),
	(703,1,4,90,NULL,NULL,NULL,'كينج',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 18:48:36','2019-09-28 18:48:36'),
	(704,1,4,90,NULL,NULL,NULL,'كينج',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 18:48:57','2019-09-28 18:48:57'),
	(705,1,4,90,NULL,NULL,NULL,'كينج',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:49:14','2019-09-28 18:49:14'),
	(706,1,4,90,NULL,NULL,NULL,'كينج',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:49:34','2019-09-28 18:49:34'),
	(707,1,4,90,NULL,NULL,NULL,'كينج',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 18:49:54','2019-09-28 18:49:54'),
	(708,1,4,76,NULL,NULL,NULL,'ماك روزيتا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 18:50:32','2019-09-28 18:50:32'),
	(709,1,4,76,NULL,NULL,NULL,'ماك روزيتا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 18:50:53','2019-09-28 18:50:53'),
	(710,1,4,76,NULL,NULL,NULL,'ماك روزيتا',NULL,1.00,0.57,NULL,NULL,NULL,'2019-09-28 18:51:20','2019-09-28 18:51:20'),
	(711,1,4,92,NULL,NULL,NULL,'كيد زينيا',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-28 18:53:27','2019-09-28 18:53:27'),
	(712,1,4,92,NULL,NULL,NULL,'كيد زينيا',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 18:54:09','2019-09-28 18:54:09'),
	(713,1,4,68,NULL,NULL,NULL,'موف اون',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 18:54:47','2019-09-28 18:54:47'),
	(714,1,4,68,NULL,NULL,NULL,'موف اون',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 18:55:11','2019-09-28 18:55:11'),
	(715,1,4,69,NULL,NULL,NULL,'موسكو',NULL,3.65,2.65,NULL,NULL,NULL,'2019-09-28 18:56:10','2019-09-28 18:56:10'),
	(716,1,4,69,NULL,NULL,NULL,'موسكو',NULL,3.15,2.25,NULL,NULL,NULL,'2019-09-28 18:57:03','2019-09-28 18:57:03'),
	(717,1,4,69,NULL,NULL,NULL,'موسكو',NULL,2.80,1.85,NULL,NULL,NULL,'2019-09-28 18:57:48','2019-09-28 18:57:48'),
	(718,1,4,69,NULL,NULL,NULL,'موسكو',NULL,2.40,1.70,NULL,NULL,NULL,'2019-09-28 18:58:59','2019-09-28 18:58:59'),
	(719,1,4,69,NULL,NULL,NULL,'موسكو',NULL,2.15,1.45,NULL,NULL,NULL,'2019-09-28 18:59:43','2019-09-28 18:59:43'),
	(720,1,4,69,NULL,NULL,NULL,'موسكو',NULL,1.95,0.65,NULL,NULL,NULL,'2019-09-28 19:00:23','2019-09-28 19:00:23'),
	(721,1,4,69,NULL,NULL,NULL,'موسكو',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 19:00:53','2019-09-28 19:00:53'),
	(722,1,4,69,NULL,NULL,NULL,'موسكو',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 19:01:14','2019-09-28 19:01:14'),
	(723,1,4,69,NULL,NULL,NULL,'موسكو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 19:01:34','2019-09-28 19:01:34'),
	(724,1,4,69,NULL,NULL,NULL,'موسكو',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 19:03:04','2019-09-28 19:03:04'),
	(725,1,4,69,NULL,NULL,NULL,'موسكو',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 19:03:27','2019-09-28 19:03:27'),
	(726,1,4,120,NULL,NULL,NULL,'داماس لاند',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 19:04:26','2019-09-28 19:04:26'),
	(727,1,4,120,NULL,NULL,NULL,'داماس لاند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 19:04:46','2019-09-28 19:04:46'),
	(728,1,4,120,NULL,NULL,NULL,'داماس لاند',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-28 19:05:16','2019-09-28 19:05:16'),
	(729,1,4,120,NULL,NULL,NULL,'داماس لاند',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 19:05:56','2019-09-28 19:05:56'),
	(730,1,4,120,NULL,NULL,NULL,'داماس لاند',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 19:06:17','2019-09-28 19:06:17'),
	(731,1,4,122,NULL,NULL,NULL,'جلاله لاند',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 19:07:00','2019-09-28 19:07:00'),
	(732,1,4,122,NULL,NULL,NULL,'جلاله لاند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 19:07:25','2019-09-28 19:07:25'),
	(733,1,4,122,NULL,NULL,NULL,'جلاله لاند',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 19:07:55','2019-09-28 19:07:55'),
	(734,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 19:08:34','2019-09-28 19:08:34'),
	(735,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 19:09:09','2019-09-28 19:09:09'),
	(736,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 19:09:09','2019-09-28 19:09:09'),
	(737,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 19:09:32','2019-09-28 19:09:32'),
	(738,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 19:09:57','2019-09-28 19:09:57'),
	(739,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 19:11:13','2019-09-28 19:11:13'),
	(740,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 19:11:13','2019-09-28 19:11:13'),
	(741,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 19:11:39','2019-09-28 19:11:39'),
	(742,1,4,121,NULL,NULL,NULL,'داكار لاند',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 19:11:57','2019-09-28 19:11:57'),
	(743,1,4,119,NULL,NULL,NULL,'بامبو لاند',NULL,3.20,2.20,NULL,NULL,NULL,'2019-09-28 19:12:46','2019-09-28 19:12:46'),
	(744,1,4,119,NULL,NULL,NULL,'بامبو لاند',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 19:13:10','2019-09-28 19:13:10'),
	(745,1,4,119,NULL,NULL,NULL,'بامبو لاند',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 19:13:34','2019-09-28 19:13:34'),
	(746,1,4,119,NULL,NULL,NULL,'بامبو لاند',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-28 19:14:14','2019-09-28 19:14:14'),
	(747,1,4,119,NULL,NULL,NULL,'بامبو لاند',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 19:14:37','2019-09-28 19:14:37'),
	(748,1,4,119,NULL,NULL,NULL,'بامبو لاند',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 19:15:00','2019-09-28 19:15:00'),
	(749,1,4,123,NULL,NULL,NULL,'جاميكا لاند',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 19:15:44','2019-09-28 19:15:44'),
	(750,1,4,123,NULL,NULL,NULL,'جاميكا لاند',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 19:16:07','2019-09-28 19:16:07'),
	(751,1,4,123,NULL,NULL,NULL,'جاميكا لاند',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-28 19:16:44','2019-09-28 19:16:44'),
	(752,1,4,123,NULL,NULL,NULL,'جاميكا لاند',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 19:17:22','2019-09-28 19:17:22'),
	(753,1,4,123,NULL,NULL,NULL,'جاميكا لاند',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 19:17:43','2019-09-28 19:17:43'),
	(754,1,4,141,NULL,NULL,NULL,'ابوجا لاند',NULL,3.65,2.65,NULL,NULL,NULL,'2019-09-28 19:18:36','2019-09-28 19:18:36'),
	(755,1,4,141,NULL,NULL,NULL,'ابوجا لاند',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-28 19:19:11','2019-09-28 19:19:11'),
	(756,1,4,141,NULL,NULL,NULL,'ابوجا لاند',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 19:19:37','2019-09-28 19:19:37'),
	(757,1,4,113,NULL,NULL,NULL,'سندريلا',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 19:21:15','2019-09-28 19:21:15'),
	(758,1,4,239,NULL,NULL,NULL,'استانلي',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 19:22:29','2019-09-28 19:22:29'),
	(759,1,4,113,NULL,NULL,NULL,'سندريلا',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 19:22:57','2019-09-28 19:22:57'),
	(760,1,4,113,NULL,NULL,NULL,'سندريلا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 19:23:25','2019-09-28 19:23:25'),
	(761,1,4,113,NULL,NULL,NULL,'سندريلا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 19:23:46','2019-09-28 19:23:46'),
	(762,1,4,129,NULL,NULL,4,'برونز',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 19:54:30','2019-12-27 18:50:28'),
	(763,1,4,129,NULL,NULL,NULL,'برونز',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 19:54:52','2019-09-28 19:54:52'),
	(764,1,4,81,NULL,NULL,NULL,'شاج سنيوريتا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 19:55:33','2019-09-28 19:55:33'),
	(765,1,4,81,NULL,NULL,NULL,'شاج سنيوريتا',NULL,2.80,2.00,NULL,NULL,NULL,'2019-09-28 19:56:03','2019-09-28 19:56:03'),
	(766,1,4,81,NULL,NULL,NULL,'شاج سنيوريتا',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 19:56:33','2019-09-28 19:56:33'),
	(767,1,4,142,NULL,NULL,NULL,'بورتوريه',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 19:57:14','2019-09-28 19:57:14'),
	(768,1,4,142,NULL,NULL,NULL,'بورتوريه',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 19:57:47','2019-09-28 19:57:47'),
	(769,1,4,142,NULL,NULL,NULL,'بورتوريه',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 19:58:35','2019-09-28 19:58:35'),
	(770,1,4,128,NULL,NULL,NULL,'بورتو',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 19:59:05','2019-09-28 19:59:05'),
	(771,1,4,126,NULL,NULL,NULL,'بانوراما',NULL,1.80,1.20,NULL,NULL,NULL,'2019-09-28 20:00:04','2019-09-28 20:00:04'),
	(772,1,4,126,NULL,NULL,NULL,'بانوراما',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 20:00:30','2019-09-28 20:00:30'),
	(773,1,4,126,NULL,NULL,NULL,'بانوراما',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 20:01:37','2019-09-28 20:01:37'),
	(774,1,4,130,NULL,NULL,NULL,'بيانكي',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:02:10','2019-09-28 20:02:10'),
	(775,1,4,130,NULL,NULL,NULL,'بيانكي',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 20:02:39','2019-09-28 20:02:39'),
	(776,1,4,127,NULL,NULL,NULL,'بدر',NULL,2.80,1.85,NULL,NULL,NULL,'2019-09-28 20:03:28','2019-09-28 20:03:28'),
	(777,1,4,127,NULL,NULL,NULL,'بدر',NULL,2.40,1.70,NULL,NULL,NULL,'2019-09-28 20:04:22','2019-09-28 20:04:22'),
	(778,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.45,1.45,NULL,NULL,NULL,'2019-09-28 20:05:02','2019-09-28 20:05:02'),
	(779,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.90,1.00,NULL,NULL,NULL,'2019-09-28 20:05:43','2019-09-28 20:05:43'),
	(780,1,4,127,NULL,NULL,NULL,'بدر',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-28 20:06:17','2019-09-28 20:06:17'),
	(781,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.00,1.50,NULL,NULL,NULL,'2019-09-28 20:06:52','2019-09-28 20:06:52'),
	(782,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 20:07:17','2019-09-28 20:07:17'),
	(783,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:07:39','2019-09-28 20:07:39'),
	(784,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:08:08','2019-09-28 20:08:08'),
	(785,1,4,127,NULL,NULL,NULL,'بدر',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 20:08:31','2019-09-28 20:08:31'),
	(786,1,4,133,NULL,NULL,NULL,'كانكون',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 20:09:11','2019-09-28 20:09:11'),
	(787,1,4,133,NULL,NULL,NULL,'كانكون',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 20:09:40','2019-09-28 20:09:40'),
	(788,1,4,133,NULL,NULL,NULL,'كانكون',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 20:10:04','2019-09-28 20:10:04'),
	(789,1,4,133,NULL,NULL,NULL,'كانكون',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:10:35','2019-09-28 20:10:35'),
	(790,1,4,133,NULL,NULL,NULL,'كانكون',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 20:10:58','2019-09-28 20:10:58'),
	(791,1,4,133,NULL,NULL,NULL,'كانكون',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:11:20','2019-09-28 20:11:20'),
	(792,1,4,133,NULL,NULL,NULL,'كانكون',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:12:01','2019-09-28 20:12:01'),
	(793,1,4,131,NULL,NULL,NULL,'داندي',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 20:12:22','2019-09-28 20:12:22'),
	(794,1,4,131,NULL,NULL,NULL,'داندي',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 20:12:54','2019-09-28 20:12:54'),
	(795,1,4,175,NULL,NULL,NULL,'جنيور محفور',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:13:50','2019-09-28 20:13:50'),
	(796,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 20:14:26','2019-09-28 20:14:26'),
	(797,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 20:14:51','2019-09-28 20:14:51'),
	(798,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:15:42','2019-09-28 20:15:42'),
	(799,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,1.00,2.00,NULL,NULL,NULL,'2019-09-28 20:16:10','2019-09-28 20:16:10'),
	(800,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 20:16:34','2019-09-28 20:16:34'),
	(801,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:17:08','2019-09-28 20:17:08'),
	(802,1,4,134,NULL,NULL,NULL,'كولكشن',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:17:28','2019-09-28 20:17:28'),
	(803,1,4,136,NULL,NULL,NULL,'اسكتش',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:17:53','2019-09-28 20:17:53'),
	(804,1,4,136,NULL,NULL,NULL,'اسكتش',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:18:14','2019-09-28 20:18:14'),
	(805,1,4,137,NULL,NULL,NULL,'الاباما',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 20:19:30','2019-09-28 20:19:30'),
	(806,1,4,137,NULL,NULL,NULL,'الاباما',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 20:19:55','2019-09-28 20:19:55'),
	(807,1,4,138,NULL,NULL,NULL,'انتيك',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 20:20:32','2019-09-28 20:20:32'),
	(808,1,4,138,NULL,NULL,NULL,'انتيك',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-28 20:22:15','2019-09-28 20:22:15'),
	(809,1,4,138,NULL,NULL,NULL,'انتيك',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 20:23:01','2019-09-28 20:23:01'),
	(810,1,4,138,NULL,NULL,NULL,'انتيك',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:23:28','2019-09-28 20:23:28'),
	(811,1,4,109,NULL,NULL,NULL,'سيزارو',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:23:52','2019-09-28 20:23:52'),
	(812,1,4,105,NULL,NULL,NULL,'فريسكا',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 20:25:33','2019-09-28 20:25:33'),
	(813,1,4,105,NULL,NULL,NULL,'فريسكا',NULL,2.20,1.60,NULL,NULL,NULL,'2019-09-28 20:26:05','2019-09-28 20:26:05'),
	(814,1,4,105,NULL,NULL,NULL,'فريسكا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:26:31','2019-09-28 20:26:31'),
	(815,1,4,104,NULL,NULL,NULL,'فيينا',NULL,2.80,1.95,NULL,NULL,NULL,'2019-09-28 20:27:08','2019-09-28 20:27:08'),
	(816,1,4,104,NULL,NULL,NULL,'فيينا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:27:34','2019-09-28 20:27:34'),
	(817,1,4,104,NULL,NULL,NULL,'فيينا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:29:26','2019-09-28 20:29:26'),
	(818,1,4,104,NULL,NULL,NULL,'فيينا',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 20:30:19','2019-09-28 20:30:19'),
	(819,1,4,106,NULL,NULL,NULL,'فرحه',NULL,2.45,1.75,NULL,NULL,NULL,'2019-09-28 20:31:41','2019-09-28 20:31:41'),
	(820,1,4,106,NULL,NULL,NULL,'فرحه',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 20:32:29','2019-09-28 20:32:29'),
	(821,1,4,106,NULL,NULL,NULL,'فرحه',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:33:05','2019-09-28 20:33:05'),
	(822,1,4,106,NULL,NULL,NULL,'فرحه',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:33:50','2019-09-28 20:33:50'),
	(823,1,4,106,NULL,NULL,NULL,'فرحه',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 20:34:21','2019-09-28 20:34:21'),
	(824,1,4,101,NULL,NULL,NULL,'كابو',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 20:35:15','2019-09-28 20:35:15'),
	(825,1,4,101,NULL,NULL,NULL,'كابو',NULL,2.85,2.00,NULL,NULL,NULL,'2019-09-28 20:35:42','2019-09-28 20:35:42'),
	(826,1,4,101,NULL,NULL,NULL,'كابو',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 20:36:17','2019-09-28 20:36:17'),
	(827,1,4,101,NULL,NULL,NULL,'كابو',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:37:00','2019-09-28 20:37:00'),
	(828,1,4,101,NULL,NULL,NULL,'كابو',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:37:22','2019-09-28 20:37:22'),
	(829,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 20:38:21','2019-09-28 20:38:21'),
	(830,1,4,99,NULL,NULL,NULL,'كروز لاند',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-28 20:38:53','2019-09-28 20:38:53'),
	(831,1,4,143,NULL,NULL,NULL,'كوجي',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-28 20:39:35','2019-09-28 20:39:35'),
	(832,1,4,143,NULL,NULL,NULL,'كوجي',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 20:40:07','2019-09-28 20:40:07'),
	(833,1,4,144,NULL,NULL,NULL,'كوجنيا',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:41:03','2019-09-28 20:41:03'),
	(834,1,4,144,NULL,NULL,NULL,'كوجنيا',NULL,1.90,1.33,NULL,NULL,NULL,'2019-09-28 20:42:06','2019-09-28 20:42:06'),
	(835,1,4,144,NULL,NULL,NULL,'كوجنيا',NULL,2.30,1.60,NULL,NULL,NULL,'2019-09-28 20:42:51','2019-09-28 20:42:51'),
	(836,1,4,144,NULL,NULL,NULL,'كوجنيا',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:43:27','2019-09-28 20:43:27'),
	(837,1,4,144,NULL,NULL,NULL,'كوجنيا',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:43:53','2019-09-28 20:43:53'),
	(838,1,4,125,NULL,NULL,NULL,'دلتا',NULL,2.20,2.20,NULL,NULL,NULL,'2019-09-28 20:45:04','2019-09-28 20:45:04'),
	(839,1,4,124,NULL,NULL,NULL,'ديزرت',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:45:52','2019-09-28 20:45:52'),
	(840,1,4,124,NULL,NULL,NULL,'ديزرت',NULL,0.90,0.60,NULL,NULL,NULL,'2019-09-28 20:46:27','2019-09-28 20:46:27'),
	(841,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,3.40,2.40,NULL,NULL,NULL,'2019-09-28 20:47:48','2019-09-28 20:47:48'),
	(842,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,2.90,2.00,NULL,NULL,NULL,'2019-09-28 20:48:22','2019-09-28 20:48:22'),
	(843,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,2.35,1.60,NULL,NULL,NULL,'2019-09-28 20:48:55','2019-09-28 20:48:55'),
	(844,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,2.00,1.40,NULL,NULL,NULL,'2019-09-28 20:49:29','2019-09-28 20:49:29'),
	(845,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,0.80,0.50,NULL,NULL,NULL,'2019-09-28 20:49:57','2019-09-28 20:49:57'),
	(846,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:50:29','2019-09-28 20:50:29'),
	(847,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,0.80,0.80,NULL,NULL,NULL,'2019-09-28 20:50:48','2019-09-28 20:50:48'),
	(848,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,1.00,1.20,NULL,NULL,NULL,'2019-09-28 20:51:20','2019-09-28 20:51:20'),
	(849,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,1.00,1.00,NULL,NULL,NULL,'2019-09-28 20:51:42','2019-09-28 20:51:42'),
	(850,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,1.00,0.80,NULL,NULL,NULL,'2019-09-28 20:52:34','2019-09-28 20:52:34'),
	(851,1,4,145,NULL,NULL,NULL,'كهرمان',NULL,1.00,0.60,NULL,NULL,NULL,'2019-09-28 20:52:58','2019-09-28 20:52:58'),
	(852,2,NULL,98,NULL,NULL,3,'هاي سنس 90*190/ 25',NULL,1.00,1.00,NULL,NULL,1150.00,'2019-12-22 23:04:24','2019-12-27 18:50:01'),
	(853,2,NULL,98,NULL,NULL,3,'هاي سنس 90*195/ 25',NULL,1.00,1.00,NULL,NULL,1150.00,'2019-12-22 23:08:43','2019-12-27 18:55:19'),
	(854,2,NULL,98,NULL,NULL,3,'هاي سنس 90*200/ 25',NULL,1.00,1.00,NULL,NULL,1150.00,'2019-12-22 23:12:45','2019-12-27 18:55:59'),
	(855,2,NULL,98,NULL,NULL,3,'هاي سنس 90*190/ 27',NULL,1.00,1.00,NULL,NULL,1425.00,'2019-12-22 23:15:09','2019-12-22 23:15:09'),
	(856,2,NULL,98,NULL,NULL,3,'هاي سنس 90*195/ 27',NULL,1.00,1.00,NULL,NULL,1425.00,'2019-12-22 23:15:58','2019-12-22 23:15:58'),
	(857,2,NULL,98,NULL,NULL,3,'هاي سنس 90*200/ 27',NULL,1.00,1.00,NULL,NULL,1425.00,'2019-12-22 23:17:09','2019-12-22 23:17:09'),
	(858,2,NULL,98,NULL,NULL,3,'هاي سنس 90*190/ 30',NULL,1.00,1.00,NULL,NULL,1631.00,'2019-12-27 17:31:26','2019-12-27 17:31:26'),
	(859,2,NULL,98,NULL,NULL,3,'هاي سنس 90*195/ 30',NULL,1.00,1.00,NULL,NULL,1631.00,'2019-12-27 17:32:54','2019-12-27 17:32:54'),
	(860,2,NULL,98,NULL,NULL,3,'هاي سنس 90*200/ 30',NULL,1.00,1.00,NULL,NULL,1631.00,'2019-12-27 17:34:36','2019-12-27 17:34:36'),
	(861,2,NULL,98,NULL,NULL,3,'هاي سنس 100*190/ 25',NULL,1.00,1.00,NULL,NULL,1280.00,'2019-12-27 17:36:15','2019-12-27 18:56:25'),
	(862,2,NULL,98,NULL,NULL,3,'هاي سنس 100*195/ 25',NULL,1.00,1.00,NULL,NULL,1280.00,'2019-12-27 17:37:38','2019-12-27 18:56:57'),
	(863,2,NULL,98,NULL,NULL,3,'هاي سنس 100*200/ 25',NULL,1.00,1.00,NULL,NULL,1280.00,'2019-12-27 17:39:31','2019-12-27 18:57:26'),
	(864,2,NULL,98,NULL,NULL,3,'هاي سنس 100*190/ 27',NULL,1.00,1.00,NULL,NULL,1580.00,'2019-12-27 17:40:51','2019-12-27 17:40:51'),
	(865,2,NULL,98,NULL,NULL,3,'هاي سنس 100*195/ 27',NULL,1.00,1.00,NULL,NULL,1580.00,'2019-12-27 17:42:07','2019-12-27 17:42:07'),
	(866,2,NULL,98,NULL,NULL,3,'هاي سنس100*200/ 27',NULL,1.00,1.00,NULL,NULL,1580.00,'2019-12-27 17:44:01','2019-12-27 17:44:01'),
	(867,2,NULL,98,NULL,NULL,3,'هاي سنس 100*190/ 30',NULL,1.00,1.00,NULL,NULL,1815.00,'2019-12-27 17:45:47','2019-12-27 17:45:47'),
	(868,2,NULL,98,NULL,NULL,3,'هاي سنس 100*195/ 30',NULL,1.00,1.00,NULL,NULL,1815.00,'2019-12-27 17:46:42','2019-12-27 17:46:42'),
	(869,2,NULL,98,NULL,NULL,3,'هاي سنس 100*200/ 30',NULL,1.00,1.00,NULL,NULL,1815.00,'2019-12-27 17:47:44','2019-12-27 17:47:44'),
	(870,2,NULL,98,NULL,NULL,3,'هاي سنس 120*190/ 25',NULL,1.00,1.00,NULL,NULL,1535.00,'2019-12-27 17:49:54','2019-12-27 18:58:01'),
	(871,2,NULL,98,NULL,NULL,3,'هاي سنس 120*195/ 25',NULL,1.00,1.00,NULL,NULL,1535.00,'2019-12-27 17:50:44','2019-12-27 18:58:26'),
	(872,2,NULL,98,NULL,NULL,3,'هاي سنس 120*200/ 25',NULL,1.00,1.00,NULL,NULL,1535.00,'2019-12-27 17:51:56','2019-12-27 18:59:01'),
	(873,2,NULL,98,NULL,NULL,3,'هاي سنس 120*190/ 27',NULL,1.00,1.00,NULL,NULL,1895.00,'2019-12-27 17:52:56','2019-12-27 17:52:56'),
	(874,2,NULL,98,NULL,NULL,3,'هاي سنس 120*195/ 27',NULL,1.00,1.00,NULL,NULL,1895.00,'2019-12-27 17:53:59','2019-12-27 17:53:59'),
	(875,2,NULL,98,NULL,NULL,3,'هاي سنس 120*200/ 27',NULL,1.00,1.00,NULL,NULL,1895.00,'2019-12-27 17:55:20','2019-12-27 17:55:20'),
	(876,2,NULL,98,NULL,NULL,3,'هاي سنس 120*190/ 30',NULL,1.00,1.00,NULL,NULL,2175.00,'2019-12-27 17:59:21','2019-12-27 17:59:21'),
	(877,2,NULL,98,NULL,NULL,3,'هاي سنس 120*195/ 30',NULL,1.00,1.00,NULL,NULL,2175.00,'2019-12-27 18:00:33','2019-12-27 18:00:33'),
	(878,2,NULL,98,NULL,NULL,3,'هاي سنس 120*200/ 30',NULL,1.00,1.00,NULL,NULL,2175.00,'2019-12-27 18:01:17','2019-12-27 18:01:17'),
	(879,2,NULL,98,NULL,NULL,3,'هاي سنس 140*190/ 25',NULL,1.00,1.00,NULL,NULL,1790.00,'2019-12-27 18:07:22','2019-12-27 18:59:31'),
	(880,2,NULL,98,NULL,NULL,3,'هاي سنس 140*195/ 25',NULL,1.00,1.00,NULL,NULL,1790.00,'2019-12-27 18:08:00','2019-12-27 19:00:04'),
	(881,2,NULL,98,NULL,NULL,3,'هاي سنس 140*200/ 25',NULL,1.00,1.00,NULL,NULL,1790.00,'2019-12-27 18:09:08','2019-12-27 19:00:37'),
	(882,2,NULL,98,NULL,NULL,3,'هاي سنس 140*190/ 27',NULL,1.00,1.00,NULL,NULL,2220.00,'2019-12-27 18:09:54','2019-12-27 18:09:54'),
	(883,2,NULL,98,NULL,NULL,3,'هاي سنس 140*195/ 27',NULL,1.00,1.00,NULL,NULL,2220.00,'2019-12-27 18:13:47','2019-12-27 18:13:47'),
	(884,1,NULL,98,NULL,NULL,3,'هاي سنس 140*200/ 27',NULL,1.00,1.00,NULL,NULL,2220.00,'2019-12-27 18:14:31','2019-12-27 18:14:31'),
	(885,2,NULL,98,NULL,NULL,3,'هاي سنس 140*190/ 30',NULL,1.00,1.00,NULL,NULL,2535.00,'2019-12-27 18:15:40','2019-12-27 18:15:40'),
	(886,2,NULL,98,NULL,NULL,3,'هاي سنس 140*195/ 30',NULL,1.00,1.00,NULL,NULL,2535.00,'2019-12-27 18:16:25','2019-12-27 18:16:25'),
	(887,2,NULL,98,NULL,NULL,3,'هاي سنس 140*200/ 30',NULL,1.00,1.00,NULL,NULL,2535.00,'2019-12-27 18:17:11','2019-12-27 18:17:11'),
	(888,2,NULL,98,NULL,NULL,3,'هاي سنس 150*190/ 25',NULL,1.00,1.00,NULL,NULL,1920.00,'2019-12-27 18:29:02','2019-12-27 19:01:16'),
	(889,2,NULL,98,NULL,NULL,3,'هاي سنس 150*195/ 25',NULL,1.00,1.00,NULL,NULL,1920.00,'2019-12-27 18:29:46','2019-12-27 19:01:55'),
	(890,2,NULL,98,NULL,NULL,3,'هاي سنس 150*200/ 25',NULL,1.00,1.00,NULL,NULL,1920.00,'2019-12-27 18:31:10','2019-12-27 19:02:39'),
	(891,2,NULL,98,NULL,NULL,3,'هاي سنس 150*190/ 27',NULL,1.00,1.00,NULL,NULL,2370.00,'2019-12-27 18:32:48','2019-12-27 18:32:48'),
	(892,2,NULL,98,NULL,NULL,3,'هاي سنس 150*195/ 27',NULL,1.00,1.00,NULL,NULL,2370.00,'2019-12-27 18:33:33','2019-12-27 18:33:33'),
	(893,2,NULL,98,NULL,NULL,3,'هاي سنس 150*200/ 27',NULL,1.00,1.00,NULL,NULL,2370.00,'2019-12-27 18:34:29','2019-12-27 18:34:29'),
	(894,2,NULL,98,NULL,NULL,3,'هاي سنس 150*190/ 30',NULL,1.00,1.00,NULL,NULL,2720.00,'2019-12-27 18:35:16','2019-12-27 18:35:16'),
	(895,2,NULL,98,NULL,NULL,3,'هاي سنس 150*195/ 30',NULL,1.00,1.00,NULL,NULL,2720.00,'2019-12-27 18:35:54','2019-12-27 18:35:54'),
	(896,2,NULL,98,NULL,NULL,3,'هاي سنس 150*200/ 30',NULL,1.00,1.00,NULL,NULL,2720.00,'2019-12-27 18:36:33','2019-12-27 18:36:33'),
	(897,2,NULL,98,NULL,NULL,3,'هاي سنس 160*190/ 25',NULL,1.00,1.00,NULL,NULL,2045.00,'2019-12-27 18:42:24','2019-12-27 18:42:24'),
	(898,2,NULL,98,NULL,NULL,3,'هاي سنس 160*195/ 25',NULL,1.00,1.00,NULL,NULL,2045.00,'2019-12-27 18:43:02','2019-12-27 18:43:02'),
	(899,2,NULL,98,NULL,NULL,3,'هاي سنس 160*200/ 25',NULL,1.00,1.00,NULL,NULL,2045.00,'2019-12-27 18:43:39','2019-12-27 18:43:39'),
	(900,2,NULL,98,NULL,NULL,3,'هاي سنس 160*190/ 27',NULL,1.00,1.00,NULL,NULL,2530.00,'2019-12-27 18:44:42','2019-12-27 18:44:42'),
	(901,2,NULL,98,NULL,NULL,3,'هاي سنس 160*195/ 27',NULL,1.00,1.00,NULL,NULL,2530.00,'2019-12-27 18:45:17','2019-12-27 18:45:17'),
	(902,2,NULL,98,NULL,NULL,3,'هاي سنس 160*200/ 27',NULL,1.00,1.00,NULL,NULL,2530.00,'2019-12-27 18:45:58','2019-12-27 18:45:58'),
	(903,2,NULL,98,NULL,NULL,3,'هاي سنس 160*190/ 30',NULL,1.00,1.00,NULL,NULL,2900.00,'2019-12-27 18:46:42','2019-12-27 18:46:42'),
	(904,2,NULL,98,NULL,NULL,3,'هاي سنس 160*195/ 30',NULL,1.00,1.00,NULL,NULL,2900.00,'2019-12-27 18:47:12','2019-12-27 18:47:12'),
	(905,2,NULL,98,NULL,NULL,3,'هاي سنس 160*200/ 30',NULL,1.00,1.00,NULL,NULL,2900.00,'2019-12-27 18:47:43','2019-12-27 18:47:43'),
	(906,2,NULL,98,NULL,NULL,3,'هاي سنس 170*190/ 25',NULL,1.00,1.00,NULL,NULL,2180.00,'2019-12-27 19:05:46','2019-12-27 19:05:46'),
	(907,2,NULL,98,NULL,NULL,3,'هاي سنس 170*195/ 25',NULL,1.00,1.00,NULL,NULL,2180.00,'2019-12-27 19:06:49','2019-12-27 19:06:49'),
	(908,2,NULL,98,NULL,NULL,3,'هاي سنس 170*200/ 25',NULL,1.00,1.00,NULL,NULL,2180.00,'2019-12-27 19:07:40','2019-12-27 19:07:40'),
	(909,2,NULL,98,NULL,NULL,3,'هاي سنس 170*190/ 27',NULL,1.00,1.00,NULL,NULL,2685.00,'2019-12-27 19:08:32','2019-12-27 19:08:32'),
	(910,2,NULL,98,NULL,NULL,3,'هاي سنس 170*195/ 27',NULL,1.00,1.00,NULL,NULL,2685.00,'2019-12-27 19:09:10','2019-12-27 19:09:10'),
	(911,2,NULL,98,NULL,NULL,3,'هاي سنس 170*200/ 27',NULL,1.00,1.00,NULL,NULL,2685.00,'2019-12-27 19:09:55','2019-12-27 19:09:55'),
	(912,2,NULL,98,NULL,NULL,3,'هاي سنس 170*190/ 30',NULL,1.00,1.00,NULL,NULL,3080.00,'2019-12-27 19:11:05','2019-12-27 19:11:05'),
	(913,2,NULL,98,NULL,NULL,3,'هاي سنس 170*195/ 30',NULL,1.00,1.00,NULL,NULL,3080.00,'2019-12-27 19:11:42','2019-12-27 19:11:42'),
	(914,2,NULL,98,NULL,NULL,3,'هاي سنس 170*200/ 30',NULL,1.00,1.00,NULL,NULL,3080.00,'2019-12-27 19:12:24','2019-12-27 19:12:24'),
	(915,2,NULL,98,NULL,NULL,3,'هاي سنس 180*190/ 25',NULL,1.00,1.00,NULL,NULL,2300.00,'2019-12-27 19:13:42','2019-12-27 19:13:42'),
	(916,2,NULL,98,NULL,NULL,3,'هاي سنس 180*195/ 25',NULL,1.00,1.00,NULL,NULL,2300.00,'2019-12-27 19:14:12','2019-12-27 19:14:12'),
	(917,2,NULL,98,NULL,NULL,3,'هاي سنس 180*200/ 25',NULL,1.00,1.00,NULL,NULL,2300.00,'2019-12-27 19:14:42','2019-12-27 19:14:42'),
	(918,2,NULL,98,NULL,NULL,3,'هاي سنس 180*190/ 27',NULL,1.00,1.00,NULL,NULL,2850.00,'2019-12-27 19:15:26','2019-12-27 19:15:26'),
	(919,2,NULL,98,NULL,NULL,3,'هاي سنس 180*195/ 27',NULL,1.00,1.00,NULL,NULL,2850.00,'2019-12-27 19:15:55','2019-12-27 19:15:55'),
	(920,2,NULL,98,NULL,NULL,3,'هاي سنس 180*200/ 27',NULL,1.00,1.00,NULL,NULL,2850.00,'2019-12-27 19:16:29','2019-12-27 19:16:29'),
	(921,2,NULL,98,NULL,NULL,3,'هاي سنس 180*190/ 30',NULL,1.00,1.00,NULL,NULL,3252.00,'2019-12-27 19:17:14','2019-12-27 19:17:14'),
	(922,2,NULL,98,NULL,NULL,3,'هاي سنس 180*195/ 30',NULL,1.00,1.00,NULL,NULL,3252.00,'2019-12-27 19:17:46','2019-12-27 19:17:46'),
	(923,2,NULL,98,NULL,NULL,3,'هاي سنس 180*200/ 30',NULL,1.00,1.00,NULL,NULL,3252.00,'2019-12-27 19:18:20','2019-12-27 19:18:20'),
	(924,2,NULL,98,NULL,NULL,3,'هاي سنس 200*190/ 25',NULL,1.00,1.00,NULL,NULL,2560.00,'2019-12-27 19:19:12','2019-12-27 19:19:12'),
	(925,2,NULL,98,NULL,NULL,3,'هاي سنس 200*195/ 25',NULL,1.00,1.00,NULL,NULL,2560.00,'2019-12-27 19:19:43','2019-12-27 19:19:43'),
	(926,2,NULL,98,NULL,NULL,3,'هاي سنس 200*200/ 25',NULL,1.00,1.00,NULL,NULL,2560.00,'2019-12-27 19:21:20','2019-12-27 19:21:20'),
	(927,2,NULL,98,NULL,NULL,3,'هاي سنس 200*190/ 27',NULL,1.00,1.00,NULL,NULL,3160.00,'2019-12-27 19:23:02','2019-12-27 19:23:02'),
	(928,2,NULL,98,NULL,NULL,3,'هاي سنس 200*195/ 27',NULL,1.00,1.00,NULL,NULL,3160.00,'2019-12-27 19:23:38','2019-12-27 19:23:38'),
	(929,2,NULL,98,NULL,NULL,3,'هاي سنس 200*200/ 27',NULL,1.00,1.00,NULL,NULL,3160.00,'2019-12-27 19:24:11','2019-12-27 19:24:11'),
	(930,2,NULL,98,NULL,NULL,3,'هاي سنس 200*190/ 30',NULL,1.00,1.00,NULL,NULL,3625.00,'2019-12-27 19:24:58','2019-12-27 19:24:58'),
	(931,2,NULL,98,NULL,NULL,3,'هاي سنس 200*195/ 30',NULL,1.00,1.00,NULL,NULL,3625.00,'2019-12-27 19:25:43','2019-12-27 19:25:43'),
	(932,2,NULL,98,NULL,NULL,3,'هاي سنس 200*200/ 30',NULL,1.00,1.00,NULL,NULL,3625.00,'2019-12-27 19:26:17','2019-12-27 19:26:17'),
	(933,2,NULL,97,NULL,NULL,2,'خدادية دبل نت',NULL,1.00,1.00,NULL,NULL,65.00,'2019-12-27 21:26:19','2019-12-27 21:26:19'),
	(934,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 100',NULL,1.00,1.00,NULL,NULL,85.00,'2019-12-27 21:27:45','2019-12-27 21:27:45'),
	(935,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 120',NULL,1.00,1.00,NULL,NULL,102.00,'2019-12-27 21:28:37','2019-12-27 21:28:37'),
	(936,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 140',NULL,1.00,1.00,NULL,NULL,119.00,'2019-12-27 21:29:50','2019-12-27 21:29:50'),
	(937,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 150',NULL,1.00,1.00,NULL,NULL,127.00,'2019-12-27 21:34:12','2019-12-27 21:34:12'),
	(938,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 160',NULL,1.00,1.00,NULL,NULL,136.00,'2019-12-27 21:35:41','2019-12-27 21:35:41'),
	(939,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 170',NULL,1.00,1.00,NULL,NULL,144.00,'2019-12-27 21:36:36','2019-12-27 21:36:36'),
	(940,2,NULL,97,NULL,NULL,2,'مخدة دبل نت 180',NULL,1.00,1.00,NULL,NULL,153.00,'2019-12-27 21:37:27','2019-12-27 21:37:27'),
	(941,2,NULL,95,NULL,NULL,2,'واقي مليتون 100',NULL,1.00,1.00,NULL,NULL,85.00,'2019-12-27 21:39:10','2019-12-27 21:39:10'),
	(942,2,NULL,95,NULL,NULL,2,'واقي مليتون 120',NULL,1.00,1.00,NULL,NULL,102.00,'2019-12-27 21:40:03','2019-12-27 21:40:03'),
	(943,2,NULL,95,NULL,NULL,2,'واقي مليتون 140',NULL,1.00,1.00,NULL,NULL,119.00,'2019-12-27 21:40:42','2019-12-27 21:40:42'),
	(944,2,NULL,95,NULL,NULL,2,'واقي مليتون 150',NULL,1.00,1.00,NULL,NULL,127.00,'2019-12-27 21:41:27','2019-12-27 21:41:27'),
	(945,2,NULL,95,NULL,NULL,2,'واقي مليتون 160',NULL,1.00,1.00,NULL,NULL,136.00,'2019-12-27 21:42:03','2019-12-27 21:42:03'),
	(946,2,NULL,95,NULL,NULL,2,'واقي مليتون 170',NULL,1.00,1.00,NULL,NULL,144.00,'2019-12-27 21:42:39','2019-12-27 21:42:39'),
	(947,2,NULL,95,NULL,NULL,2,'واقي مليتون 180',NULL,1.00,1.00,NULL,NULL,153.00,'2019-12-27 21:43:16','2019-12-27 21:43:16'),
	(948,2,NULL,96,NULL,NULL,2,'خدادية ليزر',NULL,1.00,1.00,NULL,NULL,40.00,'2019-12-27 21:44:14','2019-12-27 21:44:14'),
	(949,2,NULL,96,NULL,NULL,2,'مخدة ليزر 100',NULL,1.00,1.00,NULL,NULL,55.00,'2019-12-27 21:45:06','2019-12-27 21:45:06'),
	(950,2,NULL,96,NULL,NULL,2,'مخدة ليزر 120',NULL,1.00,1.00,NULL,NULL,66.00,'2019-12-27 21:45:44','2019-12-27 21:52:01'),
	(951,2,NULL,96,NULL,NULL,2,'مخدة ليزر 140',NULL,1.00,1.00,NULL,NULL,77.00,'2019-12-27 21:46:23','2019-12-27 21:52:42'),
	(952,2,NULL,96,NULL,NULL,2,'مخدة ليزر 150',NULL,1.00,1.00,NULL,NULL,82.00,'2019-12-27 21:47:27','2019-12-27 21:53:14'),
	(953,2,NULL,96,NULL,NULL,2,'مخدة ليزر 160',NULL,1.00,1.00,NULL,NULL,88.00,'2019-12-27 21:48:02','2019-12-27 21:53:40'),
	(954,2,NULL,96,NULL,NULL,2,'مخدة ليزر 170',NULL,1.00,1.00,NULL,NULL,93.00,'2019-12-27 21:48:38','2020-01-06 20:17:26'),
	(955,2,NULL,96,NULL,NULL,2,'مخدة ليزر 180',NULL,1.00,1.00,NULL,NULL,99.00,'2019-12-27 21:49:34','2019-12-27 21:54:24'),
	(956,2,NULL,93,NULL,NULL,3,'هاي سليب 90*190/ 24',NULL,1.00,1.00,NULL,NULL,1465.00,'2019-12-28 16:55:33','2019-12-28 16:55:33'),
	(957,2,NULL,93,NULL,NULL,3,'هاي سليب 90*195/ 24',NULL,1.00,1.00,NULL,NULL,1465.00,'2019-12-28 16:56:01','2019-12-28 16:56:01'),
	(958,2,NULL,93,NULL,NULL,3,'هاي سليب 90*200/ 24',NULL,1.00,1.00,NULL,NULL,1465.00,'2019-12-28 16:56:26','2019-12-28 16:56:26'),
	(959,1,NULL,93,NULL,NULL,3,'هاي سليب 90*190/ 27',NULL,1.00,1.00,NULL,NULL,1751.00,'2019-12-28 16:57:36','2019-12-28 16:57:36'),
	(960,2,NULL,93,NULL,NULL,3,'هاي سليب 90*195/ 27',NULL,1.00,1.00,NULL,NULL,1751.00,'2019-12-28 16:59:04','2019-12-28 16:59:04'),
	(961,2,NULL,93,NULL,NULL,3,'هاي سليب 90*200/ 27',NULL,1.00,1.00,NULL,NULL,1751.00,'2019-12-28 16:59:30','2019-12-28 16:59:30'),
	(962,2,NULL,93,NULL,NULL,3,'هاي سليب 100*190/ 24',NULL,1.00,1.00,NULL,NULL,1612.00,'2019-12-28 17:00:04','2019-12-28 17:00:04'),
	(963,2,NULL,93,NULL,NULL,3,'هاي سليب 100*195/ 24',NULL,1.00,1.00,NULL,NULL,1612.00,'2019-12-28 17:00:30','2019-12-28 17:00:30'),
	(964,2,NULL,93,NULL,NULL,3,'هاي سليب 100*200/ 24',NULL,1.00,1.00,NULL,NULL,1612.00,'2019-12-28 17:00:59','2019-12-28 17:00:59'),
	(965,2,NULL,93,NULL,NULL,3,'هاي سليب 100*190/ 27',NULL,1.00,1.00,NULL,NULL,1940.00,'2019-12-28 17:01:44','2019-12-28 17:01:44'),
	(966,2,NULL,93,NULL,NULL,3,'هاي سليب 100*195/ 27',NULL,1.00,1.00,NULL,NULL,1940.00,'2019-12-28 17:02:20','2019-12-28 17:02:20'),
	(967,2,NULL,93,NULL,NULL,3,'هاي سليب 100*200/ 27',NULL,1.00,1.00,NULL,NULL,1940.00,'2019-12-28 17:02:58','2019-12-28 17:02:58'),
	(968,2,NULL,93,NULL,NULL,3,'هاي سليب 100*190/ 29',NULL,1.00,1.00,NULL,NULL,2144.00,'2019-12-28 17:04:53','2019-12-28 17:04:53'),
	(969,2,NULL,93,NULL,NULL,3,'هاي سليب 100*195/ 29',NULL,1.00,1.00,NULL,NULL,2144.00,'2019-12-28 17:05:17','2019-12-28 17:05:17'),
	(970,2,NULL,93,NULL,NULL,3,'هاي سليب 100*200/ 29',NULL,1.00,1.00,NULL,NULL,2144.00,'2019-12-28 17:05:47','2019-12-28 17:05:47'),
	(971,2,NULL,93,NULL,NULL,3,'هاي سليب 110*190/ 24',NULL,1.00,1.00,NULL,NULL,1773.00,'2019-12-28 17:06:32','2019-12-28 17:06:32'),
	(972,2,NULL,93,NULL,NULL,3,'هاي سليب 110*195/ 24',NULL,1.00,1.00,NULL,NULL,1773.00,'2019-12-28 17:07:04','2019-12-28 17:07:04'),
	(973,2,NULL,93,NULL,NULL,3,'هاي سليب 110*200/ 24',NULL,1.00,1.00,NULL,NULL,1773.00,'2019-12-28 17:07:31','2019-12-28 17:07:31'),
	(974,2,NULL,93,NULL,NULL,3,'هاي سليب 110*190/ 27',NULL,1.00,1.00,NULL,NULL,2138.00,'2019-12-28 17:08:12','2019-12-28 17:08:12'),
	(975,2,NULL,93,NULL,NULL,3,'هاي سليب 110*195/ 27',NULL,1.00,1.00,NULL,NULL,2138.00,'2019-12-28 17:08:37','2019-12-28 17:08:37'),
	(976,2,NULL,93,NULL,NULL,3,'هاي سليب 110*200/ 27',NULL,1.00,1.00,NULL,NULL,2138.00,'2019-12-28 17:09:01','2019-12-28 17:09:01'),
	(977,2,NULL,93,NULL,NULL,3,'هاي سليب 110*190/ 29',NULL,1.00,1.00,NULL,NULL,2361.00,'2019-12-28 17:09:36','2019-12-28 17:09:36'),
	(978,2,NULL,93,NULL,NULL,3,'هاي سليب 110*195/ 29',NULL,1.00,1.00,NULL,NULL,2361.00,'2019-12-28 17:10:03','2019-12-28 17:10:03'),
	(979,2,NULL,93,NULL,NULL,3,'هاي سليب 110*200/ 29',NULL,1.00,1.00,NULL,NULL,2361.00,'2019-12-28 17:10:35','2019-12-28 17:10:35'),
	(980,2,NULL,93,NULL,NULL,3,'هاي سليب 120*190/ 24',NULL,1.00,1.00,NULL,NULL,1934.00,'2019-12-28 17:13:42','2019-12-28 17:13:42'),
	(981,2,NULL,93,NULL,NULL,3,'هاي سليب 120*195/ 24',NULL,1.00,1.00,NULL,NULL,1934.00,'2019-12-28 17:14:10','2019-12-28 17:14:10'),
	(982,2,NULL,93,NULL,NULL,3,'هاي سليب 120*200/ 24',NULL,1.00,1.00,NULL,NULL,1934.00,'2019-12-28 17:14:49','2019-12-28 17:14:49'),
	(983,2,NULL,93,NULL,NULL,3,'هاي سليب 120*190/ 27',NULL,1.00,1.00,NULL,NULL,2387.00,'2019-12-28 17:15:42','2019-12-28 17:15:42'),
	(984,2,NULL,93,NULL,NULL,3,'هاي سليب 120*195/ 27',NULL,1.00,1.00,NULL,NULL,2387.00,'2019-12-28 17:16:50','2019-12-28 17:16:50'),
	(985,2,NULL,93,NULL,NULL,3,'هاي سليب 120*200/ 27',NULL,1.00,1.00,NULL,NULL,2387.00,'2019-12-28 17:17:45','2019-12-28 17:17:45'),
	(986,2,NULL,93,NULL,NULL,3,'هاي سليب 120*190/ 29',NULL,1.00,1.00,NULL,NULL,2579.00,'2019-12-28 17:18:36','2019-12-28 17:18:36'),
	(987,2,NULL,93,NULL,NULL,3,'هاي سليب 120*195/ 29',NULL,1.00,1.00,NULL,NULL,2579.00,'2019-12-28 17:19:18','2019-12-28 17:19:18'),
	(988,2,NULL,93,NULL,NULL,3,'هاي سليب 120*200/ 29',NULL,1.00,1.00,NULL,NULL,2579.00,'2019-12-28 17:19:57','2019-12-28 17:19:57'),
	(989,2,NULL,93,NULL,NULL,3,'هاي سليب 120*190/ 31',NULL,1.00,1.00,NULL,NULL,2932.00,'2019-12-28 17:21:22','2019-12-28 17:21:22'),
	(990,2,NULL,93,NULL,NULL,3,'هاي سليب 120*195/ 31',NULL,1.00,1.00,NULL,NULL,2932.00,'2019-12-28 17:21:50','2019-12-28 17:21:50'),
	(991,2,NULL,93,NULL,NULL,3,'هاي سليب 120*200/ 31',NULL,1.00,1.00,NULL,NULL,2932.00,'2019-12-28 17:22:25','2019-12-28 17:22:25'),
	(992,2,NULL,93,NULL,NULL,3,'هاي سليب 130*190/ 24',NULL,1.00,1.00,NULL,NULL,2096.00,'2019-12-28 17:23:22','2019-12-28 17:23:22'),
	(993,2,NULL,93,NULL,NULL,3,'هاي سليب 130*195/ 24',NULL,1.00,1.00,NULL,NULL,2096.00,'2019-12-28 17:23:54','2019-12-28 17:23:54'),
	(994,2,NULL,93,NULL,NULL,3,'هاي سليب 130*200/ 24',NULL,1.00,1.00,NULL,NULL,2096.00,'2019-12-28 17:24:53','2019-12-28 17:24:53'),
	(995,2,NULL,93,NULL,NULL,3,'هاي سليب 130*190/ 27',NULL,1.00,1.00,NULL,NULL,2767.00,'2019-12-28 17:26:16','2019-12-28 17:26:16'),
	(996,2,NULL,93,NULL,NULL,3,'هاي سليب 130*195/ 27',NULL,1.00,1.00,NULL,NULL,2767.00,'2019-12-28 17:27:13','2019-12-28 17:27:13'),
	(997,2,NULL,93,NULL,NULL,3,'هاي سليب 130*200/ 27',NULL,1.00,1.00,NULL,NULL,2767.00,'2019-12-28 17:27:48','2019-12-28 17:27:48'),
	(998,2,NULL,93,NULL,NULL,3,'هاي سليب 140*190/ 24',NULL,1.00,1.00,NULL,NULL,2257.00,'2019-12-28 17:29:21','2019-12-28 17:29:21'),
	(999,2,NULL,93,NULL,NULL,3,'هاي سليب 140*195/ 24',NULL,1.00,1.00,NULL,NULL,2257.00,'2019-12-28 17:29:53','2019-12-28 17:29:53'),
	(1000,2,NULL,93,NULL,NULL,3,'هاي سليب 140*200/ 24',NULL,1.00,1.00,NULL,NULL,2257.00,'2019-12-28 17:30:36','2019-12-28 17:30:36'),
	(1001,2,NULL,93,NULL,NULL,3,'هاي سليب 140*190/ 27',NULL,1.00,1.00,NULL,NULL,2956.00,'2019-12-28 17:31:37','2019-12-28 17:31:37'),
	(1002,2,NULL,93,NULL,NULL,3,'هاي سليب 140*195/ 27',NULL,1.00,1.00,NULL,NULL,2956.00,'2019-12-28 17:33:45','2019-12-28 17:33:45'),
	(1003,2,NULL,93,NULL,NULL,3,'هاي سليب 140*200/ 27',NULL,1.00,1.00,NULL,NULL,2956.00,'2019-12-28 17:34:16','2019-12-28 17:34:16'),
	(1004,2,NULL,93,NULL,NULL,3,'هاي سليب 150*190/ 24',NULL,1.00,1.00,NULL,NULL,2418.00,'2019-12-28 17:35:12','2019-12-28 17:35:12'),
	(1005,2,NULL,93,NULL,NULL,3,'هاي سليب 150*195/ 24',NULL,1.00,1.00,NULL,NULL,2418.00,'2019-12-28 17:35:46','2019-12-28 17:35:46'),
	(1006,2,NULL,93,NULL,NULL,3,'هاي سليب 150*200/ 24',NULL,1.00,1.00,NULL,NULL,2418.00,'2019-12-28 17:36:16','2019-12-28 17:36:16'),
	(1007,2,NULL,93,NULL,NULL,3,'هاي سليب 150*190/ 27',NULL,1.00,1.00,NULL,NULL,3035.00,'2019-12-28 17:36:49','2019-12-28 17:36:49'),
	(1008,2,NULL,93,NULL,NULL,3,'هاي سليب 150*195/ 27',NULL,1.00,1.00,NULL,NULL,3035.00,'2019-12-28 17:37:11','2019-12-28 17:37:11'),
	(1009,2,NULL,93,NULL,NULL,3,'هاي سليب 150*200/ 27',NULL,1.00,1.00,NULL,NULL,3035.00,'2019-12-28 17:37:47','2019-12-28 17:37:47'),
	(1010,2,NULL,93,NULL,NULL,3,'هاي سليب 150*190/ 29',NULL,1.00,1.00,NULL,NULL,3342.00,'2019-12-28 17:38:44','2019-12-28 17:38:44'),
	(1011,2,NULL,93,NULL,NULL,3,'هاي سليب 150*195/ 29',NULL,1.00,1.00,NULL,NULL,3342.00,'2019-12-28 17:39:11','2019-12-28 17:39:11'),
	(1012,2,NULL,93,NULL,NULL,3,'هاي سليب 150*200/ 29',NULL,1.00,1.00,NULL,NULL,3342.00,'2019-12-28 17:39:39','2019-12-28 17:39:39'),
	(1013,2,NULL,93,NULL,NULL,3,'هاي سليب 150*190/ 31',NULL,1.00,1.00,NULL,NULL,3664.00,'2019-12-28 17:40:35','2019-12-28 17:40:35'),
	(1014,2,NULL,93,NULL,NULL,3,'هاي سليب 150*195/ 31',NULL,1.00,1.00,NULL,NULL,3664.00,'2019-12-28 17:40:59','2019-12-28 17:40:59'),
	(1015,2,NULL,93,NULL,NULL,3,'هاي سليب 150*200/ 31',NULL,1.00,1.00,NULL,NULL,3664.00,'2019-12-28 17:41:54','2019-12-28 17:41:54'),
	(1016,2,NULL,93,NULL,NULL,3,'هاي سليب 160*190/ 24',NULL,1.00,1.00,NULL,NULL,2579.00,'2019-12-28 17:43:14','2019-12-28 17:43:14'),
	(1017,2,NULL,93,NULL,NULL,3,'هاي سليب 160*195/ 24',NULL,1.00,1.00,NULL,NULL,2579.00,'2019-12-28 17:43:50','2019-12-28 17:43:50'),
	(1018,2,NULL,93,NULL,NULL,3,'هاي سليب 160*200/ 24',NULL,1.00,1.00,NULL,NULL,2579.00,'2019-12-28 17:44:17','2019-12-28 17:44:17'),
	(1019,2,NULL,93,NULL,NULL,3,'هاي سليب 160*190/ 27',NULL,1.00,1.00,NULL,NULL,3214.00,'2019-12-28 17:45:12','2019-12-28 17:45:12'),
	(1020,2,NULL,93,NULL,NULL,3,'هاي سليب 160*195/ 27',NULL,1.00,1.00,NULL,NULL,3214.00,'2019-12-28 17:45:51','2019-12-28 17:45:51'),
	(1021,2,NULL,93,NULL,NULL,3,'هاي سليب 160*200/ 27',NULL,1.00,1.00,NULL,NULL,3214.00,'2019-12-28 17:46:17','2019-12-28 17:46:17'),
	(1022,2,NULL,93,NULL,NULL,3,'هاي سليب 160*190/ 29',NULL,1.00,1.00,NULL,NULL,3556.00,'2019-12-28 17:46:51','2019-12-28 17:46:51'),
	(1023,2,NULL,93,NULL,NULL,3,'هاي سليب 160*195/ 29',NULL,1.00,1.00,NULL,NULL,3556.00,'2019-12-28 17:47:21','2019-12-28 17:47:21'),
	(1024,2,NULL,93,NULL,NULL,3,'هاي سليب 160*200/ 29',NULL,1.00,1.00,NULL,NULL,3556.00,'2019-12-28 17:47:55','2019-12-28 17:47:55'),
	(1025,2,NULL,93,NULL,NULL,3,'هاي سليب 160*190/ 31',NULL,1.00,1.00,NULL,NULL,3910.00,'2019-12-28 17:49:26','2019-12-28 17:49:26'),
	(1026,2,NULL,93,NULL,NULL,3,'هاي سليب 160*195/ 31',NULL,1.00,1.00,NULL,NULL,3910.00,'2019-12-28 17:49:54','2019-12-28 17:49:54'),
	(1027,2,NULL,93,NULL,NULL,3,'هاي سليب 160*200/ 31',NULL,1.00,1.00,NULL,NULL,3910.00,'2019-12-28 17:50:43','2019-12-28 17:50:43'),
	(1028,2,NULL,93,NULL,NULL,3,'هاي سليب 170*190/ 24',NULL,1.00,1.00,NULL,NULL,2739.00,'2019-12-28 17:51:30','2019-12-28 17:51:30'),
	(1029,2,NULL,93,NULL,NULL,3,'هاي سليب 170*195/ 24',NULL,1.00,1.00,NULL,NULL,2739.00,'2019-12-28 17:52:07','2019-12-28 17:52:07'),
	(1030,2,NULL,93,NULL,NULL,3,'هاي سليب 170*200/ 24',NULL,1.00,1.00,NULL,NULL,2739.00,'2019-12-28 17:52:43','2019-12-28 17:52:43'),
	(1031,2,NULL,93,NULL,NULL,3,'هاي سليب 170*190/ 27',NULL,1.00,1.00,NULL,NULL,3423.00,'2019-12-28 17:53:31','2019-12-28 17:53:31'),
	(1032,2,NULL,93,NULL,NULL,3,'هاي سليب 170*195/ 27',NULL,1.00,1.00,NULL,NULL,3423.00,'2019-12-28 17:54:02','2019-12-28 17:54:02'),
	(1033,2,NULL,93,NULL,NULL,3,'هاي سليب 170*200/ 27',NULL,1.00,1.00,NULL,NULL,3423.00,'2019-12-28 17:54:28','2019-12-28 17:54:28'),
	(1034,2,NULL,93,NULL,NULL,3,'هاي سليب 170*190/ 29',NULL,1.00,1.00,NULL,NULL,3842.00,'2019-12-28 17:55:08','2019-12-28 17:55:08'),
	(1035,2,NULL,93,NULL,NULL,3,'هاي سليب 170*195/ 29',NULL,1.00,1.00,NULL,NULL,3842.00,'2019-12-28 17:55:39','2019-12-28 17:55:39'),
	(1036,2,NULL,93,NULL,NULL,3,'هاي سليب 170*200/ 29',NULL,1.00,1.00,NULL,NULL,3842.00,'2019-12-28 17:56:03','2019-12-28 17:56:03'),
	(1037,2,NULL,93,NULL,NULL,3,'هاي سليب 170*190/ 31',NULL,1.00,1.00,NULL,NULL,4153.00,'2019-12-28 17:56:41','2019-12-28 17:56:41'),
	(1038,2,NULL,93,NULL,NULL,3,'هاي سليب 170*195/ 31',NULL,1.00,1.00,NULL,NULL,4153.00,'2019-12-28 17:57:11','2019-12-28 17:57:11'),
	(1039,2,NULL,93,NULL,NULL,3,'هاي سليب 170*200/ 31',NULL,1.00,1.00,NULL,NULL,4153.00,'2019-12-28 17:57:50','2019-12-28 17:57:50'),
	(1040,2,NULL,93,NULL,NULL,3,'هاي سليب 180*190/ 24',NULL,1.00,1.00,NULL,NULL,2902.00,'2019-12-28 18:00:33','2019-12-28 18:00:33'),
	(1041,2,NULL,93,NULL,NULL,3,'هاي سليب 180*195/ 24',NULL,1.00,1.00,NULL,NULL,2902.00,'2019-12-28 18:01:17','2019-12-28 18:01:17'),
	(1042,2,NULL,93,NULL,NULL,3,'هاي سليب 180*200/ 24',NULL,1.00,1.00,NULL,NULL,2902.00,'2019-12-28 18:02:02','2019-12-28 18:02:02'),
	(1043,2,NULL,93,NULL,NULL,3,'هاي سليب 180*190/ 27',NULL,1.00,1.00,NULL,NULL,3612.00,'2019-12-28 18:02:51','2019-12-28 18:02:51'),
	(1044,2,NULL,93,NULL,NULL,3,'هاي سليب 180*195/ 27',NULL,1.00,1.00,NULL,NULL,3612.00,'2019-12-28 18:03:18','2019-12-28 18:03:18'),
	(1045,2,NULL,93,NULL,NULL,3,'هاي سليب 180*200/ 27',NULL,1.00,1.00,NULL,NULL,3612.00,'2019-12-28 18:03:46','2019-12-28 18:03:46'),
	(1046,2,NULL,93,NULL,NULL,3,'هاي سليب 180*190/ 29',NULL,1.00,1.00,NULL,NULL,4017.00,'2019-12-28 18:04:55','2019-12-28 18:04:55'),
	(1047,2,NULL,93,NULL,NULL,3,'هاي سليب 180*195/ 29',NULL,1.00,1.00,NULL,NULL,4017.00,'2019-12-28 18:05:50','2019-12-28 18:05:50'),
	(1048,2,NULL,93,NULL,NULL,3,'هاي سليب 180*200/ 29',NULL,1.00,1.00,NULL,NULL,4017.00,'2019-12-28 18:06:17','2019-12-28 18:06:17'),
	(1049,2,NULL,93,NULL,NULL,3,'هاي سليب 180*190/ 31',NULL,1.00,1.00,NULL,NULL,4397.00,'2019-12-28 18:07:04','2019-12-28 18:07:04'),
	(1050,2,NULL,93,NULL,NULL,3,'هاي سليب 180*195/ 31',NULL,1.00,1.00,NULL,NULL,4397.00,'2019-12-28 18:07:37','2019-12-28 18:07:37'),
	(1051,2,NULL,93,NULL,NULL,3,'هاي سليب 180*200/ 31',NULL,1.00,1.00,NULL,NULL,4397.00,'2019-12-28 18:08:08','2019-12-28 18:08:08'),
	(1052,2,NULL,93,NULL,NULL,3,'هاي سليب 180*190/ 33',NULL,1.00,1.00,NULL,NULL,5203.00,'2019-12-28 18:14:49','2019-12-28 18:14:49'),
	(1053,2,NULL,93,NULL,NULL,3,'هاي سليب 180*195/ 33',NULL,1.00,1.00,NULL,NULL,5203.00,'2019-12-28 18:15:22','2019-12-28 18:15:22'),
	(1054,2,NULL,93,NULL,NULL,3,'هاي سليب 180*200/ 33',NULL,1.00,1.00,NULL,NULL,5203.00,'2019-12-28 18:15:51','2019-12-28 18:15:51'),
	(1055,2,NULL,93,NULL,NULL,3,'هاي سليب 150*190/ 33',NULL,1.00,1.00,NULL,NULL,4334.00,'2019-12-28 18:16:45','2019-12-28 18:16:45'),
	(1056,2,NULL,93,NULL,NULL,3,'هاي سليب 150*195/ 33',NULL,1.00,1.00,NULL,NULL,4334.00,'2019-12-28 18:17:18','2019-12-28 18:17:18'),
	(1057,2,NULL,93,NULL,NULL,3,'هاي سليب 150*200/ 33',NULL,1.00,1.00,NULL,NULL,4334.00,'2019-12-28 18:17:42','2019-12-28 18:17:42'),
	(1058,2,NULL,93,NULL,NULL,3,'هاي سليب 160*190/ 33',NULL,1.00,1.00,NULL,NULL,4623.00,'2019-12-28 18:18:28','2019-12-28 18:18:28'),
	(1059,2,NULL,93,NULL,NULL,3,'هاي سليب 160*195/ 33',NULL,1.00,1.00,NULL,NULL,4623.00,'2019-12-28 18:18:55','2019-12-28 18:18:55'),
	(1060,2,NULL,93,NULL,NULL,3,'هاي سليب 160*200/ 33',NULL,1.00,1.00,NULL,NULL,4623.00,'2019-12-28 18:19:19','2019-12-28 18:19:19'),
	(1061,2,NULL,93,NULL,NULL,3,'هاي سليب 170*190/ 33',NULL,1.00,1.00,NULL,NULL,4913.00,'2019-12-28 18:19:49','2019-12-28 18:19:49'),
	(1062,2,NULL,93,NULL,NULL,3,'هاي سليب 170*195/ 33',NULL,1.00,1.00,NULL,NULL,4913.00,'2019-12-28 18:20:14','2019-12-28 18:20:14'),
	(1063,2,NULL,93,NULL,NULL,3,'هاي سليب 170*200/ 33',NULL,1.00,1.00,NULL,NULL,4913.00,'2019-12-28 18:20:38','2019-12-28 18:20:38'),
	(1064,2,NULL,93,NULL,NULL,3,'هاي سليب 200*190/ 24',NULL,1.00,1.00,NULL,NULL,3223.00,'2019-12-28 18:26:02','2019-12-28 18:26:02'),
	(1065,2,NULL,93,NULL,NULL,3,'هاي سليب 200*195/ 24',NULL,1.00,1.00,NULL,NULL,3223.00,'2019-12-28 18:26:44','2019-12-28 18:26:44'),
	(1066,2,NULL,93,NULL,NULL,3,'هاي سليب 200*200/ 24',NULL,1.00,1.00,NULL,NULL,3223.00,'2019-12-28 18:27:24','2019-12-28 18:27:24'),
	(1067,2,NULL,93,NULL,NULL,3,'هاي سليب 200*190/ 27',NULL,1.00,1.00,NULL,NULL,3877.00,'2019-12-28 18:28:17','2019-12-28 18:28:17'),
	(1068,2,NULL,93,NULL,NULL,3,'هاي سليب 200*195/ 27',NULL,1.00,1.00,NULL,NULL,3877.00,'2019-12-28 18:29:04','2019-12-28 18:29:04'),
	(1069,2,NULL,93,NULL,NULL,3,'هاي سليب 200*200/ 27',NULL,1.00,1.00,NULL,NULL,3877.00,'2019-12-28 18:29:35','2019-12-28 18:29:35'),
	(1070,2,NULL,93,NULL,NULL,3,'هاي سليب 200*190/ 29',NULL,1.00,1.00,NULL,NULL,4288.00,'2019-12-28 18:30:14','2019-12-28 18:30:14'),
	(1071,2,NULL,93,NULL,NULL,3,'هاي سليب 200*195/ 29',NULL,1.00,1.00,NULL,NULL,4288.00,'2019-12-28 18:30:41','2019-12-28 18:30:41'),
	(1072,2,NULL,93,NULL,NULL,3,'هاي سليب 200*200/ 29',NULL,1.00,1.00,NULL,NULL,4288.00,'2019-12-28 18:31:21','2019-12-28 18:31:21'),
	(1073,2,NULL,93,NULL,NULL,3,'هاي سليب 200*190/ 31',NULL,1.00,1.00,NULL,NULL,4886.00,'2019-12-28 18:31:57','2019-12-28 18:31:57'),
	(1074,2,NULL,93,NULL,NULL,3,'هاي سليب 200*195/ 31',NULL,1.00,1.00,NULL,NULL,4886.00,'2019-12-28 18:32:25','2019-12-28 18:32:25'),
	(1075,2,NULL,93,NULL,NULL,3,'هاي سليب 200*200/ 31',NULL,1.00,1.00,NULL,NULL,4886.00,'2019-12-28 18:32:55','2019-12-28 18:32:55'),
	(1076,2,NULL,93,NULL,NULL,3,'هاي سليب 200*190/ 33',NULL,1.00,1.00,NULL,NULL,5773.00,'2019-12-28 18:33:34','2019-12-28 18:33:34'),
	(1077,2,NULL,93,NULL,NULL,3,'هاي سليب 200*195/ 33',NULL,1.00,1.00,NULL,NULL,5773.00,'2019-12-28 18:34:00','2019-12-28 18:34:00'),
	(1078,2,NULL,93,NULL,NULL,3,'هاي سليب 200*200/ 33',NULL,1.00,1.00,NULL,NULL,5773.00,'2019-12-28 18:34:32','2019-12-28 18:34:32'),
	(1079,2,NULL,16,NULL,NULL,1,'الدورا 90*190 /23',NULL,1.00,1.00,NULL,NULL,1260.00,'2019-12-28 19:01:24','2019-12-28 19:01:24'),
	(1080,2,NULL,16,NULL,NULL,1,'الدورا 90*195 /23',NULL,1.00,1.00,NULL,NULL,1260.00,'2019-12-28 19:01:49','2019-12-28 19:01:49'),
	(1081,2,NULL,16,NULL,NULL,1,'الدورا 90*200 /23',NULL,1.00,1.00,NULL,NULL,1260.00,'2019-12-28 19:02:13','2019-12-28 19:02:13'),
	(1082,2,NULL,16,NULL,NULL,1,'الدورا 90*190 /25',NULL,1.00,1.00,NULL,NULL,1370.00,'2019-12-28 19:02:48','2019-12-28 19:02:48'),
	(1083,2,NULL,16,NULL,NULL,1,'الدورا 90*195 /25',NULL,1.00,1.00,NULL,NULL,1370.00,'2019-12-28 19:03:10','2019-12-28 19:03:10'),
	(1084,2,NULL,16,NULL,NULL,1,'الدورا 90*200 /25',NULL,1.00,1.00,NULL,NULL,1370.00,'2019-12-28 19:03:32','2019-12-28 19:03:32'),
	(1085,2,NULL,16,NULL,NULL,1,'الدورا 90*190 /29',NULL,1.00,1.00,NULL,NULL,1655.00,'2019-12-28 19:03:58','2019-12-28 19:03:58'),
	(1086,2,NULL,16,NULL,NULL,1,'الدورا 90*195 /29',NULL,1.00,1.00,NULL,NULL,1655.00,'2019-12-28 19:04:23','2019-12-28 19:04:23'),
	(1087,2,NULL,16,NULL,NULL,1,'الدورا 90*200 /29',NULL,1.00,1.00,NULL,NULL,1655.00,'2019-12-28 19:04:51','2019-12-28 19:04:51'),
	(1088,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /23',NULL,1.00,1.00,NULL,NULL,1400.00,'2019-12-28 19:05:17','2019-12-28 19:05:17'),
	(1089,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /23',NULL,1.00,1.00,NULL,NULL,1400.00,'2019-12-28 19:05:36','2019-12-28 19:05:36'),
	(1090,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /23',NULL,1.00,1.00,NULL,NULL,1400.00,'2019-12-28 19:06:02','2019-12-28 19:06:02'),
	(1091,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /25',NULL,1.00,1.00,NULL,NULL,1520.00,'2019-12-28 19:06:26','2019-12-28 19:06:26'),
	(1092,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /25',NULL,1.00,1.00,NULL,NULL,1520.00,'2019-12-28 19:06:47','2019-12-28 19:06:47'),
	(1093,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /25',NULL,1.00,1.00,NULL,NULL,1520.00,'2019-12-28 19:07:08','2019-12-28 19:07:08'),
	(1094,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /29',NULL,1.00,1.00,NULL,NULL,1840.00,'2019-12-28 19:07:40','2019-12-28 19:07:40'),
	(1095,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /29',NULL,1.00,1.00,NULL,NULL,1840.00,'2019-12-28 19:08:01','2019-12-28 19:08:01'),
	(1096,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /29',NULL,1.00,1.00,NULL,NULL,1840.00,'2019-12-28 19:08:25','2019-12-28 19:08:25'),
	(1097,2,NULL,16,NULL,NULL,1,'الدورا 110*190 /23',NULL,1.00,1.00,NULL,NULL,1540.00,'2019-12-28 19:08:55','2019-12-28 19:08:55'),
	(1098,2,NULL,16,NULL,NULL,1,'الدورا 110*195 /23',NULL,1.00,1.00,NULL,NULL,1540.00,'2019-12-28 19:09:15','2019-12-28 19:09:15'),
	(1099,2,NULL,16,NULL,NULL,1,'الدورا 110*200 /23',NULL,1.00,1.00,NULL,NULL,1540.00,'2019-12-28 19:09:38','2019-12-28 19:09:38'),
	(1100,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /23',NULL,1.00,1.00,NULL,NULL,1680.00,'2019-12-28 19:10:14','2019-12-28 19:10:14'),
	(1101,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /23',NULL,1.00,1.00,NULL,NULL,1680.00,'2019-12-28 19:10:35','2019-12-28 19:10:35'),
	(1102,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /23',NULL,1.00,1.00,NULL,NULL,1680.00,'2019-12-28 19:11:00','2019-12-28 19:11:00'),
	(1103,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /25',NULL,1.00,1.00,NULL,NULL,1825.00,'2019-12-28 19:12:47','2019-12-28 19:12:47'),
	(1104,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /25',NULL,1.00,1.00,NULL,NULL,1825.00,'2019-12-28 19:13:06','2019-12-28 19:13:06'),
	(1105,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /25',NULL,1.00,1.00,NULL,NULL,1825.00,'2019-12-28 19:13:28','2019-12-28 19:13:28'),
	(1106,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /29',NULL,1.00,1.00,NULL,NULL,2210.00,'2019-12-28 19:13:51','2019-12-28 19:13:51'),
	(1107,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /29',NULL,1.00,1.00,NULL,NULL,2210.00,'2019-12-28 19:14:14','2019-12-28 19:14:14'),
	(1108,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /29',NULL,1.00,1.00,NULL,NULL,2210.00,'2019-12-28 19:14:36','2019-12-28 19:14:36'),
	(1109,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /23',NULL,1.00,1.00,NULL,NULL,2100.00,'2019-12-28 19:15:47','2019-12-28 19:15:47'),
	(1110,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /23',NULL,1.00,1.00,NULL,NULL,2100.00,'2019-12-28 19:16:08','2019-12-28 19:16:08'),
	(1111,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /23',NULL,1.00,1.00,NULL,NULL,2100.00,'2019-12-28 19:16:30','2019-12-28 19:16:30'),
	(1112,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /25',NULL,1.00,1.00,NULL,NULL,2280.00,'2019-12-28 19:16:57','2019-12-28 19:16:57'),
	(1113,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /25',NULL,1.00,1.00,NULL,NULL,2280.00,'2019-12-28 19:17:15','2019-12-28 19:17:15'),
	(1114,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /25',NULL,1.00,1.00,NULL,NULL,2280.00,'2019-12-28 19:17:35','2019-12-28 19:17:35'),
	(1115,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /29',NULL,1.00,1.00,NULL,NULL,2760.00,'2019-12-28 19:18:03','2019-12-28 19:18:03'),
	(1116,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /29',NULL,1.00,1.00,NULL,NULL,2760.00,'2019-12-28 19:18:26','2019-12-28 19:18:26'),
	(1117,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /29',NULL,1.00,1.00,NULL,NULL,2760.00,'2019-12-28 19:18:44','2019-12-28 19:18:44'),
	(1118,2,NULL,16,NULL,NULL,1,'الدورا 160*190 /25',NULL,1.00,1.00,NULL,NULL,2430.00,'2019-12-28 19:19:10','2019-12-28 19:19:10'),
	(1119,2,NULL,16,NULL,NULL,1,'الدورا 160*195 /25',NULL,1.00,1.00,NULL,NULL,2430.00,'2019-12-28 19:19:31','2019-12-28 19:19:31'),
	(1120,2,NULL,16,NULL,NULL,1,'الدورا 160*200 /25',NULL,1.00,1.00,NULL,NULL,2430.00,'2019-12-28 19:19:54','2019-12-28 19:19:54'),
	(1121,2,NULL,16,NULL,NULL,1,'الدورا 160*190 /29',NULL,1.00,1.00,NULL,NULL,2945.00,'2019-12-28 19:20:22','2019-12-28 19:20:22'),
	(1122,2,NULL,16,NULL,NULL,1,'الدورا 160*195 /29',NULL,1.00,1.00,NULL,NULL,2945.00,'2019-12-28 19:20:43','2019-12-28 19:20:43'),
	(1123,2,NULL,16,NULL,NULL,1,'الدورا 160*200 /29',NULL,1.00,1.00,NULL,NULL,2945.00,'2019-12-28 19:21:03','2019-12-28 19:21:03'),
	(1124,2,NULL,16,NULL,NULL,1,'الدورا 170*190 /25',NULL,1.00,1.00,NULL,NULL,2585.00,'2019-12-28 19:21:44','2019-12-28 19:21:44'),
	(1125,2,NULL,16,NULL,NULL,1,'الدورا 170*195 /25',NULL,1.00,1.00,NULL,NULL,2585.00,'2019-12-28 19:22:12','2019-12-28 19:22:12'),
	(1126,2,NULL,16,NULL,NULL,1,'الدورا 170*200 /25',NULL,1.00,1.00,NULL,NULL,2585.00,'2019-12-28 19:22:42','2019-12-28 19:22:42'),
	(1127,2,NULL,16,NULL,NULL,1,'الدورا 170*190 /29',NULL,1.00,1.00,NULL,NULL,3130.00,'2019-12-28 19:23:03','2019-12-28 19:23:03'),
	(1128,2,NULL,16,NULL,NULL,1,'الدورا 170*195 /29',NULL,1.00,1.00,NULL,NULL,3130.00,'2019-12-28 19:23:21','2019-12-28 19:23:21'),
	(1129,2,NULL,16,NULL,NULL,1,'الدورا 170*200 /29',NULL,1.00,1.00,NULL,NULL,3130.00,'2019-12-28 19:23:42','2019-12-28 19:23:42'),
	(1130,2,NULL,16,NULL,NULL,1,'الدورا 180*190 /25',NULL,1.00,1.00,NULL,NULL,2735.00,'2019-12-28 19:24:10','2019-12-28 19:24:10'),
	(1131,2,NULL,16,NULL,NULL,1,'الدورا 180*195 /25',NULL,1.00,1.00,NULL,NULL,2735.00,'2019-12-28 19:24:33','2019-12-28 19:24:33'),
	(1132,2,NULL,16,NULL,NULL,1,'الدورا 180*200 /25',NULL,1.00,1.00,NULL,NULL,2735.00,'2019-12-28 19:24:59','2019-12-28 19:24:59'),
	(1133,2,NULL,16,NULL,NULL,1,'الدورا 180*190 /29',NULL,1.00,1.00,NULL,NULL,3310.00,'2019-12-28 19:25:28','2019-12-28 19:25:28'),
	(1134,2,NULL,16,NULL,NULL,1,'الدورا 180*195 /29',NULL,1.00,1.00,NULL,NULL,3310.00,'2019-12-28 19:25:46','2019-12-28 19:25:46'),
	(1135,2,NULL,16,NULL,NULL,1,'الدورا 180*200 /29',NULL,1.00,1.00,NULL,NULL,3310.00,'2019-12-28 19:27:19','2019-12-28 19:27:19'),
	(1136,2,NULL,16,NULL,NULL,1,'الدورا 90*190 /24',NULL,1.00,1.00,NULL,NULL,1525.00,'2019-12-28 19:31:45','2019-12-28 19:31:45'),
	(1137,2,NULL,16,NULL,NULL,1,'الدورا 90*195 /24',NULL,1.00,1.00,NULL,NULL,1525.00,'2019-12-28 19:32:08','2019-12-28 19:32:08'),
	(1138,2,NULL,16,NULL,NULL,1,'الدورا 90*200 /24',NULL,1.00,1.00,NULL,NULL,1525.00,'2019-12-28 19:32:34','2019-12-28 19:32:34'),
	(1139,2,NULL,16,NULL,NULL,1,'الدورا 90*190 /26',NULL,1.00,1.00,NULL,NULL,1705.00,'2019-12-28 19:33:25','2019-12-28 19:33:25'),
	(1140,2,NULL,16,NULL,NULL,1,'الدورا 90*195 /26',NULL,1.00,1.00,NULL,NULL,1705.00,'2019-12-28 19:34:01','2019-12-28 19:34:01'),
	(1141,2,NULL,16,NULL,NULL,1,'الدورا 90*200 /26',NULL,1.00,1.00,NULL,NULL,1705.00,'2019-12-28 19:34:45','2019-12-28 19:34:45'),
	(1142,2,NULL,16,NULL,NULL,1,'الدورا 90*190 /28',NULL,1.00,1.00,NULL,NULL,1920.00,'2019-12-28 19:35:15','2019-12-28 19:35:15'),
	(1143,2,NULL,16,NULL,NULL,1,'الدورا 90*195 /28',NULL,1.00,1.00,NULL,NULL,1920.00,'2019-12-28 19:35:45','2019-12-28 19:35:45'),
	(1144,2,NULL,16,NULL,NULL,1,'الدورا 90*200 /28',NULL,1.00,1.00,NULL,NULL,1920.00,'2019-12-28 19:36:12','2019-12-28 19:36:12'),
	(1145,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /24',NULL,1.00,1.00,NULL,NULL,1695.00,'2019-12-28 19:37:13','2019-12-28 19:37:13'),
	(1146,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /24',NULL,1.00,1.00,NULL,NULL,1695.00,'2019-12-28 19:37:53','2019-12-28 19:37:53'),
	(1147,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /24',NULL,1.00,1.00,NULL,NULL,1695.00,'2019-12-28 19:38:16','2019-12-28 19:38:16'),
	(1148,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /26',NULL,1.00,1.00,NULL,NULL,1895.00,'2019-12-28 19:38:45','2019-12-28 19:38:45'),
	(1149,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /26',NULL,1.00,1.00,NULL,NULL,1895.00,'2019-12-28 19:39:09','2019-12-28 19:39:09'),
	(1150,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /26',NULL,1.00,1.00,NULL,NULL,1895.00,'2019-12-28 19:39:32','2019-12-28 19:39:32'),
	(1151,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /28',NULL,1.00,1.00,NULL,NULL,2135.00,'2019-12-28 19:40:03','2019-12-28 19:40:03'),
	(1152,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /28',NULL,1.00,1.00,NULL,NULL,2135.00,'2019-12-28 19:40:37','2019-12-28 19:40:37'),
	(1153,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /28',NULL,1.00,1.00,NULL,NULL,2135.00,'2019-12-28 19:41:06','2019-12-28 19:41:06'),
	(1154,2,NULL,16,NULL,NULL,1,'الدورا 100*190 /30',NULL,1.00,1.00,NULL,NULL,2310.00,'2019-12-28 19:41:36','2019-12-28 19:41:36'),
	(1155,2,NULL,16,NULL,NULL,1,'الدورا 100*195 /30',NULL,1.00,1.00,NULL,NULL,2310.00,'2019-12-28 19:42:02','2019-12-28 19:42:02'),
	(1156,2,NULL,16,NULL,NULL,1,'الدورا 100*200 /30',NULL,1.00,1.00,NULL,NULL,2310.00,'2019-12-28 19:42:23','2019-12-28 19:42:23'),
	(1157,2,NULL,16,NULL,NULL,1,'الدورا 110*190 /24',NULL,1.00,1.00,NULL,NULL,1865.00,'2019-12-28 19:43:02','2019-12-28 19:43:02'),
	(1158,2,NULL,16,NULL,NULL,1,'الدورا 110*195 /24',NULL,1.00,1.00,NULL,NULL,1865.00,'2019-12-28 19:43:22','2019-12-28 19:43:22'),
	(1159,2,NULL,16,NULL,NULL,1,'الدورا 110*200 /24',NULL,1.00,1.00,NULL,NULL,1865.00,'2019-12-28 19:43:43','2019-12-28 19:43:43'),
	(1160,2,NULL,16,NULL,NULL,1,'الدورا 110*190 /26',NULL,1.00,1.00,NULL,NULL,2085.00,'2019-12-28 19:44:37','2019-12-28 19:44:37'),
	(1161,2,NULL,16,NULL,NULL,1,'الدورا 110*195 /26',NULL,1.00,1.00,NULL,NULL,2085.00,'2019-12-28 19:45:39','2019-12-28 19:45:39'),
	(1162,2,NULL,16,NULL,NULL,1,'الدورا 110*200 /26',NULL,1.00,1.00,NULL,NULL,2085.00,'2019-12-28 19:46:00','2019-12-28 19:46:00'),
	(1163,2,NULL,16,NULL,NULL,1,'الدورا 110*190 /28',NULL,1.00,1.00,NULL,NULL,2345.00,'2019-12-28 19:46:57','2019-12-28 19:46:57'),
	(1164,2,NULL,16,NULL,NULL,1,'الدورا 110*195 /28',NULL,1.00,1.00,NULL,NULL,2345.00,'2019-12-28 19:47:32','2019-12-28 19:47:32'),
	(1165,2,NULL,16,NULL,NULL,1,'الدورا 110*200 /28',NULL,1.00,1.00,NULL,NULL,2345.00,'2019-12-28 19:48:16','2019-12-28 19:48:16'),
	(1166,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /24',NULL,1.00,1.00,NULL,NULL,2035.00,'2019-12-28 19:49:10','2019-12-28 19:49:10'),
	(1167,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /24',NULL,1.00,1.00,NULL,NULL,2035.00,'2019-12-28 19:49:40','2019-12-28 19:49:40'),
	(1168,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /24',NULL,1.00,1.00,NULL,NULL,2035.00,'2019-12-28 19:50:08','2019-12-28 19:50:08'),
	(1169,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /26',NULL,1.00,1.00,NULL,NULL,2275.00,'2019-12-28 19:51:12','2019-12-28 19:51:12'),
	(1170,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /26',NULL,1.00,1.00,NULL,NULL,2275.00,'2019-12-28 19:51:38','2019-12-28 19:51:38'),
	(1171,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /26',NULL,1.00,1.00,NULL,NULL,2275.00,'2019-12-28 19:52:01','2019-12-28 19:52:01'),
	(1172,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /28',NULL,1.00,1.00,NULL,NULL,2560.00,'2019-12-28 19:52:35','2019-12-28 19:52:35'),
	(1173,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /28',NULL,1.00,1.00,NULL,NULL,2560.00,'2019-12-28 19:53:13','2019-12-28 19:53:13'),
	(1174,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /28',NULL,1.00,1.00,NULL,NULL,2560.00,'2019-12-28 19:54:07','2019-12-28 19:54:07'),
	(1175,2,NULL,16,NULL,NULL,1,'الدورا 120*190 /30',NULL,1.00,1.00,NULL,NULL,2770.00,'2019-12-28 19:54:42','2019-12-28 19:54:42'),
	(1176,2,NULL,16,NULL,NULL,1,'الدورا 120*195 /30',NULL,1.00,1.00,NULL,NULL,2770.00,'2019-12-28 19:55:05','2019-12-28 19:55:05'),
	(1177,2,NULL,16,NULL,NULL,1,'الدورا 120*200 /30',NULL,1.00,1.00,NULL,NULL,2770.00,'2019-12-28 19:55:28','2019-12-28 19:55:28'),
	(1178,2,NULL,16,NULL,NULL,1,'الدورا 130*190 /24',NULL,1.00,1.00,NULL,NULL,2205.00,'2019-12-28 19:56:01','2019-12-28 19:56:01'),
	(1179,2,NULL,16,NULL,NULL,1,'الدورا 130*195 /24',NULL,1.00,1.00,NULL,NULL,2205.00,'2019-12-28 19:56:23','2019-12-28 19:56:23'),
	(1180,2,NULL,16,NULL,NULL,1,'الدورا 130*200 /24',NULL,1.00,1.00,NULL,NULL,2205.00,'2019-12-28 19:56:42','2019-12-28 19:56:42'),
	(1181,2,NULL,16,NULL,NULL,1,'الدورا 130*190 /26',NULL,1.00,1.00,NULL,NULL,2460.00,'2019-12-28 19:57:08','2019-12-28 19:57:08'),
	(1182,2,NULL,16,NULL,NULL,1,'الدورا 130*195 /26',NULL,1.00,1.00,NULL,NULL,2460.00,'2019-12-28 19:57:26','2019-12-28 19:57:26'),
	(1183,2,NULL,16,NULL,NULL,1,'الدورا 130*200 /26',NULL,1.00,1.00,NULL,NULL,2460.00,'2019-12-28 19:57:49','2019-12-28 19:57:49'),
	(1184,2,NULL,16,NULL,NULL,1,'الدورا 140*190 /24',NULL,1.00,1.00,NULL,NULL,2375.00,'2019-12-28 19:58:18','2019-12-28 19:58:18'),
	(1185,2,NULL,16,NULL,NULL,1,'الدورا 140*195 /24',NULL,1.00,1.00,NULL,NULL,2375.00,'2019-12-28 19:58:48','2019-12-28 19:58:48'),
	(1186,2,NULL,16,NULL,NULL,1,'الدورا 140*200 /24',NULL,1.00,1.00,NULL,NULL,2375.00,'2019-12-28 19:59:13','2019-12-28 19:59:13'),
	(1187,2,NULL,16,NULL,NULL,1,'الدورا 140*190 /26',NULL,1.00,1.00,NULL,NULL,2650.00,'2019-12-28 19:59:50','2019-12-28 19:59:50'),
	(1188,2,NULL,16,NULL,NULL,1,'الدورا 140*195 /26',NULL,1.00,1.00,NULL,NULL,2650.00,'2019-12-28 20:00:07','2019-12-28 20:00:07'),
	(1189,2,NULL,16,NULL,NULL,1,'الدورا 140*200 /26',NULL,1.00,1.00,NULL,NULL,2650.00,'2019-12-28 20:00:32','2019-12-28 20:00:32'),
	(1190,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /24',NULL,1.00,1.00,NULL,NULL,2545.00,'2019-12-28 20:04:37','2019-12-28 20:04:37'),
	(1191,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /24',NULL,1.00,1.00,NULL,NULL,2545.00,'2019-12-28 20:04:58','2019-12-28 20:04:58'),
	(1192,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /24',NULL,1.00,1.00,NULL,NULL,2545.00,'2019-12-28 20:05:24','2019-12-28 20:05:24'),
	(1193,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /26',NULL,1.00,1.00,NULL,NULL,2840.00,'2019-12-28 20:05:53','2019-12-28 20:05:53'),
	(1194,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /26',NULL,1.00,1.00,NULL,NULL,2840.00,'2019-12-28 20:06:15','2019-12-28 20:06:15'),
	(1195,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /26',NULL,1.00,1.00,NULL,NULL,2840.00,'2019-12-28 20:07:01','2019-12-28 20:07:01'),
	(1196,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /28',NULL,1.00,1.00,NULL,NULL,3200.00,'2019-12-28 20:07:30','2019-12-28 20:07:30'),
	(1197,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /28',NULL,1.00,1.00,NULL,NULL,3200.00,'2019-12-28 20:07:50','2019-12-28 20:07:50'),
	(1198,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /28',NULL,1.00,1.00,NULL,NULL,3200.00,'2019-12-28 20:08:21','2019-12-28 20:08:21'),
	(1199,2,NULL,16,NULL,NULL,1,'الدورا 150*190 /30',NULL,1.00,1.00,NULL,NULL,3465.00,'2019-12-28 20:09:07','2019-12-28 20:09:07'),
	(1200,2,NULL,16,NULL,NULL,1,'الدورا 150*195 /30',NULL,1.00,1.00,NULL,NULL,3465.00,'2019-12-28 20:09:28','2019-12-28 20:09:28'),
	(1201,2,NULL,16,NULL,NULL,1,'الدورا 150*200 /30',NULL,1.00,1.00,NULL,NULL,3465.00,'2019-12-28 20:09:50','2019-12-28 20:09:50'),
	(1202,2,NULL,16,NULL,NULL,1,'الدورا 160*190 /24',NULL,1.00,1.00,NULL,NULL,2715.00,'2019-12-28 20:10:28','2019-12-28 20:10:28'),
	(1203,2,NULL,16,NULL,NULL,1,'الدورا 160*195 /24',NULL,1.00,1.00,NULL,NULL,2715.00,'2019-12-28 20:10:59','2019-12-28 20:11:39'),
	(1204,2,NULL,16,NULL,NULL,1,'الدورا 160*200 /24',NULL,1.00,1.00,NULL,NULL,2715.00,'2019-12-28 20:12:16','2019-12-28 20:12:16'),
	(1205,2,NULL,16,NULL,NULL,1,'الدورا 160*190 /26',NULL,1.00,1.00,NULL,NULL,3030.00,'2019-12-28 20:12:55','2019-12-28 20:12:55'),
	(1206,2,NULL,16,NULL,NULL,1,'الدورا 160*195 /26',NULL,1.00,1.00,NULL,NULL,3030.00,'2019-12-28 20:13:13','2019-12-28 20:13:13'),
	(1207,2,NULL,16,NULL,NULL,1,'الدورا 160*200 /26',NULL,1.00,1.00,NULL,NULL,3030.00,'2019-12-28 20:13:34','2019-12-28 20:13:34'),
	(1208,2,NULL,16,NULL,NULL,1,'الدورا 160*190 /28',NULL,1.00,1.00,NULL,NULL,3415.00,'2019-12-28 20:14:00','2019-12-28 20:14:00'),
	(1209,2,NULL,16,NULL,NULL,1,'الدورا 160*195 /28',NULL,1.00,1.00,NULL,NULL,3415.00,'2019-12-28 20:14:19','2019-12-28 20:14:19'),
	(1210,2,NULL,16,NULL,NULL,1,'الدورا 160*200 /28',NULL,1.00,1.00,NULL,NULL,3415.00,'2019-12-28 20:14:45','2019-12-28 20:14:45'),
	(1211,2,NULL,16,NULL,NULL,1,'الدورا 160*190 /30',NULL,1.00,1.00,NULL,NULL,3695.00,'2019-12-28 20:15:27','2019-12-28 20:15:27'),
	(1212,2,NULL,16,NULL,NULL,1,'الدورا 160*195 /30',NULL,1.00,1.00,NULL,NULL,3695.00,'2019-12-28 20:16:04','2019-12-28 20:16:04'),
	(1213,2,NULL,16,NULL,NULL,1,'الدورا 160*200 /30',NULL,1.00,1.00,NULL,NULL,3695.00,'2019-12-28 20:16:25','2019-12-28 20:16:25'),
	(1214,2,NULL,16,NULL,NULL,1,'الدورا 170*190 /24',NULL,1.00,1.00,NULL,NULL,2885.00,'2019-12-28 20:18:10','2019-12-28 20:18:10'),
	(1215,2,NULL,16,NULL,NULL,1,'الدورا 170*195 /24',NULL,1.00,1.00,NULL,NULL,2885.00,'2019-12-28 20:18:45','2019-12-28 20:19:38'),
	(1216,2,NULL,16,NULL,NULL,1,'الدورا 170*200 /24',NULL,1.00,1.00,NULL,NULL,2885.00,'2019-12-28 20:20:06','2019-12-28 20:20:06'),
	(1217,2,NULL,16,NULL,NULL,1,'الدورا 170*190 /26',NULL,1.00,1.00,NULL,NULL,3220.00,'2019-12-28 20:20:51','2019-12-28 20:20:51'),
	(1218,2,NULL,16,NULL,NULL,1,'الدورا 170*195 /26',NULL,1.00,1.00,NULL,NULL,3220.00,'2019-12-28 20:21:31','2019-12-28 20:21:31'),
	(1219,2,NULL,16,NULL,NULL,1,'الدورا 170*200 /26',NULL,1.00,1.00,NULL,NULL,3220.00,'2019-12-28 20:21:59','2019-12-28 20:21:59'),
	(1220,2,NULL,16,NULL,NULL,1,'الدورا 170*190 /28',NULL,1.00,1.00,NULL,NULL,3630.00,'2019-12-28 20:23:04','2019-12-28 20:23:04'),
	(1221,2,NULL,16,NULL,NULL,1,'الدورا 170*200 /28',NULL,1.00,1.00,NULL,NULL,3630.00,'2019-12-28 20:23:42','2019-12-28 20:23:42'),
	(1222,2,NULL,16,NULL,NULL,1,'الدورا 170*195 /28',NULL,1.00,1.00,NULL,NULL,3630.00,'2019-12-28 20:24:36','2019-12-28 20:24:36'),
	(1223,2,NULL,16,NULL,NULL,1,'الدورا 170*190 /30',NULL,1.00,1.00,NULL,NULL,3925.00,'2019-12-28 20:25:11','2019-12-28 20:25:11'),
	(1224,2,NULL,16,NULL,NULL,1,'الدورا 170*195 /30',NULL,1.00,1.00,NULL,NULL,3925.00,'2019-12-28 20:25:39','2019-12-28 20:25:39'),
	(1225,2,NULL,16,NULL,NULL,1,'الدورا 170*200 /30',NULL,1.00,1.00,NULL,NULL,3925.00,'2019-12-28 20:26:19','2019-12-28 20:26:19'),
	(1226,2,NULL,16,NULL,NULL,1,'الدورا 180*190 /24',NULL,1.00,1.00,NULL,NULL,3055.00,'2019-12-28 20:27:31','2019-12-28 20:27:31'),
	(1227,2,NULL,16,NULL,NULL,1,'الدورا 180*195 /24',NULL,1.00,1.00,NULL,NULL,3055.00,'2019-12-28 20:28:06','2019-12-28 20:28:06'),
	(1228,2,NULL,16,NULL,NULL,1,'الدورا 180*200 /24',NULL,1.00,1.00,NULL,NULL,3055.00,'2019-12-28 20:28:33','2019-12-28 20:28:33'),
	(1229,2,NULL,16,NULL,NULL,1,'الدورا 180*190 /26',NULL,1.00,1.00,NULL,NULL,3410.00,'2019-12-28 20:29:05','2019-12-28 20:29:05'),
	(1230,2,NULL,16,NULL,NULL,1,'الدورا 180*195 /26',NULL,1.00,1.00,NULL,NULL,3410.00,'2019-12-28 20:29:31','2019-12-28 20:29:31'),
	(1231,2,NULL,16,NULL,NULL,1,'الدورا 180*200 /26',NULL,1.00,1.00,NULL,NULL,3410.00,'2019-12-28 20:30:04','2019-12-28 20:30:04'),
	(1232,2,NULL,16,NULL,NULL,1,'الدورا 180*190 /28',NULL,1.00,1.00,NULL,NULL,3840.00,'2019-12-28 20:30:36','2019-12-28 20:30:36'),
	(1233,2,NULL,16,NULL,NULL,1,'الدورا 180*195 /28',NULL,1.00,1.00,NULL,NULL,3840.00,'2019-12-28 20:30:58','2019-12-28 20:30:58'),
	(1234,2,NULL,16,NULL,NULL,1,'الدورا 180*200 /28',NULL,1.00,1.00,NULL,NULL,3840.00,'2019-12-28 20:31:26','2019-12-28 20:31:26'),
	(1235,2,NULL,16,NULL,NULL,1,'الدورا 180*190 /30',NULL,1.00,1.00,NULL,NULL,4160.00,'2019-12-28 20:31:55','2019-12-28 20:31:55'),
	(1236,2,NULL,16,NULL,NULL,1,'الدورا 180*195 /30',NULL,1.00,1.00,NULL,NULL,4160.00,'2019-12-28 20:32:18','2019-12-28 20:32:18'),
	(1237,2,NULL,16,NULL,NULL,1,'الدورا 180*200 /30',NULL,1.00,1.00,NULL,NULL,4160.00,'2019-12-28 20:32:56','2019-12-28 20:32:56'),
	(1238,2,NULL,16,NULL,NULL,1,'الدورا 200*200 /26',NULL,1.00,1.00,NULL,NULL,3790.00,'2019-12-28 20:34:20','2019-12-28 20:34:20'),
	(1239,2,NULL,16,NULL,NULL,1,'الدورا 200*190 /26',NULL,1.00,1.00,NULL,NULL,3790.00,'2019-12-28 20:34:59','2019-12-28 20:34:59'),
	(1240,2,NULL,16,NULL,NULL,1,'الدورا 200*195 /26',NULL,1.00,1.00,NULL,NULL,3790.00,'2019-12-28 20:35:26','2019-12-28 20:35:26'),
	(1241,2,NULL,16,NULL,NULL,1,'الدورا 200*190 /28',NULL,1.00,1.00,NULL,NULL,4270.00,'2019-12-28 20:35:57','2019-12-28 20:35:57'),
	(1242,2,NULL,16,NULL,NULL,1,'الدورا 200*195 /28',NULL,1.00,1.00,NULL,NULL,4270.00,'2019-12-28 20:36:28','2019-12-28 20:36:28'),
	(1243,2,NULL,16,NULL,NULL,1,'الدورا 200*200 /28',NULL,1.00,1.00,NULL,NULL,4270.00,'2019-12-28 20:36:59','2019-12-28 20:37:32'),
	(1244,2,NULL,16,NULL,NULL,1,'الدورا 200*190 /30',NULL,1.00,1.00,NULL,NULL,4620.00,'2019-12-28 20:38:23','2019-12-28 20:38:23'),
	(1245,2,NULL,16,NULL,NULL,1,'الدورا 200*195 /30',NULL,1.00,1.00,NULL,NULL,4620.00,'2019-12-28 20:38:53','2019-12-28 20:38:53'),
	(1246,2,NULL,16,NULL,NULL,1,'الدورا 200*200 /30',NULL,1.00,1.00,NULL,NULL,4620.00,'2019-12-28 20:39:27','2019-12-28 20:39:27'),
	(1247,2,NULL,2,NULL,NULL,1,'asdasdas','photos/TohzTsM8VZyAArP0uFBz8ph6dSln5HTe.png',13.00,12.00,123,123,10.50,'2020-03-07 12:42:43','2020-03-07 12:42:43'),
	(1248,1,NULL,1,NULL,NULL,2,'Administrator',NULL,20.00,2.50,123,123,10.50,'2020-03-07 18:39:05','2020-03-07 18:39:05');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchase_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_items`;

CREATE TABLE `purchase_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `number` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_items_purchase_id_index` (`purchase_id`),
  KEY `purchase_items_product_id_index` (`product_id`),
  CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `number`, `price`, `total_price`, `created_at`, `updated_at`)
VALUES
	(26,18,1,100,20.00,2000.00,'2020-03-27 21:31:12','2020-03-27 21:31:12'),
	(27,18,11,50,100.00,5000.00,'2020-03-27 21:31:12','2020-03-27 21:31:12'),
	(28,19,20,1000,20.00,20000.00,'2020-03-27 21:32:08','2020-03-27 21:32:08'),
	(29,19,17,15,100.00,1500.00,'2020-03-27 21:32:08','2020-03-27 21:32:08');

/*!40000 ALTER TABLE `purchase_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `permission_number` int(11) DEFAULT NULL,
  `taxes` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `price` decimal(11,0) DEFAULT NULL,
  `priceFinal` decimal(10,0) DEFAULT NULL,
  `finalPrice` decimal(11,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventorie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_supplier_id_index` (`supplier_id`),
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `supplier_id`, `permission_number`, `taxes`, `discount`, `price`, `priceFinal`, `finalPrice`, `created_at`, `updated_at`, `inventorie_id`)
VALUES
	(18,3,1,14,2,5000,NULL,56000,'2020-03-27 21:31:12','2020-03-27 21:31:12',2),
	(19,13,2,14,5,1500,25200,27291,'2020-03-27 21:32:08','2020-03-27 21:32:08',3);

/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sale_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sale_items`;

CREATE TABLE `sale_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `number` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_items_sale_id_index` (`sale_id`),
  KEY `sale_items_product_id_index` (`product_id`),
  CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `inventorie_id` bigint(20) unsigned DEFAULT NULL,
  `permission_number` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `taxes` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_supplier_id_index` (`supplier_id`),
  KEY `sales_inventorie_id_index` (`inventorie_id`),
  CONSTRAINT `sales_inventorie_id_foreign` FOREIGN KEY (`inventorie_id`) REFERENCES `inventories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table store_transfer_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_transfer_logs`;

CREATE TABLE `store_transfer_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_from_id` bigint(20) unsigned DEFAULT NULL,
  `store_to_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `orderNumber` int(11) NOT NULL,
  `acceptance` enum('pending','yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transfer_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_transfer_logs_store_from_id_index` (`store_from_id`),
  KEY `store_transfer_logs_store_to_id_index` (`store_to_id`),
  KEY `store_transfer_logs_product_id_index` (`product_id`),
  KEY `orderNumber` (`number`),
  CONSTRAINT `store_transfer_logs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `store_transfer_logs_store_from_id_foreign` FOREIGN KEY (`store_from_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `store_transfer_logs_store_to_id_foreign` FOREIGN KEY (`store_to_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `store_transfer_logs` WRITE;
/*!40000 ALTER TABLE `store_transfer_logs` DISABLE KEYS */;

INSERT INTO `store_transfer_logs` (`id`, `store_from_id`, `store_to_id`, `product_id`, `number`, `orderNumber`, `acceptance`, `transfer_date`, `created_at`, `updated_at`)
VALUES
	(1,1,3,13,1,0,'yes','2020-03-09','2019-12-26 16:25:43','2019-12-26 16:27:03'),
	(2,1,3,11,2,0,'yes','2020-03-09','2019-12-26 16:29:01','2019-12-26 16:30:06'),
	(3,3,1,11,1,0,'pending','2020-03-09','2019-12-26 16:31:09','2019-12-26 16:31:28'),
	(4,1,2,11,2,0,'pending','2020-03-09','2020-03-07 19:08:13','2020-03-07 19:08:13'),
	(5,1,4,10,5,0,'pending','2020-03-11','2020-03-07 19:08:28','2020-03-07 19:08:28'),
	(6,1,2,10,3,0,'pending','2020-03-25','2020-03-23 09:56:32','2020-03-23 09:56:32'),
	(7,1,2,1247,2,0,'pending','2020-03-19','2020-03-23 09:57:41','2020-03-23 09:57:41'),
	(8,1,3,10,1,8,'pending','2020-03-18','2020-03-24 19:48:05','2020-03-24 19:48:05');

/*!40000 ALTER TABLE `store_transfer_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;

INSERT INTO `stores` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'مخزن الدائري','2019-12-19 18:32:26','2019-12-19 18:32:26'),
	(2,'مخزن السيوف','2019-12-19 18:34:17','2019-12-19 18:34:17'),
	(3,'مخزن جمال عبدالناصر','2019-12-19 18:34:35','2019-12-19 18:34:35'),
	(4,'مخزن مصطفي كامل','2019-12-19 18:34:53','2019-12-19 18:34:53'),
	(5,'asdasdas','2020-03-07 13:09:09','2020-03-07 13:09:09');

/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stores_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stores_products`;

CREATE TABLE `stores_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `storeNumber` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stores_products_store_id_index` (`store_id`),
  KEY `stores_products_product_id_index` (`product_id`),
  KEY `storeNumber` (`number`),
  CONSTRAINT `stores_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stores_products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `stores_products` WRITE;
/*!40000 ALTER TABLE `stores_products` DISABLE KEYS */;

INSERT INTO `stores_products` (`id`, `store_id`, `product_id`, `number`, `storeNumber`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,0,'2019-12-19 18:33:22','2019-12-19 18:35:13'),
	(2,1,13,1,0,'2019-12-19 18:33:34','2019-12-26 16:25:43'),
	(3,1,11,1,0,'2019-12-19 18:33:48','2020-03-07 19:08:13'),
	(4,2,1,-200,0,'2019-12-19 18:35:13','2019-12-19 18:36:00'),
	(5,4,1,202,0,'2019-12-19 18:36:00','2019-12-19 18:36:00'),
	(6,1,10,1,0,'2019-12-26 16:11:43','2020-03-24 19:48:05'),
	(7,3,13,1,0,'2019-12-26 16:27:03','2019-12-26 16:27:03'),
	(8,3,11,1,0,'2019-12-26 16:30:06','2019-12-26 16:31:09'),
	(9,2,953,10,0,'2019-12-28 16:51:26','2019-12-28 16:51:26'),
	(10,1,1247,18,0,'2020-03-07 12:43:11','2020-03-23 09:57:41'),
	(11,1,2,1,0,'2020-03-16 20:28:00','2020-03-16 20:28:00'),
	(17,5,1,10,1,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(18,5,3,20,1,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(19,5,54,50,1,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(20,5,28,100,1,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(21,5,39,30,1,'2020-03-16 20:34:40','2020-03-16 20:34:40'),
	(22,5,3,20,2,'2020-03-16 20:35:13','2020-03-16 20:35:13'),
	(23,5,1,10,2,'2020-03-16 20:35:13','2020-03-16 20:35:13');

/*!40000 ALTER TABLE `stores_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sub_account_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sub_account_categories`;

CREATE TABLE `sub_account_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sub_account_categories` WRITE;
/*!40000 ALTER TABLE `sub_account_categories` DISABLE KEYS */;

INSERT INTO `sub_account_categories` (`id`, `category_id`, `title`, `number`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'3','مثال لنص','31','2020-04-08 19:18:55','2020-04-11 11:24:01','2020-04-11 11:24:01'),
	(2,'10','asdasd','101','2020-04-11 11:24:05','2020-04-11 11:24:05',NULL);

/*!40000 ALTER TABLE `sub_account_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_accounts`;

CREATE TABLE `supplier_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('credit','deposit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_accounts_supplier_id_index` (`supplier_id`),
  CONSTRAINT `supplier_accounts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `supplier_accounts` WRITE;
/*!40000 ALTER TABLE `supplier_accounts` DISABLE KEYS */;

INSERT INTO `supplier_accounts` (`id`, `supplier_id`, `balance`, `description`, `type`, `created_at`, `updated_at`)
VALUES
	(1,7,600.00,NULL,'deposit','2020-03-07 19:50:19','2020-03-07 19:50:19'),
	(2,3,5000.00,NULL,'deposit','2020-03-27 15:59:13','2020-03-27 15:59:13'),
	(3,5,1.00,NULL,'deposit','2020-03-27 16:18:46','2020-03-27 16:18:46'),
	(4,5,1500.00,NULL,'deposit','2020-03-27 20:13:55','2020-03-27 20:13:55'),
	(5,30,6000.00,NULL,'deposit','2020-03-27 20:16:23','2020-03-27 20:16:23'),
	(6,31,300.00,NULL,'deposit','2020-03-27 20:18:38','2020-03-27 20:18:38'),
	(7,NULL,750.00,NULL,'deposit','2020-03-27 20:22:18','2020-03-27 20:22:18'),
	(8,10,5000.00,NULL,'deposit','2020-03-27 21:13:42','2020-03-27 21:13:42'),
	(9,4,5000.00,NULL,'deposit','2020-03-27 21:17:42','2020-03-27 21:17:42'),
	(10,13,1500.00,NULL,'deposit','2020-03-27 21:19:13','2020-03-27 21:19:13'),
	(11,9,2000.00,NULL,'deposit','2020-03-27 21:21:05','2020-03-27 21:21:05'),
	(12,13,5000.00,NULL,'deposit','2020-03-27 21:29:07','2020-03-27 21:29:07'),
	(13,3,5000.00,NULL,'deposit','2020-03-27 21:31:12','2020-03-27 21:31:12'),
	(14,13,1500.00,NULL,'deposit','2020-03-27 21:32:08','2020-03-27 21:32:08'),
	(15,3,1000.00,NULL,'deposit','2020-04-12 14:32:17','2020-04-12 14:32:17');

/*!40000 ALTER TABLE `supplier_accounts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ground_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_supplier` tinyint(1) NOT NULL DEFAULT '0',
  `is_client` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;

INSERT INTO `suppliers` (`id`, `name`, `adress`, `phone_number`, `ground_number`, `fax_number`, `email`, `is_supplier`, `is_client`, `created_at`, `updated_at`)
VALUES
	(3,'ايمن المنيس','الحضرة  - الاسكندرية','024000008','034803604',NULL,NULL,1,0,'2019-12-08 20:45:08','2019-12-08 20:45:08'),
	(4,'احمد السيويفي','القاهرة',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:45:58','2019-12-08 20:45:58'),
	(5,'شركة الاسكندرية للمفروشات','الاسكندرية',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:46:45','2019-12-08 20:46:45'),
	(6,'تركيا','تركيا',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:47:20','2019-12-08 20:47:20'),
	(7,'حسام حسن','القاهرة',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:48:04','2019-12-08 20:48:04'),
	(8,'لمعي جروب','الاسكندرية',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:48:34','2019-12-08 20:48:34'),
	(9,'الفتال هوم للمفروشات','كفر الدوار',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:48:57','2019-12-08 21:31:49'),
	(10,'شركة هاى سليب','القاهرة',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:49:28','2019-12-08 20:49:28'),
	(11,'شركة هاى سنس','القاهرة',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:50:04','2019-12-08 20:50:04'),
	(12,'شركة باندا','القاهرة',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:50:38','2019-12-08 20:50:38'),
	(13,'شراء سجاد نقدي','الاسكندرية',NULL,NULL,NULL,NULL,1,0,'2019-12-08 20:51:28','2019-12-08 20:51:28'),
	(14,'محمد محروس  - القاهرة','القاهرة','01223101309',NULL,NULL,NULL,0,1,'2019-12-08 20:56:09','2019-12-08 20:56:09'),
	(15,'راجح التوني','الحضرة  - الاسكندرية','01220472888',NULL,NULL,NULL,0,1,'2019-12-08 20:57:31','2019-12-08 20:57:31'),
	(16,'ايمن المعمورة','الاسكندرية','01220439568',NULL,NULL,NULL,0,1,'2019-12-08 20:59:07','2019-12-08 20:59:07'),
	(17,'عماد عبد الحليم','ابيس -  الاسكندرية','01224697732',NULL,NULL,NULL,0,1,'2019-12-08 21:00:52','2019-12-08 21:00:52'),
	(18,'د سعيد','رشيد','01001233836','0452934266',NULL,NULL,0,1,'2019-12-08 21:02:47','2019-12-08 21:02:47'),
	(19,'ابو سعيد السوري','الفلكي الاسكندرية','01009151688',NULL,NULL,NULL,0,1,'2019-12-08 21:10:12','2019-12-08 21:10:12'),
	(20,'ناظم عبد الرحمن السوري','سيدي جابر الاسكندرية','01126402740',NULL,NULL,NULL,0,1,'2019-12-08 21:13:40','2019-12-08 21:13:40'),
	(21,'عماد شاهين','دمنهور','01005475721',NULL,NULL,NULL,0,1,'2019-12-08 21:15:07','2019-12-08 21:15:07'),
	(22,'حمادة نسو','كوم امبو اسوان','01066077562',NULL,NULL,NULL,0,1,'2019-12-08 21:16:45','2019-12-08 21:16:45'),
	(23,'حمدي عاشور','الحضرة  - الاسكندرية','01111718836',NULL,NULL,NULL,0,1,'2019-12-08 21:17:57','2019-12-08 21:17:57'),
	(24,'مجدي مرجان','ش احمد ابو سليمان  الاسكندرية','01068864507',NULL,NULL,NULL,0,1,'2019-12-08 21:19:34','2019-12-08 21:19:34'),
	(25,'وليد نادي الصيد','نادي الصيد الاسكندرية','01115436000',NULL,NULL,NULL,0,1,'2019-12-08 21:21:40','2019-12-08 21:21:40'),
	(26,'ايهاب شنودة','باكوس الاسكندرية','01200001449',NULL,NULL,NULL,0,1,'2019-12-08 21:22:55','2019-12-08 21:22:55'),
	(27,'محمد باكوس','باكوس الاسكندرية','01150601347',NULL,NULL,NULL,0,1,'2019-12-08 21:26:36','2019-12-08 21:26:36'),
	(28,'الشيخ عبد الرحمن','الهانوفيل العجمي الاسكندرية','01111303994',NULL,NULL,NULL,0,1,'2019-12-08 21:28:04','2019-12-08 21:28:04'),
	(29,'محمود عاطف','ابيس -  الاسكندرية','01286674077',NULL,NULL,NULL,0,1,'2019-12-08 21:30:10','2019-12-08 21:30:10'),
	(30,'فتح الله الشرنوبي','القاهرة',NULL,NULL,NULL,NULL,1,0,'2019-12-08 21:30:47','2019-12-08 21:30:47'),
	(31,'الحاج اسماعيل الشيخ','الاسكندرية',NULL,NULL,NULL,NULL,1,0,'2019-12-08 21:35:25','2019-12-08 21:35:25'),
	(32,'محمد علي','الاسكندرية','0122528858',NULL,NULL,NULL,0,1,'2019-12-08 21:39:15','2019-12-08 21:39:15'),
	(33,'عبد السلام كفر الدوار','كفر الدوار','01221298327',NULL,NULL,NULL,0,1,'2019-12-08 21:40:14','2019-12-08 21:40:14'),
	(34,'اشرف المندرة','01286050593',NULL,NULL,NULL,NULL,0,1,'2019-12-08 21:41:56','2019-12-08 21:41:56'),
	(35,'الشيخ اوشو','الاسكندرية','01205958046',NULL,NULL,NULL,0,1,'2019-12-08 21:42:55','2019-12-08 21:42:55'),
	(36,'الشيخ سامح','طنطا','01026068015',NULL,NULL,NULL,0,1,'2019-12-08 21:44:08','2019-12-08 21:44:08'),
	(37,'سعيد نصر','بركة السبع المنوفية','01000475757',NULL,NULL,NULL,0,1,'2019-12-08 21:45:03','2019-12-08 21:45:03'),
	(38,'محمد خليفة','الاسكندرية',NULL,NULL,NULL,NULL,1,0,'2019-12-08 21:48:05','2019-12-08 21:48:05'),
	(39,'محمد رجب المنصورة','المنصورة','01289494119',NULL,NULL,NULL,0,1,'2019-12-08 21:49:20','2019-12-08 21:49:20'),
	(40,'مصطفي وهيب',NULL,'01142870807',NULL,NULL,NULL,0,1,'2019-12-08 21:50:22','2019-12-08 21:50:22'),
	(41,'عبد الله الكسار','العجمي الاسكندرية','01226235000',NULL,NULL,NULL,0,1,'2019-12-08 21:55:56','2019-12-08 21:55:56'),
	(42,'ابو سفيان','بني سيوف',NULL,NULL,NULL,NULL,0,1,'2019-12-08 21:56:30','2019-12-08 21:56:30'),
	(43,'عيد قدومة',NULL,'01000248990',NULL,NULL,NULL,0,1,'2019-12-08 22:00:17','2019-12-08 22:00:17'),
	(44,'ياسر المنشية','الاسكندرية','01223913145',NULL,NULL,NULL,0,1,'2019-12-08 22:01:16','2019-12-08 22:01:16'),
	(45,'محمود خلف','دمياط','01002233429','03774976',NULL,NULL,0,1,'2019-12-08 22:03:09','2019-12-08 22:03:09'),
	(46,'احمد صقر','المنصورة','01098226656',NULL,NULL,NULL,0,1,'2019-12-08 22:04:17','2019-12-08 22:04:17'),
	(47,'الحاج هشام عبد الغني','المنصورة','01067388000',NULL,NULL,NULL,0,1,'2019-12-08 22:08:12','2019-12-08 22:08:12'),
	(48,'جوزيف صلاح الدين','الاسكندرية','01284050332',NULL,NULL,NULL,0,1,'2019-12-08 22:09:13','2019-12-08 22:09:13'),
	(49,'محمود راضي','المنصورة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:09:44','2019-12-08 22:09:44'),
	(50,'وليد حشيش','المنصورة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:10:17','2019-12-08 22:10:17'),
	(51,'خليفة الشافعي','كفر الشيخ','01066464606',NULL,NULL,NULL,0,1,'2019-12-08 22:11:29','2019-12-08 22:11:29'),
	(52,'تامر الورديان','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:12:01','2019-12-08 22:12:01'),
	(53,'محمد هاشم',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:14:42','2019-12-08 22:14:42'),
	(54,'حسن فوزي ياسين','الاقصر','01009605725',NULL,NULL,NULL,0,1,'2019-12-08 22:16:18','2019-12-08 22:16:18'),
	(55,'ضياء الاقصر','الاقصر','01010982615',NULL,NULL,NULL,0,1,'2019-12-08 22:17:17','2019-12-08 22:17:17'),
	(56,'عبد الحكيم ابو المجد الشعار','قنا',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:18:30','2019-12-08 22:18:30'),
	(57,'عبد السلام اسوان','اسوان','01004634000',NULL,NULL,NULL,0,1,'2019-12-08 22:19:51','2019-12-08 22:19:51'),
	(58,'منصور توفيق',NULL,'01007887467',NULL,NULL,NULL,0,1,'2019-12-08 22:22:03','2019-12-08 22:22:03'),
	(59,'مدام مروة','المنصورة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:22:24','2019-12-08 22:22:24'),
	(60,'خالد زهران','منيا القمح شرقية','01014860077',NULL,NULL,NULL,0,1,'2019-12-08 22:27:27','2019-12-08 22:27:27'),
	(61,'الحاج محمود ابو رحيل',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:27:52','2019-12-08 22:27:52'),
	(62,'ثروت ايطاليا',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:28:20','2019-12-08 22:28:20'),
	(63,'محمد عناني',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:31:21','2019-12-08 22:31:21'),
	(64,'اشرف خرشوفة','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:31:49','2019-12-08 22:31:49'),
	(65,'رضا عبد الرسول',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:32:10','2019-12-08 22:32:10'),
	(66,'احمد كريم','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:32:39','2019-12-08 22:32:39'),
	(67,'عمرو عبد الجليل',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:33:03','2019-12-08 22:33:03'),
	(68,'محمد ابراهيم','زفتي',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:41:26','2019-12-08 22:41:26'),
	(69,'ياسر القومية','ابيس -  الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:41:53','2019-12-08 22:41:53'),
	(70,'عمر امام','القاهرة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:42:16','2019-12-08 22:42:16'),
	(71,'الحاج محمد شرشوح',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:42:42','2019-12-08 22:42:42'),
	(72,'احمد تمساح',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:44:21','2019-12-08 22:44:21'),
	(73,'الحاج خالد حنفي السويس','السويس',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:45:01','2019-12-08 22:45:01'),
	(74,'صلاح الشريف',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:45:23','2019-12-08 22:45:23'),
	(75,'محمد طلعت','القاهرة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:45:48','2019-12-08 22:45:48'),
	(76,'علاء عمران','ابو المطامير',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:46:24','2019-12-08 22:46:24'),
	(77,'عبد الله سعيد شطارة',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:47:09','2019-12-08 22:47:09'),
	(78,'الحاج محمد العراقي',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:49:21','2019-12-08 22:49:21'),
	(79,'ماهر الجهيني','القاهرة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:49:56','2019-12-08 22:49:56'),
	(80,'معرض مؤمن الملكه','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:50:58','2019-12-08 22:50:58'),
	(81,'الحاج عبد الرحمن جملة','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:51:30','2019-12-08 22:51:30'),
	(82,'ايمن ابو سمرة','بورسعيد',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:52:06','2019-12-08 22:52:06'),
	(83,'رزق مقلد','المحمودية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:52:43','2019-12-08 22:52:43'),
	(84,'فريد سعيد ابراهيم','الوادي الجديد',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:53:33','2019-12-08 22:53:33'),
	(85,'عبد المنعم ربيع','المنصورة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:53:54','2019-12-08 22:53:54'),
	(86,'عبد العزيز العمروسي','تلا',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:54:29','2019-12-08 22:54:29'),
	(87,'الحاج رضا غطاس','الشهداء',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:55:09','2019-12-08 22:55:09'),
	(88,'الشيخ محمود البمبي','رشيد',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:55:45','2019-12-08 22:55:45'),
	(89,'احمد الطير','المنزله',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:56:28','2019-12-08 22:56:28'),
	(90,'يوسف كتانة','باكوس الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:57:05','2019-12-08 22:57:05'),
	(91,'اسلام الشافعي',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:57:39','2019-12-08 23:02:49'),
	(92,'ايمن الشبيني','المنزله',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:58:11','2019-12-08 22:58:11'),
	(93,'رجب شارع عمر',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:58:34','2019-12-08 22:58:34'),
	(94,'معرض الرواني','كفر الدوار',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:59:02','2019-12-08 22:59:02'),
	(95,'ايمن ابو رودي','القومية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 22:59:35','2019-12-08 22:59:35'),
	(96,'الحاج محمد الشاذلي',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:00:14','2019-12-08 23:00:14'),
	(97,'كريم الدين','صفط اللبن الجيزة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:01:07','2019-12-08 23:01:07'),
	(98,'حسن الدسوقي','الحوامدية الجيزة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:01:48','2019-12-08 23:01:48'),
	(99,'اسلام يسري','الغردقة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:02:24','2019-12-08 23:02:24'),
	(100,'محمد يسري','فيصل',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:03:33','2019-12-08 23:03:33'),
	(101,'محمد سلامة','الورديان',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:04:01','2019-12-08 23:04:01'),
	(102,'الحاج علي الياباني',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:04:23','2019-12-08 23:04:23'),
	(103,'سليمان احمد','مطروح',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:04:54','2019-12-08 23:04:54'),
	(104,'ايمن الحتاتي',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:09:00','2019-12-08 23:09:00'),
	(105,'حماده السيد يونس',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:09:22','2019-12-08 23:09:22'),
	(106,'ابو بلال العصافرة','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:09:48','2019-12-08 23:09:48'),
	(107,'مينا ميلاد',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:10:05','2019-12-08 23:10:05'),
	(108,'حمادة منصور','الورديان',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:10:40','2019-12-08 23:10:40'),
	(109,'الحاج سعيد بدران قطور',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:11:20','2019-12-08 23:11:20'),
	(110,'محمد طاهره','الزوايدة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:11:54','2019-12-08 23:11:54'),
	(111,'عادل عبد المنعم','بسيون',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:12:23','2019-12-08 23:12:23'),
	(112,'ناجي تمام','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:12:47','2019-12-08 23:12:47'),
	(113,'كامل عيد','مطوبس',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:13:13','2019-12-08 23:13:13'),
	(114,'طارق الشناوي',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:13:33','2019-12-08 23:13:33'),
	(115,'راندا الاسماعلية','الاسماعلية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:14:23','2019-12-08 23:14:53'),
	(116,'المعلم اشرف شعبان',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:15:25','2019-12-08 23:15:25'),
	(117,'محمد حامد','كفر الشيخ',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:16:02','2019-12-08 23:16:02'),
	(118,'جمال مصطفي','شبرا خيت',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:16:31','2019-12-08 23:16:31'),
	(119,'علاء جلال جملة','اسوان',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:17:11','2019-12-08 23:17:11'),
	(120,'خالد محمد سعد',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:17:27','2019-12-08 23:17:27'),
	(121,'هاني الحلواني',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:17:44','2019-12-08 23:17:44'),
	(122,'محمد الجيار',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:18:50','2019-12-08 23:18:50'),
	(123,'نصر رخا',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:19:01','2019-12-08 23:19:01'),
	(124,'محمد رخا',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:19:15','2019-12-08 23:19:15'),
	(125,'محمد عبد الستار  - كفر الدوار','كفر الدوار',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:19:48','2019-12-08 23:19:48'),
	(126,'مصطفي معوض','المنصورة',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:20:17','2019-12-08 23:20:17'),
	(127,'الحاج شريف العزومي','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:20:46','2019-12-08 23:20:46'),
	(128,'الحاج علي العامرية','الاسكندرية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:21:08','2019-12-08 23:21:08'),
	(129,'ابراهيم عمران',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:21:30','2019-12-08 23:21:30'),
	(130,'اسماعيل طنطا',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:21:47','2019-12-08 23:21:47'),
	(131,'احمد نظيف',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:22:06','2019-12-08 23:22:06'),
	(132,'سعيد زين الدين','تلا',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:22:30','2019-12-08 23:22:30'),
	(133,'احمد سليمان','الشرقية',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:23:01','2019-12-08 23:23:01'),
	(134,'عمرو صقر','قلين',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:23:23','2019-12-08 23:23:23'),
	(135,'محمد عادل طنطا','طنطا',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:23:46','2019-12-08 23:23:46'),
	(136,'كريم السيد فايذ',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:24:34','2019-12-08 23:24:34'),
	(137,'سعيد شاهين',NULL,NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:24:51','2019-12-08 23:24:51'),
	(138,'بسيوني زهران','طنطا',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:26:03','2019-12-08 23:26:03'),
	(139,'يحيي صبري','اسوان',NULL,NULL,NULL,NULL,0,1,'2019-12-08 23:43:25','2019-12-08 23:43:25');

/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin@carpetmall.com',NULL,'$2y$10$HbiwXoyUW5F9WBZpPxPrveAeAmgE.telvvqwLCQo78kTPaF1Ugsf2','4cNHniXuTha3FSk9AFx8Er9CuNDBN9Qf5oLxbD0QoHsMBY576dvgHtY9wWkh','2019-09-22 12:50:01','2019-09-22 12:50:01'),
	(2,'Administrator','admin@admin.com',NULL,'$2y$10$1Py.LZhGTZNYhcqjf4Z2/eouRLN21OWA/HXaLojonFUJLT0NJkwPa','6KGijy3VMMzR55MQY4f04DjRwLcqqUByeblPX9JrOoDTNYlhQr2jtxRd8SKJ','2020-03-07 12:40:28','2020-03-07 12:40:28');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table warehouses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `warehouses`;

CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
