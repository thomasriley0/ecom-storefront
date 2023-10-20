INSERT INTO "users" (username, password, email, first_name, last_name, mobile, created_at, modified_at) VALUES('usernameTest', '$2a$12$4vDQ0CHc8sjgQGVHpiIvtekvvBaIiG2NZooaCmZNEFmOvHokxDBie', 'johndoe@gmail.com', 'john', 'doe', '13193848584', '2023-10-19 18:39:00', '2023-10-19 18:39:00');

INSERT INTO "user_address"(user_id, address_line_1, address_line_2, city, postal_code, mobile) VALUES (1, '130 example st', 'apt 15', 'boulder', '80302', '1234567890');

INSERT INTO "product_category" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Decor', 'This cateogry contains modern home decor.', '2023-10-16 17:12:00', '2023-10-19 17:12:00' );
INSERT INTO "product_category" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Lighting', 'This cateogry contains lighting products such as lamps.', '2023-10-19 17:12:00', '2023-10-19 17:12:00' );

INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (156, '2023-10-17 18:39:00', '2023-10-17 18:39:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (199, '2023-10-18 17:12:00', '2023-10-18 17:12:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (214, '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, inventory_id, price, created_at, modified_at) VALUES ('59in Marble Base Hutton Floor Lamp', 'Add a touch of functional flair to your space with the contemporary design and smooth, matte finish of this striking floor lamp', 'https://img.homegoods.com/homegoods?set=DisplayName[e8],prd[7000032094_NS10469968],ag[YES]&call=url[file:tjxrPRD2_prod.chain]&v=3', 'A1', 2, 1, 67.42, '2023-10-17 18:39:00', '2023-10-17 18:39:00');
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, inventory_id, price, created_at, modified_at) VALUES ('66in Metal Adjustable Task Floor Lamp', 'Bring farmhouse flair to your space with the vintage-inspired design of this charming floor lamp' , 'https://img.homegoods.com/homegoods?set=DisplayName[e8],prd[7000029098_NS9873361],ag[no]&call=url[file:tjxrPRD2_prod.chain]&v=3', 'A2', 2, 2, 79.99, '2023-10-18 18:39:00', '2023-10-19 18:39:00' );
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, inventory_id, price, created_at, modified_at) VALUES ('67in Faux Bamboo Floor Lamp', 'Stylishly switch up your space with the statement silhouette and hammered texture of this eye-catching floor lamp','https://img.homegoods.com/homegoods?set=DisplayName[e8],prd[7000036074_NS9861225],ag[no]&call=url[file:tjxrPRD2_prod.chain]&v=3','A3', 2, 3, 99.99, '2023-10-19 18:39:00', '2023-10-19 18:39:00' );

INSERT INTO "shopping_session" (user_id, total, created_at, modified_at) VALUES (1, 67.42, '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "cart_item" (session_id, product_id, quantity, created_at, modified_at) VALUES (1, 1, 1, '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "payment_details"(amount, provider, invoice_id, status, created_at, modified_at) VALUES (67.42, 'Stripe', 'in_1NypNj2eZvKYlo2CY8o2vYlx', 'Complete', '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "order_details" (user_id, total, payment_id, created_at, modified_at) VALUES (1, 67.42, 1, '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "order_items" (order_id, product_id, quantity, created_at, modified_at) VALUES (1, 1, 1, '2023-10-19 17:12:00', '2023-10-19 17:12:00');


