select * from Khoa

-- mk: 1  tenK: cntt
select * from GiangVien
insert into GiangVien(HoVaTen, MaK) values('nguyen van a', 1)

select * from MonHoc

insert into Lop(MaGV,MaMH, SiSo, CL) values(2,1,2,2)

select *
from Lop, MonHoc, Khoa
WHERE Lop.MaMH = MonHoc.MaMH AND MonHoc.MaK = Khoa.MaK

insert into SinhVien(HoVaTen, DiaChi, sdt, email, MaK) values('tran duc a', '1334567', '1111111', '1123123@gmail.com', 1)
insert into SinhVien(HoVaTen, DiaChi, sdt, email, MaK) values('tran duc b', '1334567', '1111111', '1123123@gmail.com', 1);
insert into SinhVien(HoVaTen, DiaChi, sdt, email, MaK) values('tran duc c', '1334567', '1111111', '1123123@gmail.com', 1);
select * from SinhVien

insert into NguyenVongHoc(MaSV, MaMH) values(4,1);
insert into NguyenVongHoc(MaSV, MaMH) values(5,1);
insert into NguyenVongHoc(MaSV, MaMH) values(6,1);
select * from Lop
select * from ThanhVien
insert into ThanhVien(MaL, MaSV) values(90006,4);
insert into ThanhVien(MaL, MaSV) values(90006,5);
insert into ThanhVien(MaL, MaSV) values(68006,6);
delete from ThanhVien
where MaL = 5 and MaSV = 4

Use [DKTC]

EXEC sp_removedbreplication