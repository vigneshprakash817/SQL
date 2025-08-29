-- Create a new database (if not already created)
CREATE DATABASE HotelDB;

-- Use the database
USE HotelDB;
-- Hotel Rooms
CREATE TABLE Hotel_Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomType VARCHAR(50) NOT NULL,
    PricePerNight DECIMAL(10,2) NOT NULL,
    Availability CHAR(1) DEFAULT 'Y'  -- Y = Available, N = Occupied
);
--  Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);
-- Bookings
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    Status ENUM('Booked','CheckedIn','CheckedOut','Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Hotel_Rooms(RoomID)
);
-- Payments
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod ENUM('Cash','Card','UPI'),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
-- Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role ENUM('Receptionist','Housekeeping','RoomService'),
    ShiftTiming VARCHAR(50)
);
-- Housekeeping Schedule
CREATE TABLE Housekeeping_Schedule (
    ScheduleID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    StaffID INT,
    CleaningDate DATE,
    Status ENUM('Pending','Completed') DEFAULT 'Pending',
    FOREIGN KEY (RoomID) REFERENCES Hotel_Rooms(RoomID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
-- Room Service Requests
CREATE TABLE Room_Service (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    ServiceDetails VARCHAR(255),
    RequestDate DATE,
    Status ENUM('Pending','Completed') DEFAULT 'Pending',
    FOREIGN KEY (RoomID) REFERENCES Hotel_Rooms(RoomID)
);
INSERT INTO Hotel_Rooms (RoomType, PricePerNight, Availability) VALUES
('Single', 1500.00, 'Y'),
('Double', 2500.00, 'Y'),
('Suite', 5000.00, 'Y'),
('Deluxe', 3500.00, 'Y'),
('Single', 1600.00, 'Y'),
('Double', 2700.00, 'Y'),
('Suite', 5200.00, 'Y'),
('Deluxe', 3700.00, 'Y'),
('Single', 1400.00, 'Y'),
('Double', 2600.00, 'Y');

select * from Hotel_Rooms;

INSERT INTO Customers (Name, ContactNumber, Email) VALUES
('Rahul Sharma', '9876543210', 'rahul@example.com'),
('Priya Mehta', '9123456789', 'priya@example.com'),
('Arjun Reddy', '9988776655', 'arjun@example.com'),
('Sneha Kapoor', '9765432109', 'sneha@example.com'),
('Vikram Desai', '9811122233', 'vikram@example.com'),
('Neha Singh', '9090909090', 'neha@example.com'),
('Rohit Verma', '9822334455', 'rohit@example.com'),
('Ananya Rao', '9778899001', 'ananya@example.com'),
('Kunal Joshi', '9123987654', 'kunal@example.com'),
('Meera Iyer', '9345678123', 'meera@example.com');

select * from Customers;

INSERT INTO Staff (Name, Role, ShiftTiming) VALUES
('Amit Verma', 'Receptionist', 'Morning'),
('Rita Singh', 'Housekeeping', 'Evening'),
('Karan Malhotra', 'RoomService', 'Night'),
('Meena Gupta', 'Housekeeping', 'Morning'),
('Suresh Das', 'Receptionist', 'Evening'),
('Pooja Nair', 'RoomService', 'Morning'),
('Deepak Yadav', 'Housekeeping', 'Night'),
('Shalini Menon', 'Receptionist', 'Morning'),
('Ajay Kumar', 'RoomService', 'Evening'),
('Jyoti Sharma', 'Housekeeping', 'Morning');

select * from Staff;

INSERT INTO Bookings (CustomerID, RoomID, CheckInDate, CheckOutDate, Status) VALUES
(1, 1, '2025-08-22', '2025-08-25', 'Booked'),
(2, 2, '2025-08-23', '2025-08-27', 'CheckedIn'),
(3, 3, '2025-08-20', '2025-08-22', 'CheckedOut'),
(4, 4, '2025-08-25', '2025-08-28', 'Booked'),
(5, 5, '2025-08-21', '2025-08-23', 'Cancelled'),
(6, 6, '2025-08-24', '2025-08-29', 'Booked'),
(7, 7, '2025-08-19', '2025-08-21', 'CheckedOut'),
(8, 8, '2025-08-22', '2025-08-26', 'CheckedIn'),
(9, 9, '2025-08-20', '2025-08-22', 'CheckedOut'),
(10, 10, '2025-08-23', '2025-08-27', 'Booked');

select * from Bookings;

INSERT INTO Payments (BookingID, Amount, PaymentDate, PaymentMethod) VALUES
(1, 4500.00, '2025-08-21', 'Card'),
(2, 10000.00, '2025-08-23', 'Cash'),
(3, 10000.00, '2025-08-20', 'UPI'),
(4, 10500.00, '2025-08-25', 'Card'),
(5, 3200.00, '2025-08-21', 'Cash'),
(6, 13500.00, '2025-08-24', 'UPI'),
(7, 10400.00, '2025-08-19', 'Card'),
(8, 14800.00, '2025-08-22', 'Cash'),
(9, 2800.00, '2025-08-20', 'UPI'),
(10, 10400.00, '2025-08-23', 'Card');

select * from Payments;

INSERT INTO Housekeeping_Schedule (RoomID, StaffID, CleaningDate, Status) VALUES
(1, 2, '2025-08-22', 'Completed'),
(2, 4, '2025-08-23', 'Pending'),
(3, 2, '2025-08-21', 'Completed'),
(4, 4, '2025-08-24', 'Pending'),
(5, 7, '2025-08-21', 'Completed'),
(6, 10, '2025-08-22', 'Pending'),
(7, 2, '2025-08-20', 'Completed'),
(8, 4, '2025-08-25', 'Pending'),
(9, 7, '2025-08-19', 'Completed'),
(10, 10, '2025-08-23', 'Pending');

select * from Housekeeping_Schedule;

INSERT INTO Room_Service (RoomID, ServiceDetails, RequestDate, Status) VALUES
(1, 'Extra towels', '2025-08-22', 'Completed'),
(2, 'Breakfast in room', '2025-08-23', 'Pending'),
(3, 'Laundry pickup', '2025-08-21', 'Completed'),
(4, 'Room decoration', '2025-08-25', 'Pending'),
(5, 'Dinner order', '2025-08-21', 'Completed'),
(6, 'Ironing service', '2025-08-22', 'Pending'),
(7, 'Mini bar refill', '2025-08-20', 'Completed'),
(8, 'Airport taxi booking', '2025-08-25', 'Pending'),
(9, 'Pillow request', '2025-08-19', 'Completed'),
(10, 'Spa appointment', '2025-08-23', 'Pending');

select * from Room_Service;

-- Insert a new room
INSERT INTO Hotel_Rooms (RoomType, PricePerNight, Availability) 
VALUES ('Presidential Suite', 8000.00, 'Y');

-- Update room price
SET SQL_SAFE_UPDATES = 0;

UPDATE Hotel_Rooms
SET PricePerNight = 9000.00
WHERE RoomType = 'Presidential Suite';

SET SQL_SAFE_UPDATES = 1; -- turn it back on for safety

Select * from Hotel_Rooms;
DELETE FROM Hotel_Rooms WHERE RoomType IS NULL AND PricePerNight IS NULL AND Availability IS NULL;

-- 1. Show all available rooms
SELECT RoomID, RoomType, PricePerNight
FROM Hotel_Rooms
WHERE Availability = 'Y';

-- Find all customers who have CheckedIn today
SELECT c.Name, b.RoomID, b.CheckInDate
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
WHERE b.Status = 'CheckedIn' AND b.CheckInDate = CURDATE();

-- Show total revenue generated so far
SELECT SUM(Amount) AS TotalRevenue
FROM Payments;

-- Monthly revenue report
SELECT MONTH(PaymentDate) AS Month, SUM(Amount) AS MonthlyRevenue
FROM Payments
GROUP BY MONTH(PaymentDate)
ORDER BY Month;

-- Get all service requests that mention "laundry"
SELECT ServiceDetails FROM Room_Service WHERE ServiceDetails LIKE '%laundry%';

-- Show total number of service requests handled per staff member.
SELECT r.RoomType, COUNT(rs.RequestID) AS TotalRequests
FROM Hotel_Rooms r
JOIN Room_Service rs ON r.RoomID = rs.RoomID
GROUP BY r.RoomType;

-- Create a procedure to insert a new payment
DELIMITER //
CREATE PROCEDURE AddPayment(
    IN p_BookingID INT,
    IN p_Amount DECIMAL(10,2),
    IN p_Method VARCHAR(20)
)
BEGIN
    INSERT INTO Payments (BookingID, Amount, PaymentDate, PaymentMethod)
    VALUES (p_BookingID, p_Amount, CURDATE(), p_Method);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE MakeBooking(IN p_CustomerID INT, IN p_RoomID INT, IN p_CheckIn DATE, IN p_CheckOut DATE)
BEGIN
  INSERT INTO Bookings (CustomerID, RoomID, CheckInDate, CheckOutDate, Status)
  VALUES (p_CustomerID, p_RoomID, p_CheckIn, p_CheckOut, 'Booked');
  UPDATE Hotel_Rooms SET Availability = 'N' WHERE RoomID = p_RoomID;
END //
DELIMITER ;


CALL AddPayment(5, 5000.00, 'Card');

-- Update Room Availability when Booking is Made
-- When a booking is inserted, the room should become unavailable (Availability = 'N').
DELIMITER $$
CREATE TRIGGER AfterBookingInsert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Hotel_Rooms
    SET Availability = 'N'
    WHERE RoomID = NEW.RoomID;
END$$
DELIMITER ;

SHOW TRIGGERS LIKE 'Bookings';

-- View
CREATE VIEW available_rooms_view AS
SELECT * FROM Hotel_Rooms WHERE Availability = 'Y';


