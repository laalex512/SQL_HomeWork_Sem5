CREATE DATABASE IF NOT EXISTS homework5;

USE homework5;

# Task1
DROP VIEW IF EXISTS view1;

CREATE VIEW view1 AS
	SELECT *
    FROM car
    WHERE price < 25000;

SELECT * FROM view1;

# Task2
ALTER VIEW view1 AS
	SELECT *
    FROM car
    WHERE price < 30000;
    
SELECT * FROM view1;

# Task3

# В оригинале не было Шкоды, поэтому добавим сами)
INSERT car
	VALUES (21, "Skoda Rapid", 15555);

DROP VIEW IF EXISTS view2;

CREATE VIEW view2 AS
	SELECT *
    FROM car
    WHERE (car_name LIKE "Audi%") OR (car_name LIKE "Skoda%");

SELECT * FROM view2;

# Task4

DROP TABLE IF EXISTS train_shedule;
CREATE TABLE train_shedule
	(
    train_id INT NOT NULL,
    station varchar(20) NOT NULL,
    station_time TIME NOT NULL
	);

TRUNCATE TABLE train_shedule;

INSERT train_shedule
	VALUES
    (110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
    (120, "San Jose", "13:30:00");

SELECT * FROM train_shedule;

SELECT *,
	timediff(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY station_time), station_time) AS time_to_next_station
FROM train_shedule;
