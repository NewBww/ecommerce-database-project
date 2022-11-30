USE `e-commerce`;

SELECT * FROM cart_items;
SELECT * FROM categories;
SELECT * FROM coupons;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM prices;
SELECT * FROM product_reviews;
SELECT * FROM products;
SELECT * FROM products_categories;
SELECT * FROM products_coupons;
SELECT * FROM products_tags;
SELECT * FROM products_coupons;
SELECT * FROM tags;

SELECT c.customer_id, CONCAT(c.customer_firstname, ' ', c.customer_lastname) AS fullname, c.email, c.address->'$.address.City' AS City, c.address->'$.address.street' AS street, c.telephone, c.created_at
FROM customers c JOIN product_reviews pr ON c.customer_id = pr.customer_id
WHERE pr.review IS NOT NULL;

UPDATE products SET `desc` = JSON_INSERT(`desc`,'$.overview','Take control of your home’s heating
Maintain a comfortable climate in your home and conserve energy with the Google Nest Learning Thermostat 3rd Gen Stainless Steel.
It becomes accustomed to your habits and schedule over time, making adjustments automatically at certain times of the day.
You can also see data received from your individual temperature sensors and raise or lower the temperature as needed from anywhere
using your mobile device.')
WHERE (SELECT MAX(rating_score)
FROM product_reviews);
SELECT p.product_id, pr.rating_score, p.desc
FROM products p JOIN product_reviews pr USING(product_id)
ORDER BY pr.rating_score DESC;


CREATE OR REPLACE VIEW products_prices_view (productName,price,start_date,end_date) AS
SELECT product_name,price,start_date,end_date
FROM products JOIN prices p USING(product_id)
ORDER BY product_name, start_date;
SELECT * FROM products_prices_view;

CREATE OR REPLACE VIEW delivered_order_items_view (customer_id, product_name, quantity) AS SELECT customer_id, product_name, quantity
FROM customers JOIN (SELECT customer_id, product_name, quantity, arrival_date
                     FROM products JOIN order_items USING(product_id) JOIN orders USING(order_id)) AS product_quantities_names USING(customer_id)
WHERE DATE(arrival_date) < DATE(NOW());
SELECT * FROM delivered_order_items_view;
SELECT DATE(arrival_date), DATE(NOW())
FROM orders;

SELECT product_id, product_name, COUNT(product_id) AS num_of_product
FROM products
WHERE JSON_EXTRACT(`desc`, '$.overview') IS NOT NULL
GROUP BY product_id, product_name;