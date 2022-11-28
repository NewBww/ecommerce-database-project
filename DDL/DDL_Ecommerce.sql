-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `e-commerce` ;

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e-commerce` ;
USE `e-commerce` ;

-- -----------------------------------------------------
-- Table `e-commerce`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`products` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(45) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `desc` JSON NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `UX__PRODUCTS__SKU` (`sku` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`prices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`prices` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`prices` (
  `product_id` INT NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`product_id`, `start_date`),
  INDEX `FK__PRICES__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK__PRICES__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`tags` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`tags` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `tag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`categories` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`products_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`products_tags` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`products_tags` (
  `product_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `tag_id`),
  INDEX `FK__PRODUCTS_TAGS__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  INDEX `FK__PRODUCTS_TAGS__TAG_ID` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `FK__PRODUCTS_TAGS__TAGS`
    FOREIGN KEY (`tag_id`)
    REFERENCES `e-commerce`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__PRODUCTS_TAGS__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`products_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`products_categories` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`products_categories` (
  `product_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `FK__PRODUCTS_CATEGORIES__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  INDEX `FK__PRODUCTS_CATEGORIES__CATEGORY_ID` (`category_id` ASC) VISIBLE,
  CONSTRAINT `FK__PRODUCTS_CATEGORIES__CATEGORIES`
    FOREIGN KEY (`category_id`)
    REFERENCES `e-commerce`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__PRODUCTS_CATEGORIES__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`customers` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `hashed_password` CHAR(64) NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_lastname` VARCHAR(45) NULL,
  `address` JSON NULL,
  `telephone` VARCHAR(15) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `UX__CUSTOMERS__EMAIL` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`cart_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`cart_items` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`cart_items` (
  `product_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`product_id`, `customer_id`),
  INDEX `FK__CART_ITEMS__CUSTOMER_ID` (`customer_id` ASC) VISIBLE,
  INDEX `FK__CART_ITEMS__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK__CART_ITEMS__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__CART_ITEMS__CUSTOMERS`
    FOREIGN KEY (`customer_id`)
    REFERENCES `e-commerce`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`orders` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` DOUBLE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `tracking_number` VARCHAR(45) NULL,
  `arrival_date` DATETIME NULL,
  `delivery_person` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `FK__ORDERS__CUSTOMERS`
    FOREIGN KEY (`customer_id`)
    REFERENCES `e-commerce`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`order_items` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`order_items` (
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`product_id`, `order_id`),
  INDEX `FK__ORDER_ITEMS__ORDER_ID` (`order_id` ASC) VISIBLE,
  INDEX `FK__ORDER_ITEMS__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK__ORDER_ITEMS__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__ORDER_ITEMS__ORDERS`
    FOREIGN KEY (`order_id`)
    REFERENCES `e-commerce`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`product_reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`product_reviews` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`product_reviews` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `rating_score` INT NOT NULL,
  `review` LONGTEXT NULL,
  PRIMARY KEY (`customer_id`, `product_id`),
  INDEX `FK__PRODUCT_REVIEWS__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  INDEX `FK__PRODUCT_REVIEWS__CUSTOMER_ID` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `FK__PRODUCT_REVIEWS__CUSTOMERS`
    FOREIGN KEY (`customer_id`)
    REFERENCES `e-commerce`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__PRODUCT_REVIEWS__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`coupons` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`coupons` (
  `coupon_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `coupon_desc` VARCHAR(45) NULL,
  `discount_percent` DECIMAL NULL,
  `discount_amount` DOUBLE NULL,
  `discount_limit` DOUBLE NULL,
  `expiration_date` DATETIME NULL,
  PRIMARY KEY (`coupon_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`products_coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`products_coupons` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`products_coupons` (
  `coupon_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`coupon_id`, `product_id`),
  INDEX `FK__PRODUCTS_COUPONS__PRODUCT_ID` (`product_id` ASC) VISIBLE,
  INDEX `FK__PRODUCTS_COUPONS__COUPON_ID` (`coupon_id` ASC) VISIBLE,
  CONSTRAINT `FK__PRODUCTS_COUPONS__COUPONS`
    FOREIGN KEY (`coupon_id`)
    REFERENCES `e-commerce`.`coupons` (`coupon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__PRODUCTS_COUPONS__PRODUCTS`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `e-commerce`.`products`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`products` (`product_id`, `sku`, `product_name`, `desc`) VALUES (DEFAULT, '53870', 'Amazon Echo Dot (3rd Gen) Smart Speaker with Alexa', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`product_id`, `sku`, `product_name`, `desc`) VALUES (DEFAULT, '34589', 'Apple – HomePod mini – Space Gray', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`product_id`, `sku`, `product_name`, `desc`) VALUES (DEFAULT, '18340', 'ecobee3 lite Smart Thermostat – Black', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`product_id`, `sku`, `product_name`, `desc`) VALUES (DEFAULT, '12378', 'Google – Nest Hello Smart Wi-Fi Video Doorbell', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`product_id`, `sku`, `product_name`, `desc`) VALUES (DEFAULT, '34545', 'Indoor/Outdoor Wire Free 1080p Security Camera', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`product_id`, `sku`, `product_name`, `desc`) VALUES (DEFAULT, '23458', 'LIFX Mini Color A19 – Multicolor', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`prices`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (1, '2020-01-01', NULL, 12412);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (2, '2020-01-01', NULL, 45565);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (3, '2020-01-01', NULL, 67567);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (4, '2020-01-01', NULL, 56757);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (5, '2020-01-01', NULL, 12390);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (6, '2021-10-15', NULL, 1239);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (1, '2020-02-01', '2020-03-30', 9999);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (2, '2020-05-25', '2020-05-30', 29999);
INSERT INTO `e-commerce`.`prices` (`product_id`, `start_date`, `end_date`, `price`) VALUES (6, '2020-12-31', NULL, 999);

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`tags`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`tags` (`tag_id`, `tag`) VALUES (DEFAULT, 'Nest');
INSERT INTO `e-commerce`.`tags` (`tag_id`, `tag`) VALUES (DEFAULT, 'Steel');
INSERT INTO `e-commerce`.`tags` (`tag_id`, `tag`) VALUES (DEFAULT, 'Thermostat');

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Accessories');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Assistants');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Cameras');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Category Grid');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Heating');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Lighting');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Speakers');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Thermostats');
INSERT INTO `e-commerce`.`categories` (`category_id`, `category`) VALUES (DEFAULT, 'Security');

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`customers`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'banlearit.siri@gmail.com', 'e82146238410edb61a4bebaaaf79b177e98d5bf572f5089fa42cb38ae34d2dfa', 'Banlearit', 'Siriboon', '{\"address\": {\"street\": \"609 Barrington Court\", \"City\": \"Piggott\"}}', '+1 316-311-6177', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'bonoxe2446@kuvasin.com', '0d1e5fab139fe6b34fad464f7e7fc59e9d2eff9a761932d66be5f9b9f8c3c442', 'Leonard', 'Novak', '{\"address\": {\"street\": \"3365 Poe Road\", \"City\": \"North Charleston\"}}', '+1 309-715-6386', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'dasole8187@nubotel.com', 'a0ac8f2ba8dab76a64dd989a421997a6d8d89e00dde7ada20a00eac48e44d508', 'Shaylee', 'Estrada', '{\"address\": { \"street\": \"1863 Hemlock Lane\", \"City\": \"Harlingen\"}}', '+1 505-644-2303', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'cotob97508@nubotel.com', '0550566a8aae53578df9db287a6beb840f82dea9fe364de0ee861408c607e48b', 'Yael', 'Hayes', '{\"address\": { \"street\": \"622 Shady Pines Drive\", \"City\": \"Wytheville\"}}', '+1 224-411-2818', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'deyicof678@nubotel.com', 'fb511352960b627340a8e66f991b8c5f43f9f1de2a1bbe9646fc1ba52b36b31a', 'Jamir', 'Weber', '{\"address\": {\"street\": \"4808 Sherman Street\", \"City\": \"Lawrence\"}}', '+1 218-980-9479', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'vajalod304@probdd.com', '8b89b7de6c1c9847953d37188f651a4392c46604ee7809fbb4053d83e366af83', 'Landon', 'Mclean', '{\"address\": {\"street\": \"2626 Glenview Drive\", \"City\": \"Corpus Christi\"}}', '+1 207-384-2684', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'pofaw36777@kuvasin.com', '512c0b1ea4c1197ceb3ced3703a0c4e2581e8afb5caeb0da405b3e2eeba089d1', 'Erik', 'Finley', '{\"address\": {\"street\": \"2900 Olen Thomas Drive\", \"City\": \"Wichita Falls\"}}', '+1 435-735-6720', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'sapobe7142@probdd.com', 'bc4e02087b195e22436957f331f3144da4bec1f317a21f85b1a4e165ba0b0e4f', 'Karma', 'Liu', '{\"address\": {\"street\": \"853 Woodland Terrace\", \"City\": \"Sacramento\"}}', '+1 505-219-2420', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'kaxoc93466@rubeshi.com', '8f13e0e3a432c7f5ec515fd213ce434368f2d87aca4baa1b02c871569ce1bb12', 'Shayna', 'Horn', '{\"address\": {\"street\": \"261 Oakridge Farm Lane\", \"City\": \"Milwaukee\"}}', '+1 225-928-5202', DEFAULT);
INSERT INTO `e-commerce`.`customers` (`customer_id`, `email`, `hashed_password`, `customer_name`, `customer_lastname`, `address`, `telephone`, `created_at`) VALUES (DEFAULT, 'jeyayos488@kuvasin.com', 'd4566c7ba4955b031d50fd727150d6862d2d3b947fac38688a2d384863a0ea09', 'Jeramiah', 'Villegas', '{\"address\": {\"street\": \"3419 Camden Street\", \"City\": \"Reno\"}}', '+1 505-406-9701', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`cart_items`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`cart_items` (`product_id`, `customer_id`, `quantity`) VALUES (1, 1, 1);
INSERT INTO `e-commerce`.`cart_items` (`product_id`, `customer_id`, `quantity`) VALUES (2, 1, 2);
INSERT INTO `e-commerce`.`cart_items` (`product_id`, `customer_id`, `quantity`) VALUES (6, 4, 1);
INSERT INTO `e-commerce`.`cart_items` (`product_id`, `customer_id`, `quantity`) VALUES (3, 2, 2);
INSERT INTO `e-commerce`.`cart_items` (`product_id`, `customer_id`, `quantity`) VALUES (4, 5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 1, DEFAULT, 2, 'Completed', 'FSW3JFFUGA', '2020-01-25', 'Leah Vincent');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 2, DEFAULT, 3, 'Completed', 'FXXJJNZQJE', '2020-01-25', 'Roberta Castaneda');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 6, DEFAULT, 1, 'Awaiting Pickup', 'BYZ9XEWKA3', '2020-03-27', 'Terry Roth');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 3, DEFAULT, 3, 'Awaiting Pickup', 'NGLDACCYZ7', '2021-06-05', 'Lynn Weber');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 4, DEFAULT, 2, 'Awaiting Pickup', 'BXTJ94VGEM', '2021-10-07', 'Sean Dennis');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 1, DEFAULT, 3, 'Declined', '36QNFLTDD5', '2021-10-20', 'Mr. Curtis Grimes');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 2, DEFAULT, 4, 'Refunded', 'YAWAEN2H4S', '2022-06-27', 'Jennifer Phillips');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 6, DEFAULT, 2, 'Awaiting Shipment', 'CLQ9RWNDEE', '2022-06-25', 'Laura Hall');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 3, DEFAULT, 1, 'Awaiting Fulfillment', '3JHKAYFQ9K', '2022-10-30', 'David Nolan');
INSERT INTO `e-commerce`.`orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (DEFAULT, 4, DEFAULT, 3, 'Pending', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`order_items`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`order_items` (`product_id`, `order_id`, `quantity`) VALUES (1, 1, 2);
INSERT INTO `e-commerce`.`order_items` (`product_id`, `order_id`, `quantity`) VALUES (2, 1, 2);
INSERT INTO `e-commerce`.`order_items` (`product_id`, `order_id`, `quantity`) VALUES (6, 4, 1);
INSERT INTO `e-commerce`.`order_items` (`product_id`, `order_id`, `quantity`) VALUES (3, 2, 3);
INSERT INTO `e-commerce`.`order_items` (`product_id`, `order_id`, `quantity`) VALUES (4, 5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`product_reviews`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`product_reviews` (`customer_id`, `product_id`, `rating_score`, `review`) VALUES (1, 1, 4, 'I use this in my bathroom. It\'s pretty loud so it\'s easy to hear while your taking a shower. That said however I\'m upgrading to the Echo Dot 4th Generation with the clock. It\'s a sphere and releasing in October or November. The 3rd Gen Dot I have now has the clock on it.');
INSERT INTO `e-commerce`.`product_reviews` (`customer_id`, `product_id`, `rating_score`, `review`) VALUES (2, 1, 4, 'I got one when they came out. Don\'t use it very much but it sounds very good so it\'s nice to have on my desk for some music here and there. But for smart home control I\'ve got Alexa devices.');
INSERT INTO `e-commerce`.`product_reviews` (`customer_id`, `product_id`, `rating_score`, `review`) VALUES (6, 4, 5, NULL);
INSERT INTO `e-commerce`.`product_reviews` (`customer_id`, `product_id`, `rating_score`, `review`) VALUES (3, 2, 2, NULL);
INSERT INTO `e-commerce`.`product_reviews` (`customer_id`, `product_id`, `rating_score`, `review`) VALUES (4, 5, 3, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `e-commerce`.`coupons`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`coupons` (`coupon_id`, `code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES (DEFAULT, 'BF2022', NULL, 0.05, NULL, 99, '2022-11-28');
INSERT INTO `e-commerce`.`coupons` (`coupon_id`, `code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES (DEFAULT, 'XOXO12', NULL, NULL, 1000, NULL, '2022-09-10');
INSERT INTO `e-commerce`.`coupons` (`coupon_id`, `code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES (DEFAULT, 'HPNY2023', NULL, NULL, 1500, NULL, '2023-01-31');
INSERT INTO `e-commerce`.`coupons` (`coupon_id`, `code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES (DEFAULT, 'SALE75', NULL, 0.75, NULL, 2000, '2023-02-25');

COMMIT;

