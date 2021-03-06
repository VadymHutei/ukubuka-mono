-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               5.7.33 - MySQL Community Server (GPL)
-- ОС сервера:                   Linux
-- HeidiSQL Версія:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ukubuka
CREATE DATABASE IF NOT EXISTS `ukubuka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ukubuka`;

-- Dumping structure for таблиця ukubuka.catalog
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.catalog_category
CREATE TABLE IF NOT EXISTS `catalog_category` (
  `catalog_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `filter` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'filter params in JSON',
  PRIMARY KEY (`catalog_id`,`category_id`),
  KEY `FK_catalog_category_category` (`category_id`),
  CONSTRAINT `FK_catalog_category_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalog_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.catalog_product
CREATE TABLE IF NOT EXISTS `catalog_product` (
  `catalog_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_id`,`product_id`),
  KEY `FK__product` (`product_id`),
  CONSTRAINT `FK__catalog` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.catalog_text
CREATE TABLE IF NOT EXISTS `catalog_text` (
  `catalog_id` int(10) unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`catalog_id`,`language`) USING BTREE,
  KEY `FK_catalog_text_languages` (`language`) USING BTREE,
  CONSTRAINT `FK_catalog_text_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalog_text_languages` FOREIGN KEY (`language`) REFERENCES `language` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`) USING BTREE,
  KEY `FK_category_category` (`parent_id`) USING BTREE,
  CONSTRAINT `FK_category_category` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.category_text
CREATE TABLE IF NOT EXISTS `category_text` (
  `category_id` int(10) unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`language`) USING BTREE,
  KEY `FK_category_text_languages` (`language`) USING BTREE,
  CONSTRAINT `FK_category_text_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_category_text_languages` FOREIGN KEY (`language`) REFERENCES `language` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.characteristic_numeric
CREATE TABLE IF NOT EXISTS `characteristic_numeric` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.characteristic_numeric_text
CREATE TABLE IF NOT EXISTS `characteristic_numeric_text` (
  `characteristic_id` int(10) unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`characteristic_id`,`language`) USING BTREE,
  KEY `FK_characteristic_numeric_text_language` (`language`),
  CONSTRAINT `FK_characteristic_numeric_text_characteristic_numeric` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristic_numeric` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_characteristic_numeric_text_language` FOREIGN KEY (`language`) REFERENCES `language` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.characteristic_text
CREATE TABLE IF NOT EXISTS `characteristic_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.characteristic_text_text
CREATE TABLE IF NOT EXISTS `characteristic_text_text` (
  `characteristic_id` int(10) unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`characteristic_id`,`language`),
  KEY `FK_characteristic_text_text_language` (`language`),
  CONSTRAINT `FK_characteristic_text_text_characteristic_text` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristic_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_characteristic_text_text_language` FOREIGN KEY (`language`) REFERENCES `language` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.language
CREATE TABLE IF NOT EXISTS `language` (
  `code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(10) unsigned NOT NULL,
  `is_default` int(10) unsigned NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `price` int(10) unsigned NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL,
  `is_complex` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `FK_product_category` (`category_id`),
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.product_characteristic_numeric
CREATE TABLE IF NOT EXISTS `product_characteristic_numeric` (
  `product_id` int(10) unsigned NOT NULL,
  `characteristic_id` int(10) unsigned NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`characteristic_id`),
  KEY `FK_product_characteristic_numeric_characteristic_numeric` (`characteristic_id`),
  CONSTRAINT `FK_product_characteristic_numeric_characteristic_numeric` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristic_numeric` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_product_characteristic_numeric_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.product_characteristic_text
CREATE TABLE IF NOT EXISTS `product_characteristic_text` (
  `product_id` int(10) unsigned NOT NULL,
  `characteristic_id` int(10) unsigned NOT NULL,
  `value` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`product_id`,`characteristic_id`),
  KEY `FK_product_characteristic_text_characteristic_text` (`characteristic_id`),
  CONSTRAINT `FK_product_characteristic_text_characteristic_text` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristic_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_product_characteristic_text_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.sku
CREATE TABLE IF NOT EXISTS `sku` (
  `sku` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `alias` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`sku`) USING BTREE,
  UNIQUE KEY `alias` (`alias`),
  KEY `FK_sku_product` (`product_id`),
  CONSTRAINT `FK_sku_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `sku` int(10) unsigned NOT NULL,
  `number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sku`),
  CONSTRAINT `FK_stock_sku` FOREIGN KEY (`sku`) REFERENCES `sku` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

-- Dumping structure for таблиця ukubuka.translate
CREATE TABLE IF NOT EXISTS `translate` (
  `text` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translate` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`language`,`text`) USING BTREE,
  CONSTRAINT `FK_translates_language` FOREIGN KEY (`language`) REFERENCES `language` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дані для експорту не вибрані

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
