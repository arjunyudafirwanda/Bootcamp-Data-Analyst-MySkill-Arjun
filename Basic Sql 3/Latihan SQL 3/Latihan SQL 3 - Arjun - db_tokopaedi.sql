--- 1. LIMIT -> digunakan untuk membatasi dalam menampilkan row ---
-- Kenapa menggunakan LIMIT? untuk membatasi bandwidth -> pricing di cloud berdasarkan bandwidth data --

SELECT * FROM
	orders
LIMIT 10

-- Saat kapan menggunakan LIMIT?
-- Saat kita hanya memerlukan contoh data --
-- Contohnya: kita punya data log -> daripada kita menampilkan data log secara keseluruhan, instead ambil sampel 10, 15, 29 --


--- 2. BETWEEN -> diantara ---
-- BETWEEN berlaku untuk: angka (integer, float), tanggal, string/teks (lexicogrammatical -> urutannya seperti dikamus / diurutkan berdasarkan abjad) --
-- Menampilkan semua transaksi yang berada ditahun 2018 --
-- Tahun 2018 = dari 1 januari 2018 hingga 30 desember 2018 (2018-01-01 hingga 2018-12-30) --
-- Bagian 1 menggunakan Operator >=, <= --
SELECT * FROM
	orders
WHERE
	order_date >= '2018-01-01'
AND
	order_date <= '2018-12-30'
LIMIT 10

-- Bagian 2 --
SELECT * FROM
	orders
WHERE
	order_date
BETWEEN
	'2018-01-01'
AND
	'2018-12-30'
LIMIT 10

-- Menampilkan semua transaksi dari orang yang namanya berasal dari A sampai E --
SELECT * FROM
	orders
WHERE
	customer_name
BETWEEN
	'A'
AND
	'F'
LIMIT 10

-- Menampilkan semua transaksi yang terjadi selama bulan maret sampai mei 2019 / 2019-03-01 and 2019-05-01 --
SELECT * FROM
	orders
WHERE
	order_date
BETWEEN
	'2019-03-01'
AND
	'2019-05-01'
LIMIT 10


--- 3. EXTRACT -> mengekstraksi / mengambil data ---
-- Menampilkan semua transaksi dari tahun 2017 hingga 2018 --
SELECT * FROM
	orders
WHERE
EXTRACT (YEAR FROM order_date)
BETWEEN
	2017
AND
	2018
LIMIT 10
	
-- Mengekstraksi YEAR dari DATE --
SELECT 
	order_date, EXTRACT (YEAR FROM order_date)
FROM
	orders
LIMIT 10

-- Mengekstraksi MONTH dari DATE --
SELECT
	order_date, EXTRACT (MONTH FROM order_date)
FROM
	orders
LIMIT 10

-- Mengekstraksi DAY dari DATE --
SELECT
	order_date, EXTRACT (DAY FROM order_date)
FROM
	orders
LIMIT 10


--- 4. ORDER BY -> mengurutkan data -> 2 menaik dan menurun ---
-- Urutan transaksi sehingga menampilkan barusan yang paling baru, by default ORDER BY akan diurutkan secara ASCENDING --
-- Default ASCENDING --
SELECT * FROM
	orders
ORDER BY
	order_date
LIMIT 10

-- Menggunakan DESCENDING --
SELECT * FROM
	orders
ORDER BY
	order_date
DESC
LIMIT 10

-- Urutkan semua transaksi dari yang nominal penjualannya terbesar --
SELECT * FROM
	orders
ORDER BY
	sales
DESC
LIMIT 10

-- 10 baris dengan kerugian terbesar --
-- Bagian 1 --
SELECT * FROM
	orders
ORDER BY
	profit -- 9994
LIMIT 10

-- Bagian 2 --
SELECT * FROM
	orders
WHERE
	profit < 0
ORDER BY
	profit -- 1871
LIMIT 10

-- Bagian 3 --
SELECT * FROM
	orders
WHERE
	profit <= 0
ORDER BY
	profit
ASC
LIMIT 10

-- Urutkan secara ASCENDING dengan kerugian limit 10 --
SELECT * FROM
	orders
WHERE
	profit <= 0
ORDER BY
	profit
ASC
LIMIT 10

-- ORDER BY -> multiple column / multiple direction --
-- Bagian ASC --
SELECT * FROM
	orders
ORDER BY
	order_date ASC,
	customer_name ASC
LIMIT 10

-- Bagian DESC --
SELECT * FROM
	orders
ORDER BY
	order_date ASC,
	customer_name DESC
LIMIT 10


--- 5. ALIAS -> nama samaran (mengganti nama kolom, mengganti nama subquery) ---
-- Mengganti nama kolom order_date dengan tanggal_order dan EXTRACT order_date diganti dengan tahun_order --
-- Bagian 1 ALIAS--
SELECT
	order_date,
EXTRACT (YEAR FROM order_date)
FROM
	orders
LIMIT 10

-- Bagian 2 --
SELECT
	order_date AS tanggal_order, 
	EXTRACT (YEAR FROM order_date) AS tahun_order
FROM
	orders
LIMIT 10

-- Bagian 3 --
SELECT
	order_date tanggal_order,
	EXTRACT (YEAR FROM order_date) tahun_order
FROM
	orders
LIMIT 10
