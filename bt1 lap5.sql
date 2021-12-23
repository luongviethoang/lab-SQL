USE Example5
GO
--tạo bảng cho lớp học
CREATE TABLE Lophoc (
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10)
)
GO
--Tạo Bảng Sinh viên có khóa ngoại là cột MaLopHoc, nối với bảng LopHoc
CREATE TABLE SinhVien(
MaSV int PRIMARY KEY,
TenSV varchar(40),
MaLopHoc int,
CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO
--Tạo bảng SanPham với một cột Null, một cột NOT NULL
CREATE TABLE SanPham(
MaSP int NOT NULL,
Tenp varchar(40) NULL,
)
GO
--Tạo bảng với thuộc tính default cho cột Price
CREATE TABLE StoreProduct(
ProductID int NOT NULL,
Name varchar(40) NOT NULL,
Price money NOT NULL DEFAULT (100)
)
--Thử Kiểm tra xem giá trị default có được sử dụng hay không 
INSERT INTO StoreProduct (ProductID, Name) VALUES (111,20)
Go
--Tạo bảng ContactPhone với thuộc tính IDENTITY
CREATE TABLE CntactPhone (
person_ID int IDENTITY (500,1) NOT NULL,
MobileNumber bigint NOT NULL
)
GO
--tạo cột nhận dạng duy nhất tổng thể
CREATE TABLE CellularPhone (
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)
--Chèn 1 record vào
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT*FROM CellularPhone
GO
--Tạo bảng Contactphone với cột MobileNumber có thuộc tính UNIQUE
CREATE TABLE CentactPhone(
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và lanlieNumber để quan sát lỗi 
INSERT INTO CentactPhone values (1,983345674, 'Hutch',605)
INSERT INTO CentactPhone values (2,982345674, 'Hoang',701)
GO
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
CREATE TABLE phoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES CentactPhone (MobileNumber),
Amout bigint CHECK (Amount>0)
)
GO
--Chỉnh sửa cột trong bảng
ALTER TABLE ContactPhone
	ALTER COLUMN ServiceProvider Varchar(45)
GO
--xóa cột trong bảng 
ALTER TABLE ContactPhone
	DROP COLUMN ServiceProvider
	GO
--Thêm một ràng buộc vào bảng 
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--Xóa một ràng buộc 
ALTER TABLE Person.ContactPhone
DROP CONSTRAINT CHK_RC





