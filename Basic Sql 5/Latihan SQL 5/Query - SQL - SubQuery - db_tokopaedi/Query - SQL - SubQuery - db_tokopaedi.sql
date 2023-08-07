--- 5. SUBQUERY ---
-- SUBQUERY QUERY ADALAH SEPERTI QUERY BIASA YANG BERJALAN DALAM QUERY LAIN. ---
-- SUBQUERY BIASANYA DIGUNAKAN UNTUK MEMECAHKAN MASALAH YANG KOMPLEKS MENJADI SOLUSI YANG LEBIH BERTAHAP. --
-- SUBQUERY BISA DI KLAUSA SELECT, FROM, DAN WHER. --

-- SUBQUERY KLAUSA SELECT FROM --
-- Query membuat tabel berisi nama konsumen, segmen, dan sum of sales. kemudian menampilkan hanya konsumen dari segment Consumer --
-- BAGIAN 1 --
SELECT
	customer_name,
	segment,
SUM(sales)
FROM
	orders
GROUP BY
	customer_name,
	segment
LIMIT 10

-- BAGIAN 2 --
SELECT
	customer_name
VALUE
FROM(
	SELECT
		customer_name,
		segment,
	SUM(sales)
	VALUE
	FROM
		orders
	GROUP BY
		customer_name, 
		segment
)
AS
	T
WHERE
	segment = 'Consumer'
LIMIT 10

-- SUBQUERY KLAUSA WHERE/HAVING --
-- Query mencari konsumen pada segment ‘Consumer’ dengan total sales diatas rata-rata Consumer lainnya --
-- BAGIAN 1 --
SELECT
	SUM(sales)/COUNT(DISTINCT customer_id)
FROM
	orders
WHERE
	segment = 'Consumer'

-- BAHIAN 2 --
SELECT
	customer_name,
	SUM(sales)
FROM
	orders
WHERE
	segment = 'Consumer'
GROUP BY
	customer_name
HAVING
	SUM(sales) >=
		(SELECT
		 	SUM(sales)/COUNT(DISTINCT customer_id)
		 FROM
		 	orders
		 WHERE
		 	segment = 'Consumer'
		)
LIMIT 10

-- SUBQUERY DENGAN WITH DAN ALIAS --
WITH
total_sales 
AS
(
	SELECT
		customer_name,
		segment,
	SUM(sales)
	VALUE
	FROM
		orders
	GROUP BY
		customer_name,
		segment
),

consumer_avg
AS
(
	SELECT
	SUM(sales)/COUNT(DISTINCT customer_id)
	AS
		average
	FROM
		orders
	WHERE
		segment = 'Consumer'
)

SELECT * FROM
	total_sales
WHERE
	segment = 'Consumer'
	AND VALUE >= (
		SELECT 
			average
		FROM
			consumer_avg
	)
LIMIT 10
