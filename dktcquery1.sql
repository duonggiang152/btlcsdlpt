use DKTC

CREATE TABLE Khoa(
	MaK int not null identity(1,1) primary key,
	TenK varchar(100) not null
);

CREATE TABLE GiangVien (
	MaGV int not null identity(1,1) primary key,
	HoVaTen varchar(100) not null,
	MaK int not null,
	foreign key (MaK) References Khoa(MaK) 
);
CREATE TABLE SinhVien (
	MaSV int not null identity(1,1) primary key,
	HoVaTen varchar(100) not null,
	DiaChi varchar(100) not null,
	sdt varchar(100) not null,
	email varchar(100) not null,
	MaK int not null,
	foreign key (MaK) References Khoa(MaK)  
);
CREATE TABLE MonHoc (
	  MaMH int not null identity(1,1) primary key,
	  TenMH varchar(100) not null,
	  MaK int not null,
	  foreign key (MaK) References Khoa(MaK)
);
CREATE TABLE NguyenVongHoc (
	MaSV int not null,
	MaMH int not null,
	foreign key (MaSV) References Sinhvien(MaSV),
	foreign key (MaMH) References MonHoc(MaMH)
)
CREATE TABLE Lop(
	MaL int not null identity(1,1) primary key,
	MaGV int not null,
	MaMH int not null,
	SiSo int not null,
	CL   int not null,
	foreign key (MaGV) references GiangVien(MaGV),
	foreign key (MaMH) references MonHoc(MaMH)
)
CREATE TABLE ThanhVien (
	MaL int not null,
	MaSV int not null,
	foreign key (MaL) references Lop(MaL),
	foreign key (MaSV) References Sinhvien(MaSV)
)
ALTER TABLE ThanhVien
ADD CONSTRAINT MotSinhVienMotLop UNIQUE (MaL, MaSV) 