---- QUERY MENGGUNAKAN POSTGRESQL 14 ----
---- A. MENYIAPKAN KEBUTUHAN DATA ----
--- 1. MEMBUAT DATABASE "realpaedi" ---
--- 2. MEMBUAT TABLE ---
CREATE TABLE customer(
	customer_id VARCHAR,
	customer_name VARCHAR,
	segment VARCHAR
)

CREATE TABLE order_pesanan(
	order_id VARCHAR,
	customer_id VARCHAR,
	postal_code VARCHAR,
	product_id VARCHAR,
	sales FLOAT,
	quantity INT,
	discount FLOAT,
	profit FLOAT
)

CREATE TABLE product(
	product_id VARCHAR,
	category VARCHAR,
	sub_category VARCHAR,
	product_name VARCHAR
)

CREATE TABLE region(
	county VARCHAR,
	city VARCHAR,
	state VARCHAR,
	postal_code VARCHAR,
	region VARCHAR
)

CREATE TABLE shipment(
	order_id VARCHAR,
	order_date DATE,
	ship_date DATE,
	ship_mode VARCHAR
)

--- 3. IMPORT DATA CSV FROM FILE DIRECTORY ---

--- 4. SELECT * FROM TABLE ----



---- B. MATERI SQL JOIN ----
--- 1. INNER JOIN -> MENAMPILKAN DATA DI KEDUA KOLOM ---
SELECT * FROM
	customer
INNER JOIN
	order_pesanan
ON
	customer.customer_id = order_pesanan.customer_id
LIMIT 10

--- 2. LEFT JOIN -> MENGAWETKAN DATA YANG ADA DI SEBELAH KIRI DAN DILENGKAPI DENGAN TABLE DI SEBALAH KANAN ---
SELECT * FROM
	customer
LEFT JOIN
	order_pesanan
ON
	customer.customer_id = order_pesanan.customer_id
LIMIT 10

--- 3. RIGT JOIN -> KEBALIKAN LEFT JOIN ---
SELECT * FROM
	customer
RIGHT JOIN
	order_pesanan
ON
	customer.customer_id = order_pesanan.customer_id
LIMIT 10

--- 4. FULL OUTER -> MENAMPILKAN ALL DATA ---
SELECT * FROM
	customer
FULL JOIN
	order_pesanan
ON
	customer.customer_id = order_pesanan.customer_id
LIMIT 10
