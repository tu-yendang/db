--Team Members: Victoria DaRosa (ktb2rz) and Tu-Yen Dang (frk3nx)
--CREATE DATABASE HW4
--GO
Use HW4 
GO

DROP TABLE IF EXISTS Housing

CREATE TABLE Housing (
    houseid INT IDENTITY(1,1) PRIMARY KEY,
    price BIGINT,
    area INT,
    bedrooms INT,
    bathrooms INT,
    stories INT,
    mainroad VARCHAR(3),
    guestroom VARCHAR(3),
    basement VARCHAR(3),
    hotwaterheating VARCHAR(3),
    airconditioning VARCHAR(3),
    parking INT,
    prefarea VARCHAR(3),
    furnishingstatus VARCHAR(15)
);

INSERT INTO Housing (price, area, bedrooms, bathrooms, stories, mainroad, guestroom, basement, hotwaterheating, airconditioning, parking, prefarea, furnishingstatus) VALUES
(13300000, 7420, 4, 2, 3, 'yes', 'no', 'no', 'no', 'yes', 2, 'yes', 'furnished'),
(12250000, 8960, 4, 4, 4, 'yes', 'no', 'no', 'no', 'yes', 3, 'no', 'furnished'),
(12250000, 9960, 3, 2, 2, 'yes', 'no', 'yes', 'no', 'no', 2, 'yes', 'semi-furnished'),
(12215000, 7500, 4, 2, 2, 'yes', 'no', 'yes', 'no', 'yes', 3, 'yes', 'furnished'),
(11410000, 7420, 4, 1, 2, 'yes', 'yes', 'yes', 'no', 'yes', 2, 'no', 'furnished'),
(10850000, 7500, 3, 3, 1, 'yes', 'no', 'yes', 'no', 'yes', 2, 'yes', 'semi-furnished'),
(10150000, 8580, 4, 3, 4, 'yes', 'no', 'no', 'no', 'yes', 2, 'yes', 'semi-furnished'),
(10150000, 16200, 5, 3, 2, 'yes', 'no', 'no', 'no', 'no', 0, 'no', 'unfurnished'),
(9870000, 8100, 4, 1, 2, 'yes', 'yes', 'yes', 'no', 'yes', 2, 'yes', 'furnished'),
(9800000, 5750, 3, 2, 4, 'yes', 'yes', 'no', 'no', 'yes', 1, 'yes', 'unfurnished'),
(9800000, 13200, 3, 1, 2, 'yes', 'no', 'yes', 'no', 'yes', 2, 'yes', 'furnished'),
(9681000, 6000, 4, 3, 2, 'yes', 'yes', 'yes', 'yes', 'no', 2, 'no', 'semi-furnished'),
(9310000, 6550, 4, 2, 2, 'yes', 'no', 'no', 'no', 'yes', 1, 'yes', 'semi-furnished'),
(9240000, 3500, 4, 2, 2, 'yes', 'no', 'no', 'yes', 'no', 2, 'no', 'furnished'),
(9240000, 7800, 3, 2, 2, 'yes', 'no', 'no', 'no', 'no', 0, 'yes', 'semi-furnished'),
(9100000, 6000, 4, 1, 2, 'yes', 'no', 'yes', 'no', 'no', 2, 'no', 'semi-furnished'),
(9100000, 6600, 4, 2, 2, 'yes', 'yes', 'yes', 'no', 'yes', 1, 'yes', 'unfurnished'),
(8960000, 8500, 3, 2, 4, 'yes', 'no', 'no', 'no', 'yes', 2, 'no', 'furnished'),
(8890000, 4600, 3, 2, 2, 'yes', 'yes', 'no', 'no', 'yes', 2, 'no', 'furnished'),
(8855000, 6420, 3, 2, 2, 'yes', 'no', 'no', 'no', 'yes', 1, 'yes', 'semi-furnished'),
(8750000, 4320, 3, 1, 2, 'yes', 'no', 'yes', 'yes', 'no', 2, 'no', 'semi-furnished'),
(8680000, 7155, 3, 2, 1, 'yes', 'yes', 'yes', 'no', 'yes', 2, 'no', 'unfurnished'),
(8645000, 8050, 3, 1, 1, 'yes', 'yes', 'yes', 'no', 'yes', 1, 'no', 'furnished'),
(8645000, 4560, 3, 2, 2, 'yes', 'yes', 'yes', 'no', 'yes', 1, 'no', 'furnished'),
(8575000, 8800, 3, 2, 2, 'yes', 'no', 'no', 'no', 'yes', 2, 'no', 'furnished'),
(8540000, 6540, 4, 2, 2, 'yes', 'yes', 'yes', 'no', 'yes', 2, 'yes', 'furnished'),
(8463000, 6000, 3, 2, 4, 'yes', 'yes', 'yes', 'no', 'yes', 0, 'yes', 'semi-furnished'),
(8400000, 8875, 3, 1, 1, 'yes', 'no', 'no', 'no', 'no', 1, 'no', 'semi-furnished'),
(8400000, 7950, 5, 2, 2, 'yes', 'no', 'yes', 'yes', 'no', 2, 'no', 'unfurnished'),
(8400000, 5500, 4, 2, 2, 'yes', 'no', 'yes', 'no', 'yes', 1, 'yes', 'semi-furnished');

-- Q2: How many houses have a basement?
-- ANSWER: BasementCount=17
SELECT COUNT(basement) AS BasementCount FROM Housing WHERE basement='yes';

--Q4: What is the price range (minimum and maximum price) of houses with guest rooms? 
-- ANSWER: MinimumPrice=8463000, MaximumPrice=11410000
SELECT MIN(price) AS MinimumPrice, MAX(price) AS MaximumPrice FROM Housing WHERE guestroom='yes';

--Q6: What is the most common number of bathrooms in the dataset? 
-- ANSWER: 2
SELECT bathrooms FROM Housing GROUP BY bathrooms HAVING COUNT(*) = (
SELECT MAX(BathroomCount)
FROM (SELECT COUNT(*) AS BathroomCount FROM Housing GROUP BY bathrooms) AS BathroomCounts);

--Q8: What is the average area of semi-furnished houses?
-- ANSWER: AreaAverage=6958
SELECT AVG(area) AS AreaAverage FROM Housing WHERE furnishingstatus='semi-furnished';

--Q10: List all houses priced above 10,000,000 that have more than 2 stories 
--ANSWER: house_ids=1,2, and 7
SELECT * FROM Housing WHERE price>10000000 AND stories>2;