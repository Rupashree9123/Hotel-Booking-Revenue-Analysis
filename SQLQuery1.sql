create database HotelAnalytics;
use HotelAnalytics;

USE HotelAnalytics;
GO

SELECT COUNT(*) AS TotalRows
FROM dbo.Hotel_Booking_Analysis;

SELECT TOP 5 *
FROM dbo.Hotel_Booking_Analysis;


---SQL Query 1 — Total Bookings & Revenue
SELECT
    COUNT(*) AS TotalBookings,
    SUM(Revenue) AS TotalRevenue
FROM dbo.Hotel_Booking_Analysis;

---SQL Query 2 - Revenue by Hotel
SELECT
    Hotel,
    SUM(Revenue) AS TotalRevenue
FROM dbo.Hotel_Booking_Analysis
GROUP BY Hotel
ORDER BY TotalRevenue DESC;


--- SQL Query 3 - Revenue by Room Type.
SELECT
    RoomType,
    SUM(Revenue) AS TotalRevenue
FROM dbo.Hotel_Booking_Analysis
GROUP BY RoomType
ORDER BY TotalRevenue DESC;

---SQL Query 4 - Monthly Revenue.

SELECT
    YEAR(CheckInDate) AS Year,
    MONTH(CheckInDate) AS Month,
    SUM(Revenue) AS MonthlyRevenue
FROM dbo.Hotel_Booking_Analysis
GROUP BY
    YEAR(CheckInDate),
    MONTH(CheckInDate)
ORDER BY
    Year,
    Month;

--- SQL Query 5 - Cancellation Rate

SELECT
    BookingStatus,
    COUNT(*) AS Bookings,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS DECIMAL(5,2)) AS Percentage
FROM dbo.Hotel_Booking_Analysis
GROUP BY BookingStatus
ORDER BY Bookings DESC;

--- SQL Query 6 - Booking Channel.
SELECT
    BookingChannel,
    COUNT(*) AS TotalBookings,
    SUM(Revenue) AS TotalRevenue
FROM dbo.Hotel_Booking_Analysis
GROUP BY BookingChannel
ORDER BY TotalRevenue DESC;


--- SQL Query 7 - Average Room Rate by Hotel.
SELECT
    Hotel,
    AVG(RoomRate) AS AverageRoomRate
FROM dbo.Hotel_Booking_Analysis
GROUP BY Hotel
ORDER BY AverageRoomRate DESC;


--- SQL Query 8 - Customer Type.
SELECT
    CustomerType,
    COUNT(*) AS TotalBookings,
    SUM(Revenue) AS TotalRevenue,
    AVG(Nights) AS AverageNights
FROM dbo.Hotel_Booking_Analysis
GROUP BY CustomerType
ORDER BY TotalBookings DESC;


--- SQL Query 9 - Average Length of Stay by Hotel
SELECT
    Hotel,
    AVG(CAST(Nights AS DECIMAL(10,2))) AS AverageNights
FROM dbo.Hotel_Booking_Analysis
GROUP BY Hotel
ORDER BY AverageNights DESC;


--- SQL Query 10 - Top-performing Hotel & Room Type
SELECT TOP 10
    Hotel,
    RoomType,
    COUNT(*) AS TotalBookings,
    SUM(Revenue) AS TotalRevenue,
    AVG(RoomRate) AS AverageRoomRate
FROM dbo.Hotel_Booking_Analysis
GROUP BY
    Hotel,
    RoomType
ORDER BY
    TotalRevenue DESC;

