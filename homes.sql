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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
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
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
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
INSERT INTO `categories` VALUES (1,'2021-11-04 10:44:32.135258','2021-11-04 10:44:32.136874','침대',1),(2,'2021-11-04 10:44:32.186915','2021-11-04 10:44:32.186985','소파',1),(3,'2021-11-04 10:44:32.190536','2021-11-04 10:44:32.190606','테이블',1),(4,'2021-11-04 10:44:32.193218','2021-11-04 10:44:32.193333','화장대/거울',1),(5,'2021-11-04 10:44:32.195421','2021-11-04 10:44:32.195509','드레스룸',1),(6,'2021-11-04 10:44:32.198723','2021-11-04 10:44:32.198787','거실장/서랍장/선반',1),(7,'2021-11-04 10:44:32.201695','2021-11-04 10:44:32.201771','식탁/주방수납',1),(8,'2021-11-04 10:44:32.204484','2021-11-04 10:44:32.204562','책상/책장',1),(9,'2021-11-04 10:44:32.206293','2021-11-04 10:44:32.206340','의자',1),(10,'2021-11-04 10:44:32.208134','2021-11-04 10:44:32.208191','유아/아동가구',1);
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
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'2021-11-04 10:49:34.374861','2021-11-04 10:49:34.374932','베이지'),(2,'2021-11-04 10:49:34.376861','2021-11-04 10:49:34.376909','그레이'),(3,'2021-11-04 10:49:34.378484','2021-11-04 10:49:34.378530','월넛'),(4,'2021-11-04 10:49:34.380958','2021-11-04 10:49:34.381001','화이트'),(5,'2021-11-04 10:49:34.382538','2021-11-04 10:49:34.382584','메이플'),(6,'2021-11-04 10:49:34.384090','2021-11-04 10:49:34.384129','블랙'),(7,'2021-11-04 10:49:34.385756','2021-11-04 10:49:34.385806','크림'),(8,'2021-11-04 10:49:34.387464','2021-11-04 10:49:34.387523','오크');
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
INSERT INTO `deliveries` VALUES (1,'2021-11-04 10:49:34.237679','2021-11-04 10:49:34.237765','직접배송','착불',40000.000),(2,'2021-11-04 10:49:34.246366','2021-11-04 10:49:34.246444','직접배송','착불',35000.000),(3,'2021-11-04 10:49:34.248211','2021-11-04 10:49:34.248303','직접배송','착불',25000.000),(4,'2021-11-04 10:49:34.249926','2021-11-04 10:49:34.249976','직접배송','선불',0.000);
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
INSERT INTO `django_migrations` VALUES (1,'users','0001_initial','2021-11-04 08:13:34.375627'),(2,'products','0001_initial','2021-11-04 08:13:35.136175'),(3,'carts','0001_initial','2021-11-04 08:13:35.240259'),(4,'contenttypes','0001_initial','2021-11-04 08:13:35.276234'),(5,'contenttypes','0002_remove_content_type_name','2021-11-04 08:13:35.338542'),(6,'orders','0001_initial','2021-11-04 08:13:35.694029'),(7,'sessions','0001_initial','2021-11-04 08:13:35.729461');
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
INSERT INTO `menus` VALUES (1,'2021-11-04 09:56:43.384514','2021-11-04 09:56:43.384655','가구',''),(2,'2021-11-04 09:56:43.428282','2021-11-04 09:56:43.428351','패브릭',''),(3,'2021-11-04 09:56:43.430836','2021-11-04 09:56:43.430904','조명',''),(4,'2021-11-04 09:56:43.436572','2021-11-04 09:56:43.436643','주방',''),(5,'2021-11-04 09:56:43.438239','2021-11-04 09:56:43.438284','수납/정리',''),(6,'2021-11-04 09:56:43.440016','2021-11-04 09:56:43.440064','가전',''),(7,'2021-11-04 09:56:43.441838','2021-11-04 09:56:43.441901','인테리어소품',''),(8,'2021-11-04 09:56:43.445470','2021-11-04 09:56:43.445542','생활용품',''),(9,'2021-11-04 09:56:43.447990','2021-11-04 09:56:43.448066','셀프인테리어','');
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
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_412ad78b_fk_orders_id` (`order_id`),
  KEY `order_items_product_id_dd557d5a_fk_products_id` (`product_id`),
  CONSTRAINT `order_items_order_id_412ad78b_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_dd557d5a_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
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
  `discount_price` decimal(5,3) NOT NULL,
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
INSERT INTO `product_groups` VALUES (1,'2021-11-04 10:49:34.252867','2021-11-04 10:49:34.252941','캐더린 통수납 침대','리샘가구',599000.000,68.000,1,1),(2,'2021-11-04 10:49:34.255589','2021-11-04 10:49:34.255640','다락 빅 수납침대','포덕홈',650000.000,63.000,1,1),(3,'2021-11-04 10:49:34.257242','2021-11-04 10:49:34.257290','헤르만 무헤드 통수납 침대','리샘가구',309000.000,69.000,1,1),(4,'2021-11-04 10:49:34.260521','2021-11-04 10:49:34.260596','단잠슬림가드 저상형 패밀리 침대','모던바로크',798000.000,79.000,1,1),(5,'2021-11-04 10:49:34.262360','2021-11-04 10:49:34.262404','산타페 하이브리드 침대','지누스',189000.000,20.000,1,1),(6,'2021-11-04 10:49:34.264076','2021-11-04 10:49:34.264133','레아 사계절 고무나무 원목침대','퍼니코',399000.000,53.000,1,1),(7,'2021-11-04 10:49:34.266155','2021-11-04 10:49:34.266231','몬드리안 침대 프레임 호텔식 침대','한국갤러리',1120000.000,50.000,1,1),(8,'2021-11-04 10:49:34.268375','2021-11-04 10:49:34.268442','조이 빅서랍 3단 수납 침대','삼익가구',219000.000,59.000,2,1),(9,'2021-11-04 10:49:34.270629','2021-11-04 10:49:34.270706','호텔컬렉션 프리미엄 레온 어메이징 빅수납 침대','삼익가구',549000.000,55.000,2,1),(10,'2021-11-04 10:49:34.272536','2021-11-04 10:49:34.272582','밀리스탠다드 침대','딜라이트',159000.000,67.000,2,1),(11,'2021-11-04 10:49:34.274208','2021-11-04 10:49:34.274277','스마트베이스 엘리트 침대','지누스',125000.000,26.000,2,1),(12,'2021-11-04 10:49:34.276297','2021-11-04 10:49:34.276359','위더스 디자인 원목 침대','삼익가구',499000.000,60.000,2,1),(13,'2021-11-04 10:49:34.278432','2021-11-04 10:49:34.278496','엘레나 고무나무 원목 서랍형 침대','썸앤데코',1100000.000,35.000,3,1),(14,'2021-11-04 10:49:34.281183','2021-11-04 10:49:34.281244','NEW! 슬림 높이조절 침대','도담',1049000.000,74.000,3,1),(15,'2021-11-04 10:49:34.283135','2021-11-04 10:49:34.283197','모노 수납 침대','레이디가구',329000.000,40.000,3,1),(16,'2021-11-04 10:49:34.285299','2021-11-04 10:49:34.285353','스칸딕 로맨틱 핀란드 원목 침대','레이디가구',599000.000,57.000,3,1),(17,'2021-11-04 10:49:34.287031','2021-11-04 10:49:34.287071','위슨 호텔형 가죽 침대','레이디가구',539000.000,45.000,3,1),(18,'2021-11-04 10:49:34.288744','2021-11-04 10:49:34.288797','네추럴감성 곡선헤드! New 잉그리드 원목침대','웨스트프롬',488000.000,50.000,1,1),(19,'2021-11-04 10:49:34.290563','2021-11-04 10:49:34.290612','리노바 평상형 침대','딜라이트',199000.000,59.000,1,1),(20,'2021-11-04 10:49:34.292599','2021-11-04 10:49:34.292698','하이필로우탑 침대세트','도르미릴렉스',1749000.000,56.000,1,1);
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
INSERT INTO `product_images` VALUES (1,'2021-11-04 10:49:34.390133','2021-11-04 10:49:34.390191','https://images.unsplash.com/photo-1560184897-502a475f7a0d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',1),(2,'2021-11-04 10:49:34.392218','2021-11-04 10:49:34.392260','https://cdn.pixabay.com/photo/2020/11/24/11/36/bedroom-5772286_960_720.jpg',1),(3,'2021-11-04 10:49:34.394138','2021-11-04 10:49:34.394185','https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',2),(4,'2021-11-04 10:49:34.395850','2021-11-04 10:49:34.395894','https://cdn.pixabay.com/photo/2018/04/10/06/29/apartment-3306501__340.jpg',3),(5,'2021-11-04 10:49:34.397438','2021-11-04 10:49:34.397480','https://cdn.pixabay.com/photo/2018/01/23/06/58/modern-minimalist-bedroom-3100786__340.jpg',4),(6,'2021-11-04 10:49:34.399359','2021-11-04 10:49:34.399418','https://cdn.pixabay.com/photo/2018/07/14/20/04/interior-3538315__340.jpg',5),(7,'2021-11-04 10:49:34.401250','2021-11-04 10:49:34.401308','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221_960_720.jpg',6),(8,'2021-11-04 10:49:34.402964','2021-11-04 10:49:34.403012','https://cdn.pixabay.com/photo/2015/08/16/04/04/bed-890567__340.jpg',7),(9,'2021-11-04 10:49:34.404638','2021-11-04 10:49:34.404700','https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80',8),(10,'2021-11-04 10:49:34.406762','2021-11-04 10:49:34.406844','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664223__340.jpg',9),(11,'2021-11-04 10:49:34.408524','2021-11-04 10:49:34.408572','https://images.unsplash.com/photo-1616627561839-074385245ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',10),(12,'2021-11-04 10:49:34.410267','2021-11-04 10:49:34.410313','https://cdn.pixabay.com/photo/2019/01/31/19/24/bed-3967757__340.png',11),(13,'2021-11-04 10:49:34.411794','2021-11-04 10:49:34.411851','https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',12),(14,'2021-11-04 10:49:34.413890','2021-11-04 10:49:34.413975','https://cdn.pixabay.com/photo/2015/02/02/23/40/bed-621742__340.jpg',13),(15,'2021-11-04 10:49:34.415922','2021-11-04 10:49:34.415984','https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',14),(16,'2021-11-04 10:49:34.417877','2021-11-04 10:49:34.417937','https://cdn.pixabay.com/photo/2016/10/13/09/08/travel-1737172__340.jpg',15),(17,'2021-11-04 10:49:34.419820','2021-11-04 10:49:34.419891','https://cdn.pixabay.com/photo/2017/04/28/22/16/room-2269594__340.jpg',16),(18,'2021-11-04 10:49:34.422003','2021-11-04 10:49:34.422062','https://cdn.pixabay.com/photo/2020/06/27/16/40/apartment-5346461__340.jpg',17),(19,'2021-11-04 10:49:34.423786','2021-11-04 10:49:34.423831','https://cdn.pixabay.com/photo/2018/02/12/10/07/modern-minimalist-bedroom-3147893__340.jpg',18),(20,'2021-11-04 10:49:34.425416','2021-11-04 10:49:34.425463','https://cdn.pixabay.com/photo/2017/06/17/10/58/furniture-2411853__340.jpg',19),(21,'2021-11-04 10:49:34.427083','2021-11-04 10:49:34.427136','https://cdn.pixabay.com/photo/2018/09/20/02/47/bedroom-3689929__340.jpg',20),(22,'2021-11-04 10:49:34.428986','2021-11-04 10:49:34.429051','https://cdn.pixabay.com/photo/2018/04/10/06/29/apartment-3306501__340.jpg',3),(23,'2021-11-04 10:49:34.430943','2021-11-04 10:49:34.431001','https://cdn.pixabay.com/photo/2018/01/23/06/58/modern-minimalist-bedroom-3100786__340.jpg',4),(24,'2021-11-04 10:49:34.433040','2021-11-04 10:49:34.433103','https://cdn.pixabay.com/photo/2018/07/14/20/04/interior-3538315__340.jpg',5),(25,'2021-11-04 10:49:34.435055','2021-11-04 10:49:34.435124','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221_960_720.jpg',6),(26,'2021-11-04 10:49:34.437170','2021-11-04 10:49:34.437244','https://cdn.pixabay.com/photo/2015/08/16/04/04/bed-890567__340.jpg',7),(27,'2021-11-04 10:49:34.439124','2021-11-04 10:49:34.439177','https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80',8),(28,'2021-11-04 10:49:34.441122','2021-11-04 10:49:34.441185','https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664223__340.jpg',9),(29,'2021-11-04 10:49:34.443296','2021-11-04 10:49:34.443356','https://images.unsplash.com/photo-1616627561839-074385245ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',10),(30,'2021-11-04 10:49:34.445317','2021-11-04 10:49:34.445371','https://cdn.pixabay.com/photo/2019/01/31/19/24/bed-3967757__340.png',11),(31,'2021-11-04 10:49:34.447243','2021-11-04 10:49:34.447304','https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',12),(32,'2021-11-04 10:49:34.449261','2021-11-04 10:49:34.449320','https://cdn.pixabay.com/photo/2015/02/02/23/40/bed-621742__340.jpg',13),(33,'2021-11-04 10:49:34.451414','2021-11-04 10:49:34.451496','https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',14),(34,'2021-11-04 10:49:34.453272','2021-11-04 10:49:34.453322','https://cdn.pixabay.com/photo/2016/10/13/09/08/travel-1737172__340.jpg',15),(35,'2021-11-04 10:49:34.455360','2021-11-04 10:49:34.455484','https://cdn.pixabay.com/photo/2017/04/28/22/16/room-2269594__340.jpg',16),(36,'2021-11-04 10:49:34.457573','2021-11-04 10:49:34.457620','https://cdn.pixabay.com/photo/2020/06/27/16/40/apartment-5346461__340.jpg',17),(37,'2021-11-04 10:49:34.459383','2021-11-04 10:49:34.459429','https://cdn.pixabay.com/photo/2018/02/12/10/07/modern-minimalist-bedroom-3147893__340.jpg',18),(38,'2021-11-04 10:49:34.460963','2021-11-04 10:49:34.461012','https://cdn.pixabay.com/photo/2017/06/17/10/58/furniture-2411853__340.jpg',19),(39,'2021-11-04 10:49:34.462979','2021-11-04 10:49:34.463049','https://cdn.pixabay.com/photo/2018/09/20/02/47/bedroom-3689929__340.jpg',20),(40,'2021-11-04 10:49:34.465074','2021-11-04 10:49:34.465329','https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGJlZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',2);
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
INSERT INTO `products` VALUES (1,'2021-11-04 10:49:34.295430','2021-11-04 10:49:34.295501','캐더린 통수납 침대 SS',189000.000,1),(2,'2021-11-04 10:49:34.297673','2021-11-04 10:49:34.297720','캐더린 통수납 침대 Q',209000.000,1),(3,'2021-11-04 10:49:34.299639','2021-11-04 10:49:34.299689','다락 빅 수납침대 SS',239000.000,2),(4,'2021-11-04 10:49:34.301389','2021-11-04 10:49:34.301433','다락 빅 수납침대 Q',319000.000,2),(5,'2021-11-04 10:49:34.303088','2021-11-04 10:49:34.303134','헤르만 무헤드 통수납 침대 SS',95900.000,3),(6,'2021-11-04 10:49:34.304750','2021-11-04 10:49:34.304793','헤르만 무헤드 통수납 침대 Q',109900.000,3),(7,'2021-11-04 10:49:34.306826','2021-11-04 10:49:34.306877','단잠슬림가드 저상형 패밀리 침대 SS',169000.000,4),(8,'2021-11-04 10:49:34.308956','2021-11-04 10:49:34.309005','단잠슬림가드 저상형 패밀리 침대 K',219000.000,4),(9,'2021-11-04 10:49:34.310677','2021-11-04 10:49:34.310720','산타페 하이브리드 침대 SS',152100.000,5),(10,'2021-11-04 10:49:34.312266','2021-11-04 10:49:34.312310','산타페 하이브리드 침대 Q',179100.000,5),(11,'2021-11-04 10:49:34.313787','2021-11-04 10:49:34.313831','레아 사계절 고목나무 원목침대 SS',189000.000,6),(12,'2021-11-04 10:49:34.315465','2021-11-04 10:49:34.315513','레아 사계절 고목나무 원목침대 Q',219000.000,6),(13,'2021-11-04 10:49:34.317060','2021-11-04 10:49:34.317106','몬드리안 침대 프레임 호텔식 침대 SS',560000.000,7),(14,'2021-11-04 10:49:34.318617','2021-11-04 10:49:34.318660','몬드리안 침대 프레임 호텔식 침대 Q',6600000.000,7),(15,'2021-11-04 10:49:34.320851','2021-11-04 10:49:34.320902','조이 빅서랍 3단 수납침대 SS',89000.000,8),(16,'2021-11-04 10:49:34.322869','2021-11-04 10:49:34.322932','조이 빅서랍 3단 수납침대 Q',109000.000,8),(17,'2021-11-04 10:49:34.324930','2021-11-04 10:49:34.325000','호텔컬렉션 프리미엄 레온 어메이징 빅수납 침대 SS',244900.000,9),(18,'2021-11-04 10:49:34.327121','2021-11-04 10:49:34.327205','호텔컬렉션 프리미엄 레온 어메이징 빅수납 침대 Q',304900.000,9),(19,'2021-11-04 10:49:34.329313','2021-11-04 10:49:34.329399','밀리스탠다드 침대 SS',51900.000,10),(20,'2021-11-04 10:49:34.331335','2021-11-04 10:49:34.331383','밀리스탠다드 침대 Q',73900.000,10),(21,'2021-11-04 10:49:34.333054','2021-11-04 10:49:34.333105','스마트베이스 엘리트 침대 S',92650.000,11),(22,'2021-11-04 10:49:34.334877','2021-11-04 10:49:34.334930','스마트베이스 엘리트 침대 Q',128140.000,11),(23,'2021-11-04 10:49:34.336705','2021-11-04 10:49:34.336768','위더스 디자인 원목 침대 SS',199000.000,12),(24,'2021-11-04 10:49:34.339320','2021-11-04 10:49:34.339388','위더스 디자인 원목 침대 Q',299000.000,12),(25,'2021-11-04 10:49:34.342076','2021-11-04 10:49:34.342131','엘레나 고목나무 원목 서랍형 침대 SS',710000.000,13),(26,'2021-11-04 10:49:34.344385','2021-11-04 10:49:34.344450','엘레나 고목나무 원목 서랍형 침대 Q',770000.000,13),(27,'2021-11-04 10:49:34.347015','2021-11-04 10:49:34.347072','NEW! 슬림 높이조절 침대 SS',269000.000,14),(28,'2021-11-04 10:49:34.349620','2021-11-04 10:49:34.349734','NEW! 슬림 높이조절 침대 Q',329000.000,14),(29,'2021-11-04 10:49:34.352081','2021-11-04 10:49:34.352152','모노 수납 침대 SS',199000.000,15),(30,'2021-11-04 10:49:34.354048','2021-11-04 10:49:34.354099','모노 수납 침대 Q',259000.000,15),(31,'2021-11-04 10:49:34.355831','2021-11-04 10:49:34.355881','스칸딕 로맨틱 핀란드 원목 침대 SS',219000.000,16),(32,'2021-11-04 10:49:34.357470','2021-11-04 10:49:34.357515','스칸딕 로맨틱 핀란드 원목 침대 Q',259000.000,16),(33,'2021-11-04 10:49:34.359092','2021-11-04 10:49:34.359148','위슨 호텔형 가죽 침대 SS',279000.000,17),(34,'2021-11-04 10:49:34.361115','2021-11-04 10:49:34.361178','위슨 호텔형 가죽 침대 Q',299000.000,17),(35,'2021-11-04 10:49:34.362939','2021-11-04 10:49:34.362988','네추럴감성 곡선헤드! New 잉그리드 원목침대 SS',244900.000,18),(36,'2021-11-04 10:49:34.364591','2021-11-04 10:49:34.364648','네추럴감성 곡선헤드! New 잉그리드 원목침대 Q',304900.000,18),(37,'2021-11-04 10:49:34.366611','2021-11-04 10:49:34.366685','리노바 평상형 침대 SS',82000.000,19),(38,'2021-11-04 10:49:34.368823','2021-11-04 10:49:34.368871','리노바 평상형 침대 Q',99000.000,19),(39,'2021-11-04 10:49:34.370570','2021-11-04 10:49:34.370621','하이필로우탑 침대세트 SS',699000.000,20),(40,'2021-11-04 10:49:34.372208','2021-11-04 10:49:34.372255','하이필로우탑 침대세트Q',799000.000,20);
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
INSERT INTO `products_colors` VALUES (1,'2021-11-04 10:49:34.569518','2021-11-04 10:49:34.569569',1,1),(2,'2021-11-04 10:49:34.571459','2021-11-04 10:49:34.571509',2,1),(3,'2021-11-04 10:49:34.573118','2021-11-04 10:49:34.573170',1,2),(4,'2021-11-04 10:49:34.574673','2021-11-04 10:49:34.574714',2,2),(5,'2021-11-04 10:49:34.576162','2021-11-04 10:49:34.576208',3,3),(6,'2021-11-04 10:49:34.577746','2021-11-04 10:49:34.577782',4,3),(7,'2021-11-04 10:49:34.579227','2021-11-04 10:49:34.579273',3,4),(8,'2021-11-04 10:49:34.580717','2021-11-04 10:49:34.580751',4,4),(9,'2021-11-04 10:49:34.582367','2021-11-04 10:49:34.582411',5,5),(10,'2021-11-04 10:49:34.583902','2021-11-04 10:49:34.583960',6,5),(11,'2021-11-04 10:49:34.585634','2021-11-04 10:49:34.585686',5,6),(12,'2021-11-04 10:49:34.587203','2021-11-04 10:49:34.587249',6,6),(13,'2021-11-04 10:49:34.588746','2021-11-04 10:49:34.588789',7,7),(14,'2021-11-04 10:49:34.590635','2021-11-04 10:49:34.590683',8,7),(15,'2021-11-04 10:49:34.592225','2021-11-04 10:49:34.592276',7,8),(16,'2021-11-04 10:49:34.593718','2021-11-04 10:49:34.593761',8,8),(17,'2021-11-04 10:49:34.595046','2021-11-04 10:49:34.595084',1,9),(18,'2021-11-04 10:49:34.596380','2021-11-04 10:49:34.596422',2,9),(19,'2021-11-04 10:49:34.597766','2021-11-04 10:49:34.597805',1,10),(20,'2021-11-04 10:49:34.599163','2021-11-04 10:49:34.599202',2,10),(21,'2021-11-04 10:49:34.600734','2021-11-04 10:49:34.600780',3,11),(22,'2021-11-04 10:49:34.602173','2021-11-04 10:49:34.602214',4,11),(23,'2021-11-04 10:49:34.603666','2021-11-04 10:49:34.603712',3,12),(24,'2021-11-04 10:49:34.605224','2021-11-04 10:49:34.605269',4,12),(25,'2021-11-04 10:49:34.607138','2021-11-04 10:49:34.607222',5,13),(26,'2021-11-04 10:49:34.609078','2021-11-04 10:49:34.609129',6,13),(27,'2021-11-04 10:49:34.610726','2021-11-04 10:49:34.610770',5,14),(28,'2021-11-04 10:49:34.612183','2021-11-04 10:49:34.612222',6,14),(29,'2021-11-04 10:49:34.613475','2021-11-04 10:49:34.613522',7,15),(30,'2021-11-04 10:49:34.614794','2021-11-04 10:49:34.614833',8,15),(31,'2021-11-04 10:49:34.616376','2021-11-04 10:49:34.616424',7,16),(32,'2021-11-04 10:49:34.618064','2021-11-04 10:49:34.618115',8,16),(33,'2021-11-04 10:49:34.619648','2021-11-04 10:49:34.619693',1,17),(34,'2021-11-04 10:49:34.621347','2021-11-04 10:49:34.621391',2,17),(35,'2021-11-04 10:49:34.623033','2021-11-04 10:49:34.623079',1,18),(36,'2021-11-04 10:49:34.624489','2021-11-04 10:49:34.624530',2,18),(37,'2021-11-04 10:49:34.625925','2021-11-04 10:49:34.625971',3,19),(38,'2021-11-04 10:49:34.627513','2021-11-04 10:49:34.627561',4,19),(39,'2021-11-04 10:49:34.629356','2021-11-04 10:49:34.629407',3,20),(40,'2021-11-04 10:49:34.631045','2021-11-04 10:49:34.631106',4,20),(41,'2021-11-07 10:17:31.057314','2021-11-07 10:17:31.057386',1,21),(42,'2021-11-07 10:17:31.089966','2021-11-07 10:17:31.090048',2,21),(43,'2021-11-07 10:17:31.095118','2021-11-07 10:17:31.095193',1,22),(44,'2021-11-07 10:17:31.098018','2021-11-07 10:17:31.098091',2,22),(45,'2021-11-07 10:17:31.101077','2021-11-07 10:17:31.101138',3,23),(46,'2021-11-07 10:17:31.104676','2021-11-07 10:17:31.104804',4,23),(47,'2021-11-07 10:17:31.107821','2021-11-07 10:17:31.107927',3,24),(48,'2021-11-07 10:17:31.111590','2021-11-07 10:17:31.111655',4,24),(49,'2021-11-07 10:17:31.115275','2021-11-07 10:17:31.115344',5,25),(50,'2021-11-07 10:17:31.117261','2021-11-07 10:17:31.117333',6,25),(51,'2021-11-07 10:17:31.123827','2021-11-07 10:17:31.123893',5,26),(52,'2021-11-07 10:17:31.125737','2021-11-07 10:17:31.125782',6,26),(53,'2021-11-07 10:17:31.127612','2021-11-07 10:17:31.127658',7,27),(54,'2021-11-07 10:17:31.129122','2021-11-07 10:17:31.129170',8,27),(55,'2021-11-07 10:17:31.131473','2021-11-07 10:17:31.131541',7,28),(56,'2021-11-07 10:17:31.133341','2021-11-07 10:17:31.133390',8,28),(57,'2021-11-07 10:17:31.135085','2021-11-07 10:17:31.135128',1,29),(58,'2021-11-07 10:17:31.136771','2021-11-07 10:17:31.136814',2,29),(59,'2021-11-07 10:17:31.138341','2021-11-07 10:17:31.138415',1,30),(60,'2021-11-07 10:17:31.139954','2021-11-07 10:17:31.139997',2,30),(61,'2021-11-07 10:17:31.141669','2021-11-07 10:17:31.141721',3,31),(62,'2021-11-07 10:17:31.143275','2021-11-07 10:17:31.143326',4,31),(63,'2021-11-07 10:17:31.145291','2021-11-07 10:17:31.145342',3,32),(64,'2021-11-07 10:17:31.146821','2021-11-07 10:17:31.146866',4,32),(65,'2021-11-07 10:17:31.148574','2021-11-07 10:17:31.148620',5,33),(66,'2021-11-07 10:17:31.150077','2021-11-07 10:17:31.150126',6,33),(67,'2021-11-07 10:17:31.153673','2021-11-07 10:17:31.153754',5,34),(68,'2021-11-07 10:17:31.155663','2021-11-07 10:17:31.155716',6,34),(69,'2021-11-07 10:17:31.157379','2021-11-07 10:17:31.157428',7,35),(70,'2021-11-07 10:17:31.158984','2021-11-07 10:17:31.159028',8,35),(71,'2021-11-07 10:17:31.160524','2021-11-07 10:17:31.160576',7,36),(72,'2021-11-07 10:17:31.162414','2021-11-07 10:17:31.162476',8,36),(73,'2021-11-07 10:17:31.164499','2021-11-07 10:17:31.164608',1,37),(74,'2021-11-07 10:17:31.166380','2021-11-07 10:17:31.166429',2,37),(75,'2021-11-07 10:17:31.168239','2021-11-07 10:17:31.168294',1,38),(76,'2021-11-07 10:17:31.170116','2021-11-07 10:17:31.170174',2,38),(77,'2021-11-07 10:17:31.171806','2021-11-07 10:17:31.171854',3,39),(78,'2021-11-07 10:17:31.173703','2021-11-07 10:17:31.173748',4,39),(79,'2021-11-07 10:17:31.175333','2021-11-07 10:17:31.175381',3,40),(80,'2021-11-07 10:17:31.177097','2021-11-07 10:17:31.177159',4,40);
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
INSERT INTO `reviews` VALUES (1,'2021-11-04 10:49:34.468161','2021-11-04 10:49:34.468220','q',1.00,1,1),(2,'2021-11-04 10:49:34.470446','2021-11-04 10:49:34.470495','asvasv',5.00,1,1),(3,'2021-11-04 10:49:34.472336','2021-11-04 10:49:34.472424','rev',4.00,1,1),(4,'2021-11-04 10:49:34.474035','2021-11-04 10:49:34.474081','ner',3.00,1,1),(5,'2021-11-04 10:49:34.475673','2021-11-04 10:49:34.475718','q',2.00,2,1),(6,'2021-11-04 10:49:34.477407','2021-11-04 10:49:34.477451','w',3.00,2,1),(7,'2021-11-04 10:49:34.479048','2021-11-04 10:49:34.479106','e',4.00,3,1),(8,'2021-11-04 10:49:34.481107','2021-11-04 10:49:34.481264','rt',2.00,3,1),(9,'2021-11-04 10:49:34.483223','2021-11-04 10:49:34.483273','y',3.00,4,1),(10,'2021-11-04 10:49:34.485020','2021-11-04 10:49:34.485069','u',2.00,4,1),(11,'2021-11-04 10:49:34.487044','2021-11-04 10:49:34.487133','I',3.00,5,1),(12,'2021-11-04 10:49:34.489506','2021-11-04 10:49:34.489558','o',2.00,5,1),(13,'2021-11-04 10:49:34.491218','2021-11-04 10:49:34.491264','p',5.00,6,1),(14,'2021-11-04 10:49:34.492732','2021-11-04 10:49:34.492775','asd',4.00,6,1),(15,'2021-11-04 10:49:34.494183','2021-11-04 10:49:34.494223','f',4.00,7,1),(16,'2021-11-04 10:49:34.496026','2021-11-04 10:49:34.496074','gh',5.00,7,1),(17,'2021-11-04 10:49:34.497987','2021-11-04 10:49:34.498056','h',1.00,8,1),(18,'2021-11-04 10:49:34.499699','2021-11-04 10:49:34.499745','j',2.00,8,1),(19,'2021-11-04 10:49:34.501262','2021-11-04 10:49:34.501302','k',3.00,9,1),(20,'2021-11-04 10:49:34.503155','2021-11-04 10:49:34.503201','l',4.00,9,1),(21,'2021-11-04 10:49:34.504851','2021-11-04 10:49:34.504904','z',3.00,10,1),(22,'2021-11-04 10:49:34.506617','2021-11-04 10:49:34.506677','x',2.00,10,1),(23,'2021-11-04 10:49:34.508650','2021-11-04 10:49:34.508718','cx',4.00,11,1),(24,'2021-11-04 10:49:34.510835','2021-11-04 10:49:34.510912','v',1.00,11,1),(25,'2021-11-04 10:49:34.512909','2021-11-04 10:49:34.512970','b',3.00,12,1),(26,'2021-11-04 10:49:34.515135','2021-11-04 10:49:34.515208','nmqwe',2.00,12,1),(27,'2021-11-04 10:49:34.517361','2021-11-04 10:49:34.517422','qwt',4.00,13,1),(28,'2021-11-04 10:49:34.519377','2021-11-04 10:49:34.519430','sdg',5.00,13,1),(29,'2021-11-04 10:49:34.521315','2021-11-04 10:49:34.521375','dgs',1.00,14,1),(30,'2021-11-04 10:49:34.523291','2021-11-04 10:49:34.523345','gh',2.00,14,1),(31,'2021-11-04 10:49:34.525066','2021-11-04 10:49:34.525122','vdf',3.00,15,1),(32,'2021-11-04 10:49:34.526924','2021-11-04 10:49:34.526987','ynr',2.00,15,1),(33,'2021-11-04 10:49:34.528931','2021-11-04 10:49:34.528993','nrt',3.00,16,1),(34,'2021-11-04 10:49:34.530923','2021-11-04 10:49:34.530987','web',2.00,16,1),(35,'2021-11-04 10:49:34.532710','2021-11-04 10:49:34.532758','webqw',3.00,17,1),(36,'2021-11-04 10:49:34.534423','2021-11-04 10:49:34.534474','wrn',4.00,17,1),(37,'2021-11-04 10:49:34.536200','2021-11-04 10:49:34.536258','erj',4.00,18,1),(38,'2021-11-04 10:49:34.538101','2021-11-04 10:49:34.538147','erg',4.00,18,1),(39,'2021-11-04 10:49:34.539706','2021-11-04 10:49:34.539750','trjn',1.00,19,1),(40,'2021-11-04 10:49:34.541251','2021-11-04 10:49:34.541293','rm',2.00,19,1),(41,'2021-11-04 10:49:34.542869','2021-11-04 10:49:34.542908','qwe',3.00,1,1),(42,'2021-11-04 10:49:34.544409','2021-11-04 10:49:34.544452','asvasv',4.00,1,1),(43,'2021-11-04 10:49:34.545866','2021-11-04 10:49:34.545905','en',5.00,1,1),(44,'2021-11-04 10:49:34.547344','2021-11-04 10:49:34.547385','ernew',1.00,2,1),(45,'2021-11-04 10:49:34.548936','2021-11-04 10:49:34.548976','qwbb',2.00,2,1),(46,'2021-11-04 10:49:34.550311','2021-11-04 10:49:34.550371','qwbqwgv',3.00,3,1),(47,'2021-11-04 10:49:34.552287','2021-11-04 10:49:34.552337','qwgwqgv',5.00,4,1),(48,'2021-11-04 10:49:34.554021','2021-11-04 10:49:34.554080','renernern',2.00,2,1),(49,'2021-11-04 10:49:34.555896','2021-11-04 10:49:34.555952','enqwf',4.00,8,1),(50,'2021-11-04 10:49:34.557912','2021-11-04 10:49:34.557967','mgmgm',3.00,3,1),(51,'2021-11-04 10:49:34.559603','2021-11-04 10:49:34.559648','mfgdnb',2.00,3,1),(52,'2021-11-04 10:49:34.561153','2021-11-04 10:49:34.561194','ernbrdb',1.00,6,1),(53,'2021-11-04 10:49:34.562755','2021-11-04 10:49:34.562800','ewgvsegv',4.00,5,1),(54,'2021-11-04 10:49:34.564255','2021-11-04 10:49:34.564297','fgqgvernhredhb',3.00,1,1),(55,'2021-11-04 10:49:34.565697','2021-11-04 10:49:34.565740','weg',2.00,1,1),(56,'2021-11-04 10:49:34.567288','2021-11-04 10:49:34.567326','qwgvwqg',1.00,2,1),(57,'2021-11-07 10:17:30.949001','2021-11-07 10:17:30.949085','q',1.00,20,1),(58,'2021-11-07 10:17:31.050521','2021-11-07 10:17:31.050619','asvasv',5.00,20,1);
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
INSERT INTO `sub_categories` VALUES (1,'2021-11-04 10:45:51.811794','2021-11-04 10:45:51.811891','일반침대',1),(2,'2021-11-04 10:45:51.814979','2021-11-04 10:45:51.815033','수납침대',1),(3,'2021-11-04 10:45:51.816687','2021-11-04 10:45:51.816765','LED침대',1);
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
INSERT INTO `users` VALUES (1,'2021-11-04 10:47:52.395243','2021-11-04 10:47:52.395344','lck0827@gmail.com','이찬규','abc123!!','01027499229','찬규짱');
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

-- Dump completed on 2021-11-08 17:20:39
