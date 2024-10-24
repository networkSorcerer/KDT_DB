
CREATE TABLE Hotel (
	hotelID NUMBER(4) NOT NULL,            -- �ִ� 4�ڸ� ����
	hotelName VARCHAR2(100) NULL,           -- �ִ� 100�� ���ڿ�
	region VARCHAR2(100) NULL,              -- �ִ� 100�� ���ڿ�
	phone VARCHAR2(20) NULL,                 -- ��ȭ��ȣ �ִ� 20��
	hotelExpl varchar2(100) NULL
);

CREATE TABLE users (
    userID varchar2(100) NOT NULL,           -- �ִ� 40�� ���ڿ� (���� ID)
    password VARCHAR2(100),                  -- �ִ� 100�� ���ڿ� (��й�ȣ)
    name VARCHAR2(100),                      -- �ִ� 100�� ���ڿ� (�̸�)
    age NUMBER(3),                           -- �ִ� 3�ڸ� ���� (����)
    email VARCHAR2(100),                     -- �ִ� 100�� ���ڿ� (�̸���)
    grade number(2)          -- �ִ� 10�� ���ڿ� (���)
);

CREATE TABLE reviews (
	reviewID NUMBER(10) NOT NULL,           -- �ִ� 10�ڸ� ���� (���� ID)
	hotelID NUMBER(10) NOT NULL,           -- �ִ� 10�ڸ� ���� (ȣ�� ID)
	userID VARCHAR2(40) NOT NULL,          -- �ִ� 40�� ���ڿ� (���� ID)
	content VARCHAR2(1000) NULL,            -- �ִ� 1000�� ���ڿ� (���� ����)
	star NUMBER(2) NULL                     -- �ִ� 2�ڸ� ���� (����)
);

CREATE TABLE reservation (
	reserveID NUMBER(10) NOT NULL,          -- �ִ� 10�ڸ� ���� (���� ID)
	userID VARCHAR2(40) NOT NULL,           -- �ִ� 40�� ���ڿ� (���� ID)
	hotelID NUMBER(10) NOT NULL,            -- �ִ� 10�ڸ� ���� (ȣ�� ID)
	roomID number(6) NOT NULL,           -- �ִ� 40�� ���ڿ� (�� Ű)
	startDate DATE NULL,                    -- ���� ��¥
	endDate DATE NULL                       -- ���� ��¥
);

CREATE TABLE room (
	roomID number(6) NOT NULL,          -- �ִ� 6�� ���ڿ� (�� Ű)
	hotelID NUMBER(4) NOT NULL,            -- �ִ� 4�ڸ� ���� (ȣ�� ID)
	roomType VARCHAR2(100) NOT NULL,        -- �ִ� 100�� ���ڿ� (�� ����)
	price NUMBER(10) NOT NULL,              -- �ִ� 10�ڸ� ���� (�� ����)
	roomNumber number(6) not null
);

-- Primary Key Constraints
ALTER TABLE Hotel ADD CONSTRAINT PK_HOTEL PRIMARY KEY (hotelID);

ALTER TABLE users ADD CONSTRAINT PK_USER PRIMARY KEY (userID);

ALTER TABLE reviews ADD CONSTRAINT PK_REVIEW PRIMARY KEY (reviewID);

ALTER TABLE reservation ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (reserveID);

ALTER TABLE room ADD CONSTRAINT PK_ROOM PRIMARY KEY (roomKey, hotelID);

-- Foreign Key Constraint
ALTER TABLE room ADD CONSTRAINT FK_Hotel_TO_room_1 FOREIGN KEY (hotelID) REFERENCES Hotel (hotelID);


INSERT INTO Hotel (hotelID, hotelName, region, phone, hotelExpl) 
VALUES (1001, 'Seoul Plaza Hotel', 'Seoul', '02-1234-5678', 'Luxury hotel in the heart of Seoul');

INSERT INTO Hotel (hotelID, hotelName, region, phone, hotelExpl) 
VALUES (1002, 'Busan Beach Hotel', 'Busan', '051-8765-4321', 'Comfortable rooms with a seaside view');

INSERT INTO Hotel (hotelID, hotelName, region, phone, hotelExpl) 
VALUES (1003, 'Jeju Island Resort', 'Jeju', '064-1234-5678', 'Relaxing resort with oceanfront views');

INSERT INTO Hotel (hotelID, hotelName, region, phone, hotelExpl) 
VALUES (1004, 'Gangnam Grand Hotel', 'Seoul', '02-2345-6789', 'Modern and stylish hotel in Gangnam');

INSERT INTO Hotel (hotelID, hotelName, region, phone, hotelExpl) 
VALUES (1999, '����ƮȨ', '����', '02-2345-6789', 'Modern and stylish hotel in Gangnam');

INSERT INTO users (userID, password, name, age, email, grade) 
VALUES ('user01', 'password123', 'Kim Minho', 28, 'minho.kim@example.com', '2');

INSERT INTO users (userID, password, name, age, email, grade) 
VALUES ('user02', 'securepass456', 'Lee Jisoo', 34, 'jisoo.lee@example.com', '1');

INSERT INTO users (userID, password, name, age, email, grade) 
VALUES ('user03', 'pass789', 'Park Hyejin', 22, 'hyejin.park@example.com', '1');

INSERT INTO users (userID, password, name, age, email, grade) 
VALUES ('user04', 'mypassword', 'Choi Seungwoo', 40, 'seungwoo.choi@example.com', '3');


INSERT INTO reviews (reviewID, hotelID, userID, content, star) 
VALUES (10001, 1001, 'user01', 'Great location and service!', 5);

INSERT INTO reviews (reviewID, hotelID, userID, content, star) 
VALUES (10002, 1002, 'user02', 'The room was clean but a bit small.', 4);

INSERT INTO reviews (reviewID, hotelID, userID, content, star) 
VALUES (10003, 1003, 'user03', 'Amazing resort, would definitely come again!', 5);

INSERT INTO reviews (reviewID, hotelID, userID, content, star) 
VALUES (10004, 1004, 'user04', 'Not bad, but could be better.', 3);


INSERT INTO reservation (reserveID, userID, hotelID, roomID, startDate, endDate) 
VALUES (20001, 'user01', 1001, 1001, TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_DATE('2024-10-15', 'YYYY-MM-DD'));

INSERT INTO reservation (reserveID, userID, hotelID, roomID, startDate, endDate) 
VALUES (20002, 'user02', 1002, 2001, TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-05', 'YYYY-MM-DD'));

INSERT INTO reservation (reserveID, userID, hotelID, roomID, startDate, endDate) 
VALUES (20003, 'user03', 1003, 3001, TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-25', 'YYYY-MM-DD'));

INSERT INTO reservation (reserveID, userID, hotelID, roomID, startDate, endDate) 
VALUES (20004, 'user04', 1004, 4001, TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'));


INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (1001, 1001, 'Deluxe Suite', 250000, 101);

INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (1002, 1001, 'Standard Room', 150000, 102);

INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (2001, 1002, 'Sea View Suite', 300000, 201);

INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (3001, 1003, 'Ocean View Room', 200000, 301);

INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (4001, 1004, 'Executive Suite', 400000, 401);

INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (4001, 1004, '������', 400000, 403);

INSERT INTO room (roomID, hotelID, roomType, price, roomNumber) 
VALUES (4011, 1999, '������', 400000, 403);

CREATE SEQUENCE hotel_seq
START WITH 1005  -- ���� �������� ������ hotelID + 1
INCREMENT BY 1;

CREATE SEQUENCE reviews_seq
START WITH 10005  -- ���� �������� ������ reviewID + 1
INCREMENT BY 1;

CREATE SEQUENCE reservation_seq
START WITH 20005  -- ���� �������� ������ reserveID + 1
INCREMENT BY 1;

CREATE SEQUENCE room_seq
START WITH 1006  -- ���� �������� ������ roomID + 1
INCREMENT BY 1;


--drop table Hotel;
--drop table users;
--drop table reviews;
--drop table reservation;
--drop table room;

select * from hotel;
select * from users;
select * from reviews;
select * from reservation;
select * from room;


SELECT r.roomID, r.hotelID, r.roomType, r.price, r.roomNumber
FROM room r
WHERE r.hotelID = 1999  -- Ư�� ȣ�� ID
  AND r.roomType = '������'  -- ���ϴ� �� Ÿ��
  AND NOT EXISTS (
      SELECT 1
      FROM reservation v
      WHERE v.roomid = r.roomid
        AND (
            (v.startDate < TO_DATE('2024-11-12', 'YYYY-MM-DD') AND 
             v.endDate > TO_DATE('2024-11-11', 'YYYY-MM-DD'))
        )
  )
ORDER BY r.roomNumber;  -- �� ��ȣ�� ���� (���� ����)
