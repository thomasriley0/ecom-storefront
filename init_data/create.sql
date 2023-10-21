CREATE TABLE "users"(
  id SERIAL PRIMARY KEY, 
  username VARCHAR(32) NOT NULL, 
  password TEXT NOT NULL, 
  email VARCHAR(128) NOT NULL,
  first_name VARCHAR(64), 
  last_name VARCHAR(64), 
  mobile VARCHAR(32), 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP
);

CREATE TABLE "user_address"(
  id SERIAL PRIMARY KEY, 
  user_id INT, 
  address_line_1 varchar(128), 
  address_line_2 varchar(128), 
  city varchar(64), 
  postal_code varchar(32), 
  mobile varchar(32), 
  FOREIGN KEY (user_id) REFERENCES "users"(id)
);

CREATE TABLE "payment_details"(
  id SERIAL PRIMARY KEY, 
  amount INT NOT NULL, 
  provider VARCHAR(128) NOT NULL, 
  invoice_id VARCHAR(256),
  status VARCHAR(128) NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP
);

CREATE TABLE "order_details"(
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  total DECIMAL NOT NULL, 
  payment_id INT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES "users"(id),
  FOREIGN KEY (payment_id) REFERENCES "payment_details"(id)
);


CREATE TABLE "shopping_session"(
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  total DECIMAL NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES "users"(id)
);

CREATE TABLE "product_category"(
  id SERIAL PRIMARY KEY, 
  categoryName VARCHAR(256) NOT NULL, 
  categoryDesc TEXT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  deleted_at TIMESTAMP
);

CREATE TABLE "product_subcategory" (
  id SERIAL PRIMARY KEY,
  category_id INT,
  categoryName VARCHAR(256) NOT NULL, 
  categoryDesc TEXT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  FOREIGN KEY (category_id) REFERENCES "product_category"(id)

);

CREATE TABLE "product_inventory"(
  id SERIAL PRIMARY KEY, quantity INT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, modified_at TIMESTAMP, 
  deleted_at TIMESTAMP
);

CREATE TABLE "product"(
  id SERIAL PRIMARY KEY, 
  productName VARCHAR(256) NOT NULL, 
  productDesc TEXT NOT NULL, 
  imageLink VARCHAR(256) NOT NULL,
  SKU  VARCHAR(256) NOT NULL, 
  category_id INT NOT NULL, 
  subcategory_id INT,
  inventory_id INT NOT NULL, 
  price DECIMAL NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  deleted_at TIMESTAMP, 
  FOREIGN KEY (inventory_id) REFERENCES "product_inventory"(id), 
  FOREIGN KEY (category_id) REFERENCES "product_category"(id),
  FOREIGN KEY (subcategory_id) REFERENCES "product_subcategory"(id)

);

CREATE TABLE "cart_item"(
  id SERIAL PRIMARY KEY, 
  session_id INT NOT NULL, 
  product_id INT NOT NULL, 
  quantity INT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  FOREIGN KEY (session_id) REFERENCES "shopping_session"(id), 
  FOREIGN KEY (product_id) REFERENCES "product"(id)
);


CREATE TABLE "order_items"(
  id SERIAL PRIMARY KEY, 
  order_id INT NOT NULL, 
  product_id INT NOT NULL, 
  quantity INT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modified_at TIMESTAMP, 
  FOREIGN KEY (order_id) REFERENCES "order_details"(id), 
  FOREIGN KEY (product_id) REFERENCES "product"(id)
);

