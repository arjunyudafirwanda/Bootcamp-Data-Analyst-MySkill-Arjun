-- Mini Task --
-- Kamu sekarang memiliki tabel transaksi dari customer yang bertransaksi di Tokopaedi. Selanjutnya kamu diminta untuk --
--- 1. Tampilkan nama-nama konsumen segment Consumer yang pernah membeli meja
--- 2. Tampilkan nama-nama konsumen dari segment Corporate dan Home Office yang berasal dari kota Los Angeles dan bertransaksi selama tahun 2018.

-- Soal No 1 --
SELECT * FROM
	orders
WHERE 
	segment = 'Consumer'
AND (
	subcategory = 'Tables'
OR
	subcategory = 'Desk'
)

-- Soal No 2 Menggunakan BETWEEN --
SELECT * FROM
	orders
WHERE
	segment
IN (
	'Corporate',
	'Home Office'
)
AND
	city = 'Los Angeles'
AND
	order_date
BETWEEN
	'2018/01/01'
AND
	'2018/12/31'

-- Soal No 2 Menggunakan Simbol >= --
SELECT * FROM
	orders
WHERE
	segment
IN (
	'Corporate',
	'Home Office'
)
AND
	city = 'Los Angeles'
AND
	order_date >= '2018/01/01'
AND
	order_date < '2019/01/01'
