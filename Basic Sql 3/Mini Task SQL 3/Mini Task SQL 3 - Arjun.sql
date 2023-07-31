-- Mini Task --
-- 1. Query transaksi yang merugikan saja yang terjadi di tahun 2018 hingga 2019 di kota Los Angeles diurutkan dari kerugian terbesar --
-- 2. Query transaksi yang keuntungan saja yang terjadi pada Q1 2018 di kota Henderson diurutkan dari keuntungan terbesar --

-- Soal No 1 --
SELECT * FROM
	orders
WHERE
	profit < 0
AND
	EXTRACT (YEAR FROM order_date)
BETWEEN
	2018
AND
	2019
AND
	city = 'Los Angeles'
ORDER BY
	profit

-- Soal No 2 --
SELECT * FROM
	orders
WHERE
	order_date
BETWEEN
	'2018-01-01'
AND
	'2018-04-30'
AND
	city = 'Henderson'
ORDER BY
	profit > 0
