CREATE TABLE Hotel (
    hotelID NUMBER NOT NULL,
    hotelName VARCHAR(100),
    region VARCHAR(100),
    star NUMBER,
    min_price NUMBER,
    max_price NUMBER,
    phone VARCHAR(20),
    site VARCHAR(100),
    CONSTRAINT PK_HOTEL PRIMARY KEY (hotelID)
);

CREATE TABLE Users (
    userID NUMBER NOT NULL,
    name VARCHAR(100),
    age NUMBER,
    ID VARCHAR(100),
    userphone NUMBER,
    password VARCHAR(100),
    email VARCHAR(100),
    grade VARCHAR(50),
    CONSTRAINT PK_USER PRIMARY KEY (userID)
);

CREATE TABLE Reviews (
    reviewID NUMBER NOT NULL,
    title VARCHAR(200),
    content VARCHAR(1000),
    star NUMBER,
    userID NUMBER NOT NULL,
    hotelID NUMBER NOT NULL,
    CONSTRAINT PK_REVIEW PRIMARY KEY (reviewID),
    CONSTRAINT FK_Review_User FOREIGN KEY (userID) REFERENCES Users (userID),
    CONSTRAINT FK_Review_Hotel FOREIGN KEY (hotelID) REFERENCES Hotel (hotelID)
);

CREATE TABLE Room (
    roomSort VARCHAR(100) NOT NULL,
    hotelID NUMBER NOT NULL,
    roomNumber VARCHAR(50),
    price NUMBER,
    howMany NUMBER,
    CONSTRAINT PK_ROOM PRIMARY KEY (roomSort, hotelID),
    CONSTRAINT FK_Hotel_TO_room_1 FOREIGN KEY (hotelID) REFERENCES Hotel (hotelID)
);

CREATE TABLE Reservations (
    reserveID NUMBER NOT NULL,
    reserveDate VARCHAR(100),
    reservePeopleCount NUMBER,
    userID NUMBER NOT NULL,
    hotelID NUMBER NOT NULL,
    CONSTRAINT PK_RESERVATION PRIMARY KEY (reserveID),
    CONSTRAINT FK_Reservation_Users FOREIGN KEY (userID) REFERENCES Users (userID),
    CONSTRAINT FK_Reservation_Hotel FOREIGN KEY (hotelID) REFERENCES Hotel (hotelID)
);


-- Hotel 테이블에 더미 데이터 추가
INSERT INTO Hotel (hotelID, hotelName, region, star, min_price, max_price, phone, site)
VALUES
(1, 'Grand Palace Hotel', 'Seoul', 5, 100000, 500000, '02-1234-5678', 'www.grandpalace.com');
INSERT INTO Hotel (hotelID, hotelName, region, star, min_price, max_price, phone, site)
VALUES
(2, 'Sunshine Resort', 'Busan', 4, 80000, 300000, '051-8765-4321', 'www.sunshine.com');
INSERT INTO Hotel (hotelID, hotelName, region, star, min_price, max_price, phone, site)
VALUES
(3, 'Blue Ocean Inn', 'Jeju', 3, 50000, 200000, '064-123-4567', 'www.blueocean.com');

-- User 테이블에 더미 데이터 추가
INSERT INTO Users (userID, name, age, ID, userphone, password, email, grade)
VALUES
(1, 'John Doe', 30, 'john123', 01012345678, 'password123', 'john@example.com', 'Gold');
INSERT INTO Users (userID, name, age, ID, userphone, password, email, grade)
VALUES
(2, 'Jane Smith', 28, 'jane456', 01087654321, 'password456', 'jane@example.com', 'Silver');
INSERT INTO Users (userID, name, age, ID, userphone, password, email, grade)
VALUES
(3, 'Sam Wilson', 35, 'sam789', 01055556666, 'password789', 'sam@example.com', 'Bronze');

-- Review 테이블에 더미 데이터 추가
INSERT INTO Reviews (reviewID, title, content, star, userID, hotelID)
VALUES
(1, 'Amazing stay!', 'I had a wonderful time at Grand Palace Hotel.', 5, 1, 1);
INSERT INTO Reviews (reviewID, title, content, star, userID, hotelID)
VALUES
(2, 'Good experience', 'Sunshine Resort was quite good for a family vacation.', 4, 2, 2);
INSERT INTO Reviews (reviewID, title, content, star, userID, hotelID)
VALUES
(3, 'Average hotel', 'Blue Ocean Inn was okay, nothing special.', 3, 3, 3);

-- Room 테이블에 더미 데이터 추가
INSERT INTO Room (roomSort, hotelID, roomNumber, price, howMany)
VALUES
('Deluxe', 1, '101', 200000, 2);
INSERT INTO Room (roomSort, hotelID, roomNumber, price, howMany)
VALUES
('Suite', 1, '102', 300000, 4);
INSERT INTO Room (roomSort, hotelID, roomNumber, price, howMany)
VALUES
('Standard', 2, '201', 100000, 2);
INSERT INTO Room (roomSort, hotelID, roomNumber, price, howMany)
VALUES
('Family', 2, '202', 150000, 4);

-- Reservation 테이블에 더미 데이터 추가
INSERT INTO Reservations (reserveID, reserveDate, reservePeopleCount, userID, hotelID)
VALUES
(1, '2024-10-01', 2, 1, 1);
INSERT INTO Reservations (reserveID, reserveDate, reservePeopleCount, userID, hotelID)
VALUES
(2, '2024-11-15', 4, 2, 2);
INSERT INTO Reservations (reserveID, reserveDate, reservePeopleCount, userID, hotelID)
VALUES
(3, '2024-12-20', 1, 3, 3);


select * from hotel;
select * from users;
select * from reviews;
select * from reservations;
select * from room;
