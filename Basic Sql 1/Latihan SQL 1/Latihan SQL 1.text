-- Create Table --
create table tbl_employee (
	id_employee VARCHAR(10) PRIMARY KEY,
	nama_employee VARCHAR,
	age INT,
	gender VARCHAR(10)
)


-- Select Table --
select * from tbl_employee


-- Delete Table --
drop table tbl_employee


-- Insert Into --
--- Method 1 ---
insert into tbl_employee values (1174008, 'Arjun Yuda Firwanda', 24, 'Male')
insert into tbl_employee values (1174039, 'Liyana Majdah Rahma', 24, 'Female')

--- Method 2 ---
insert into tbl_employee (id_employee, nama_employee, age, gender) values (1174000, 'Momo Ekor Hitam', 10, 'Male')
insert into tbl_employee (id_employee, nama_employee, age, gender) values (1234567, 'Testing Name 1', 30, 'Male')


--- Drop Value with Certain Conditions ---
-- I will drop id_employee = 1234567 --
delete from tbl_employee where id_employee = '1234567'


-- Alter Table --
--- Add New Column ---
alter table tbl_employee add column addres VARCHAR(100)

-- Drop Column ---
alter table tbl_employee drop column addres

-- Rename Colum --
alter table tbl_employee rename column nama_employee to name_employee

-- If you cading experience error "ERROR: cached plan must not change result type", you can rename column to beginning --
-- My case column name_employee error and i change to nama_employee, and then run select * from --
alter table tbl_employee rename column name_employee to nama_employee
