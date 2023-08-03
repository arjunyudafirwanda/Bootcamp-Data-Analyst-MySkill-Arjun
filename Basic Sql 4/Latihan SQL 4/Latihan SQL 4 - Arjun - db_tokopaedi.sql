--- Customer Behavior -> Customer Segmentation ---

--- AGGREGAT -> fungi yang merangkum data-data ---
-- SUM --
-- AVG / AVERAGE --
-- MIN --
-- MAX --
-- COUNT --
-- COUNT DISTINCT --

SELECT * FROM
	orders
LIMIT 10

-- Total penjualan / sales--
SELECT
	SUM(sales) AS total_sales,
	AVG(sales) AS ratarata_sales,
	MIN(sales) AS min_sales,
	MAX(sales) AS max_sales
FROM
	orders


-- Query SUM --
-- Query berapa total penjualan di kota Los Angeles --
SELECT
	SUM(sales)
FROM
	orders
WHERE
	city = 'Los Angeles'

-- Query berapa total penjualan dikelompokkan berdasarkan kota (GROUP BY) --
SELECT
	city,
	SUM(sales) AS total_penjualan
FROM
	orders
GROUP BY
	city
LIMIT 10

-- Query berapa total penjualan dikelompokkan berdasarkan kota diurutkan berdasarkan penjualan terbesar --
SELECT
	city,
	SUM(sales) AS total_penjualan
FROM
	orders
GROUP BY
	city
ORDER BY
	SUM(sales)
DESC
LIMIT 10

-- Query 10 kota dengan penjualan terburuk --
SELECT
	city,
	SUM(sales) AS total_penjualan
FROM
	orders
GROUP BY
	city
ORDER BY
	SUM(sales)
ASC
LIMIT 10


-- COUNT, COUNT DISTINCT --
-- COUNT -> menghitung banyak baris --
-- COUNT DISTICT -> menghitung banyak data yang berbeda --
-- Query COUNT --
-- Query mengetahui jumlah baris pada tabel orders --
SELECT
	COUNT(*)
FROM
	orders

-- Query COUNT DISTINCT --
-- Query berapa banyak konsumen --
SELECT
	COUNT(DISTINCT customer_id) AS jumlah_konsumen
FROM
	orders

-- Query berapa banyak pesanan --
SELECT
	COUNT(DISTINCT order_id) AS jumlah_pesanan
FROM
	orders

-- Query berapa banyak produk yang dijual --
SELECT
	COUNT(DISTINCT product_id) AS jumlah_produk_terjual
FROM
	orders

-- Query berapa banyak transaksi yang terjadi di kota Los Angeles selama tahun 2018 --
SELECT
	COUNT(DISTINCT order_id)
FROM
	orders
WHERE
	city = 'Los Angeles'
AND
	EXTRACT(YEAR FROM order_date) = 2018


-- GROUP BY -> bisa menggunakan lebih dari satu kolom --
-- Query untuk setiap segment konsumen, berapa banyak transaksi berdasarkan ship_mode --
-- Ada segment apa saja? --
-- Ada ship_mode apa saja? --
-- Ketika ada group by, maka kolom setelah select harus memilih salah satu --
-- Bagian 1 --
SELECT
	segment,
	ship_mode,
	COUNT(DISTINCT order_id)
FROM
	orders
GROUP BY
	1,2 -- adalah urutan kolom setelah select --

-- Bagian 2 --
SELECT
	segment,
	ship_mode,
	COUNT(DISTINCT order_id)
FROM
	orders
GROUP BY
	segment,
	ship_mode
ORDER BY
	segment,
	ship_mode

-- Bagian 3 --
-- Query untuk mengetahui segment, ship_mode menampilkan berdasarkan order_date dan jumlah sales pada tahun 2018 --
SELECT
	segment,
	ship_mode,
	EXTRACT (MONTH FROM order_date) AS bulan_transaksi,
	COUNT(DISTINCT order_id) AS total_order,
	SUM(sales) AS total_value_penjualan
FROM
	orders
WHERE
	EXTRACT (YEAR FROM order_date) = 2018
GROUP BY
	1,2,3
ORDER BY
	1,2,3
LIMIT 10

-- Query penjualan per bulan selama tahun 2018 terdapat kolom bulan, kolom sum of sales where tahun = 2018 --
SELECT
	EXTRACT (MONTH FROM order_date) AS no_bulan,
	SUM(sales) AS total_penjualan
FROM
	orders
WHERE
	EXTRACT (YEAR from order_date) = 2018
GROUP BY
	1
ORDER BY
	1
ASC

-- Query mengetahui konsumen prioritas: konsumen yang telah membelanjakan uangnya lebih dari 10 rb dolar --
-- Bagian 1 mencari customer_name yang sering belanja --
SELECT
	customer_name,
	SUM(sales)
FROM
	orders
GROUP BY
	1
ORDER BY
	2
DESC
LIMIT 10

-- Bagian 2 mencari prioritas --
-- WHERE tidak boleh ada fungsi aggregate --
-- HAVING -> mirip where tetapi bisa menggunakan fungsi aggregate --
-- HAVING letaknya setelah group by --
-- CATATAN --
-- WHERE: tidak mengenal alias, tidak bisa memfilter fungsi aggregate --
-- HAVING: mengenal alias, bisa memfilter fungsi aggregate --
SELECT
	customer_name,
	SUM(sales) AS total_belanja
FROM
	orders
GROUP BY
	1
HAVING
	SUM(sales) >= 10000
ORDER BY
	2
DESC
LIMIT 10

-- Query menampilkan orang sultan/tajir yang berasal dari kota New York --
SELECT
	customer_name,
	SUM(sales) AS total_belanja
FROM
	orders
WHERE
	city = 'New York City'
GROUP BY
	1
HAVING
	SUM(sales) >= 10000
ORDER BY
	2
DESC
