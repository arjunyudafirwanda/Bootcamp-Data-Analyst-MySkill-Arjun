-- Mini Task --
-- 1. Pastikan bahwa satu nama hanya memiliki satu customer_id --
-- 2. Menggunakan produk (product_name) apa yang paling best selling --
-- 3. Produk apa yang paling merugikan selama tahun 2017 --

-- Soal No 1 --
SELECT
	customer_name,
	COUNT(DISTINCT customer_id)
FROM
	orders
GROUP BY
	1
HAVING 
	COUNT(DISTINCT customer_id) > 1

-- Soal No 2 --
SELECT
	product_name,
	SUM(quantity) AS total_penjualan
FROM
	orders
GROUP BY
	1
ORDER BY
	2
DESC
LIMIT 10

-- Soal No 3 --
SELECT
	product_name,
	SUM(profit) AS total_profit
FROM
	orders
WHERE
	EXTRACT(YEAR FROM order_date) = 2017
GROUP BY
	1
ORDER BY
	2
LIMIT 10
