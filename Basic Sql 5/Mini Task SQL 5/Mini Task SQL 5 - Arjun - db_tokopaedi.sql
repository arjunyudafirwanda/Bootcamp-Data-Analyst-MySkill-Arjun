--- Tampilkan super tajir (orang tajir yang belanjanya diatas rata-rata orang tajir) ---
-- 1. Query bikin list orang tajir dari total belajanya --
-- 2. Query hitung rata-rata belanja dari orang tajir tersebut --

-- Soal No 1 --
WITH
orang_tajir 
AS
(
	SELECT
		customer_name,
		SUM(sales) 
	AS total_penjualan
	FROM
		orders
	GROUP BY
		1
	HAVING
		SUM(sales) > 10000
)

SELECT
	customer_name
FROM
	orang_tajir
WHERE
	orang_tajir.total_penjualan > (SELECT
								   AVG(orang_tajir.total_penjualan)
								   FROM orang_tajir)
								   

-- Soal No 2 --
WITH
orang_tajir
AS
(
	SELECT
		customer_name,
	SUM(sales)
	AS
		total_penjualan
	FROM
		orders
	GROUP BY
		1
	HAVING
		SUM(sales) > 10000
)

SELECT
	customer_name,
	orang_tajir.total_penjualan
FROM
	orang_tajir
WHERE
	orang_tajir.total_penjualan > (SELECT
								   AVG(orang_tajir.total_penjualan)
								   FROM orang_tajir)
