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
  `product_id` INT NOT NULL,
  `sku` VARCHAR(45) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `desc` JSON NOT NULL,
  PRIMARY KEY (`product_id`))
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`prices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`prices` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`prices` (
  `product_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`product_id`, `start_date`),
  INDEX `fk_prices_products_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_prices_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`tags` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`tags` (
  `tag_id` INT NOT NULL,
  `tag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`categories` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`categories` (
  `category_id` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`products_have_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`products_have_tags` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`products_have_tags` (
  `tag_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `product_id`),
  INDEX `fk_tags_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_tags_has_products_tags1_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_tags_has_products_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `e-commerce`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`products_have_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`products_have_categories` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`products_have_categories` (
  `category_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `product_id`),
  INDEX `fk_categories_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_categories_has_products_categories1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_categories_has_products_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `e-commerce`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`customers` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`customers` (
  `customer_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `hashed_password` CHAR(64) NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_lastname` VARCHAR(45) NULL,
  `address` JSON NULL,
  `telephone` VARCHAR(15) NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
  INDEX `fk_products_has_customers_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_products_has_customers_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_customers_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_customers_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `e-commerce`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`orders` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`orders` (
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `e-commerce`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`order_items` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`order_items` (
  `product_id` INT NOT NULL,
  `order_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_id`, `order_id`),
  INDEX `fk_products_has_orders_orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_products_has_orders_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_orders_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_orders_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `e-commerce`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`payment_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`payment_details` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`payment_details` (
  `order_id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_payment_details_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `e-commerce`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`product_reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`product_reviews` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`product_reviews` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `rating_score` INT NOT NULL,
  `rating_desc` LONGTEXT NULL,
  PRIMARY KEY (`customer_id`, `product_id`),
  INDEX `fk_customers_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_customers_has_products_customers1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_has_products_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `e-commerce`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`coupons` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`coupons` (
  `coupon_id` INT NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `coupon_desc` VARCHAR(45) NULL,
  `discount_percent` DECIMAL NULL,
  `discount_amount` DOUBLE NULL,
  `discount_limit` DOUBLE NULL,
  PRIMARY KEY (`coupon_id`))
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`coupons_for_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`coupons_for_products` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`coupons_for_products` (
  `coupon_id` INT NOT NULL,
  `product_id` INT NULL,
  PRIMARY KEY (`coupon_id`, `product_id`),
  INDEX `fk_coupons_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_coupons_has_products_coupons1_idx` (`coupon_id` ASC) VISIBLE,
  CONSTRAINT `fk_coupons_has_products_coupons1`
    FOREIGN KEY (`coupon_id`)
    REFERENCES `e-commerce`.`coupons` (`coupon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_coupons_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `e-commerce`.`shipment_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e-commerce`.`shipment_details` ;

CREATE TABLE IF NOT EXISTS `e-commerce`.`shipment_details` (
  `order_id` INT NOT NULL,
  `shipment_serial` VARCHAR(45) NOT NULL,
  `arrival_date` DATETIME NULL,
  `delivery_person` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_shipment_details_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `e-commerce`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
