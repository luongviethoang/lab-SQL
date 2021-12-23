create table IssueDetails (
	BookCode int,
	MemberCode int,
	IssueDate datetime,
	ReturnDate datetime,
	constraint fk_BookCode foreign key (BookCode) references Book(BookCode),
	constraint fk_MemberCode foreign key (MemberCode) references Member(MemberCode)
)
GO
-- Xoá bỏ các ràng buộc khoá ngoại ở bảng IssueDetails
alter table IssueDetails
	drop constraint fk_BookCode
alter table IssueDetails
	drop constraint fk_MemberCode
go
-- Xoá bỏ ràng buộc khoá chính ở bảng Book và Member
alter table Book
	drop constraint pk_book
alter table Member
	drop constraint pk_member
go
-- Thêm mới ràng buộc khoá chính cho bảng Member và Book
alter table Book
	add constraint pk_book primary key (BookCode)
alter table Member
	add constraint pk_member primary key (MemberCode)
go
-- Thêm mới các ràng buộc khoá ngoại cho bảng IssueDetails
alter table IssueDetails
	add constraint fk_BookCode foreign key (BookCode) references Book(BookCode);
alter table IssueDetails
	add constraint fk_MemberCode foreign key (MemberCode) references Member(MemberCode)
go
-- Bổ sung thêm ràng buộc giá bán sách >0 và <200
alter table Book
	add constraint ck_BookPrice check (BookPrice > 0 and BookPrice < 200)
go
-- Bổ sung thêm ràng buộc duy nhất cho cột PhoneNumber của bảng Member
alter table Member
	add constraint unique_PhoneNumber unique(PhoneNumber)
go
-- Bổ sung thêm ràng buộc NOT NULL cho BookCode, MemberCode trong bảng IssueDetails
alter table IssueDetails
	alter column BookCode int NOT NULL;
alter table IssueDetails
	alter column MemberCode int NOT NULL	
go
-- Tạo khóa chính gồm 2 cột BookCode, MemberCode cho bảng IssueDetails		
alter table IssueDetails
	add primary key (BookCode, MemberCode) 	
go
--Check lại bảng 
SELECT * FROM IssueDetails
GO