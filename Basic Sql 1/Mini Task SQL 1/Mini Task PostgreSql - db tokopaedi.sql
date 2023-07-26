-- Mini Task --
--- Create database "tokopaedi"
--- Create tabel orders ---

-- Create Table --
create table orders(
	order_id VARCHAR(50) primary key,
	customer_id VARCHAR(10),
	portal_code INT,
	product_id VARCHAR(50),
	sales FLOAT,
	quantity INT,
	discount FLOAT,
	profit INT,
	category VARCHAR(50),
	subcategory VARCHAR(20),
	product_name VARCHAR(50),
	order_date DATE,
	ship_date DATE,
	ship_mode VARCHAR(20),
	customer_name VARCHAR(100),
	segment VARCHAR(20),
	country VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(100),
	region VARCHAR(10)
)


-- Select Table --
select * from orders


-- Insert Table --
--- Insert Data 1 ---
insert into orders values (
	'CA-2019-152156',
	'CG-12520',
	42420,
	'FUR-BO-10001798',
	261.96,
	2,
	0,
	41.9136,
	'Furniture',
	'Bookcases',
	'Bush Somerset',
	'2019/11/8',
	'2019/11/11',
	'Second Class',
	'Claire Gute',
	'Consumer',
	'United States',
	'Henderson',
	'Kentucky',
	'South'
)

--- Insert Data 2 ---
insert into orders values (
	'CA-2019-152255',
	'CG-12520',
	42420,
	'FUR-CH-10000454',
	731.94,
	3,
	0,
	219.582,
	'Furniture',
	'Chairs',
	'Hon Deluxe',
	'2019/11/8',
	'2019/11/11',
	'Second Class',
	'Claire Gute',
	'Consumer',
	'United States',
	'Henderson',
	'Kentucky',
	'South'
)

--- Insert Data 3 ---
insert into orders values (
	'CA-2019-138688',
	'DV-13045',
	90036,
	'OFF-LA-10000240',
	14.26,
	2,
	0,
	6.8714,
	'Office Supplies',
	'Labels',
	'Self-Adhesive',
	'2019/6/12',
	'2019/6/16',
	'Second Class',
	'Darrin Van Huff',
	'Corporate',
	'United States',
	'Los Angeles',
	'California',
	'West'
)

--- Insert Data 4 ---
insert into orders values (
	'US-2018-108966',
	'SO-20335',
	33311,
	'FUR-TA-10000577',
	957.5775,
	5,
	0.45,
	-383.031,
	'Furniture',
	'Tables',
	'Bretford CR4500',
	'2018/10/11',
	'2018/10/18',
	'Standard Class',
	'Sean O Donnell',
	'Consumer',
	'United States',
	'Fort Lauderdale',
	'Florida',
	'South'
)
