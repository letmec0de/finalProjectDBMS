show databases;
create database fLab;
use flab;


CREATE TABLE HOTEL
(
	id_hotel char(6) primary key,
    name_hotel varchar(70) not null,
    address_hotel varchar(150) not null,
    price_hotel float ,check (price_hotel > 0),
    number_phone varchar(12) unique,
    star_number smallint , check (star_number between 1 and 5 ),
    reviews varchar(300)
);
insert into hotel values('HT0001','Sheraton Cần Thơ','209 Đường 30/4, Xuan Khanh, Hưng Lợi, Ninh Kiều, Thành phố Cần Thơ, Việt Nam','2.103','02923761888','5','Ở sheraton thì không có gì để chê nhé. Từ dịch vụ, ăn uống đều rất ok
');

select * from hotel;
desc hotel;

alter table customer  drop  column pass_word;

select * from customer;
select curdate();
select getdate() as current;

show tables;
create table customer
(
	id_cus char(6) primary key,
    name_cus varchar(30) not null,
    gender varchar(6) not null ,check (gender in ('Male', 'Female')),
    birthday date not null,
    city varchar(20) not null,
    email varchar(50) not null,
    phone_number varchar(10) check(phone_number like '0%')
);
alter table customer add column user_name varchar(7) not null unique;
alter table customer add column pass_word char(4) not null;
alter table customer add check (length(phone_number) = 10 and phone_number like '0%');

select * from customer;
insert into customer values ('KH0001','Nguyễn Văn Thuần', 'Male', '2003-10-01', 'Cần Thơ', 'vanthuann.ng@gmail.com', '0123456789', '094203002285', 'thuan01', '1234');
insert into customer values ('KH0002','Trần Quốc Duy', 'Male', '2003-12-02', 'Bạc Liêu', 'duyng.ng@gmail.com', '0708292027', '094209002285', 'duyvip1', '1434');

alter table customer add column identify_card varchar(12) unique;
select * from customer;
create table personnel
(
	id_per char(6) primary key,
    id_hotel char(6),
    name varchar(30) not null,
    position_p varchar(20) not null,
    gender varchar(6) not null , check (gender in ('Male', 'Female')),
	email varchar(50) not null,
    identify_card varchar(12) unique
);
alter table personnel add constraint fk_idhotel foreign key (id_hotel) references hotel(id_hotel);	
desc personnel;
insert into personnel values ('NV0001', 'Nguyễn Duy Bằng','Quản lí','Male','bangng@gmail.com','09229920002', 'HT0001');



create table room
(
	id_hotel char(6), constraint fk_id_hotel foreign key(id_hotel) references hotel(id_hotel),
    id_room char(6) primary key,
    acreage float not null,
    amount_people smallint unique,
    price float not null
);
ALTER TABLE ROOM ADD COLUMN name_room varchar(100);

insert into room values ('HT0001','HTR001','46.0','2','2.103', '2 Twin Beds Deluxe City View');
create table booking 
(
		id_booking char(6) primary key,
        id_cus char(6), constraint  foreign key (id_cus) references customer(id_cus),
		id_hotel char(6), constraint  foreign key(id_hotel) references hotel(id_hotel),
        date_booking date not null,
		detail_booking varchar(100)
);
desc BOOKING;
insert into booking values('IDB001', 'KH0001', 'HT0001', CURRENT_DATE(), '','HTR001');
select * from BOOKING;
create table payment 
(
	id_payment char(6) primary key,
	id_cus char(6), constraint  foreign key (id_cus) references customer(id_cus),
    id_method char(1), constraint foreign key (id_method) references payment_method(id_method)
);
insert into payment values ('PM0001','KH0001', '1');
insert into payment values ('PM0002','KH0002', '2');

DELETE FROM PAYMENT;
create table payment_method
(
	id_method char(1) primary key,
    method_payment_desciption varchar(10)
);
alter table payment_method modify method_payment_desciption varchar(20);
insert into payment_method values('1', 'Credit Card');
INSERT INTO payment_method VALUES ('6', 'Bank Transfer');
INSERT INTO payment_method VALUES ('7', 'Cash');


show tables;
select * from hotel;
select * from customer;
select * from room;
select * from personnel;
select * from payment;
select * from payment_method;
select * from booking;
alter table booking add column id_room char(6) ;
alter table booking drop  id_hotel;
desc booking;

alter table booking add constraint fk_id_room foreign key (id_room) references room(id_room);
--FUCNTION
/--INSERT HOTEL
CREATE PROCEDURE SP_ADDHOTEL(sp_id char(6)

use flab;
show tables;
