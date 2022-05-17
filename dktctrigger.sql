use DKTC
Drop trigger dbo.KiemTraSinhVien;

GO
Create Trigger KiemTraSinhVien
	ON dbo.ThanhVien
	AFTER INSERT
	NOT FOR REPLICATION
	AS 
	BEGIN
		DECLARE @MaSV INT
		DECLARE @MaL  INT
		SET @MaSV =  (SELECT MaSV from inserted )
		SET @MaL  =  (SELECT MaL from inserted)
		IF NOT EXISTS (
				SELECT *
				FROM NguyenVongHoc, Lop, inserted
				WHERE NguyenVongHoc.MaMH = Lop.MaMH
				AND   Lop.MaL = @MaL
				AND   Lop.CL > 0)
				BEGIN
				RAISERROR ('Khong Dang Ki Nguyen Vong Mon Nay hoac lop da day', -1, -1)
				rollback transaction 
				END
		ELSE
			BEGIN
				UPDATE Lop
				SET Lop.CL = Lop.CL - 1
				WHERE Lop.MaL = @MaL
			END
	END
DROP trigger dbo.KIEMTRAXOASINHVIEN;
GO
CREATE TRIGGER KIEMTRAXOASINHVIEN
	ON dbo.ThanhVien
	AFTER DELETE
	NOT FOR REPLICATION
	AS
	BEGIN
		DECLARE @MaSV INT
		DECLARE @MaL  INT
		SET @MaSV = (SELECT MaSV from deleted)
		SET @MaL = (SELECT MaL from deleted)
		IF EXISTS (SELECT * FROM deleted)
			BEGIN
				UPDATE LOP
				SET Lop.CL = Lop.CL + 1
				WHERE Lop.MaL = @MaL
			END
	END

BEGIN TRANSACTION;



