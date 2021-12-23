--kiểm tra xem nếu có CSDL BookLibrary thì xóa.
if exists(select *from sys.databases where name='BookLibary')
	drop database BookLibrary
GO
--tạo một file có tên BookLibrary
CREATE DATABASE BookLibrary
GO
--sử dụng BookLibrary
USE BookLibrary
GO
--tạo bảng Book
CREATE TABLE Book(
BookCode int PRIMARY KEY,
BookTitle varchar(100) NOT NULL,
Author varchar(50) NOT NULL,
Edition int,
BookPrice money,
Copies int)
GO
--Thêm một số thông tin vào trong bảng
INSERT INTO Book VALUES (01,'tâm lí học tội phạm','oàng lương viết',1,21.000,134)
INSERT INTO Book VALUES (02,'tâm học tội phạm','hoàng lương viết',2,30.000,34)
INSERT INTO Book VALUES (03,'tâm tội phạm','hoàg lương viết',3,25.000,223)
INSERT INTO Book VALUES (04,'tâm phạm','hoàng lương iết',4,20.000,234)
INSERT INTO Book VALUES (05,'tâm ','hoàng lươn viết',5,15.000,234)
GO
--check bảng
SELECT * FROM Book
GO
--tạo bảng Member
CREATE TABLE Member(
MemberCode int uniqueidentifier DEFAULT NEWID() NULL,
Name varchar(50) NOT NULL,
Address varchar (100) NOT NULL,
PhoneNumber int,
)
GO
--thêm một vài thông tin vào bảng
INSERT INTO Member VALUES (1,'Hoàng','homelessness',0979908276)
GO
--check bảng
SELECT*FROM Member
GO

