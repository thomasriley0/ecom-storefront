INSERT INTO "users" (username, password, email, first_name, last_name, mobile, created_at, modified_at) VALUES('johndoe', 'pass', 'johndoe@gmail.com', 'john', 'doe', '13193848584', '2023-10-19 18:39:00', '2023-10-19 18:39:00');
INSERT INTO "users" (username, password, email, first_name, last_name, mobile, created_at, modified_at) VALUES('johhnyapple', 'pass', 'johhnyapple@gmail.com', 'johnny', 'apple', '12193548524', '2023-10-20 18:39:00', '2023-10-20 18:39:00');

INSERT INTO "user_address"(user_id, address_line_1, address_line_2, city, postal_code, mobile) VALUES (1, '130 example st', 'apt 15', 'boulder', '80302', '1234567890');

INSERT INTO "product_category" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Decor', 'This cateogry contains modern home decor.', '2023-10-16 17:12:00', '2023-10-19 17:12:00' );
INSERT INTO "product_category" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Lighting', 'This cateogry contains lighting products such as lamps.', '2023-10-19 17:12:00', '2023-10-19 17:12:00' );

INSERT INTO "product_subcategory" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Floor Lamps', 'This sub-category contains floor lamps.', '2023-10-19 17:12:00', '2023-10-19 17:12:00' );
INSERT INTO "product_subcategory" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Table Lamps', 'This sub-category contains table lamps.', '2023-10-19 10:12:00', '2023-10-19 10:12:00' );
INSERT INTO "product_subcategory" (categoryName, categoryDesc, created_at, modified_at) VALUES ('Light Fixture', 'This sub-category contains light fixtures.', '2023-10-19 10:12:00', '2023-10-19 10:12:00' );

INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (156, '2023-10-17 18:39:00', '2023-10-17 18:39:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (199, '2023-10-18 17:12:00', '2023-10-18 17:12:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (214, '2023-10-19 17:12:00', '2023-10-19 17:12:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (314, '2023-10-20 17:12:00', '2023-10-20 17:12:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (299, '2023-10-21 17:12:00', '2023-10-21 17:12:00');
INSERT INTO "product_inventory" (quantity, created_at, modified_at) VALUES (322, '2023-10-22 17:12:00', '2023-10-22 17:12:00');

INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, subcategory_id, inventory_id, price, created_at, modified_at) VALUES ('59in Marble Base Hutton Floor Lamp', 'Add a touch of functional flair to your space with the contemporary design and smooth, matte finish of this striking floor lamp', 'https://img.homegoods.com/homegoods?set=DisplayName[e8],prd[7000032094_NS10469968],ag[YES]&call=url[file:tjxrPRD2_prod.chain]&v=3', 'A1', 2, 1, 1, 67.42, '2023-10-17 18:39:00', '2023-10-17 18:39:00');
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, subcategory_id, inventory_id, price, created_at, modified_at) VALUES ('66in Metal Adjustable Task Floor Lamp', 'Bring farmhouse flair to your space with the vintage-inspired design of this charming floor lamp' , 'https://img.homegoods.com/homegoods?set=DisplayName[e8],prd[7000029098_NS9873361],ag[no]&call=url[file:tjxrPRD2_prod.chain]&v=3', 'A2', 2, 1, 2, 79.99, '2023-10-18 18:39:00', '2023-10-19 18:39:00' );
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, subcategory_id, inventory_id, price, created_at, modified_at) VALUES ('67in Faux Bamboo Floor Lamp', 'Stylishly switch up your space with the statement silhouette and hammered texture of this eye-catching floor lamp','https://img.homegoods.com/homegoods?set=DisplayName[e8],prd[7000036074_NS9861225],ag[no]&call=url[file:tjxrPRD2_prod.chain]&v=3','A3', 2, 1, 3, 99.99, '2023-10-19 18:39:00', '2023-10-19 18:39:00' );
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, subcategory_id, inventory_id, price, created_at, modified_at) VALUES ('Bittle Metal Table Lamp', 'Bring back some old-world style to your living space with this fantastic iron lamp. It features an iron and glass vintage camping-style lantern base and has a burlap neutral shade that will work in any decor.','https://assets.wfcdn.com/im/37904347/resize-h800-w800%5Ecompr-r85/4317/43175747/Bittle+Metal+Table+Lamp.jpg','A4', 2, 2, 4, 99.99, '2023-10-20 18:39:00', '2023-10-20 18:39:00' );
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, subcategory_id, inventory_id, price, created_at, modified_at) VALUES ('Metal Desk Lamp', 'This lamp measures: 12.5" (H) x 4.7" (D) x 4.7" (W), the perfect little gold table lamp for any desk, with a solid plated aluminum frame and standard base.','https://assets.wfcdn.com/im/91211542/resize-h800-w800%5Ecompr-r85/1932/193245922/Metal+Desk+Lamp.jpg','A5', 2, 2, 5, 99.99, '2023-10-21 18:39:00', '2023-10-21 18:39:00' );
INSERT INTO "product"(productName, productDesc, imageLink, SKU, category_id, subcategory_id, inventory_id, price, created_at, modified_at) VALUES ('Light Dimmable Sputnik Modern Linear Chandelier', ' The 12-light Sputnik Chandelier is a spectacularly versatile piece that complements many different decor styles. Mid-century Brushed Brass finish pairs perfectly to elevate this industrial pendant to luxury. ','https://assets.wfcdn.com/im/97451914/resize-h445%5Ecompr-r85/2440/244050546/Croner+12+-+Light+Dimmable+Sputnik+Modern+Linear+Chandelier.jpg','A6', 2, 3, 6, 214.99, '2023-10-22 18:39:00', '2023-10-22 18:39:00' );

INSERT INTO "shopping_session" (user_id, total, created_at, modified_at) VALUES (1, 147.41, '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "cart_item" (session_id, product_id, quantity, created_at, modified_at) VALUES (1, 1, 1, '2023-10-19 17:12:00', '2023-10-19 17:12:00');
INSERT INTO "cart_item" (session_id, product_id, quantity, created_at, modified_at) VALUES (1, 2, 1, '2023-10-19 17:13:00', '2023-10-19 17:13:00');

INSERT INTO "payment_details"(amount, provider, invoice_id, status, created_at, modified_at) VALUES (67.42, 'Stripe', 'in_1NypNj2eZvKYlo2CY8o2vYlx', 'Complete', '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "order_details" (user_id, total, payment_id, created_at, modified_at) VALUES (1, 67.42, 1, '2023-10-19 17:12:00', '2023-10-19 17:12:00');

INSERT INTO "order_items" (order_id, product_id, quantity, created_at, modified_at) VALUES (1, 1, 1, '2023-10-19 17:12:00', '2023-10-19 17:12:00');


