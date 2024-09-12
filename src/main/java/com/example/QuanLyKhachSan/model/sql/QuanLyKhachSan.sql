create database QuanLyKhachSan;
use QuanLyKhachSan;

create table Users(
	uid int auto_increment primary key,
    name varchar(64),
    dob date,
    gender char,
    phone varchar(16),
    email varchar(50),
    username varchar(64),
    password varchar(128),
    avatar text,
    role varchar(1)
);

create table room_type(
	room_type_id int auto_increment primary key,
    room_type varchar(50)
);
create table room_status(
	room_status_id int auto_increment primary key,
    room_status varchar(50)
);
create table Room(
	rid int auto_increment primary key,
    roomNumber int,
    room_type_id int,
    foreign key (room_type_id) references room_type(room_type_id),
    room_status_id int,
    foreign key (room_status_id) references room_status(room_status_id)
);

create table booking_type(
	booking_type_id int auto_increment primary key,
    booking_type varchar(50)
);
create table booking_status(
	booking_status_id int auto_increment primary key,
    booking_status varchar(50)
);
create table Booking(
	bid int auto_increment primary key,
    uid int,
    foreign key (uid) references Users(uid),
    rid int,
    foreign key (rid) references Room(rid),
    booking_type_id int,
    foreign key (booking_type_id) references booking_type(booking_type_id),
    booking_date datetime,
    check_in_date datetime,
    check_out_date datetime,
	booking_status_id int,
    foreign key (booking_status_id) references booking_status(booking_status_id)
);

create table Price(
	pid int auto_increment primary key,
    room_type_id int,
    foreign key (room_type_id) references room_type(room_type_id),
    giaThue2GioDau double,
    giaThueSau2Gio double,
    GiaThueQuaDem double,
    GiaThueTheoNgay double
);

-- create table Payments(
-- 	payment_id int auto_increment primary key,
--     bid int,
--     foreign key (bid) references Bookings(bid),
--     payment_date datetime,
--     payment_method enum('credit_card', 'cash', 'bank_transfer'),
--     payment_status enum('pending', 'completed', 'failed')
-- );

-- create table RoomService(
-- 	service_id	int auto_increment primary key,
-- 	bid int,
--     foreign key (bid) references Bookings(bid),
-- 	service_type VARCHAR(100),
-- 	service_price	DECIMAL(10,2),
-- 	service_date	TIMESTAMP
-- );

create table Review(
	review_id int auto_increment primary key,
	uid int,
    foreign key (uid) references Users(uid),
	rid int,
    foreign key (rid) references Room(rid),
	rating int,
    comments text,
	review_date	timestamp
);

create table cham_cong(
	cham_cong_id int auto_increment primary key,
    cham_cong varchar(20)
);
create table StaffShift(
	staff_shift_id int auto_increment primary key,
	uid int,
    foreign key (uid) references Users(uid),
	shift_date date,
	start_time time,
	end_time time,
    cham_cong_id int,
    foreign key(cham_cong_id) references cham_cong(cham_cong_id)
);

-- Insert dữ liệu cho bảng Users
INSERT INTO Users (name, dob, gender, phone, email, username, password, avatar, role) VALUES
('Nguyen Van A', '1990-01-01', 'M', '0912345678', 'a@gmail.com', 'a_user', 'password123', 'https://img-b.udemycdn.com/course/750x422/5138456_6663.jpg', 'A'),
('Le Thi B', '1985-02-15', 'F', '0912345679', 'b@gmail.com', 'b_user', 'password123', 'avatar2.png', 'S'),
('Tran Van C', '1992-05-30', 'M', '0912345680', 'c@gmail.com', 'c_user', 'password123', 'avatar3.png', 'U'),
('Hoang Thi D', '1988-10-10', 'F', '0912345681', 'd@gmail.com', 'd_user', 'password123', 'avatar4.png', 'U'),
('Pham Van E', '1995-12-25', 'M', '0912345682', 'e@gmail.com', 'e_user', 'password123', 'avatar5.png', 'S');

-- Insert dữ liệu cho bảng room_type
INSERT INTO room_type (room_type) VALUES
('Phòng Tiêu Chuẩn Đơn'),
('Phòng Tiêu Chuẩn Đôi'),
('Phòng VIP Đơn'),
('Phòng VIP Đôi'),
('Phòng Gia Đình'),
('Phòng Tổng Thống');

-- Insert dữ liệu cho bảng room_status
INSERT INTO room_status (room_status) VALUES
('Phòng Trống'),
('Phòng Đã Được Đặt');

-- Insert dữ liệu cho bảng Room
INSERT INTO Room (roomNumber, room_type_id, room_status_id) VALUES
(101, 1, 1),
(102, 2, 2),
(103, 3, 1),
(104, 4, 2),
(105, 5, 1),
(201, 1, 1),
(202, 2, 2),
(203, 3, 1),
(204, 4, 2),
(205, 5, 1);

-- Insert dữ liệu cho bảng booking_type
INSERT INTO booking_type (booking_type) VALUES
('Theo Giờ'),
('Theo Đêm'),
('Theo Ngày');

-- Insert dữ liệu cho bảng booking_status
INSERT INTO booking_status (booking_status) VALUES
('Đặt Phòng Thành Công'),
('Bạn chưa đặt phòng');

-- Insert dữ liệu cho bảng Booking
INSERT INTO Booking (uid, rid, booking_type_id, booking_date, check_in_date, check_out_date, booking_status_id) VALUES
(1, 1, 1, '2024-09-10 10:00:00', '2024-09-10 12:00:00', '2024-09-10 14:00:00', 1),
(2, 2, 2, '2024-09-11 11:00:00', '2024-09-11 19:00:00', '2024-09-12 07:00:00', 1),
(3, 3, 3, '2024-09-12 12:00:00', '2024-09-13 08:00:00', '2024-09-13 20:00:00', 1),
(4, 4, 1, '2024-09-13 13:00:00', '2024-09-13 15:00:00', '2024-09-13 17:00:00', 2),
(5, 5, 2, '2024-09-14 14:00:00', '2024-09-14 22:00:00', '2024-09-15 10:00:00', 1);

-- Insert dữ liệu cho bảng Price
INSERT INTO Price (room_type_id, giaThue2GioDau, giaThueSau2Gio, GiaThueQuaDem, GiaThueTheoNgay) VALUES
(1, 200000, 50000, 800000, 1500000),
(2, 250000, 60000, 900000, 1600000),
(3, 300000, 70000, 1000000, 1700000),
(4, 350000, 80000, 1100000, 1800000),
(5, 400000, 90000, 1200000, 1900000),
(6, 450000, 100000, 1300000, 2000000);
select * from Price;

-- Insert dữ liệu cho bảng Review
INSERT INTO Review (uid, rid, rating, comments, review_date) VALUES
(1, 1, 5, 'Dịch vụ rất tốt.', '2024-09-11 10:00:00'),
(2, 2, 4, 'Phòng sạch sẽ và thoải mái.', '2024-09-12 11:00:00'),
(3, 3, 3, 'Phòng tạm ổn, nhưng hơi nhỏ.', '2024-09-13 12:00:00'),
(4, 4, 2, 'Phòng không được như mong đợi.', '2024-09-14 13:00:00'),
(5, 5, 5, 'Phòng tuyệt vời, rất hài lòng.', '2024-09-15 14:00:00');
select * from Review;

-- Insert dữ liệu cho bảng cham_cong
INSERT INTO cham_cong (cham_cong) VALUES
('Absent'),
('Present');

-- Insert dữ liệu cho bảng StaffShift
INSERT INTO StaffShift (uid, shift_date, start_time, end_time, cham_cong_id) VALUES
(1, '2024-09-10', '08:00:00', '17:00:00', 2),
(2, '2024-09-11', '08:00:00', '17:00:00', 1),
(3, '2024-09-12', '08:00:00', '17:00:00', 2),
(4, '2024-09-13', '08:00:00', '17:00:00', 1),
(5, '2024-09-14', '08:00:00', '17:00:00', 2);
