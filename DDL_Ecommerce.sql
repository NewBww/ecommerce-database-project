-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `price` DOUBLE NOT NULL,
  `end_date` DATETIME NULL,
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
  `created_at` DATETIME NOT NULL DEFAULT (CURRENT_DATE),
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
  `item_amount` INT NOT NULL,
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
  `order_date` DATETIME NOT NULL DEFAULT (CURRENT_DATE),
  `amount` DOUBLE NOT NULL,
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
  `item_amount` INT NOT NULL,
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
