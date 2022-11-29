-- -----------------------------------------------------
-- Data for table `e-commerce`.`products`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`products` (`sku`, `product_name`, `desc`) VALUES ('53870', 'Amazon Echo Dot (3rd Gen) Smart Speaker with Alexa', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`sku`, `product_name`, `desc`) VALUES ('34589', 'Apple – HomePod mini – Space Gray', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`sku`, `product_name`, `desc`) VALUES ('18340', 'ecobee3 lite Smart Thermostat – Black', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`sku`, `product_name`, `desc`) VALUES ('12378', 'Google – Nest Hello Smart Wi-Fi Video Doorbell', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`sku`, `product_name`, `desc`) VALUES ('34545', 'Indoor/Outdoor Wire Free 1080p Security Camera', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');
INSERT INTO `e-commerce`.`products` (`sku`, `product_name`, `desc`) VALUES ('23458', 'LIFX Mini Color A19 – Multicolor', '{\"desc\": \"The Nest Learning Thermostat is a smart thermostat that learns your schedule and programs itself to help save energy. You can control it from anywhere with the Nest app, and it works with Alexa and Google Assistant so you can adjust the temperature with your voice. And it’s beautifully designed, with a big, bright display.\"}');

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
INSERT INTO `e-commerce`.`tags` (`tag`) VALUES ('Nest');
INSERT INTO `e-commerce`.`tags` (`tag`) VALUES ('Steel');
INSERT INTO `e-commerce`.`tags` (`tag`) VALUES ('Thermostat');

COMMIT;

-- -----------------------------------------------------
-- Data for table `e-commerce`.`categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Accessories');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Assistants');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Cameras');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Category Grid');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Heating');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Lighting');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Speakers');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Thermostats');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Security');
INSERT INTO `e-commerce`.`categories` (`category`) VALUES ('Doorbells');

COMMIT;

-- -----------------------------------------------------
-- Data for table `e-commerce`.`products_tags`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (1, 1);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (1, 3);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (2, 1);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (2, 2);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (2, 3);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (3, 1);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (3, 2);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (3, 3);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (4, 1);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (4, 2);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (4, 3);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (5, 1);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (5, 2);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (5, 3);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (6, 1);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (6, 2);
INSERT INTO `e-commerce`.`products_tags` (`product_id`, `tag_id`) VALUES (6, 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `e-commerce`.`products_categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 1);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 2);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 3);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 4);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 5);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 6);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 7);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (1, 8);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (2, 1);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 2);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 3);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 4);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 5);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 6);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 9);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 7);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (3, 8);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (4, 9);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (5, 10);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (5, 9);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (6, 1);
INSERT INTO `e-commerce`.`products_categories` (`product_id`, `category_id`) VALUES (6, 6);

COMMIT;

-- -----------------------------------------------------
-- Data for table `e-commerce`.`customers`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('banlearit.siri@gmail.com', 'e82146238410edb61a4bebaaaf79b177e98d5bf572f5089fa42cb38ae34d2dfa', 'Banlearit', 'Siriboon', '{\"address\": {\"street\": \"609 Barrington Court\", \"City\": \"Piggott\"}}', '+1 316-311-6177');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('bonoxe2446@kuvasin.com', '0d1e5fab139fe6b34fad464f7e7fc59e9d2eff9a761932d66be5f9b9f8c3c442', 'Leonard', 'Novak', '{\"address\": {\"street\": \"3365 Poe Road\", \"City\": \"North Charleston\"}}', '+1 309-715-6386');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('dasole8187@nubotel.com', 'a0ac8f2ba8dab76a64dd989a421997a6d8d89e00dde7ada20a00eac48e44d508', 'Shaylee', 'Estrada', '{\"address\": { \"street\": \"1863 Hemlock Lane\", \"City\": \"Harlingen\"}}', '+1 505-644-2303');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('cotob97508@nubotel.com', '0550566a8aae53578df9db287a6beb840f82dea9fe364de0ee861408c607e48b', 'Yael', 'Hayes', '{\"address\": { \"street\": \"622 Shady Pines Drive\", \"City\": \"Wytheville\"}}', '+1 224-411-2818');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('deyicof678@nubotel.com', 'fb511352960b627340a8e66f991b8c5f43f9f1de2a1bbe9646fc1ba52b36b31a', 'Jamir', 'Weber', '{\"address\": {\"street\": \"4808 Sherman Street\", \"City\": \"Lawrence\"}}', '+1 218-980-9479');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('vajalod304@probdd.com', '8b89b7de6c1c9847953d37188f651a4392c46604ee7809fbb4053d83e366af83', 'Landon', 'Mclean', '{\"address\": {\"street\": \"2626 Glenview Drive\", \"City\": \"Corpus Christi\"}}', '+1 207-384-2684');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('pofaw36777@kuvasin.com', '512c0b1ea4c1197ceb3ced3703a0c4e2581e8afb5caeb0da405b3e2eeba089d1', 'Erik', 'Finley', '{\"address\": {\"street\": \"2900 Olen Thomas Drive\", \"City\": \"Wichita Falls\"}}', '+1 435-735-6720');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('sapobe7142@probdd.com', 'bc4e02087b195e22436957f331f3144da4bec1f317a21f85b1a4e165ba0b0e4f', 'Karma', 'Liu', '{\"address\": {\"street\": \"853 Woodland Terrace\", \"City\": \"Sacramento\"}}', '+1 505-219-2420');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('kaxoc93466@rubeshi.com', '8f13e0e3a432c7f5ec515fd213ce434368f2d87aca4baa1b02c871569ce1bb12', 'Shayna', 'Horn', '{\"address\": {\"street\": \"261 Oakridge Farm Lane\", \"City\": \"Milwaukee\"}}', '+1 225-928-5202');
INSERT INTO `e-commerce`.`customers` (`email`, `hashed_password`, `customer_firstname`, `customer_lastname`, `address`, `telephone`) VALUES ('jeyayos488@kuvasin.com', 'd4566c7ba4955b031d50fd727150d6862d2d3b947fac38688a2d384863a0ea09', 'Jeramiah', 'Villegas', '{\"address\": {\"street\": \"3419 Camden Street\", \"City\": \"Reno\"}}', '+1 505-406-9701');

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
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (1, 2, 'Completed', 'FSW3JFFUGA', '2020-01-25', 'Leah Vincent');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (2, 3, 'Completed', 'FXXJJNZQJE', '2020-01-25', 'Roberta Castaneda');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (6, 1, 'Awaiting Pickup', 'BYZ9XEWKA3', '2020-03-27', 'Terry Roth');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (3, 3, 'Awaiting Pickup', 'NGLDACCYZ7', '2021-06-05', 'Lynn Weber');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (4, 2, 'Awaiting Pickup', 'BXTJ94VGEM', '2021-10-07', 'Sean Dennis');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (1, 3, 'Declined', '36QNFLTDD5', '2021-10-20', 'Mr. Curtis Grimes');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (2, 4, 'Refunded', 'YAWAEN2H4S', '2022-06-27', 'Jennifer Phillips');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (6, 2, 'Awaiting Shipment', 'CLQ9RWNDEE', '2022-06-25', 'Laura Hall');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (3, 1, 'Awaiting Fulfillment', '3JHKAYFQ9K', '2022-10-30', 'David Nolan');
INSERT INTO `e-commerce`.`orders` (`customer_id`, `total_amount`, `status`, `tracking_number`, `arrival_date`, `delivery_person`) VALUES (4, 3, 'Pending', NULL, NULL, NULL);

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
INSERT INTO `e-commerce`.`coupons` (`code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES ('BF2022', NULL, 0.05, NULL, 99, '2022-11-28');
INSERT INTO `e-commerce`.`coupons` (`code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES ('XOXO12', NULL, NULL, 1000, NULL, '2022-09-10');
INSERT INTO `e-commerce`.`coupons` (`code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES ('HPNY2023', NULL, NULL, 1500, NULL, '2023-01-31');
INSERT INTO `e-commerce`.`coupons` (`code`, `coupon_desc`, `discount_percent`, `discount_amount`, `discount_limit`, `expiration_date`) VALUES ('SALE75', NULL, 0.75, NULL, 2000, '2023-02-25');

COMMIT;

-- -----------------------------------------------------
-- Data for table `e-commerce`.`products_coupons`
-- -----------------------------------------------------
START TRANSACTION;
USE `e-commerce`;
INSERT INTO `e-commerce`.`products_coupons` (`coupon_id`, `product_id`) VALUES (1, 3);
INSERT INTO `e-commerce`.`products_coupons` (`coupon_id`, `product_id`) VALUES (2, 6);
INSERT INTO `e-commerce`.`products_coupons` (`coupon_id`, `product_id`) VALUES (3, 5);
INSERT INTO `e-commerce`.`products_coupons` (`coupon_id`, `product_id`) VALUES (4, 2);

COMMIT;