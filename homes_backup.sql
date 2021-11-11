-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: localhost    Database: homes
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_d930d1dc_fk_users_id` (`user_id`),
  CONSTRAINT `addresses_user_id_d930d1dc_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'2021-11-10 09:50:31.008235','2021-11-10 09:50:31.012055','경기도 성남시 분당구',1);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_color_id_310b8eda_fk_colors_id` (`color_id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
  CONSTRAINT `carts_color_id_310b8eda_fk_colors_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `carts_product_id_02913eac_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_menu_id_33730ae9_fk_menus_id` (`menu_id`),
  CONSTRAINT `categories_menu_id_33730ae9_fk_menus_id` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2021-11-10 08:46:52.522518','2021-11-10 08:46:52.522571','침대',1),(2,'2021-11-10 08:46:52.525193','2021-11-10 08:46:52.525241','소파',1),(3,'2021-11-10 08:46:52.526932','2021-11-10 08:46:52.526980','테이블',1),(4,'2021-11-10 08:46:52.528408','2021-11-10 08:46:52.528451','화장대/거울',1),(5,'2021-11-10 08:46:52.530037','2021-11-10 08:46:52.530087','드레스룸',1),(6,'2021-11-10 08:46:52.531640','2021-11-10 08:46:52.531691','거실장/서랍장/선반',1),(7,'2021-11-10 08:46:52.533740','2021-11-10 08:46:52.533836','식탁/주방수납',1),(8,'2021-11-10 08:46:52.535614','2021-11-10 08:46:52.535666','책상/책장',1),(9,'2021-11-10 08:46:52.537523','2021-11-10 08:46:52.537573','의자',1),(10,'2021-11-10 08:46:52.539398','2021-11-10 08:46:52.539456','유아/아동가구',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'2021-11-10 08:46:52.663783','2021-11-10 08:46:52.663830','베이지'),(2,'2021-11-10 08:46:52.666003','2021-11-10 08:46:52.666080','그레이'),(3,'2021-11-10 08:46:52.667861','2021-11-10 08:46:52.667921','월넛'),(4,'2021-11-10 08:46:52.669779','2021-11-10 08:46:52.669839','화이트'),(5,'2021-11-10 08:46:52.671582','2021-11-10 08:46:52.671634','메이플'),(6,'2021-11-10 08:46:52.673195','2021-11-10 08:46:52.673240','블랙'),(7,'2021-11-10 08:46:52.674546','2021-11-10 08:46:52.674594','크림'),(8,'2021-11-10 08:46:52.676562','2021-11-10 08:46:52.676700','오크');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `delivery_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_fee` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'2021-11-10 08:46:52.550890','2021-11-10 08:46:52.550944','직접배송','착불',40000.000),(2,'2021-11-10 08:46:52.553300','2021-11-10 08:46:52.553369','직접배송','착불',35000.000),(3,'2021-11-10 08:46:52.555002','2021-11-10 08:46:52.555048','직접배송','착불',25000.000),(4,'2021-11-10 08:46:52.556511','2021-11-10 08:46:52.556553','직접배송','선불',0.000);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (20,'carts','cart'),(1,'contenttypes','contenttype'),(16,'orders','order'),(17,'orders','orderitem'),(18,'orders','orderstatus'),(19,'orders','shipment'),(5,'products','category'),(6,'products','color'),(7,'products','delivery'),(8,'products','menu'),(9,'products','product'),(15,'products','productcolor'),(10,'products','productgroup'),(14,'products','productimage'),(11,'products','review'),(13,'products','reviewimage'),(12,'products','subcategory'),(2,'sessions','session'),(4,'users','address'),(3,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'users','0001_initial','2021-11-10 08:44:05.972439'),(2,'products','0001_initial','2021-11-10 08:44:06.664754'),(3,'carts','0001_initial','2021-11-10 08:44:06.832159'),(4,'contenttypes','0001_initial','2021-11-10 08:44:06.868774'),(5,'contenttypes','0002_remove_content_type_name','2021-11-10 08:44:06.930921'),(6,'orders','0001_initial','2021-11-10 08:44:07.324721'),(7,'sessions','0001_initial','2021-11-10 08:44:07.355318');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'2021-11-10 08:46:52.504522','2021-11-10 08:46:52.504611','가구','https://i.ibb.co/wwSPJj7/furniture.png'),(2,'2021-11-10 08:46:52.508853','2021-11-10 08:46:52.508924','패브릭','https://i.ibb.co/tBts5MX/fabric.png'),(3,'2021-11-10 08:46:52.510657','2021-11-10 08:46:52.510698','조명','https://i.ibb.co/jMCqJ1p/light.png'),(4,'2021-11-10 08:46:52.512881','2021-11-10 08:46:52.512936','주방','https://i.ibb.co/prk7WGJ/kitchen.png'),(5,'2021-11-10 08:46:52.514338','2021-11-10 08:46:52.514384','수납/정리','https://i.ibb.co/fFsGHMb/drawer.png'),(6,'2021-11-10 08:46:52.515780','2021-11-10 08:46:52.515825','가전','https://i.ibb.co/b6qTPD9/appliance.png'),(7,'2021-11-10 08:46:52.517356','2021-11-10 08:46:52.517404','인테리어소품','https://i.ibb.co/HHvV0t5/interior-item.png'),(8,'2021-11-10 08:46:52.518750','2021-11-10 08:46:52.518794','생활용품','https://i.ibb.co/4KYN5XQ/household-item.png'),(9,'2021-11-10 08:46:52.520259','2021-11-10 08:46:52.520313','셀프인테리어','https://i.ibb.co/8Dc7B67/self-interior.png');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `color_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_color_id_66aacd45_fk_colors_id` (`color_id`),
  KEY `order_items_order_id_412ad78b_fk_orders_id` (`order_id`),
  KEY `order_items_product_id_dd557d5a_fk_products_id` (`product_id`),
  CONSTRAINT `order_items_color_id_66aacd45_fk_colors_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `order_items_order_id_412ad78b_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_dd557d5a_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (2,'2021-11-10 11:45:51.037428','2021-11-10 11:45:51.040859',3,'',2,2,1),(9,'2021-11-11 08:08:18.491303','2021-11-11 08:08:18.491380',3,'',2,7,1),(10,'2021-11-11 08:08:18.491480','2021-11-11 08:08:18.491518',5,'',1,7,4);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'2021-11-10 09:55:43.656127','2021-11-10 09:55:43.656201','입금 대기 중');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_status_id_e763064e_fk_order_statuses_id` (`status_id`),
  KEY `orders_user_id_7e2523fb_fk_users_id` (`user_id`),
  KEY `orders_address_id_38f528bc_fk_addresses_id` (`address_id`),
  CONSTRAINT `orders_address_id_38f528bc_fk_addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orders_status_id_e763064e_fk_order_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `order_statuses` (`id`),
  CONSTRAINT `orders_user_id_7e2523fb_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-11-10 09:56:45.240024','2021-11-10 09:56:45.242794',1,1,1),(2,'2021-11-10 11:45:51.020036','2021-11-10 11:45:51.029273',1,1,1),(7,'2021-11-11 08:08:18.487867','2021-11-11 08:08:18.488004',1,1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_groups`
--

DROP TABLE IF EXISTS `product_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `displayed_price` decimal(10,3) NOT NULL,
  `discount_rate` decimal(5,3) NOT NULL,
  `delivery_id` bigint NOT NULL,
  `sub_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_groups_sub_category_id_0838cca7_fk_sub_categories_id` (`sub_category_id`),
  KEY `product_groups_delivery_id_2738e94d_fk_deliveries_id` (`delivery_id`),
  CONSTRAINT `product_groups_delivery_id_2738e94d_fk_deliveries_id` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`),
  CONSTRAINT `product_groups_sub_category_id_0838cca7_fk_sub_categories_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_groups`
--

LOCK TABLES `product_groups` WRITE;
/*!40000 ALTER TABLE `product_groups` DISABLE KEYS */;
INSERT INTO `product_groups` VALUES (1,'2021-11-10 08:46:52.558821','2021-11-10 08:46:52.558867','캐더린 통수납 침대','리샘가구',599000.000,68.000,1,1),(2,'2021-11-10 08:46:52.560809','2021-11-10 08:46:52.560853','다락 빅 수납침대','포덕홈',650000.000,63.000,1,1),(3,'2021-11-10 08:46:52.562373','2021-11-10 08:46:52.562415','헤르만 무헤드 통수납 침대','리샘가구',309000.000,69.000,1,1),(4,'2021-11-10 08:46:52.564176','2021-11-10 08:46:52.564227','단잠슬림가드 저상형 패밀리 침대','모던바로크',798000.000,79.000,1,1),(5,'2021-11-10 08:46:52.565926','2021-11-10 08:46:52.565970','산타페 하이브리드 침대','지누스',189000.000,20.000,1,1),(6,'2021-11-10 08:46:52.567706','2021-11-10 08:46:52.567761','레아 사계절 고무나무 원목침대','퍼니코',399000.000,53.000,1,1),(7,'2021-11-10 08:46:52.570250','2021-11-10 08:46:52.570330','몬드리안 침대 프레임 호텔식 침대','한국갤러리',1120000.000,50.000,1,1),(8,'2021-11-10 08:46:52.572336','2021-11-10 08:46:52.572393','조이 빅서랍 3단 수납 침대','삼익가구',219000.000,59.000,2,1),(9,'2021-11-10 08:46:52.574075','2021-11-10 08:46:52.574114','호텔컬렉션 프리미엄 레온 어메이징 빅수납 침대','삼익가구',549000.000,55.000,2,1),(10,'2021-11-10 08:46:52.575990','2021-11-10 08:46:52.576039','밀리스탠다드 침대','딜라이트',159000.000,67.000,2,1),(11,'2021-11-10 08:46:52.577650','2021-11-10 08:46:52.577696','스마트베이스 엘리트 침대','지누스',125000.000,26.000,2,1),(12,'2021-11-10 08:46:52.579211','2021-11-10 08:46:52.579250','위더스 디자인 원목 침대','삼익가구',499000.000,60.000,2,1),(13,'2021-11-10 08:46:52.580972','2021-11-10 08:46:52.581024','엘레나 고무나무 원목 서랍형 침대','썸앤데코',1100000.000,35.000,3,1),(14,'2021-11-10 08:46:52.582800','2021-11-10 08:46:52.582849','NEW! 슬림 높이조절 침대','도담',1049000.000,74.000,3,1),(15,'2021-11-10 08:46:52.584590','2021-11-10 08:46:52.584634','모노 수납 침대','레이디가구',329000.000,40.000,3,1),(16,'2021-11-10 08:46:52.586186','2021-11-10 08:46:52.586227','스칸딕 로맨틱 핀란드 원목 침대','레이디가구',599000.000,57.000,3,1),(17,'2021-11-10 08:46:52.587691','2021-11-10 08:46:52.587741','위슨 호텔형 가죽 침대','레이디가구',539000.000,45.000,3,1),(18,'2021-11-10 08:46:52.589530','2021-11-10 08:46:52.589584','네추럴감성 곡선헤드! New 잉그리드 원목침대','웨스트프롬',488000.000,50.000,1,1),(19,'2021-11-10 08:46:52.591406','2021-11-10 08:46:52.591461','리노바 평상형 침대','딜라이트',199000.000,59.000,1,1),(20,'2021-11-10 08:46:52.593405','2021-11-10 08:46:52.593465','하이필로우탑 침대세트','도르미릴렉스',1749000.000,56.000,1,1);
/*!40000 ALTER TABLE `product_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_url` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `product_group_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_group_id_352935dc_fk_product_groups_id` (`product_group_id`),
  CONSTRAINT `product_images_product_group_id_352935dc_fk_product_groups_id` FOREIGN KEY (`product_group_id`) REFERENCES `product_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'2021-11-10 08:46:52.679181','2021-11-10 08:46:52.679231','https://images.unsplash.com/photo-1616627561839-074385245ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',10),(2,'2021-11-10 08:46:52.681301','2021-11-10 08:46:52.681368','https://i.ibb.co/GsbTkj7/bedbed.jpg',1),(3,'2021-11-10 08:46:52.683662','2021-11-10 08:46:52.683766','https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',2),(4,'2021-11-10 08:46:52.686716','2021-11-10 08:46:52.686775','https://cdn.pixabay.com/photo/2018/04/10/06/29/apartment-3306501__340.jpg',3),(5,'2021-11-10 08:46:52.688550','2021-11-10 08:46:52.688601','https://cdn.pixabay.com/photo/2018/01/23/06/58/modern-minimalist-bedroom-3100786__340.jpg',4),(6,'2021-11-10 08:46:52.690278','2021-11-10 08:46:52.690326','https://cdn.pixabay.com/photo/2018/07/14/20/04/interior-3538315__340.jpg',5),(7,'2021-11-10 08:46:52.691813','2021-11-10 08:46:52.691854','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221_960_720.jpg',6),(8,'2021-11-10 08:46:52.693688','2021-11-10 08:46:52.693742','https://cdn.pixabay.com/photo/2015/08/16/04/04/bed-890567__340.jpg',7),(9,'2021-11-10 08:46:52.695597','2021-11-10 08:46:52.695645','https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80',8),(10,'2021-11-10 08:46:52.697449','2021-11-10 08:46:52.697495','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664223__340.jpg',9),(11,'2021-11-10 08:46:52.699050','2021-11-10 08:46:52.699091','https://images.unsplash.com/photo-1560184897-502a475f7a0d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',1),(12,'2021-11-10 08:46:52.700880','2021-11-10 08:46:52.700924','https://cdn.pixabay.com/photo/2019/01/31/19/24/bed-3967757__340.png',11),(13,'2021-11-10 08:46:52.702501','2021-11-10 08:46:52.702548','https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',12),(14,'2021-11-10 08:46:52.703962','2021-11-10 08:46:52.704008','https://cdn.pixabay.com/photo/2015/02/02/23/40/bed-621742__340.jpg',13),(15,'2021-11-10 08:46:52.705706','2021-11-10 08:46:52.705789','https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',14),(16,'2021-11-10 08:46:52.708357','2021-11-10 08:46:52.708435','https://cdn.pixabay.com/photo/2016/10/13/09/08/travel-1737172__340.jpg',15),(17,'2021-11-10 08:46:52.709952','2021-11-10 08:46:52.710001','https://cdn.pixabay.com/photo/2017/04/28/22/16/room-2269594__340.jpg',16),(18,'2021-11-10 08:46:52.711722','2021-11-10 08:46:52.711770','https://cdn.pixabay.com/photo/2020/06/27/16/40/apartment-5346461__340.jpg',17),(19,'2021-11-10 08:46:52.713391','2021-11-10 08:46:52.713450','https://cdn.pixabay.com/photo/2018/02/12/10/07/modern-minimalist-bedroom-3147893__340.jpg',18),(20,'2021-11-10 08:46:52.715030','2021-11-10 08:46:52.715075','https://cdn.pixabay.com/photo/2017/06/17/10/58/furniture-2411853__340.jpg',19),(21,'2021-11-10 08:46:52.716625','2021-11-10 08:46:52.716666','https://cdn.pixabay.com/photo/2018/09/20/02/47/bedroom-3689929__340.jpg',20),(22,'2021-11-10 08:46:52.718282','2021-11-10 08:46:52.718329','https://cdn.pixabay.com/photo/2018/04/10/06/29/apartment-3306501__340.jpg',3),(23,'2021-11-10 08:46:52.719883','2021-11-10 08:46:52.719918','https://cdn.pixabay.com/photo/2018/01/23/06/58/modern-minimalist-bedroom-3100786__340.jpg',4),(24,'2021-11-10 08:46:52.721479','2021-11-10 08:46:52.721516','https://cdn.pixabay.com/photo/2018/07/14/20/04/interior-3538315__340.jpg',5),(25,'2021-11-10 08:46:52.722989','2021-11-10 08:46:52.723044','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221_960_720.jpg',6),(26,'2021-11-10 08:46:52.724597','2021-11-10 08:46:52.724645','https://cdn.pixabay.com/photo/2015/08/16/04/04/bed-890567__340.jpg',7),(27,'2021-11-10 08:46:52.726093','2021-11-10 08:46:52.726138','https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80',8),(28,'2021-11-10 08:46:52.727734','2021-11-10 08:46:52.727786','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664223__340.jpg',9),(29,'2021-11-10 08:46:52.729907','2021-11-10 08:46:52.730021','https://images.unsplash.com/photo-1616627561839-074385245ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',10),(30,'2021-11-10 08:46:52.732096','2021-11-10 08:46:52.732143','https://cdn.pixabay.com/photo/2019/01/31/19/24/bed-3967757__340.png',11),(31,'2021-11-10 08:46:52.733877','2021-11-10 08:46:52.733939','https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',12),(32,'2021-11-10 08:46:52.736409','2021-11-10 08:46:52.736483','https://cdn.pixabay.com/photo/2015/02/02/23/40/bed-621742__340.jpg',13),(33,'2021-11-10 08:46:52.738151','2021-11-10 08:46:52.738195','https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',14),(34,'2021-11-10 08:46:52.739777','2021-11-10 08:46:52.739826','https://cdn.pixabay.com/photo/2016/10/13/09/08/travel-1737172__340.jpg',15),(35,'2021-11-10 08:46:52.741684','2021-11-10 08:46:52.741741','https://cdn.pixabay.com/photo/2017/04/28/22/16/room-2269594__340.jpg',16),(36,'2021-11-10 08:46:52.743656','2021-11-10 08:46:52.743730','https://cdn.pixabay.com/photo/2020/06/27/16/40/apartment-5346461__340.jpg',17),(37,'2021-11-10 08:46:52.745676','2021-11-10 08:46:52.745736','https://cdn.pixabay.com/photo/2018/02/12/10/07/modern-minimalist-bedroom-3147893__340.jpg',18),(38,'2021-11-10 08:46:52.748039','2021-11-10 08:46:52.748093','https://cdn.pixabay.com/photo/2017/06/17/10/58/furniture-2411853__340.jpg',19),(39,'2021-11-10 08:46:52.749886','2021-11-10 08:46:52.749943','https://cdn.pixabay.com/photo/2018/09/20/02/47/bedroom-3689929__340.jpg',20),(40,'2021-11-10 08:46:52.751620','2021-11-10 08:46:52.751668','https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',2);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `product_group_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_group_id_aa3a07a9_fk_product_groups_id` (`product_group_id`),
  CONSTRAINT `products_product_group_id_aa3a07a9_fk_product_groups_id` FOREIGN KEY (`product_group_id`) REFERENCES `product_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2021-11-10 08:46:52.596002','2021-11-10 08:46:52.596056','캐더린 통수납 침대 SS',189000.000,1),(2,'2021-11-10 08:46:52.598317','2021-11-10 08:46:52.598376','캐더린 통수납 침대 Q',209000.000,1),(3,'2021-11-10 08:46:52.600210','2021-11-10 08:46:52.600252','다락 빅 수납침대 SS',239000.000,2),(4,'2021-11-10 08:46:52.601703','2021-11-10 08:46:52.601741','다락 빅 수납침대 Q',319000.000,2),(5,'2021-11-10 08:46:52.603461','2021-11-10 08:46:52.603508','헤르만 무헤드 통수납 침대 SS',95900.000,3),(6,'2021-11-10 08:46:52.605195','2021-11-10 08:46:52.605251','헤르만 무헤드 통수납 침대 Q',109900.000,3),(7,'2021-11-10 08:46:52.606963','2021-11-10 08:46:52.607022','단잠슬림가드 저상형 패밀리 침대 SS',169000.000,4),(8,'2021-11-10 08:46:52.609109','2021-11-10 08:46:52.609172','단잠슬림가드 저상형 패밀리 침대 K',219000.000,4),(9,'2021-11-10 08:46:52.611132','2021-11-10 08:46:52.611194','산타페 하이브리드 침대 SS',152100.000,5),(10,'2021-11-10 08:46:52.613318','2021-11-10 08:46:52.613449','산타페 하이브리드 침대 Q',179100.000,5),(11,'2021-11-10 08:46:52.615348','2021-11-10 08:46:52.615400','레아 사계절 고목나무 원목침대 SS',189000.000,6),(12,'2021-11-10 08:46:52.617070','2021-11-10 08:46:52.617116','레아 사계절 고목나무 원목침대 Q',219000.000,6),(13,'2021-11-10 08:46:52.618732','2021-11-10 08:46:52.618778','몬드리안 침대 프레임 호텔식 침대 SS',560000.000,7),(14,'2021-11-10 08:46:52.620296','2021-11-10 08:46:52.620345','몬드리안 침대 프레임 호텔식 침대 Q',6600000.000,7),(15,'2021-11-10 08:46:52.621982','2021-11-10 08:46:52.622031','조이 빅서랍 3단 수납침대 SS',89000.000,8),(16,'2021-11-10 08:46:52.623642','2021-11-10 08:46:52.623689','조이 빅서랍 3단 수납침대 Q',109000.000,8),(17,'2021-11-10 08:46:52.625192','2021-11-10 08:46:52.625237','호텔컬렉션 프리미엄 레온 어메이징 빅수납 침대 SS',244900.000,9),(18,'2021-11-10 08:46:52.627088','2021-11-10 08:46:52.627141','호텔컬렉션 프리미엄 레온 어메이징 빅수납 침대 Q',304900.000,9),(19,'2021-11-10 08:46:52.628893','2021-11-10 08:46:52.628948','밀리스탠다드 침대 SS',51900.000,10),(20,'2021-11-10 08:46:52.630669','2021-11-10 08:46:52.630719','밀리스탠다드 침대 Q',73900.000,10),(21,'2021-11-10 08:46:52.632355','2021-11-10 08:46:52.632395','스마트베이스 엘리트 침대 S',92650.000,11),(22,'2021-11-10 08:46:52.633784','2021-11-10 08:46:52.633824','스마트베이스 엘리트 침대 Q',128140.000,11),(23,'2021-11-10 08:46:52.635420','2021-11-10 08:46:52.635470','위더스 디자인 원목 침대 SS',199000.000,12),(24,'2021-11-10 08:46:52.636948','2021-11-10 08:46:52.636988','위더스 디자인 원목 침대 Q',299000.000,12),(25,'2021-11-10 08:46:52.638335','2021-11-10 08:46:52.638374','엘레나 고목나무 원목 서랍형 침대 SS',710000.000,13),(26,'2021-11-10 08:46:52.639633','2021-11-10 08:46:52.639673','엘레나 고목나무 원목 서랍형 침대 Q',770000.000,13),(27,'2021-11-10 08:46:52.641022','2021-11-10 08:46:52.641061','NEW! 슬림 높이조절 침대 SS',269000.000,14),(28,'2021-11-10 08:46:52.642394','2021-11-10 08:46:52.642433','NEW! 슬림 높이조절 침대 Q',329000.000,14),(29,'2021-11-10 08:46:52.643770','2021-11-10 08:46:52.643820','모노 수납 침대 SS',199000.000,15),(30,'2021-11-10 08:46:52.645296','2021-11-10 08:46:52.645336','모노 수납 침대 Q',259000.000,15),(31,'2021-11-10 08:46:52.646833','2021-11-10 08:46:52.646881','스칸딕 로맨틱 핀란드 원목 침대 SS',219000.000,16),(32,'2021-11-10 08:46:52.648584','2021-11-10 08:46:52.648627','스칸딕 로맨틱 핀란드 원목 침대 Q',259000.000,16),(33,'2021-11-10 08:46:52.650168','2021-11-10 08:46:52.650227','위슨 호텔형 가죽 침대 SS',279000.000,17),(34,'2021-11-10 08:46:52.651807','2021-11-10 08:46:52.651855','위슨 호텔형 가죽 침대 Q',299000.000,17),(35,'2021-11-10 08:46:52.653423','2021-11-10 08:46:52.653462','네추럴감성 곡선헤드! New 잉그리드 원목침대 SS',244900.000,18),(36,'2021-11-10 08:46:52.655007','2021-11-10 08:46:52.655051','네추럴감성 곡선헤드! New 잉그리드 원목침대 Q',304900.000,18),(37,'2021-11-10 08:46:52.656506','2021-11-10 08:46:52.656546','리노바 평상형 침대 SS',82000.000,19),(38,'2021-11-10 08:46:52.658152','2021-11-10 08:46:52.658208','리노바 평상형 침대 Q',99000.000,19),(39,'2021-11-10 08:46:52.659708','2021-11-10 08:46:52.659751','하이필로우탑 침대세트 SS',699000.000,20),(40,'2021-11-10 08:46:52.661462','2021-11-10 08:46:52.661504','하이필로우탑 침대세트Q',799000.000,20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_colors`
--

DROP TABLE IF EXISTS `products_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_colors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_colors_color_id_6f4711fc_fk_colors_id` (`color_id`),
  KEY `products_colors_product_id_6c9653b3_fk_products_id` (`product_id`),
  CONSTRAINT `products_colors_color_id_6f4711fc_fk_colors_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `products_colors_product_id_6c9653b3_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_colors`
--

LOCK TABLES `products_colors` WRITE;
/*!40000 ALTER TABLE `products_colors` DISABLE KEYS */;
INSERT INTO `products_colors` VALUES (1,'2021-11-10 08:46:52.866046','2021-11-10 08:46:52.866111',1,1),(2,'2021-11-10 08:46:52.868746','2021-11-10 08:46:52.868808',2,1),(3,'2021-11-10 08:46:52.870489','2021-11-10 08:46:52.870536',1,2),(4,'2021-11-10 08:46:52.872045','2021-11-10 08:46:52.872082',2,2),(5,'2021-11-10 08:46:52.873495','2021-11-10 08:46:52.873536',3,3),(6,'2021-11-10 08:46:52.875035','2021-11-10 08:46:52.875078',4,3),(7,'2021-11-10 08:46:52.876409','2021-11-10 08:46:52.876448',3,4),(8,'2021-11-10 08:46:52.877810','2021-11-10 08:46:52.877851',4,4),(9,'2021-11-10 08:46:52.879320','2021-11-10 08:46:52.879376',5,5),(10,'2021-11-10 08:46:52.881440','2021-11-10 08:46:52.881495',6,5),(11,'2021-11-10 08:46:52.883227','2021-11-10 08:46:52.883268',5,6),(12,'2021-11-10 08:46:52.884981','2021-11-10 08:46:52.885034',6,6),(13,'2021-11-10 08:46:52.886621','2021-11-10 08:46:52.886666',7,7),(14,'2021-11-10 08:46:52.888146','2021-11-10 08:46:52.888186',8,7),(15,'2021-11-10 08:46:52.889496','2021-11-10 08:46:52.889538',7,8),(16,'2021-11-10 08:46:52.890798','2021-11-10 08:46:52.890839',8,8),(17,'2021-11-10 08:46:52.892222','2021-11-10 08:46:52.892264',1,9),(18,'2021-11-10 08:46:52.893982','2021-11-10 08:46:52.894028',2,9),(19,'2021-11-10 08:46:52.895356','2021-11-10 08:46:52.895398',1,10),(20,'2021-11-10 08:46:52.896719','2021-11-10 08:46:52.896759',2,10),(21,'2021-11-10 08:46:52.898279','2021-11-10 08:46:52.898324',3,11),(22,'2021-11-10 08:46:52.899662','2021-11-10 08:46:52.899722',4,11),(23,'2021-11-10 08:46:52.901055','2021-11-10 08:46:52.901096',3,12),(24,'2021-11-10 08:46:52.902701','2021-11-10 08:46:52.902750',4,12),(25,'2021-11-10 08:46:52.904350','2021-11-10 08:46:52.904397',5,13),(26,'2021-11-10 08:46:52.905740','2021-11-10 08:46:52.905788',6,13),(27,'2021-11-10 08:46:52.907208','2021-11-10 08:46:52.907252',5,14),(28,'2021-11-10 08:46:52.908608','2021-11-10 08:46:52.908648',6,14),(29,'2021-11-10 08:46:52.910095','2021-11-10 08:46:52.910140',7,15),(30,'2021-11-10 08:46:52.911579','2021-11-10 08:46:52.911624',8,15),(31,'2021-11-10 08:46:52.913338','2021-11-10 08:46:52.913430',7,16),(32,'2021-11-10 08:46:52.915400','2021-11-10 08:46:52.915483',8,16),(33,'2021-11-10 08:46:52.917300','2021-11-10 08:46:52.917391',1,17),(34,'2021-11-10 08:46:52.919095','2021-11-10 08:46:52.919144',2,17),(35,'2021-11-10 08:46:52.920769','2021-11-10 08:46:52.920811',1,18),(36,'2021-11-10 08:46:52.922462','2021-11-10 08:46:52.922515',2,18),(37,'2021-11-10 08:46:52.924117','2021-11-10 08:46:52.924161',3,19),(38,'2021-11-10 08:46:52.926533','2021-11-10 08:46:52.926590',4,19),(39,'2021-11-10 08:46:52.928292','2021-11-10 08:46:52.928362',3,20),(40,'2021-11-10 08:46:52.930447','2021-11-10 08:46:52.930579',4,20),(41,'2021-11-10 08:46:52.932786','2021-11-10 08:46:52.932843',1,21),(42,'2021-11-10 08:46:52.934541','2021-11-10 08:46:52.934591',2,21),(43,'2021-11-10 08:46:52.936406','2021-11-10 08:46:52.936471',1,22),(44,'2021-11-10 08:46:52.938412','2021-11-10 08:46:52.938468',2,22),(45,'2021-11-10 08:46:52.940293','2021-11-10 08:46:52.940349',3,23),(46,'2021-11-10 08:46:52.942275','2021-11-10 08:46:52.942346',4,23),(47,'2021-11-10 08:46:52.944181','2021-11-10 08:46:52.944232',3,24),(48,'2021-11-10 08:46:52.945868','2021-11-10 08:46:52.945918',4,24),(49,'2021-11-10 08:46:52.947841','2021-11-10 08:46:52.947953',5,25),(50,'2021-11-10 08:46:52.949557','2021-11-10 08:46:52.949600',6,25),(51,'2021-11-10 08:46:52.951222','2021-11-10 08:46:52.951272',5,26),(52,'2021-11-10 08:46:52.952775','2021-11-10 08:46:52.952834',6,26),(53,'2021-11-10 08:46:52.954535','2021-11-10 08:46:52.954589',7,27),(54,'2021-11-10 08:46:52.956380','2021-11-10 08:46:52.956441',8,27),(55,'2021-11-10 08:46:52.957990','2021-11-10 08:46:52.958038',7,28),(56,'2021-11-10 08:46:52.959754','2021-11-10 08:46:52.959801',8,28),(57,'2021-11-10 08:46:52.961317','2021-11-10 08:46:52.961361',1,29),(58,'2021-11-10 08:46:52.962760','2021-11-10 08:46:52.962800',2,29),(59,'2021-11-10 08:46:52.964356','2021-11-10 08:46:52.964405',1,30),(60,'2021-11-10 08:46:52.966079','2021-11-10 08:46:52.966127',2,30),(61,'2021-11-10 08:46:52.967627','2021-11-10 08:46:52.967670',3,31),(62,'2021-11-10 08:46:52.969051','2021-11-10 08:46:52.969090',4,31),(63,'2021-11-10 08:46:52.970428','2021-11-10 08:46:52.970471',3,32),(64,'2021-11-10 08:46:52.971779','2021-11-10 08:46:52.971819',4,32),(65,'2021-11-10 08:46:52.973099','2021-11-10 08:46:52.973138',5,33),(66,'2021-11-10 08:46:52.974778','2021-11-10 08:46:52.974849',6,33),(67,'2021-11-10 08:46:52.976853','2021-11-10 08:46:52.976914',5,34),(68,'2021-11-10 08:46:52.978808','2021-11-10 08:46:52.978864',6,34),(69,'2021-11-10 08:46:52.980509','2021-11-10 08:46:52.980564',7,35),(70,'2021-11-10 08:46:52.982578','2021-11-10 08:46:52.982644',8,35),(71,'2021-11-10 08:46:52.984627','2021-11-10 08:46:52.984709',7,36),(72,'2021-11-10 08:46:52.986684','2021-11-10 08:46:52.986739',8,36),(73,'2021-11-10 08:46:52.988600','2021-11-10 08:46:52.988671',1,37),(74,'2021-11-10 08:46:52.990590','2021-11-10 08:46:52.990652',2,37),(75,'2021-11-10 08:46:52.993225','2021-11-10 08:46:52.993298',1,38),(76,'2021-11-10 08:46:52.995140','2021-11-10 08:46:52.995182',2,38),(77,'2021-11-10 08:46:52.996795','2021-11-10 08:46:52.996837',3,39),(78,'2021-11-10 08:46:52.998304','2021-11-10 08:46:52.998344',4,39),(79,'2021-11-10 08:46:52.999730','2021-11-10 08:46:52.999780',3,40),(80,'2021-11-10 08:46:53.001484','2021-11-10 08:46:53.001540',4,40);
/*!40000 ALTER TABLE `products_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_images`
--

DROP TABLE IF EXISTS `review_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_url` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `review_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_images_review_id_9c7a1455_fk_reviews_id` (`review_id`),
  CONSTRAINT `review_images_review_id_9c7a1455_fk_reviews_id` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_images`
--

LOCK TABLES `review_images` WRITE;
/*!40000 ALTER TABLE `review_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `star_rate` decimal(3,2) NOT NULL,
  `product_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_group_id_972b11ca_fk_product_groups_id` (`product_group_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_product_group_id_972b11ca_fk_product_groups_id` FOREIGN KEY (`product_group_id`) REFERENCES `product_groups` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'2021-11-10 08:46:52.754074','2021-11-10 08:46:52.754125','q',1.00,1,1),(2,'2021-11-10 08:46:52.756343','2021-11-10 08:46:52.756396','asvasv',5.00,1,1),(3,'2021-11-10 08:46:52.758023','2021-11-10 08:46:52.758068','rev',4.00,1,1),(4,'2021-11-10 08:46:52.759697','2021-11-10 08:46:52.759740','ner',3.00,1,1),(5,'2021-11-10 08:46:52.761190','2021-11-10 08:46:52.761232','q',2.00,2,1),(6,'2021-11-10 08:46:52.762803','2021-11-10 08:46:52.762846','w',3.00,2,1),(7,'2021-11-10 08:46:52.764617','2021-11-10 08:46:52.764664','e',4.00,3,1),(8,'2021-11-10 08:46:52.766319','2021-11-10 08:46:52.766373','rt',2.00,3,1),(9,'2021-11-10 08:46:52.768211','2021-11-10 08:46:52.768273','y',3.00,4,1),(10,'2021-11-10 08:46:52.770573','2021-11-10 08:46:52.770638','u',2.00,4,1),(11,'2021-11-10 08:46:52.772619','2021-11-10 08:46:52.772676','I',3.00,5,1),(12,'2021-11-10 08:46:52.774379','2021-11-10 08:46:52.774426','o',2.00,5,1),(13,'2021-11-10 08:46:52.776133','2021-11-10 08:46:52.776183','p',5.00,6,1),(14,'2021-11-10 08:46:52.778149','2021-11-10 08:46:52.778207','asd',4.00,6,1),(15,'2021-11-10 08:46:52.780258','2021-11-10 08:46:52.780335','f',4.00,7,1),(16,'2021-11-10 08:46:52.782346','2021-11-10 08:46:52.782397','gh',5.00,7,1),(17,'2021-11-10 08:46:52.784136','2021-11-10 08:46:52.784191','h',1.00,8,1),(18,'2021-11-10 08:46:52.785944','2021-11-10 08:46:52.785991','j',2.00,8,1),(19,'2021-11-10 08:46:52.787484','2021-11-10 08:46:52.787523','k',3.00,9,1),(20,'2021-11-10 08:46:52.789240','2021-11-10 08:46:52.789281','l',4.00,9,1),(21,'2021-11-10 08:46:52.790735','2021-11-10 08:46:52.790775','z',3.00,10,1),(22,'2021-11-10 08:46:52.792376','2021-11-10 08:46:52.792422','x',2.00,10,1),(23,'2021-11-10 08:46:52.794260','2021-11-10 08:46:52.794308','cx',4.00,11,1),(24,'2021-11-10 08:46:52.795951','2021-11-10 08:46:52.796012','v',1.00,11,1),(25,'2021-11-10 08:46:52.798034','2021-11-10 08:46:52.798095','b',3.00,12,1),(26,'2021-11-10 08:46:52.800352','2021-11-10 08:46:52.800431','nmqwe',2.00,12,1),(27,'2021-11-10 08:46:52.802429','2021-11-10 08:46:52.802492','qwt',4.00,13,1),(28,'2021-11-10 08:46:52.804614','2021-11-10 08:46:52.804671','sdg',5.00,13,1),(29,'2021-11-10 08:46:52.806712','2021-11-10 08:46:52.806758','dgs',1.00,14,1),(30,'2021-11-10 08:46:52.808571','2021-11-10 08:46:52.808694','gh',2.00,14,1),(31,'2021-11-10 08:46:52.810500','2021-11-10 08:46:52.810548','vdf',3.00,15,1),(32,'2021-11-10 08:46:52.812338','2021-11-10 08:46:52.812387','ynr',2.00,15,1),(33,'2021-11-10 08:46:52.814027','2021-11-10 08:46:52.814070','nrt',3.00,16,1),(34,'2021-11-10 08:46:52.815709','2021-11-10 08:46:52.815753','web',2.00,16,1),(35,'2021-11-10 08:46:52.817685','2021-11-10 08:46:52.817822','webqw',3.00,17,1),(36,'2021-11-10 08:46:52.819955','2021-11-10 08:46:52.820001','wrn',4.00,17,1),(37,'2021-11-10 08:46:52.821733','2021-11-10 08:46:52.821776','erj',4.00,18,1),(38,'2021-11-10 08:46:52.823189','2021-11-10 08:46:52.823242','erg',4.00,18,1),(39,'2021-11-10 08:46:52.825104','2021-11-10 08:46:52.825165','trjn',1.00,19,1),(40,'2021-11-10 08:46:52.827352','2021-11-10 08:46:52.827420','rm',2.00,19,1),(41,'2021-11-10 08:46:52.829407','2021-11-10 08:46:52.829462','qwe',3.00,1,1),(42,'2021-11-10 08:46:52.831536','2021-11-10 08:46:52.831625','asvasv',4.00,1,1),(43,'2021-11-10 08:46:52.833760','2021-11-10 08:46:52.833823','en',5.00,1,1),(44,'2021-11-10 08:46:52.835941','2021-11-10 08:46:52.836001','ernew',1.00,2,1),(45,'2021-11-10 08:46:52.837877','2021-11-10 08:46:52.837954','qwbb',2.00,2,1),(46,'2021-11-10 08:46:52.840035','2021-11-10 08:46:52.840114','qwbqwgv',3.00,3,1),(47,'2021-11-10 08:46:52.842513','2021-11-10 08:46:52.842598','qwgwqgv',5.00,4,1),(48,'2021-11-10 08:46:52.844859','2021-11-10 08:46:52.844908','renernern',2.00,2,1),(49,'2021-11-10 08:46:52.846551','2021-11-10 08:46:52.846620','enqwf',4.00,8,1),(50,'2021-11-10 08:46:52.848780','2021-11-10 08:46:52.848832','mgmgm',3.00,3,1),(51,'2021-11-10 08:46:52.850814','2021-11-10 08:46:52.850881','mfgdnb',2.00,3,1),(52,'2021-11-10 08:46:52.852753','2021-11-10 08:46:52.852815','ernbrdb',1.00,6,1),(53,'2021-11-10 08:46:52.854570','2021-11-10 08:46:52.854620','ewgvsegv',4.00,5,1),(54,'2021-11-10 08:46:52.856794','2021-11-10 08:46:52.856862','fgqgvernhredhb',3.00,1,1),(55,'2021-11-10 08:46:52.858535','2021-11-10 08:46:52.858579','weg',2.00,1,1),(56,'2021-11-10 08:46:52.860135','2021-11-10 08:46:52.860178','qwgvwqg',1.00,2,1),(57,'2021-11-10 08:46:52.861656','2021-11-10 08:46:52.861692','q',1.00,20,1),(58,'2021-11-10 08:46:52.863304','2021-11-10 08:46:52.863349','asvasv',5.00,20,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `tracking_number` int NOT NULL,
  `date` date NOT NULL,
  `order_item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_item_id_85241299_fk_order_items_id` (`order_item_id`),
  CONSTRAINT `shipments_order_item_id_85241299_fk_order_items_id` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_dc42080e_fk_categories_id` (`category_id`),
  CONSTRAINT `sub_categories_category_id_dc42080e_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'2021-11-10 08:46:52.543458','2021-11-10 08:46:52.543520','일반침대',1),(2,'2021-11-10 08:46:52.546012','2021-11-10 08:46:52.546076','수납침대',1),(3,'2021-11-10 08:46:52.548167','2021-11-10 08:46:52.548216','LED침대',1);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2021-11-10 08:44:55.976670','2021-11-10 08:44:55.976762','lck0827@gmail.com','이찬규','$2b$12$cfTSdNqCAeTso6PvtLWLLerx/2k1.wAo1SbZ1.pdGR2y68iGuLqem','01027499229','찬규짱');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 17:28:08
