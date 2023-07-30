-- Buat database tokopaedi --
-- Klik kanan pada database tokopaedi -> query tool --
-- Eksekusi query yang sudah diberikan --


--- 1. Query select ---
-- Menampilkan table orders --
SELECT * FROM orders

-- Memilih hanya sebagian kolom --
-- Panggil nama kolomnya pisahkan dengan koma --
SELECT 
	customer_id, 
	product_id 
FROM 
	orders

--- Select distinct -> menampilkan data berbeda-beda ---
-- Select distinct segment --
SELECT 
	DISTINCT segment
FROM
	orders
	
-- Select distinct category --
SELECT
	DISTINCT category
FROM
	orders

-- Select distinct subcategory --
SELECT
	DISTINCT subcategory
FROM
	orders

-- Select distinct ship_mode --
SELECT
	DISTINCT ship_mode
FROM
	orders

-- Select 4 kombinasi kolom pada distinct --
SELECT
DISTINCT
	segment, 
	category, 
	subcategory, 
	ship_mode
FROM
	orders


--- 2. Query where -> kondisional untuk filter data ---
-- Menampilkan semua data yang merupakan transaksi di kota Los Angeles --
-- Kutip (') untuk nilai literal atau teks --
-- Kutip (") untuk kolom misalnya customer_id --
SELECT * FROM 
	orders 
WHERE 
	city = 'Los Angeles'

-- Menampilkan semua transaksi yang salesnya diatas 100 dollar --
SELECT * FROM
	orders
WHERE
	sales > 100

-- Pilih semua transaksi yang merugikan --
select * from
	orders
where
	profit  < 0


--- 3. Query operator logika ---
-- Bagaimana kalau memfilter dengan banyak kondisi --
-- Menggunakan operator logika -> AND, OR, NOT --

-- Contoh query operator AND --
-- Menampilkan Semua transaksi yang merugikan di kota Los Angeles --
SELECT * FROM
	orders
WHERE
	city = 'Los Angeles'
AND
	profit < 0

-- Bagaimana jika 3 kondisi operator --
-- Menampilkan semua transaksi yang merugikan di kota Los Angelese dari segment konsumen Consumer --
SELECT * FROM
	orders
WHERE
	profit < 0
AND
	city = 'Los Angeles'
AND
	segment = 'Consumer'
	
-- Contoh query operator OR --
-- Menampilkan transaksi untuk segment ("consumer atau corporate") --
SELECT * FROM
	orders
WHERE
	segment = 'Consumer'
OR
	segment = 'Corporate'

-- Menampilkan semua transaksi yang ada di kota Los Angeles ("Henderson, dan Houston") --
SELECT * FROM
	orders
WHERE
	city = 'Los Angeles'
OR
	city = 'Henderson'
OR
	city = 'Housten'

-- Bagaimana mengatasi menampilkan kolom city yang berantai --
-- Operator IN untuk menyederhanakan OR berantai --
SELECT * FROM
	orders
WHERE
	city 
IN (
	'Los Angeles', 
	'Henderson', 
	'Houston'
)

-- Menampilkan semua transaksi yang merugikan di ketiga kota tersebut (Los Angeles, Herderson, Houston) --
SELECT * FROM
	orders
WHERE
	city 
IN (
	'Los Angeles', 
	'Henderson', 
	'Houston'
)
AND
	profit < 0

-- Contoh query operator NOT --
-- Menampilkan semua transaksi yang terjadi kecuali di kota Los Angeles --
SELECT * FROM
	orders
WHERE
NOT
	city = 'Los Angeles'

-- Query Simbol >, <, >=, <=, != berlaku untuk numberik, tanggal, teks (lexicorgrammation) --
-- Menampilkan semua transaksi yang terjadi setelah tanggal 1 mare 2019 --
SELECT * FROM
	orders
WHERE
	order_date > '2019-03-01'
